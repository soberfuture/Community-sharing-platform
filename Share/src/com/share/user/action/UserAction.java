package com.share.user.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.share.fans.service.FansService;
import com.share.sales.entity.Sales;
import com.share.sales.service.SalesService;
import com.share.share.entity.Share;
import com.share.share.service.ShareService;
import com.share.user.entity.User;
import com.share.user.service.UserService;
import com.share.util.ResponseUtil;
import com.share.util.SendMsg;
import com.share.util.getCurrentTime;

import net.sf.json.JSONObject;

@SuppressWarnings("serial")
public class UserAction extends ActionSupport implements ModelDriven<User>{

	private User user = new User();
	
	public User getModel() {
		return user;
	}
	
	private UserService userService;
	private FansService fansService;
	private ShareService shareService;
	private SalesService salesService;
	private String telcode;
	public void setTelcode(String telcode) {
		this.telcode = telcode;
	}

	public void setShareService(ShareService shareService) {
		this.shareService = shareService;
	}

	public void setSalesService(SalesService salesService) {
		this.salesService = salesService;
	}

	public void setFansService(FansService fansService) {
		this.fansService = fansService;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	private Integer page=1;
	private Integer rows=20;
	
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

	public String loginPage(){//跳转到登录页面
		return "login";
	}
	
	public String registerPage(){//跳转到注册页面
		return "registerPage";
	}
	
	public String add(){//添加一个用户
		String code = (String) ServletActionContext.getRequest().getSession().getAttribute("code");
		if(!telcode.equals(code)){
			addActionError("验证码错误！");
			return "login";
		}else{
		user.setAttention(0);
		user.setPicture("images/a6.png");
		user.setLifecoin(0);
		user.setPoints(0);
		user.setCredit(75);
		user.setFans(0);
		user.setTime(getCurrentTime.gettime());
		userService.save(user);
		return "login";
		}
	}
	
	public void checkpwd() throws Exception{//验证账号密码，并跳转到相应的页面
		JSONObject jsonObject = new JSONObject();
		HttpServletResponse response = ServletActionContext.getResponse();
		HttpServletRequest request = ServletActionContext.getRequest();
		User user1 = (User) request.getSession().getAttribute("user");
		String oldpwd = request.getParameter("password1");
		String newpwd = request.getParameter("password2");
		if(user1.getPassword().equals(oldpwd)){
			user1.setPassword(newpwd);
			userService.save(user1);
			ServletActionContext.getRequest().getSession().invalidate();
			jsonObject.accumulate("result", true);
			ResponseUtil.write(response, jsonObject);
		}else{
			jsonObject.accumulate("result", false);
			ResponseUtil.write(response, jsonObject);
		}
	}
	
	public String login(){
		User checkuser = userService.checkUser(user);
		if(checkuser==null){
			this.addActionError("用户名或密码错误！");
			return "login";
		}else{
			ServletActionContext.getRequest().getSession().setAttribute("user", checkuser);
			return "index";
		}
	}
	
	public String exit(){
		ServletActionContext.getRequest().getSession().invalidate();
		return "index";
	}

	
	public String userlist() throws Exception{
		List<User> userlist = userService.userlist(page,rows);
		int total = userService.gettotal();
		this.toBeJson(userlist,total);
		return null;
	}

	private void toBeJson(List<User> userlist, int total) throws IOException {
		HttpServletResponse response = ServletActionContext.getResponse();
		JSONObject jsonObject = new JSONObject();
		jsonObject.accumulate("total", total);
		jsonObject.accumulate("rows", userlist);
		response.setCharacterEncoding("utf-8");
		response.getWriter().write(jsonObject.toString());
	}

	//检验用户名是否已存在
	public void checkUsername() throws Exception{
		HttpServletResponse response = ServletActionContext.getResponse();
		JSONObject jsonObject = new JSONObject();
		if(userService.checkUsername(user.getUsername())==0){
			jsonObject.put("result", true);//不存在是为TRUE
		}else{
			jsonObject.put("result", false);//已存在是为FALSE
		}
		ResponseUtil.write(response, jsonObject);
	}
	/*我关注的所有人*/
	public String myfocus(){
		User user = (User) ServletActionContext.getRequest().getSession().getAttribute("user");
		List<User> userlist = fansService.findByUid(user.getUid());
		ActionContext.getContext().getValueStack().set("userlist", userlist);
		return "myfocus";
	}
	
	public String findGoods(){
		List<Share> sharelist = shareService.findByUid(user.getUid());
		List<Sales> saleslist = salesService.findlistByUid(user.getUid());
		User concern = userService.findByUid(user.getUid());
		ServletActionContext.getRequest().getSession().setAttribute("concern", concern);
		ActionContext.getContext().getValueStack().set("sharelist", sharelist);
		ActionContext.getContext().getValueStack().set("saleslist", saleslist);
		return "hisgoods";
	}
	
	public void sendMsg() throws Exception{//发送验证码
		JSONObject jsonObject = new JSONObject();
		if(user.getTel()==null){
			jsonObject.accumulate("result", false);
			ResponseUtil.write(ServletActionContext.getResponse(), jsonObject);
		}else{
			String code = SendMsg.getRandom();
			SendMsg.sendMessage(user.getTel(), code);
			ServletActionContext.getRequest().getSession().setAttribute("code", code);
			jsonObject.accumulate("result", true);
			ResponseUtil.write(ServletActionContext.getResponse(), jsonObject);
		}
	}
	
	public void topup() throws IOException{//生活币的充值
		User user1 = (User) ServletActionContext.getRequest().getSession().getAttribute("user");
		user1.setLifecoin(user1.getLifecoin()+user.getLifecoin());
		userService.save(user1);
		ServletActionContext.getRequest().getSession().setAttribute("user", user1);
		ResponseUtil.Rmessage();
	}
	
	public void checkExist() throws Exception{
		JSONObject jsonObject = new JSONObject();
		User existUser = userService.checkExist(user.getTel());
		if(existUser==null){
			jsonObject.accumulate("result", false);
		}else{
			jsonObject.accumulate("result", true);
		}
		ResponseUtil.write(ServletActionContext.getResponse(), jsonObject);
	}
	
	public void revise() throws IOException{
		User user1 = (User) ServletActionContext.getRequest().getSession().getAttribute("user");
		System.out.println(user.getAddress()+user.getMotto());
		user1.setName(user.getName());
		user1.setAddress(user.getAddress());
		user1.setBirthday(user.getBirthday());
		user1.setEmail(user.getEmail());
		user1.setMotto(user.getMotto());
		user1.setSex(user.getSex());
		userService.save(user1);
		ServletActionContext.getRequest().getSession().setAttribute("user", user1);
		ResponseUtil.Rmessage();
	}
} 
