package com.share.transfer.entity;

public class Transfer {
	private Integer tid;	//转账编号
	private Integer buyer;	//购买者
	private Integer seller;	//售卖者
	private Integer oid;	//订单编号
	private String type;	//销售订单，还是分享订单
	private double plife; 	//支出生活币
	private int ppoints;	//支出积分
	private int award;		//奖励
	private double total; 	//消费额
	private String time;	//转账时间
	public Integer getTid() {
		return tid;
	}
	public void setTid(Integer tid) {
		this.tid = tid;
	}
	public Integer getBuyer() {
		return buyer;
	}
	public void setBuyer(Integer buyer) {
		this.buyer = buyer;
	}
	public Integer getSeller() {
		return seller;
	}
	public void setSeller(Integer seller) {
		this.seller = seller;
	}
	public Integer getOid() {
		return oid;
	}
	public void setOid(Integer oid) {
		this.oid = oid;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public double getPlife() {
		return plife;
	}
	public void setPlife(double plife) {
		this.plife = plife;
	}
	public int getPpoints() {
		return ppoints;
	}
	public void setPpoints(int ppoints) {
		this.ppoints = ppoints;
	}
	public int getAward() {
		return award;
	}
	public void setAward(int award) {
		this.award = award;
	}
	public double getTotal() {
		return total;
	}
	public void setTotal(double total) {
		this.total = total;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	
	
}
