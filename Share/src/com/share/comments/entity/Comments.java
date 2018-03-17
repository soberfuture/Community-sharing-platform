package com.share.comments.entity;

import com.share.user.entity.User;

public class Comments {
	private Integer cid;	//评论编号
	private double level;	//评论等级
	private String content;	//评论内容
	private Integer uid;	//评论人id,外键
	private Integer sid;	//被评论的物品id,外键	
	private String type;	//评论类别：share是对共享表的评论，sales是对销售表的评论
	private String ctime;	//评论时间
	private User user;
	public Integer getCid() {
		return cid;
	}
	public void setCid(Integer cid) {
		this.cid = cid;
	}
	
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Integer getUid() {
		return uid;
	}
	public void setUid(Integer uid) {
		this.uid = uid;
	}
	public String getCtime() {
		return ctime;
	}
	public void setCtime(String ctime) {
		this.ctime = ctime;
	}
	public Integer getSid() {
		return sid;
	}
	public void setSid(Integer sid) {
		this.sid = sid;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public double getLevel() {
		return level;
	}
	public void setLevel(double level) {
		this.level = level;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	
	
}
