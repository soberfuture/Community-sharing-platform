<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
   	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<link rel="shortcut icon" type="image/x-icon" href="images/HomeIcon.png" media="screen" />
	<link rel="stylesheet" type="text/css" href="css/Register.css" />
	<script src="js/jquery-3.1.1.js"></script>
	<title>欢迎您的加入</title>
	</head>

<body ondragstart="return false">
<!-- 头部返回主页部分 -->
<div class="header">
	<div id="logo">
    	<a title="点击返回主站" href="Home.html"><img src="images/HomeIcon.jpg" width="90" height="90" /></a>
    </div>
    <span class="welcome">欢迎您的加入！</span>
    
</div>
<!-- 注册部分 -->
<div id="registerBg">
<div id="registerBox">
<div id="registerMain">
	<form class="form" onreset="qingkong()" onsubmit="return panduan()" id="form" action="user_add.action" method="post">
	<div id="usernameBox">
    	<div class="titleSection"><img src="images/user.png" /></div>
    	<div class="inputSection">
        	<input id="username" name="username" type="text" required="required" placeholder="请输入用户名" />
        </div>
        <div class="messagesSection"><label id="userMessages"></label></div>
        	</div>
        	<div id="password1Box">
            	<div class="titleSection"><img src="images/lockIcon.png" /></div>
            	<div class="inputSection">
            		<input id="password" name="password" type="password" required="required" placeholder="请输入密码" />
            	</div>
            	<div class="messagesSection"><label id="pwd1Messages"></label></div>
			</div>
        	<div id="password2Box">
            	<div class="titleSection"><img src="images/lockIcon.png" /></div>
            	<div class="inputSection">
            		<input id="password2" name="password2" type="password" required="required" placeholder="请再次输入密码" />
            	</div>
            	<div class="messagesSection"><label id="pwd2Messages"></label></div>
			</div>
            <div id="emailBox">
            	<div class="titleSection"><img src="images/email.png" /></div>
            	<div class="inputSection">
           			<input id="email" name="email" type="text" placeholder="请输入您的邮箱" required="required" />
            	</div>
            	<div class="messagesSection"><label id="emailMessages"></label></div> 
			</div>
            <div id="nameBox">
                <div class="titleSection"><img src="images/name.png" /></div>
                <div class="inputSection">
                    <input id="name" name="name" type="text" required="required" placeholder="请输入您的姓名" />
                </div>
               	<div class="messagesSection"><label id="nameMessages"></label></div>
            </div>
            <div id="sexBox">
                <div class="titleSection"><img src="images/sex.png" /></div>
                <div class="inputSection">
                    <select id="sex" name="sex" />
                        <option value="男">男</option>
                        <option value="女">女</option>
                    </select>
                </div>
                <div class="messagesSection"><label id="sexMessages"></label></div>
            </div>
            <div id="idBox">
                <div class="titleSection"><img src="images/idcard.png" /></div>
                <div class="inputSection">
                    <input id="idcard" name="idcard" type="text" placeholder="您的身份证号" required="required" />
                </div>
                <div class="messagesSection"><label id="idCardMessages"></label></div>
            </div>
            <div id="telBox">
                <div class="titleSection"><img src="images/tel.png" /></div>
                <div class="inputSection">
                    <input id="tel" name="tel" type="text" placeholder="您的电话号码" required="required" />
                </div>
                <div class="messagesSection"><label id="telMessages"></label></div>
            </div>
            
            <div id="addressBox">
                <div class="titleSection"><img src="images/address.png" /></div>
                <div class="inputSection">
                    <input id="address" name="address" required="required" type="text" placeholder="您的居住地址" />
                </div>
                <div class="messagesSection"><label id="addressMessages"></label></div>
            </div>
		<div id="buttonBox">
        	<button type="submit">注册</button>
            <button type="reset">重置</button>
        </div>
	</form>
    <span class="toLogin">已有账号？<a title="点击登录" href="Login.html">点击登录</a></span>
    </div>
</div>
</div>
<!-- 底部部分 -->
<div class="footer">
	<div id="footerSection">
		<p id="footerTitle">CopyRight &copy; 2017 1073****@qq.com 九江市|信息科学与技术学院</p>
    	<p id="footerPrompt">本站请使用IE9.0或以上版本 Chrome浏览器请使用80%比例</p>
	</div>
