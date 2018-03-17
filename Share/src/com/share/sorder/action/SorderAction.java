package com.share.sorder.action;

import java.util.ArrayList;
import java.util.List;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.share.page.Pagebean;
import com.share.share.entity.Share;
import com.share.sorder.entity.Sorder;
import com.share.sorder.service.SorderService;
import com.share.transfer.entity.Transfer;
import com.share.transfer.service.TransferService;
import com.share.user.entity.User;
import com.share.user.service.UserService;
import com.share.util.ResponseUtil;
import com.share.util.getCurrentTime;

import net.sf.json.JSONObject;

@SuppressWarnings("serial")
public class SorderAction extends ActionSupport implements ModelDriven<Sorder> {
	private Sorder sorder = new Sorder();
	public Sorder getModel() {
		return sorder;
	}
	private SorderService sorderService;
	private UserService userService;
	private TransferService transferService;
	
	
	public void setTransferService(TransferService transferService) {
		this.transferService = transferService;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	public void setSorderService(SorderService sorderService) {
		this.sorderService = sorderService;
	}
	
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
	private Integer page=1;
	private Integer rows=3;
	
	private Pagebean getPageBean(List<Sorder> list, int total) {
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

	public void addSorder() throws Exception{
		JSONObject jsonObject = new JSONObject();
		User user = (User) ServletActionContext.getRequest().getSession().getAttribute("user");
		Share share = (Share) ServletActionContext.getRequest().getSession().getAttribute("share");
		if(user==null){
			jsonObject.accumulate("result", false);
		}else{
			sorder.setSid(share.getSid());
			sorder.setPrice(share.getPrice());
			sorder.setState(1);
			sorder.setTime(getCurrentTime.gettime());
			sorder.setUid(user.getUid());
			sorder.setUphone(share.getUser().getTel());
			sorder.setUuid(share.getUid());
			sorderService.save(sorder);
			jsonObject.accumulate("result", true);
		}
		ResponseUtil.write(ServletActionContext.getResponse(), jsonObject);
	}
	
	public String change() throws Exception{
		User user = (User) ServletActionContext.getRequest().getSession().getAttribute("user");
		Sorder sorder1 = sorderService.findBySoid(sorder.getSoid());
		if(sorder.getState()==3){
			sorder1.setStart(getCurrentTime.gettime());
		}
		if(sorder.getState()==4){
			JSONObject jsonObject = new JSONObject();
			sorder1.setStop(getCurrentTime.gettime());
			sorder1.setTotal(getCurrentTime.gettotal(sorder1.getStart(), getCurrentTime.gettime(), sorder1.getPrice()));
			if(user.getLifecoin()<sorder1.getTotal()){
				jsonObject.accumulate("result", false);
				jsonObject.accumulate("message", "生活币不足，请及时充值！");
			}else{
				transfer(sorder1);
				jsonObject.accumulate("result", true);
				jsonObject.accumulate("message", "付款成功！");
				User user2 = userService.findByUid(user.getUid());
				ServletActionContext.getRequest().getSession().setAttribute("user", user2);
			}
			ResponseUtil.write(ServletActionContext.getResponse(), jsonObject);
		}
		sorder1.setState(sorder.getState());
		sorderService.save(sorder1);
		ResponseUtil.Rmessage();
		return NONE;
	}
	
	private void transfer(Sorder sorder) {
		Transfer transfer = new Transfer();
		User buyer = userService.findByUid(sorder.getUid());
		buyer.setLifecoin(buyer.getLifecoin()-sorder.getTotal());
		buyer.setPoints(buyer.getPoints()+10);
		userService.save(buyer);
		User seller = userService.findByUid(sorder.getUuid());
		seller.setLifecoin(seller.getLifecoin()+sorder.getTotal());
		seller.setPoints(seller.getPoints()+10);
		userService.save(seller);
		transfer.setAward(10);
		transfer.setBuyer(buyer.getUid());
		transfer.setOid(sorder.getSoid());
		transfer.setPlife(sorder.getTotal());
		transfer.setPpoints(0);
		transfer.setSeller(seller.getUid());
		transfer.setTime(getCurrentTime.gettime());
		transfer.setTotal(sorder.getTotal());
		transfer.setType("share");
		transferService.save(transfer);
	}

	public String findByUid(){
		User user = (User) ServletActionContext.getRequest().getSession().getAttribute("user");
		List<Sorder> list = new ArrayList<Sorder>();
		int total = 0;
		Integer state = sorder.getState();
		if(state==null){
			list = sorderService.findByUid(user.getUid(),page,rows);
			total = sorderService.gettotalByUid(user.getUid());
		}else{
			list = sorderService.findByUS(user.getUid(),page,rows,sorder.getState());
			total = sorderService.gettotalByUS(user.getUid(),sorder.getState());
		}
		Pagebean pagebean = getPageBean(list, total);
		pagebean.setMygoods("share");
		pagebean.setType(state);
		ServletActionContext.getRequest().getSession().setAttribute("pagebean", pagebean);
		return "buyer";
	}
	
	public String findByUUid(){
		User user = (User) ServletActionContext.getRequest().getSession().getAttribute("user");
		List<Sorder> list = new ArrayList<Sorder>();
		int total = 0;
		Integer state = sorder.getState();
		if(state==null){
			list = sorderService.findByUUid(user.getUid(),page,rows);
			total = sorderService.gettotalByUUid(user.getUid());
		}else{
			list = sorderService.findByUUS(user.getUid(),page,rows,sorder.getState());
			total = sorderService.gettotalByUUS(user.getUid(),sorder.getState());
		}
		Pagebean pagebean = getPageBean(list, total);
		pagebean.setMygoods("share");
		pagebean.setType(state);
		ServletActionContext.getRequest().getSession().setAttribute("pagebean", pagebean);
		return "seller";
	}
}
