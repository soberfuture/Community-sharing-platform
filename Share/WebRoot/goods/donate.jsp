<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'share.jsp' starting page</title>
   
	 	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<link rel="shortcut icon" type="image/x-icon" href="images/HomeIcon.jpg" media="screen" />
	<link rel="stylesheet" type="text/css" href="css/sales_more.css" />
	<script src="jq/jquery-3.1.1.js"></script>
	<title>更多热销</title>
  </head>
  
  <body>
  <!-- 头部部分 -->
<div class="top_header">
	<div class="top_header_section">
    	<div class="top_header_left">
            <a class="to_home" href="home.html">
            	<span class="backHome"></span>
            	<p>返回主页</p>
            </a>
        </div>
        <div class="top_header_right">
        	<p>没有账号？<a class="to_register" href="user_registerPage.action">注册一个</a></p>
        </div>
    </div>
</div>
<div class="sales_more_top_box">
<div class="sales_more_top">
	<div class="sales_more_top_left">热销</div>
    <div class="sales_more_top_right">
    	<s:if test="#session.user==null">
    	<span><a href="user_loginPage.action" title="登录">登录</a></span>
    	</s:if>
    	<s:else>
            <div class="login_after">
            	<img src="images/a6.png" class="firstImg" />
                <span class="username">用户名</span>
                <div class="userToolBox">
                	<div class="userToolBox_userImg">
                    	<img src="images/a6.png" />
                    </div>
                    <div class="userToolBox_username">
                    	用户名
                    </div>
                    <div class="userToolBox_myProfile">
                    	<a href="#">我的资料</a>
                    </div>
                    <div class="userToolBox_exit">
                    	<a href="#">退出</a>
                    </div>
                </div>
            </div>
           </s:else>
    </div>
</div>
</div>
<!-- 内容部分-->
<div class="main_box">
	<div class="main_title">
    	<span class="main_title_top">热销</span>
        <span class="main_title_bottom">更多好货&emsp;你来发现</span>
    </div>
	<div class="main_section">
        <div class="nav_bigbox">
            <div class="nav_box" id="nav_box_P">
                <ul class="cls_list">
                    <li class="now_cls_list">全部</li>
                    <li>分类一</li>
                    <li>分类二</li>
                    <li>分类三</li>
                    <li>分类四</li>
                    <li>分类五</li>
                    <li>分类六</li>
                    <li>分类七</li>
                    <li>分类八</li>
                    <li>分类九</li>
                </ul>
            </div> 
        </div>
    	
    </div>
    </div>
   <div>
   <jsp:forward page="donate_allDonate.action"></jsp:forward>
   </div>

  </body>
</html>
