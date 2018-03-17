package com.share.activity.entity;

import com.share.user.entity.User;

public class Activity {
	private Integer aid;	//活动编号，主键
	private Integer uid;	//发起人id,外键,链接user表uid
	private String phone;	//咨询电话
	private String picture;	//活动宣传图片
	private String title;	//活动标题
	private String aexplain;	//活动描述
	private int state;//发布状态：0代表待审核，1代表发布，2代表暂停发布
	private String ptime;//发布时间
	private String starttime;//活动开始时间
	private String stoptime;//活动结束时间
	private int number;//参加人数
	private User user;
	public String getAexplain() {
		return aexplain;
	}
	public void setAexplain(String aexplain) {
		this.aexplain = aexplain;
	}
	public String getStarttime() {
		return starttime;
	}
	public void setStarttime(String starttime) {
		this.starttime = starttime;
	}
	public String getStoptime() {
		return stoptime;
	}
	public void setStoptime(String stoptime) {
		this.stoptime = stoptime;
	}
	public Integer getAid() {
		return aid;
	}
	public void setAid(Integer aid) {
		this.aid = aid;
	}
	public Integer getUid() {
		return uid;
	}
	public void setUid(Integer uid) {
		this.uid = uid;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getPicture() {
		return picture;
	}
	public void setPicture(String picture) {
		this.picture = picture;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	
	public int getNumber() {
		return number;
	}
	public void setNumber(int number) {
		this.number = number;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public String getPtime() {
		return ptime;
	}
	public void setPtime(String ptime) {
		this.ptime = ptime;
	}
	
}
