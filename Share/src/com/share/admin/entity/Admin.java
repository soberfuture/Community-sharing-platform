package com.share.admin.entity;

public class Admin {
	private Integer aid;		//管理员编号，主键
	private String adminname;	//管理员用户名
	private String password;	//管理员密码
	public Integer getAid() {
		return aid;
	}
	public void setAid(Integer aid) {
		this.aid = aid;
	}
	public String getAdminname() {
		return adminname;
	}
	public void setAdminname(String adminname) {
		this.adminname = adminname;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	
}
