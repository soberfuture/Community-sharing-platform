package com.share.comments.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.share.comments.entity.Comments;
import com.share.comments.service.CommentsService;
import com.share.user.entity.User;
import com.share.util.ResponseUtil;
import com.share.util.getCurrentTime;

import net.sf.json.JSONObject;

@SuppressWarnings("serial")
public class CommentsAction extends ActionSupport implements ModelDriven<Comments> {

	private Comments comments = new Comments();
	public Comments getModel() {
		return comments;
	}
	
	private CommentsService commentsService;
	public void setCommentsService(CommentsService commentsService) {
		this.commentsService = commentsService;
	}
	
	public String addCom() throws Exception{
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		JSONObject jsonObject = new JSONObject();
		User user = (User) request.getSession().getAttribute("user");
		Integer order = Integer.valueOf(request.getParameter("order"));
		if(user==null){
			jsonObject.accumulate("result", false);
			jsonObject.accumulate("message", "您还没有登录！");
		}else{
			comments.setUid(user.getUid());
			comments.setCtime(getCurrentTime.gettime());
			commentsService.addCom(comments,order);
			jsonObject.accumulate("result", true);
			jsonObject.accumulate("message", "评价成功！");
		}
		ResponseUtil.write(response, jsonObject);
		return NONE;
	}
}
