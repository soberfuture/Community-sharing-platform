package com.share.sales.entity;

import com.share.user.entity.User;

public class Sales {
	private Integer sid;	//销售物品编号
	private String sname;	//物品名
	private int stype;		//物品类型
	private String sexplain;	//物品描述
	private String picture;		//物品图片
	private double price;		//物品价格
	private Integer number;		//拥有的物品数量
	private Integer uid;		//用户id，外键
	private String stime;		//发布时间
	private int count;			//被购买的次数
	private User user;
	
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
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
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
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
	public Integer getNumber() {
		return number;
	}
	public void setNumber(Integer number) {
		this.number = number;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	
	
}
