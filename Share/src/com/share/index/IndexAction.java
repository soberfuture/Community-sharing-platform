package com.share.index;

import java.util.ArrayList;
import java.util.List;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.share.activity.service.ActivityService;
import com.share.sales.entity.Sales;
import com.share.sales.service.SalesService;
import com.share.share.entity.Share;
import com.share.share.service.ShareService;
import com.share.user.entity.User;
import com.share.user.service.UserService;

@SuppressWarnings("serial")
public class IndexAction extends ActionSupport{
	private SalesService salesService;
	private ShareService shareService;
	private UserService userService;
	public void setActivityService(ActivityService activityService) {
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	public void setSalesService(SalesService salesService) {
		this.salesService = salesService;
	}

	public void setShareService(ShareService shareService) {
		this.shareService = shareService;
	}

	public String execute(){
		//总是要登录好麻烦，先弄一个user
		/*User user = new User();
		user = userService.getUser(1);
		ServletActionContext.getRequest().getSession().setAttribute("user", user);*/
		
		//首页销售
		List<Sales> salesList = salesService.findAll();
		List<Sales> list1 = new ArrayList<Sales>();
		for(Sales salse1:salesList){
			list1.add(salse1);
			if(list1.size()==8){
				break;
			}
		}
		ActionContext.getContext().getValueStack().set("saleshome", list1);
		//首页共享
		List<Share> sharelist = shareService.allShare();
		List<Share> list2 = new ArrayList<Share>();
		for(Share share1:sharelist){
			list2.add(share1);
			if(list2.size()==10){
				break;
			}
		}
		ActionContext.getContext().getValueStack().set("sharehome", list2);
		return "index";
	}
}
