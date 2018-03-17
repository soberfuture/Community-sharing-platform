package com.share.order.action;


import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.share.order.entity.Order;
import com.share.order.service.OrderService;
import com.share.page.Pagebean;
import com.share.sales.entity.Sales;
import com.share.sales.service.SalesService;
import com.share.transfer.entity.Transfer;
import com.share.transfer.service.TransferService;
import com.share.user.entity.User;
import com.share.user.service.UserService;
import com.share.util.ResponseUtil;
import com.share.util.getCurrentTime;

import net.sf.json.JSONObject;

@SuppressWarnings("serial")
public class OrderAction extends ActionSupport implements ModelDriven<Order>{

	private Order order = new Order();
	public Order getModel() {
		return order;
	}

	private OrderService orderService ;
	public void setOrderService(OrderService orderService) {
		this.orderService = orderService;
	}
	private SalesService salesService;
	private UserService userService;
	private TransferService transferService;
	
	
	public void setTransferService(TransferService transferService) {
		this.transferService = transferService;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	public void setSalesService(SalesService salesService) {
		this.salesService = salesService;
	}

	private Integer page=1;
	private Integer rows=3;
	public Integer getPage() {
		return page;
	}

	public void setPage(Integer page) {
		this.page = page;
	}

	public Integer getRows() {
		return rows;
	}

	public void setRows(Integer rows) {
		this.rows = rows;
	}

	
	public String findByUid(){
		User user = (User) ServletActionContext.getRequest().getSession().getAttribute("user");
		List<Order> list = new ArrayList<Order>();
		int total = 0;
		Integer state = order.getState();
		if(state == null){
			list = orderService.findByUid(user.getUid(),page,rows);
			total = orderService.gettotalByUid(user.getUid());
		}else{
			list = orderService.findByUS(user.getUid(),page,rows,order.getState());
			total = orderService.gettotalByUS(user.getUid(),order.getState());
		}
		Pagebean pagebean = getPageBean(list,total);
		pagebean.setMygoods("sales");
		pagebean.setType(state);
		ServletActionContext.getRequest().getSession().setAttribute("pagebean", pagebean);
		return "buyer";
	}
	private Pagebean getPageBean(List<Order> list, int total) {
		Pagebean pagebean = new Pagebean();
		int totalPage = 0;
		if(total%rows==0){
			totalPage=total/rows;
		}else{
			totalPage=total/rows+1;
		}
		pagebean.setCurrentPage(page);
		pagebean.setPageSize(rows);
		pagebean.setTotal(total);
		pagebean.setTotalPage(totalPage);
		pagebean.setList(list);
		return pagebean;
	}
	
	public String change() throws Exception{
		HttpServletResponse response = ServletActionContext.getResponse();
		JSONObject jsonObject = new JSONObject();
		User user = (User) ServletActionContext.getRequest().getSession().getAttribute("user"); 
		Order order2 = orderService.findByOid(order.getOid());
		if(order.getState()==2){
			double money = user.getLifecoin();
			System.out.println(user.getLifecoin());
			if(money<order2.getTotal()){
				jsonObject.accumulate("result", false);
				jsonObject.accumulate("message", "您的生活币不足，请充值！");
				ResponseUtil.write(response, jsonObject);
				return NONE;
			}else{
				/*转账付款*/
				transfer(order2);
				jsonObject.accumulate("result", true);
				jsonObject.accumulate("message", "付款成功！");
				User user2 = userService.findByUid(user.getUid());
				ServletActionContext.getRequest().getSession().setAttribute("user", user2);
				ResponseUtil.write(response, jsonObject);
				return NONE;
			}
		}
		if(order.getState()==3){
			Sales sales = salesService.findByID(order2.getSid());
			sales.setNumber(sales.getNumber()-order2.getCount());
			salesService.save(sales);
			
		}
		order2.setState(order.getState());
		orderService.save(order2);
		ResponseUtil.Rmessage();
		return NONE;
	}
	
	/*转账交易，并改变订单状态*/
	private void transfer(Order order) {
		Transfer transfer = new Transfer();
		User buyer = userService.findByUid(order.getUid());
		User seller = userService.findByUid(order.getUuid());
		double need = order.getTotal()*0.1;	//订单金额的10%可以用积分支付
		double have = buyer.getPoints()*0.01;//购买者所有的积分价值
		if(have>=need){	//积分足够
			int dif = (int) ((have-need)*100);	//剩余积分
			int points = (int) (order.getTotal()*0.005*100);	//奖励积分
			if(points==0){
				points = 1;
			}
			double lifecoin1 =  order.getTotal()*0.9;//买家减去生活币
			double lifecoin2 = order.getTotal();//卖家获得生活币
			buyer.setPoints(dif+points);
			buyer.setLifecoin(buyer.getLifecoin()-lifecoin1);
			userService.save(buyer);//更新卖家生活币和积分
			seller = userService.findByUid(order.getUuid());
			seller.setLifecoin(seller.getLifecoin()+lifecoin2);
			seller.setPoints(points+seller.getPoints());
			userService.save(seller);
			order.setState(2);
			orderService.save(order);
			transfer.setType("sales");
			transfer.setAward(points);
			transfer.setBuyer(order.getUid());
			transfer.setPlife(order.getTotal()*0.9);
			transfer.setPpoints((int) (need*100));
			transfer.setSeller(order.getUuid());
			transfer.setOid(order.getOid());
			transfer.setTime(getCurrentTime.gettime());
			transfer.setTotal(order.getTotal());
			transferService.save(transfer);
		}else{
			double dif = need-have;	//积分不足，还需要支付的生活币
			int points = (int) (order.getTotal()*0.005*100);	//奖励积分
			if(points==0){
				points = 1;
			}
			double lifecoin1 = order.getTotal()*0.9+dif;//买家减去生活币
			double lifecoin2 = order.getTotal();//卖家获得生活币
			buyer.setPoints(points);
			buyer.setLifecoin(buyer.getLifecoin()-lifecoin1);
			userService.save(buyer);//更新买家生活币和积分
			seller = userService.findByUid(order.getUuid());
			seller.setLifecoin(seller.getLifecoin()+lifecoin2);
			seller.setPoints(points+seller.getPoints());
			userService.save(seller);
			order.setState(2);
			orderService.save(order);
			transfer.setType("sales");
			transfer.setAward(points);
			transfer.setBuyer(order.getUid());
			transfer.setPlife(order.getTotal()*0.9+dif);
			transfer.setPpoints(buyer.getPoints());
			transfer.setSeller(order.getUuid());
			transfer.setOid(order.getOid());
			transfer.setTime(getCurrentTime.gettime());
			transfer.setTotal(order.getTotal());
			transferService.save(transfer);
		}
	}

	public void buysales() throws Exception{
		JSONObject jsonObject = new JSONObject();
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		Sales sales = (Sales) request.getSession().getAttribute("sales");
		User user = (User) request.getSession().getAttribute("user");
		if(user==null){
			jsonObject.accumulate("result", false);
			ResponseUtil.write(response, jsonObject);
		}else{
			order.setUuid(sales.getUser().getUid());
			order.setUphone(sales.getUser().getTel());
			order.setSid(sales.getSid());
			order.setTime(getCurrentTime.gettime());
			order.setPrice(sales.getPrice());
			order.setState(1);
			order.setTotal(sales.getPrice()*order.getCount());
			order.setUid(user.getUid());
			orderService.save(order);
			jsonObject.accumulate("result", true);
			ResponseUtil.write(response, jsonObject);
		}
	}
	
	
	public String findByUUid(){
		User user = (User) ServletActionContext.getRequest().getSession().getAttribute("user");
		List<Order> list = new ArrayList<Order>();
		int total = 0;
		Integer state = order.getState();
		if(state==null){
			list = orderService.findByUUid(user.getUid(),page,rows);
			total = orderService.gettotalByUUid(user.getUid());
		}else{
			list = orderService.findByUUS(user.getUid(),page,rows,order.getState());
			total = orderService.gettotalByUUS(user.getUid(),order.getState());
		}
		Pagebean pagebean = getPageBean(list,total);
		pagebean.setMygoods("sales");
		pagebean.setType(state);
		ServletActionContext.getRequest().getSession().setAttribute("pagebean", pagebean);
		return "seller";
	}
}
