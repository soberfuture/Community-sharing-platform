package com.share.share.action;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
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
import com.share.page.Pagebean;
import com.share.share.entity.Share;
import com.share.share.service.ShareService;
import com.share.user.entity.User;
import com.share.util.ResponseUtil;
import com.share.util.getCurrentTime;

import net.sf.json.JSONObject;

@SuppressWarnings("serial")
public class ShareAction extends ActionSupport implements ModelDriven<Share>{
	
	private Share share = new Share();
	
	public Share getModel() {
		return share;
	}

	private ShareService shareService;
	private CommentsService commentsService;
	
	public void setCommentsService(CommentsService commentsService) {
		this.commentsService = commentsService;
	}

	public void setShareService(ShareService shareService) {
		this.shareService = shareService;
	}
	
	private Integer page=1;
	private Integer rows=12;
	private Integer type=null;
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

	// 文件上传需要的三个属性:
		private File upload;
		private String uploadFileName;

		public void setUpload(File upload) {
			this.upload = upload;
		}

		public void setUploadFileName(String uploadFileName) {
			this.uploadFileName = uploadFileName;
		}
	
	private Pagebean getPageBean(List<Share> list, int total) {
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

	public String findByType() throws UnsupportedEncodingException{
		List<Share> list = new ArrayList<Share>();
		int total = 0;
		if(type==null){
			list = shareService.sharelist(page, rows);
			total = shareService.gettotal();
		}else{
			list = shareService.findByType(type,page,rows);
			total = shareService.gettotalType(type);
		}
		Pagebean pagebean = getPageBean(list, total);
		pagebean.setType(type);
		ServletActionContext.getRequest().getSession().setAttribute("pagebean", pagebean);
		return "sharetype";
	}
	
	public String findByID(){
		//1.物品信息 ，2.发布人信息，3.其他分享物品，4.评论
		HttpServletRequest request = ServletActionContext.getRequest();
		Share share1 = shareService.findByID(share.getSid());//物品信息和发布人信息（包含在物品信息中）
		List<Comments> clist = commentsService.findBySid(share.getSid(), "share");
		List<Share> slist = shareService.findListByUid(share1.getUid());
		ActionContext.getContext().getValueStack().set("clist", clist);
		ActionContext.getContext().getValueStack().set("slist", slist);
		request.getSession().setAttribute("share", share1);
		return "sharemsg";
	}
	
	public void findBysid() throws Exception{
		JSONObject jsonObject = new JSONObject();
		Share share1 = shareService.findByID(share.getSid());
		jsonObject.accumulate("share", share1);
		ResponseUtil.write(ServletActionContext.getResponse(), jsonObject);
	}
	
	public String sharelist() throws IOException{
		List<Share> sharelist = shareService.sharelist(page,rows);
		int total = shareService.gettotal();
		this.toBeJson(sharelist,total);
		return NONE;
	}

	private void toBeJson(List<Share> sharelist, int total) throws IOException {
		HttpServletResponse response = ServletActionContext.getResponse();
		JSONObject jsonObject = new JSONObject();
		jsonObject.accumulate("total", total);
		jsonObject.accumulate("rows", sharelist);
		response.setCharacterEncoding("utf-8");
		response.getWriter().write(jsonObject.toString());
	}
	
	public String deleteShare() throws IOException{
		System.out.println(share.getSid()+"........");
		shareService.deleteShare(share);
		JSONObject result = new JSONObject();
		result.put("success", true);
		ServletActionContext.getResponse().getWriter().print(result.toString());
		return NONE;
	}
	
	public String delShare() throws IOException{
		shareService.deleteShare(share);
		ResponseUtil.Rmessage();
		return NONE;
	}
		
	public String findByUid(){   //我的分享物品
		User user = (User) ServletActionContext.getRequest().getSession().getAttribute("user");
		List<Share> list = shareService.shareByUid(user.getUid(),page,rows);
		int total = shareService.gettotalByUid(user.getUid());
		Pagebean pagebean = getPageBean(list, total);
		pagebean.setMygoods("share");
		ServletActionContext.getRequest().getSession().setAttribute("pagebean", pagebean);
		return "mygoods";
	}
	
	public String addShare() throws Exception{		//添加分享物品
		User user = (User) ServletActionContext.getRequest().getSession().getAttribute("user");
		if(upload != null){
			//将商品图片上传到服务器上
			//获得上传图片的服务器端路径
			String path = ServletActionContext.getServletContext().getRealPath("/upload");
			//创建文件类型对象
			File diskFile = new File(path+"//"+uploadFileName);
			//文件上传
			FileUtils.copyFile(upload, diskFile);
			share.setPicture("upload/"+uploadFileName);
		}
		share.setState(0);
		share.setStime(getCurrentTime.gettime());
		share.setUid(user.getUid());
		shareService.save(share);
		ResponseUtil.Rmessage();
		return NONE;
	}
	
}
