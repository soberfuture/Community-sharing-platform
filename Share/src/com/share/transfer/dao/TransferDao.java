package com.share.transfer.dao;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.share.transfer.entity.Transfer;

public class TransferDao extends HibernateDaoSupport {

	public void save(Transfer transfer) {
		this.getHibernateTemplate().save(transfer);
	}

}
