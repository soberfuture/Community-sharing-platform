package com.share.fans.action;

import java.io.IOException;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.share.fans.entity.Fans;
import com.share.fans.service.FansService;
import com.share.user.entity.User;
import com.share.user.service.UserService;
import com.share.util.ResponseUtil;

@SuppressWarnings("serial")
public class FansAction extends ActionSupport implements ModelDriven<Fans> {

	private Fans fans = new Fans();
	public Fans getModel() {
		return fans;
	}
	
	private FansService fansService;
	public void setFansService(FansService fansService) {
		this.fansService = fansService;
	}
	
	private Integer uid;
	public Integer getUid() {
		return uid;
	}
	private UserService userService;
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	public void setUid(Integer uid) {
		this.uid = uid;
	}
	public String add() throws IOException{//关注
		User user1 = (User) ServletActionContext.getRequest().getSession().getAttribute("user");
		Fans Existfans = fansService.findBytwo(user1.getUid(), uid);
		if(Existfans==null){
			fans.setConcern(user1.getUid());
			fans.setConcerned(uid);
			fansService.save(fans);
			SetUserfans(user1.getUid(),uid);//检查粉丝数和关注数
		}
		ResponseUtil.Rmessage();
		return NONE;
	}
	
	private void SetUserfans(Integer uid1, Integer uid2) {	//粉丝数
		User user1 = userService.findByUid(uid1);//设置关注数
		int total1 = fansService.getconcern(uid1);
		user1.setAttention(total1);
		userService.save(user1);
		User user2 = userService.findByUid(uid2);//设置粉丝数
		int total2 = fansService.gettotalByUid(uid2);
		user2.setFans(total2);
		userService.save(user2);
	}
	public String del() throws IOException{//取消关注
		User user1 = (User) ServletActionContext.getRequest().getSession().getAttribute("user");
		Fans Existfans1 = fansService.findBytwo(user1.getUid(), uid);
		if(Existfans1!=null){
			fansService.del(Existfans1);
			SetUserfans(user1.getUid(),uid);//检查粉丝数和关注数
		}
		ResponseUtil.Rmessage();
		return NONE;
	}
	
	
}
