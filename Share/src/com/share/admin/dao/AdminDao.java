package com.share.admin.dao;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.share.admin.entity.Admin;
@SuppressWarnings("unchecked")
public class AdminDao extends HibernateDaoSupport{


	public Admin findAdmin(Admin admin) {
		List<Admin> list=this.getHibernateTemplate().find("from Admin a where a.adminname=? and a.password=?", admin.getAdminname(),admin.getPassword());
		if( !list.isEmpty() && list != null){
			return list.get(0);
		}else{
			return null;
		}
	}

}
