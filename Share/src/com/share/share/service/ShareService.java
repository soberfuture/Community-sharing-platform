package com.share.share.service;

import java.util.List;

import com.share.share.dao.ShareDao;
import com.share.share.entity.Share;

public class ShareService {
	
	private ShareDao shareDao;

	public void setShareDao(ShareDao shareDao) {
		this.shareDao = shareDao;
	}

	public List<Share> sharelist(Integer page, Integer rows) {
		List<Share> sharelist = shareDao.sharelist(page,rows);
		return sharelist;
	}

	public int gettotal() {
		int total = shareDao.gettotal();
		return total;
	}

	public void deleteShare(Share share) {
		shareDao.delete(share);
	}

	public void save(Share share) {
		shareDao.save(share);
	}

	public List<Share> allShare() {
		List<Share> list = shareDao.allShare();
		return list;
	}

	public List<Share> findByType(int type, Integer page, Integer rows) {
		List<Share> list = shareDao.findByType(type,page,rows);
		return list;
	}

	public int gettotalType(int type) {
		int totalType = shareDao.gettotalType(type);
		return totalType;
	}

	public List<Share> shareByUid(Integer uid, Integer page, Integer rows) {
		List<Share> list = shareDao.shareByUid(uid,page,rows);
		return list;
	}

	public int gettotalByUid(Integer uid) {
		int total = shareDao.gettotalByUid(uid);
		return total;
	}

	public Share findByID(Integer sid) {
		Share share1 = shareDao.findByID(sid);
		return share1;
	}

	public List<Share> findListByUid(Integer uid) {
		List<Share> list = shareDao.findListByUid(uid);
		return list;
	}

	public List<Share> findByUid(Integer uid) {
		List<Share> list = shareDao.findByUid(uid);
		return list;
	}
	
}
