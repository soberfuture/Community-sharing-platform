package com.share.admin.service;

import com.share.admin.dao.AdminDao;
import com.share.admin.entity.Admin;

public class AdminService {

	private AdminDao adminDao;

	public void setAdminDao(AdminDao adminDao) {
		this.adminDao = adminDao;
	}

	public Admin findAdmin(Admin admin) {
		Admin admin2 = adminDao.findAdmin(admin);
		return admin2;
	}
	
}
