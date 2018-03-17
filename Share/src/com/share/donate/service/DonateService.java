package com.share.donate.service;

import java.util.List;

import com.share.donate.dao.DonateDao;
import com.share.donate.entity.Donate;

public class DonateService {
	private DonateDao donateDao;

	public void setDonateDao(DonateDao donateDao) {
		this.donateDao = donateDao;
	}

	public void save(Donate donate) {
		donateDao.save(donate);
	}

	public void del(Donate donate) {
		donateDao.del(donate);
	}

	public List<Donate> All() {
		List<Donate> list = donateDao.All();
		return list;
	}

	
}
