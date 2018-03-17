<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <link rel="shortcut icon" type="image/x-icon" href="images/HomeIcon.png" media="screen">
	<link rel="stylesheet" type="text/css" href="css/Login_s.css" />
	<script src="js/jquery-3.1.1.js"></script>
	<title>进入您的社区</title>
  </head>

<body>
<!-- 头部返回主页部分 -->
<div class="header">
	<div id="logo">
    	<a title="点击返回主站"><img src="images/HomeIcon.jpg" width="90" height="90" /></a>
    </div>
    <span>社区共享平台</span>
</div>
<div class="middle_box">
    <div class="lr_box">
		<ul class="top_box">
		    <li class="login_btn btn_now_show" style="width: 100%;text-align:center;">登录</li>
		</ul>
		<div class="main_box">
		    <div class="login_box box_show_now">
		        <p class="error_box" id="error" ><s:actionerror cssClass="error_box"/> </p>
		        <form action="admin_login" method="post" class="form1">
		            <input id="adminname" name="adminname" type="text" placeholder="账号" required="required" />
		            <input style="margin-top: 18px;" id="password" name="password" type="password" placeholder="密码" required="required" />
		            <input style="margin-left: 25px;margin-bottom: 40px;" id="submit1" type="submit" value="登录" /> 
		        </form>
		    </div>
		</div>
	</div>
</div>
</body>
<script>

$(window).ready(function(e) {
	//登录框部分
	$('#loginBox').animate({opacity:"1"},900,function(){
		$('.header span').animate({opacity:"1"},700);
		});
	//用户名获得/失去焦点
	$('#username').focus(function(){
		/*$('#userIcon').css({
			"background":"url(../images/userLight.png) no-repeat",
			"background-size":"38px 38px"
			});*/
		$('#loginBox').css({
			//"box-shadow":"0 0 10px 10px rgba(255,0,0,0.4)"
			"box-shadow":"0 0 10px 10px rgba(0,255,0,0.4)"
			});
		});
	$('#username').blur(function(){
		/*$('#userIcon').css({
			"background":"url(../images/user2.png) no-repeat",
			"background-size":"38px 38px"
			});*/
		$('#loginBox').css({
			"box-shadow":"0 0 10px 5px rgba(204,204,204,1)"
			});
		});
	//密码获得/失去焦点
	$('#password').focus(function(){
		/*$('#pwdIcon').css({
			"background":"url(../images/unlock.png) no-repeat",
			"background-size":"35px 38px"
			});*/
		$('#loginBox').css({
			//"box-shadow":"0 0 10px 10px rgba(0,0,255,0.4)"
			"box-shadow":"0 0 10px 10px rgba(0,255,0,0.4)"
			});
		});
	$('#password').blur(function(){
		/*$('#pwdIcon').css({
			"background":"url(../images/Lock.png) no-repeat",
			"background-size":"35px 38px"
			});*/
		$('#loginBox').css({
			"box-shadow":"0 0 10px 5px rgba(204,204,204,1)"
			});
		});
	//验证码获得/失去焦点
	$('#verificationCode').focus(function(){
		$('#loginBox').css({
			"box-shadow":"0 0 10px 10px rgba(0,255,0,0.4)"
			});
		});
	$('#verificationCode').blur(function(){
		$('#loginBox').css({
			"box-shadow":"0 0 10px 5px rgba(204,204,204,1)"
			});
		});
});
//验证码部分
		var code;
        function createCode() {
            code = "";
            var codeLength = 6; //验证码的长度
            var checkCode = document.getElementById("checkCode");
            var codeChars = new Array(0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 
            'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z',
            'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'); //所有候选组成验证码的字符，当然也可以用中文的
            for (var i = 0; i < codeLength; i++) 
            {
                var charNum = Math.floor(Math.random() * 52);
                code += codeChars[charNum];
            }
            if (checkCode) 
            {
                checkCode.className = "code";
                checkCode.innerHTML = code;
            }
        }
        function validateCode() 
        {
            var inputCode = document.getElementById("verificationCode").value;
			var error = document.getElementById("error");
            if (inputCode.length <= 0) 
            {
                error.innerHTML = "您还没有输入验证码！";
				return false;
            }
            else if (inputCode.toUpperCase() != code.toUpperCase()) 
            {
				error.innerHTML = "验证码输入有误！";
				createCode();
				return false;
            }
            else 
            {
				error.innerHTML = "验证码正确！";
				error.style.color = "green";
				return true;
            }        
        }
        /*登录input部分*/
        $('.login_box input:nth-child(1)').focus(function(){
        	$('.error_box ul li span').html('');
        	$(this).css({
        		"width":"300px",
        		"background":"#fff",
        		"color":"rgba(138,234,193,1)",
        		"border":"1px solid rgba(115,205,180,1)"
        		});
        	});
        $('.login_box input:nth-child(1)').blur(function(){
        	$(this).css({
        		"width":"250px",
        		"background":"rgba(255,255,255,0.2)",
        		"color":"#fff",
        		"border":"1px solid rgba(255,255,255,1)"
        		});
        	});
        $('.login_box input:nth-child(2)').focus(function(){
        	$(this).css({
        		"width":"300px",
        		"background":"#fff",
        		"color":"rgba(138,234,193,1)",
        		"border":"1px solid rgba(115,205,180,1)"
        		});
        	});
        $('.login_box input:nth-child(2)').blur(function(){
        	$(this).css({
        		"width":"250px",
        		"background":"rgba(255,255,255,0.2)",
        		"color":"#fff",
        		"border":"1px solid rgba(255,255,255,1)"
        		});
        	});
	</script>
</html>