</div>
</body>
<script>
$(window).ready(function(e) {
	$('#registerBox').css({"display":"block"});
	$('#registerBox').animate({"opacity":"1"},600,function(){
		$('#registerMain').css({"display":"block"});
		$('#registerMain').animate({"opacity":"1"},1000,function(){
			$('.header .welcome').animate({"opacity":"1"},1000);
			});
		});
	});
var a = 0;
var b = 0;
var c = 0;
var d = 0;
var e = 0;
var f = 0;
var g = 0;
var h = 0;
//$(window).ready(function(e) {
//用户名
$('#username').focus(function(){
	$('#userMessages').css({"color":"black"});
	$('#userMessages').html('请输入');
	});
$('#username').blur(function(){
	var usernameVal = $("#username").val();
	//var usernameRet = /^[a-zA-Z][a-zA-Z0-9_]{5,20}$/;
	if(usernameVal != ''){
		$.ajax({
			        url : "user_checkUsername.action",
			        type : "post",
			        dataType : "json",
			        data : "username="+usernameVal,
			        success : function(data) {
			            if(data.result){
			            	$('#userMessages').css({"color":"green"});
					        $('#userMessages').html('√');
							a = 1;
			            }else{
			            	$('#userMessages').css({"color":"red"});
							$('#userMessages').html('用户已存在！');
			            }
			        }
			    });
	}else{
		$('#userMessages').css({"color":"red"});
		$('#userMessages').html('您还没有输入');
	}
	});
//密码
$('#password').focus(function(){
	$('#pwd1Messages').css({"color":"black"});
	$('#pwd1Messages').html('长度为6~16位');
	});
$('#password').blur(function(){
	var pwd1Val = $("#password").val();
	var pwd1Ret =/^(\w){6,16}$/;
	if(pwd1Ret.test(pwd1Val)){
		$('#pwd1Messages').css({"color":"green"});
        $('#pwd1Messages').html('√');
		b = 1;
      	}
	if(!pwd1Ret.test(pwd1Val)){
		$('#pwd1Messages').css({"color":"red"});
        $('#pwd1Messages').html('密码格式不正确，请重新填写');
      	}
	if(pwd1Val == null || pwd1Val == ''){
		$('#pwd1Messages').css({"color":"red"});
		$('#pwd1Messages').html('您还没有输入');
		}
	});
//再次输入密码
$('#password2').focus(function(){
	$('#pwd2Messages').css({"color":"black"});
	$('#pwd2Messages').html('再次输入密码');
	});
$('#password2').blur(function(){
	var pwd1Val = $("#password").val();
	var pwd1Ret = /^(\w){6,16}$/;
	if($('#password2').val() == null ||  $('#password2').val() == ''){
		$('#pwd2Messages').css({"color":"red"});
		$('#pwd2Messages').html('您还没有输入');
		}
	else if($('#password').val() == null ||  $('#password').val() == ''){
		$('#pwd2Messages').css({"color":"red"});
		$('#pwd2Messages').html('您还没有输入首次密码');
		}
	else if($('#password').val() == $('#password2').val() && !pwd1Ret.test(pwd1Val)){
		$('#pwd2Messages').css({"color":"red"});
		$('#pwd2Messages').html('密码格式不正确，请检查');
		
		}
	else if($('#password').val() == $('#password2').val() && pwd1Ret.test(pwd1Val)){
		$('#pwd2Messages').css({"color":"green"});
		$('#pwd2Messages').html('√');
		c = 1;
		}
	else if($('#password').val() != $('#password2').val()){
		$('#pwd2Messages').css({"color":"red"});
		$('#pwd2Messages').html('两次密码不一样');
		}
	});
//邮箱
$('#email').focus(function(){
	$('#emailMessages').css({"color":"black"});
	$('#emailMessages').html('输入邮箱，格式如：10735@qq.com');
	});
$('#email').blur(function(){
	var emailVal = $("#email").val();
	var emailRet = /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(.[a-zA-Z0-9_-])+/;
	if(emailVal == null || emailVal == ''){
		$('#emailMessages').css({"color":"red"});
		$('#emailMessages').html('您还没有输入');
		}
	else if(emailRet.test(emailVal)){
		$('#emailMessages').css({"color":"green"});
        $('#emailMessages').html('√');
		d = 1;
		}
	else if(!emailRet.test(emailVal)){
		$('#emailMessages').css({"color":"red"});
        $('#emailMessages').html('邮箱格式不正确，请重新填写');
		}	
	});
