package com.share.fans.service;

import java.util.List;

import com.share.fans.dao.FansDao;
import com.share.fans.entity.Fans;
import com.share.user.entity.User;

public class FansService {

	private FansDao fansDao;

	public void setFansDao(FansDao fansDao) {
		this.fansDao = fansDao;
	}

	public void save(Fans fans) {
		fansDao.save(fans);
	}

	public void del(Fans fans) {
		fansDao.del(fans);
	}

	public int gettotalByUid(Integer uid) {//粉丝数
		return fansDao.gettotalByUid(uid);
	}

	public Fans findByfid(Integer fid) {
		Fans fans = fansDao.findByfid(fid);
		return fans;
	}

	public Fans findBytwo(Integer uid, Integer uid2) {
		Fans fans = fansDao.findBytwo(uid,uid2);
		return fans;
	}

	public int getconcern(Integer uid1) {//关注数
		return fansDao.getconcern(uid1);
	}

	public List<User> findByUid(Integer uid) {
		List<User> list = fansDao.findByUid(uid);
		return list;
	}

}
