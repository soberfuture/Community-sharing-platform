package com.share.share.entity;

import com.share.user.entity.User;

public class Share {
	private Integer sid;	//共享物品编号
	private String sname;	//物品名
	private int stype;		//物品类型
	private String sexplain;	//物品描述
	private String picture;		//物品图片
	private double deposit;		//押金
	private double price;		//价格，即每小时多少钱
	private int state;//0代表未分享，1代表已分享
	private Integer uid;//用户id,外键
	private String stime;	//发布时间
	private User user;		
	
	
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public Integer getSid() {
		return sid;
	}
	public void setSid(Integer sid) {
		this.sid = sid;
	}
	public String getSname() {
		return sname;
	}
	public void setSname(String sname) {
		this.sname = sname;
	}
	public int getStype() {
		return stype;
	}
	public void setStype(int stype) {
		this.stype = stype;
	}
	public String getSexplain() {
		return sexplain;
	}
	public void setSexplain(String sexplain) {
		this.sexplain = sexplain;
	}
	public String getPicture() {
		return picture;
	}
	public void setPicture(String picture) {
		this.picture = picture;
	}
	public double getDeposit() {
		return deposit;
	}
	public void setDeposit(double deposit) {
		this.deposit = deposit;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	public Integer getUid() {
		return uid;
	}
	public void setUid(Integer uid) {
		this.uid = uid;
	}
	public String getStime() {
		return stime;
	}
	public void setStime(String stime) {
		this.stime = stime;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	
	
	
}
