package com.share.activity.action;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.share.activity.entity.Activity;
import com.share.activity.service.ActivityService;
import com.share.attend.service.AttendService;
import com.share.notice.entity.Notice;
import com.share.notice.service.NoticeService;
import com.share.user.entity.User;
import com.share.util.ResponseUtil;
import com.share.util.getCurrentTime;

import net.sf.json.JSONObject;

@SuppressWarnings("serial")
public class ActivityAction extends ActionSupport implements ModelDriven<Activity> {

	private Activity activity = new Activity();
	public Activity getModel() {
		return activity;
	}
	
	private ActivityService activityService;
	
	public void setActivityService(ActivityService activityService) {
		this.activityService = activityService;
	}

	private AttendService attendService;
	private NoticeService noticeService;
	
	public void setNoticeService(NoticeService noticeService) {
		this.noticeService = noticeService;
	}

	public void setAttendService(AttendService attendService) {
		this.attendService = attendService;
	}
	
	private Integer page=1;
	private Integer rows=10;
	// 文件上传需要的三个属性:
	private File upload;
	private String uploadFileName;

	public void setUpload(File upload) {
		this.upload = upload;
	}

	public void setUploadFileName(String uploadFileName) {
		this.uploadFileName = uploadFileName;
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

	public String addActivity() throws Exception{
		User user = (User) ServletActionContext.getRequest().getSession().getAttribute("user");
		if(upload != null){
			//将商品图片上传到服务器上
			//获得上传图片的服务器端路径
			String path = ServletActionContext.getServletContext().getRealPath("/upload");
			//创建文件类型对象
			File diskFile = new File(path+"//"+uploadFileName);
			//文件上传
			FileUtils.copyFile(upload, diskFile);
			activity.setPicture("upload/"+uploadFileName);
		}
		activity.setUid(user.getUid());
		activity.setState(1);
		activity.setNumber(0);
		activity.setPtime(getCurrentTime.gettime());
		activityService.addActivity(activity);
		JSONObject result = new JSONObject();
		result.accumulate("success", true);
		ResponseUtil.write(ServletActionContext.getResponse(), result);
		return NONE;
	}
	
	public String delActivity() throws Exception{
		activityService.delActivity(activity);
		JSONObject jsonObject = new JSONObject();
		jsonObject.accumulate("success", true);
		ResponseUtil.write(ServletActionContext.getResponse(), jsonObject);
		return NONE;
	}
	
	public String findAll() throws Exception{
		List<Activity> list = activityService.AllPaging(page, rows);
		int total = activityService.gettotal();
		JSONObject jsonObject = new JSONObject();
		jsonObject.accumulate("rows", list);
		jsonObject.accumulate("total", total);
		ResponseUtil.write(ServletActionContext.getResponse(), jsonObject);
		return NONE;
	}
	
	public String deal(){
		List<Activity> list = activityService.deal();
		ActionContext.getContext().getValueStack().set("list", list);
		return "deal";
	}
	
	public String findList(){
		User user = (User) ServletActionContext.getRequest().getSession().getAttribute("user");
		List<Activity> list = activityService.findList(user.getUid());
		ActionContext.getContext().getValueStack().set("activitylist", list);
		return "myActivity";
	}
	
	public String findByAid(){
		HttpServletRequest request = ServletActionContext.getRequest();
		Activity activity1 = activityService.findByAid(activity.getAid());
		User user = (User) ServletActionContext.getRequest().getSession().getAttribute("user");
		if(user!=null){
			int size = attendService.isAttend(user.getUid(), activity1.getAid());
			if(size==0){
				request.getSession().setAttribute("isattend", true);
			}else{
				request.getSession().setAttribute("isattend", false);
			}
		}else{
			request.getSession().setAttribute("isattend", true);
		}
		request.getSession().setAttribute("activity", activity1);
		return "activity";
	}
	
	public String findByUid() throws IOException{
		User user = (User) ServletActionContext.getRequest().getSession().getAttribute("user");
		List<Activity> list = activityService.findByUid(user.getUid(),page,rows);
		int total = activityService.gettotalByUid(user.getUid());
		toBeJson(list,total);
		return NONE;
	}
	
	private void toBeJson(List<Activity> list, int total) throws IOException {
		HttpServletResponse response = ServletActionContext.getResponse();
		JSONObject jsonObject = new JSONObject();
		jsonObject.accumulate("rows", list);
		jsonObject.accumulate("total", total);
		response.setContentType("text/html;charset=utf-8");
		response.getWriter().print(jsonObject.toString());
	}

	public String AllPaging() throws Exception{
		JSONObject jsonObject = new JSONObject();
		List<Activity> alist = activityService.AllPaging(page,rows);
		int atotal = activityService.gettotal();
		List<Notice> nlist = noticeService.AllPaging(page,rows);
		int ntotal = noticeService.gettotal();
		jsonObject.accumulate("page", page);
		jsonObject.accumulate("result1", alist);
		jsonObject.accumulate("total1", atotal);
		jsonObject.accumulate("result2", nlist);
		jsonObject.accumulate("total2", ntotal);
		ResponseUtil.write(ServletActionContext.getResponse(), jsonObject);
		return NONE;
	}
	
	public String APage() throws Exception{
		JSONObject jsonObject = new JSONObject();
		List<Activity> alist = activityService.AllPaging(page,rows);
		int atotal = activityService.gettotal();
		jsonObject.accumulate("page", page);
		jsonObject.accumulate("result1", alist);
		jsonObject.accumulate("total1", atotal);
		ResponseUtil.write(ServletActionContext.getResponse(), jsonObject);
		return NONE;
	}
	
	public void change() throws IOException{
		Activity act = activityService.findByAid(activity.getAid());
		act.setState(activity.getState());
		activityService.addActivity(act);
		ResponseUtil.Rmessage();
	}
}
