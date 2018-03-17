package com.share.fans.entity;

public class Fans {
	private Integer fid;	//关注编号
	private Integer concern;	//关注人，外键，链接user表uid
	private Integer concerned;	//被关注人，外键,链接user表uid
	public Integer getFid() {
		return fid;
	}
	public void setFid(Integer fid) {
		this.fid = fid;
	}
	public Integer getConcern() {
		return concern;
	}
	public void setConcern(Integer concern) {
		this.concern = concern;
	}
	public Integer getConcerned() {
		return concerned;
	}
	public void setConcerned(Integer concerned) {
		this.concerned = concerned;
	}
	
	
}
