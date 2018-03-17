package com.share.sales.action;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.share.comments.entity.Comments;
import com.share.comments.service.CommentsService;
import com.share.fans.entity.Fans;
import com.share.fans.service.FansService;
import com.share.page.Pagebean;
import com.share.sales.entity.Sales;
import com.share.sales.service.SalesService;
import com.share.user.entity.User;
import com.share.util.ResponseUtil;
import com.share.util.getCurrentTime;

import net.sf.json.JSONObject;

@SuppressWarnings("serial")
public class SalesAction extends ActionSupport implements ModelDriven<Sales> {

	private Sales sales = new Sales();
	public Sales getModel() {
		return sales;
	}
	
	private SalesService salesService;
	private CommentsService commentsService;
	private FansService fansService;
	private File upload;
	private String uploadFileName;
	
	public void setUpload(File upload) {
		this.upload = upload;
	}

	public void setUploadFileName(String uploadFileName) {
		this.uploadFileName = uploadFileName;
	}

	public void setFansService(FansService fansService) {
		this.fansService = fansService;
	}

	public void setCommentsService(CommentsService commentsService) {
		this.commentsService = commentsService;
	}

	public void setSalesService(SalesService salesService) {
		this.salesService = salesService;
	}

	private Integer page=1;//第几页
	private Integer rows=12;//默认每页12条记录
	private Integer type=null;//商品类型
	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
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
	
	public String saleslist() throws IOException{
		List<Sales> saleslist = salesService.saleslist(page,rows);
		int total = salesService.gettotal();
		this.toBeJso(saleslist,total);
		return NONE;
	}

	private void toBeJso(List<Sales> saleslist, int total) throws IOException {
		HttpServletResponse response = ServletActionContext.getResponse();
		JSONObject jsonObject = new JSONObject();
		jsonObject.accumulate("total", total);
		jsonObject.accumulate("rows", saleslist);
		response.setCharacterEncoding("utf-8");
		response.getWriter().write(jsonObject.toString());
	}
	
	public String deleteSales() throws IOException{
		salesService.deleteSales(sales);
		JSONObject result = new JSONObject();
		result.put("success", true);
		ServletActionContext.getResponse().getWriter().print(result.toString());
		return NONE;
	}
	
	public String delSales() throws IOException{
		salesService.deleteSales(sales);
		ResponseUtil.Rmessage();
		return NONE;
	}
	
	private Pagebean getPagebean(List<Sales> saleslist, int total) {
		int totalPage=0;
		if(total%rows==0){
			totalPage = total/rows;
		}else{
			totalPage = total/rows+1;
		}
		Pagebean pagebean = new Pagebean();
		pagebean.setCurrentPage(page);
		pagebean.setPageSize(rows);
		pagebean.setList(saleslist);
		pagebean.setTotal(total);
		pagebean.setTotalPage(totalPage);
		return pagebean;
	}
	
	public String findByType(){
		List<Sales> list = new ArrayList<Sales>();
		int total = 0;
		if(type==null){
			 list= salesService.allSales(page,rows);
			 total = salesService.gettotal();
		}else{
			list = salesService.findByType(page,rows,type);
			total = salesService.gettypetotal(type);
		}
		Pagebean pagebean = getPagebean(list, total);
		pagebean.setType(type);
		ServletActionContext.getRequest().getSession().setAttribute("pagebean", pagebean);
		return "salestype";
	}
	
	public String findByID(){
		//页面需求：1物品信息，2发布人信息，3发布人发布的其他物品，4该物品的评价
		HttpServletRequest request = ServletActionContext.getRequest();
		User user = (User) ServletActionContext.getRequest().getSession().getAttribute("user");
		
		Sales sales1 = salesService.findByID(sales.getSid());//获得物品信息和发布人信息（包含在物品中）
		List<Comments> clist = commentsService.findBySid(sales.getSid(),"sales");//获取评论
		List<Sales> slist = salesService.findListByUid(sales1.getUid());//获取其他发布物品
		if(user!=null){
			Fans Existfans = fansService.findBytwo(user.getUid(),sales1.getUid());
			if(Existfans==null){
				request.getSession().setAttribute("judge", true);
			}else{
				request.getSession().setAttribute("judge", false);
			}
		}
		ActionContext.getContext().getValueStack().set("clist", clist);
		ActionContext.getContext().getValueStack().set("slist", slist);
		request.getSession().setAttribute("sales", sales1);
		return "buy";
	}
	
	public void findBysid() throws Exception{
		JSONObject jsonObject = new JSONObject();
		Sales sales1 = salesService.findByID(sales.getSid());
		jsonObject.accumulate("sales", sales1);
		ResponseUtil.write(ServletActionContext.getResponse(), jsonObject);
	}
	
	public String findByUid(){		//我的销售物品
		User user = (User) ServletActionContext.getRequest().getSession().getAttribute("user");
		List<Sales> list = salesService.findByUid(user.getUid(),page,rows);
		int total = salesService.gettotalByUid(user.getUid());
		Pagebean pagebean = getPagebean(list, total);
		pagebean.setMygoods("sales");
		ServletActionContext.getRequest().getSession().setAttribute("pagebean", pagebean);
		return "mygoods";
	}
	
	public String addSales() throws Exception{		//添加销售物品
		if(upload != null){
			//将商品图片上传到服务器上
			//获得上传图片的服务器端路径
			String path = ServletActionContext.getServletContext().getRealPath("/upload");
			//创建文件类型对象
			File diskFile = new File(path+"//"+uploadFileName);
			//文件上传
			FileUtils.copyFile(upload, diskFile);
			sales.setPicture("upload/"+uploadFileName);
		}
		User user = (User) ServletActionContext.getRequest().getSession().getAttribute("user");
		sales.setStime(getCurrentTime.gettime());
		sales.setUid(user.getUid());
		salesService.save(sales);
		ResponseUtil.Rmessage();
		return NONE;
	}
}
