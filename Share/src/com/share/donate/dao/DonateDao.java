package com.share.donate.dao;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.share.donate.entity.Donate;
@SuppressWarnings("unchecked")
public class DonateDao extends HibernateDaoSupport{

	public void save(Donate donate) {
		this.getHibernateTemplate().saveOrUpdate(donate);
	}

	public void del(Donate donate) {
		this.getHibernateTemplate().delete(donate);
	}

	public List<Donate> All() {
		List<Donate> list = this.getHibernateTemplate().find("from Donate order by did desc");
		return list;
	}

	
}
