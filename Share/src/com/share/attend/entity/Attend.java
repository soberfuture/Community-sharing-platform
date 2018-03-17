package com.share.attend.entity;

import com.share.activity.entity.Activity;

public class Attend {
	private Integer atid;	//参加编号，主键
	private Integer uid;	//参加人id,外键，链接user表uid
	private Integer aid;	//活动id，外键，链接activity表aid
	private Activity activity;
	public Integer getAtid() {
		return atid;
	}
	public void setAtid(Integer atid) {
		this.atid = atid;
	}
	public Integer getUid() {
		return uid;
	}
	public void setUid(Integer uid) {
		this.uid = uid;
	}
	public Integer getAid() {
		return aid;
	}
	public void setAid(Integer aid) {
		this.aid = aid;
	}
	public Activity getActivity() {
		return activity;
	}
	public void setActivity(Activity activity) {
		this.activity = activity;
	}
	
	
}
