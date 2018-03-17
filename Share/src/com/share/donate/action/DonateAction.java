package com.share.donate.action;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.share.donate.entity.Donate;
import com.share.donate.service.DonateService;
import com.share.util.ResponseUtil;
import com.share.util.getCurrentTime;

import net.sf.json.JSONObject;

@SuppressWarnings("serial")
public class DonateAction extends ActionSupport implements ModelDriven<Donate>{
	
	private Donate donate = new Donate();
	public Donate getModel() {
		return donate;
	}
	
	private DonateService donateService;
	public void setDonateService(DonateService donateService) {
		this.donateService = donateService;
	}
	
	public void add() throws Exception{//保存捐赠活动
		donate.setPtime(getCurrentTime.gettime());
		donateService.save(donate);
		JSONObject result = new JSONObject();
		result.put("success", true);
		ServletActionContext.getResponse().getWriter().print(result.toString());
	}
	public String del(){//删除捐赠活动
		donateService.del(donate);
		return NONE;
	}
	public String All() throws Exception{//所有捐赠活动
		HttpServletResponse response = ServletActionContext.getResponse();
		List<Donate> list = donateService.All();
		JSONObject jsonObject = new JSONObject();
		jsonObject.accumulate("rows", list);
		jsonObject.accumulate("total", 8);
		ResponseUtil.write(response, jsonObject);
		return NONE;
	}
}