//姓名
$('#name').focus(function(){
	$('#nameMessages').css({"color":"black"});
	$('#nameMessages').html('输入您的姓名');
	});
$('#name').blur(function(){
	var nameVal = $("#name").val();
	var nameRet = /^[\u4E00-\u9FA5A-Za-z]+$/;
	if(nameVal == null || nameVal == ''){
		$('#nameMessages').css({"color":"red"});
		$('#nameMessages').html('您还没有输入');
		}
	else if(nameRet.test(nameVal)){
		$('#nameMessages').css({"color":"green"});
        $('#nameMessages').html('√');
		e = 1;
		}
	else if(!nameRet.test(nameVal)){
		$('#nameMessages').css({"color":"red"});
        $('#nameMessages').html('姓名格式不正确，请重新填写');
		}
	});
//性别
$('#sex').focus(function(){
	$('#sexMessages').css({"color":"black"});
	$('#sexMessages').html('选择您的性别');
	});
$('#sex').blur(function(){
	$('#sexMessages').css({"color":"green"});
	$('#sexMessages').html('√');
	});
//身份证
$('#idcard').focus(function(){
	$('#idCardMessages').css({"color":"black"});
	$('#idCardMessages').html('输入您的身份证号(X为大写)');
	});
$('#idcard').blur(function(){
	var idCardVal = $("#idcard").val();
	var idCardRet = /^[1-9]\d{5}[1-9]\d{3}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{3}([0-9]|X)$/;;
	if(idCardVal == null || idCardVal == ''){
		$('#idCardMessages').css({"color":"red"});
		$('#idCardMessages').html('您还没有输入');
		}
	else if(idCardRet.test(idCardVal)){
		$('#idCardMessages').css({"color":"green"});
        $('#idCardMessages').html('√');
		f = 1;
		}
	else if(!idCardRet.test(idCardVal)){
		$('#idCardMessages').css({"color":"red"});
        $('#idCardMessages').html('身份证号码格式不正确，请重新填写');
		}
	});
//电话
$('#tel').focus(function(){
	$('#telMessages').css({"color":"black"});
	$('#telMessages').html('输入您的手机号');
	});
$('#tel').blur(function(){
	var telVal = $("#tel").val();
	var telRet = /^(13[0-9]|15[012356789]|17[678]|18[0-9]|14[57])[0-9]{8}$/;
	if(telVal == null || telVal == ''){
		$('#telMessages').css({"color":"red"});
		$('#telMessages').html('您还没有输入');
		}
	else if(telRet.test(telVal)){
		$('#telMessages').css({"color":"green"});
        $('#telMessages').html('√');
		g = 1;
		}
	else if(!telRet.test(telVal)){
		$('#telMessages').css({"color":"red"});
        $('#telMessages').html('手机格式不正确，请重新填写');
		}
	});
//地址
$('#address').focus(function(){
	$('#addressMessages').css({"color":"black"});
	$('#addressMessages').html('输入您的家庭住址');
	});
$('#address').blur(function(){
	var addressVal = $("#address").val();
	var addressRet = /^(?=.*?[\u4E00-\u9FA5])[\dA-Za-z\u4E00-\u9FA5]+$/;
	if(addressVal == null || addressVal == ''){
		$('#addressMessages').css({"color":"red"});
		$('#addressMessages').html('您还没有输入');
		}
	else if(addressRet.test(addressVal)){
		$('#addressMessages').css({"color":"green"});
        $('#addressMessages').html('√');
		h = 1;
		}
	else if(!addressRet.test(addressVal)){
		$('#addressMessages').css({"color":"red"});
        $('#addressMessages').html('地址格式不正确，请重新填写');
		}
	});
//});  
//提交前判断
function panduan(){
	if(a + b + c + d + e + f + g + h == 8){
		return true;
	}else{
		alert('填写有误，请对应改正！');
		return false;
	}
	}
//清空按钮
function qingkong(){
	$('.messagesSection label').html('');
	}
	

</script>
</html>
