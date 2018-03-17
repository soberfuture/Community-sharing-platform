package com.share.admin.action;

import java.io.IOException;

import org.apache.struts2.ServletActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.share.admin.entity.Admin;
import com.share.admin.service.AdminService;
import com.share.util.ResponseUtil;

@SuppressWarnings("serial")
public class AdminAction extends ActionSupport implements ModelDriven<Admin>{

	private Admin admin = new Admin();

	public Admin getModel() {
		return admin;
	}
	
	private AdminService adminService;
	
	
	public void setAdminService(AdminService adminService) {
		this.adminService = adminService;
	}


	public String loginPage(){
		return "login";
	}
	
	public String login(){
		Admin admin1 = adminService.findAdmin(admin);
		if(admin1==null){
			this.addActionError("用户名或密码错误！");
			return "login";
		}else{
			ServletActionContext.getRequest().getSession().setAttribute("admin", admin1);
			return "admin";
		}
	}
	
	public void Exist() throws IOException{
		ServletActionContext.getRequest().getSession().invalidate();
		ResponseUtil.Rmessage();
	}
}
