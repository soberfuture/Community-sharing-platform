package com.share.activity.service;

import java.util.List;

import com.share.activity.dao.ActivityDao;
import com.share.activity.entity.Activity;

public class ActivityService {
	private ActivityDao activityDao;

	public void setActivityDao(ActivityDao activityDao) {
		this.activityDao = activityDao;
	}

	public void addActivity(Activity activity) {
		activityDao.addActivity(activity);
	}

	public void delActivity(Activity activity) {
		activityDao.delActivity(activity);
	}

	public List<Activity> findAll() {
		List<Activity> list = activityDao.findAll();
		return list;
	}

	public Activity findByAid(Integer aid) {
		Activity activity = activityDao.findByAid(aid);
		return activity;
	}

	public List<Activity> AllPaging(Integer page, Integer rows) {
		List<Activity> list = activityDao.AllPaging(page,rows);
		return list;
	}

	public int gettotal() {
		return activityDao.gettotal();
	}

	public List<Activity> findByUid(Integer uid, Integer page, Integer rows) {
		List<Activity> list = activityDao.findByUid(uid,page,rows);
		return list;
	}

	public int gettotalByUid(Integer uid) {
		return activityDao.gettotalByUid(uid);
	}

	public List<Activity> findList(Integer uid) {
		List<Activity> list = activityDao.findList(uid);
		return list;
	}

	public List<Activity> deal() {
		List<Activity> list = activityDao.deal();
		return list;
	}

	
}
