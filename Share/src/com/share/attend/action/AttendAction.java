package com.share.attend.action;

import java.util.List;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.share.attend.entity.Attend;
import com.share.attend.service.AttendService;
import com.share.user.entity.User;
import com.share.util.ResponseUtil;

import net.sf.json.JSONObject;

@SuppressWarnings("serial")
public class AttendAction extends ActionSupport implements ModelDriven<Attend> {
	private Attend attend = new Attend();
	public Attend getModel() {
		return attend;
	}
	
	private AttendService attendService;
	
	
	public void setAttendService(AttendService attendService) {
		this.attendService = attendService;
	}

	public String addAttend() throws Exception{
		JSONObject jsonObject = new JSONObject();
		User user = (User) ServletActionContext.getRequest().getSession().getAttribute("user");
		if(user==null){
			jsonObject.accumulate("result", false);
			jsonObject.accumulate("message", "您还没有登录！");
		}else{
			attend.setUid(user.getUid());
			int size = attendService.addAttend(attend);//参与成功之后返回参与人数
			jsonObject.accumulate("result", true);
			jsonObject.accumulate("message", "参与成功！");
			jsonObject.accumulate("number", size);
		}
		ResponseUtil.write(ServletActionContext.getResponse(), jsonObject);
		return NONE;
	}

	public String delAttend() throws Exception{
		JSONObject jsonObject = new JSONObject();
		User user = (User) ServletActionContext.getRequest().getSession().getAttribute("user");
		if(user==null){
			jsonObject.accumulate("result", false);
			jsonObject.accumulate("message", "您还没有登录！");
		}else{
			Attend attend1 = attendService.findByUA(attend.getAid(),user.getUid());
			int size = attendService.delAttend(attend1);//取消成功之后返回参与人数
			jsonObject.accumulate("result", true);
			jsonObject.accumulate("message", "取消成功！");
			jsonObject.accumulate("number", size);
		}
		ResponseUtil.write(ServletActionContext.getResponse(), jsonObject);
		return NONE;
	}
	
	public String isAttend() throws Exception{
		JSONObject jsonObject = new JSONObject();
		User user = (User) ServletActionContext.getRequest().getSession().getAttribute("user");
		int size = attendService.isAttend(user.getUid(),attend.getAid());
		if(size==0){
			jsonObject.accumulate("result", false);
		}else{
			jsonObject.accumulate("result", true);
		}
		ResponseUtil.write(ServletActionContext.getResponse(), jsonObject);
		return NONE;
	}
	
	public String findByUid() throws Exception{
		JSONObject jsonObject = new JSONObject();
		User user = (User) ServletActionContext.getRequest().getSession().getAttribute("user");
		if(user==null){
			return NONE;
		}
		List<Attend> list = attendService.findByUid(user.getUid());
		if(list==null||list.size()==0){
			jsonObject.accumulate("result", false);
			jsonObject.accumulate("message", "还没有参加任何活动");
		}else{
			jsonObject.accumulate("result", true);
			jsonObject.accumulate("message", list);
		}
		
		ResponseUtil.write(ServletActionContext.getResponse(), jsonObject);
		return NONE;
	}
}
