package com.share.sorder.entity;

import com.share.share.entity.Share;

public class Sorder {
	private Integer soid;	//分享物品订单编号
	private Integer sid;	//分享物品编号,外键
	private double price;	//分享物品价格，即每小时多少钱
	private String time;	//订单生成时间
	private Integer state;//1代表申请分享，2代表待接单，3代表收货，4代表已归还
	private String name;	//收货人姓名
	private String phone;	//收货人电话
	private String addr;	//收货人地址
	private Integer uid;	//分享该物品用户ID，外键
	private Integer uuid;	//发布该物品用户ID，外键
	private String uphone;	//发布该物品的用户电话
	private String start;//开始分享时间
	private String stop;//结束分享时间
	private Double total;//总额
	private Share share;
	public Integer getSoid() {
		return soid;
	}
	public void setSoid(Integer soid) {
		this.soid = soid;
	}
	public Integer getSid() {
		return sid;
	}
	public void setSid(Integer sid) {
		this.sid = sid;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public Integer getState() {
		return state;
	}
	public void setState(Integer state) {
		this.state = state;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public Integer getUid() {
		return uid;
	}
	public void setUid(Integer uid) {
		this.uid = uid;
	}
	public Integer getUuid() {
		return uuid;
	}
	public void setUuid(Integer uuid) {
		this.uuid = uuid;
	}
	public String getUphone() {
		return uphone;
	}
	public void setUphone(String uphone) {
		this.uphone = uphone;
	}
	public Share getShare() {
		return share;
	}
	public void setShare(Share share) {
		this.share = share;
	}
	public String getStart() {
		return start;
	}
	public void setStart(String start) {
		this.start = start;
	}
	public String getStop() {
		return stop;
	}
	public void setStop(String stop) {
		this.stop = stop;
	}
	public Double getTotal(){
		return total;
	}
	public void setTotal(Double total) {
		this.total = total;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	
	
	
}
