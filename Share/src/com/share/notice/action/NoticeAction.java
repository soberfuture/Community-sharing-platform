package com.share.notice.action;

import java.util.List;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.share.notice.entity.Notice;
import com.share.notice.service.NoticeService;
import com.share.util.ResponseUtil;
import com.share.util.getCurrentTime;

import net.sf.json.JSONObject;

@SuppressWarnings("serial")
public class NoticeAction extends ActionSupport implements ModelDriven<Notice> {

	private Notice notice = new Notice();
	public Notice getModel() {
		return notice;
	}
	
	private NoticeService noticeService;
	public void setNoticeService(NoticeService noticeService) {
		this.noticeService = noticeService;
	}
	
	private Integer page=1;
	private Integer rows=10;
	
	public Integer getPage() {
		return page;
	}

	public void setPage(Integer page) {
		this.page = page;
	}

	public Integer getRows() {
		return rows;
	}

	public void setRows(Integer rows) {
		this.rows = rows;
	}

	public String addNotice() throws Exception{
		notice.setPtime(getCurrentTime.gettime());
		noticeService.saveOrUpdate(notice);
		JSONObject jsonObject = new JSONObject();
		jsonObject.accumulate("success", true);
		ResponseUtil.write(ServletActionContext.getResponse(), jsonObject);
		return NONE;
	}
	
	public String delNotice() throws Exception{
		noticeService.delNotice(notice);
		JSONObject jsonObject = new JSONObject();
		jsonObject.accumulate("success", true);
		ResponseUtil.write(ServletActionContext.getResponse(), jsonObject);
		return NONE;
	}
	
	public String findAll() throws Exception{
		List<Notice> list = noticeService.findAll(page,rows);
		int total = noticeService.gettotal();
		JSONObject jsonObject = new JSONObject();
		jsonObject.accumulate("rows", list);
		jsonObject.accumulate("total", total);
		ResponseUtil.write(ServletActionContext.getResponse(), jsonObject);
		return NONE;
	}
	
	public String reading(){
		Notice notice1 = noticeService.findByNid(notice.getNid());
		ServletActionContext.getRequest().getSession().setAttribute("notice", notice1);
		return "notice";
	}
	
	public String APage() throws Exception{
		JSONObject jsonObject = new JSONObject();
		List<Notice> nlist = noticeService.AllPaging(page,rows); 
		int ntotal = noticeService.gettotal();
		jsonObject.accumulate("page", page);
		jsonObject.accumulate("result2", nlist);
		jsonObject.accumulate("total2", ntotal);
		ResponseUtil.write(ServletActionContext.getResponse(), jsonObject);
		return NONE;
	}
}
