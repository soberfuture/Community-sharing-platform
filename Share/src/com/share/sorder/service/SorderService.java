package com.share.sorder.service;

import java.util.List;

import com.share.sorder.dao.SorderDao;
import com.share.sorder.entity.Sorder;

public class SorderService {
	private SorderDao sorderDao;

	public void setSorderDao(SorderDao sorderDao) {
		this.sorderDao = sorderDao;
	}

	public void save(Sorder sorder) {
		sorderDao.save(sorder);
	}

	public List<Sorder> findByUid(Integer uid, Integer page, Integer rows) {
		List<Sorder> list = sorderDao.findByUid(uid,page,rows);
		return list;
	}

	public Sorder findBySoid(Integer soid) {
		Sorder sorder = sorderDao.findBySoid(soid);
		return sorder;
	}

	public int gettotal() {
		int total = sorderDao.gettotal();
		return total;
	}

	public int gettotalByUid(Integer uid) {
		int total = sorderDao.gettotalByUid(uid);
		return total;
	}

	public List<Sorder> findByUS(Integer uid, Integer page, Integer rows, Integer state) {
		List<Sorder> list = sorderDao.findByUS(uid,page,rows,state);
		return list;
	}

	public int gettotalByUS(Integer uid, Integer state) {
		int total = sorderDao.gettotalByUS(uid,state);
		return total;
	}

	public List<Sorder> findByUUid(Integer uuid, Integer page, Integer rows) {
		List<Sorder> list = sorderDao.findByUUid(uuid,page,rows);
		return list;
	}

	public int gettotalByUUid(Integer uuid) {
		int total = sorderDao.gettotalByUUid(uuid);
		return total;
	}

	public List<Sorder> findByUUS(Integer uuid, Integer page, Integer rows, Integer state) {
		List<Sorder> list = sorderDao.findByUUS(uuid,page,rows,state);
		return list;
	}

	public int gettotalByUUS(Integer uuid, Integer state) {
		int total = sorderDao.gettotalByUUS(uuid,state);
		return total;
	}
	
	
}
