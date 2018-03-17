<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>用户</title>
    
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<link rel="shortcut icon" type="image/x-icon" href="images/HomeIcon.jpg" media="screen" />
	<link rel="stylesheet" type="text/css" href="css/User.css" />
	<script src="js/jquery-3.1.1.js"></script>
	<title>欢迎您</title>
  </head>
  
 <body>
 <s:if test="#session.user==null">
 	<jsp:forward page="index.action"></jsp:forward>
 </s:if>
<div class="wrapper">
	<!-- 左边部分 -->
    <div class="sider_left">
        <div class="sider_box">
        	<div class="sider_box_top">
            	<div class="sider_box_top_userImg">
                	<img src="images/user.jpg" />
                </div>           
                <div class="sider_box_top_username" title="生活币">
                	<p class="lifecoin_num">￥<s:property value="#session.user.lifecoin"/></p>
                </div>
            </div>
            <div class="sider_box_nav_list">
            	<li><a class="siderOn" href="order_findByUUid?state=2" title="我是卖家" target="iframe1"><span>我是卖家</span></a></li>
                <li><a href="order_findByUid?state=1" title="我是买家" target="iframe1"><span>我是买家</span></a></li>
                <li><a href="user_myfocus" title="我的关注" target="iframe1"><span>我的关注</span></a></li>
                <li><a href="share_findByUid" title="物品管理" target="iframe1"><span>物品管理</span></a></li>
                <li><a href="activity_findList" title="活动管理" target="iframe1"><span>活动管理</span></a></li>
                <li><a href="user/msg.jsp" title="个人信息" target="iframe1"><span>个人信息</span></a></li>
                <li><a href="user/repwd.jsp" title="修改密码" target="iframe1"><span>修改密码</span></a></li>
                <li><a href="index" title="返回"><span>返回</span></a></li>
            </div>
        </div>
        <div class="sider_box_background" style="background-image: url(images/sidebar_left.jpg);"></div>
    </div>
   	<!-- 右边部分 -->
    <div class="main_right">
    	<iframe id="iframe1" name="iframe1" class="iframe" src="order_findByUUid?state=2" width="100%" height="100%" frameborder="0" scrolling="auto">
        </iframe>
    </div>
</div>
</body>
<script>
/*左边按钮*/
var index = 0;
$('.sider_box_nav_list li a').click(function(){
	index = $(".sider_box_nav_list li a").index(this);
	showBg(index);
	});
function showBg(index){
	$(".sider_box_nav_list li a").removeClass('siderOn').eq(index).addClass('siderOn');
	}
$('.sider_box_nav_list li:nth-child(4) a').click(function(){
	$('.iframe').attr("src","sales_more.html");
	});
</script>
</html>
