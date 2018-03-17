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
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<link rel="shortcut icon" type="image/x-icon" href="images/HomeIcon.jpg" media="screen" />
		<link rel="stylesheet" type="text/css" href="css/Login_s.css" />
		<script src="js/jquery-3.1.1.js"></script>
		<title>进入社区</title>
	</head>

<body>
<!-- 头部返回主页部分 -->
<div class="header">
	<div id="logo">
    	<img src="images/HomeIcon.jpg" width="90" height="90" /></a>
    </div>
    <span>您的生活有个圈</span>
</div>
<div class="middle_box">
    <div class="lr_box">
        <ul class="top_box">
            <li class="login_btn btn_now_show">登录</li>
            <li class="register_btn">注册</li>
        </ul>
        <div class="main_box">
            <div class="login_box box_show_now">
                <p class="error_box" id="error" ><s:actionerror cssClass="error_box"/> </p>
                <form action="user_login" method="post" class="form1" onsubmit="return validateCode()">
                    <input id="tel" name="tel" type="text" placeholder="账号" required="required" />
                    <input id="password" name="password" type="password" placeholder="密码" required="required" />
                    <input id="verificationCode" type="text" placeholder="验证码" required="required" />
                    <nav class="code" id="checkCode" onclick="createCodee()"></nav>
                    <input id="submit1" type="submit" value="登录" />
                    
                </form>
            </div>
            <div class="register_box">
                <p class="error_box" id="error_register"><s:actionmessage cssClass="error_box"/></p>
                <form action="user_add.action" class="form2">
                    <input id="tel" name="tel" type="text" placeholder="输入手机号" required="required" />
                    <input id="telcode" name="telcode" type="text" placeholder="验证码" required="required" />
                    <input type="button" class="tel_yzm" value="获取验证码" onclick="startTime(this)" />
                    <input id="username" name="username" type="text" placeholder="输入昵称" required="required" />
                    <input id="password" name="password" type="password" placeholder="输入密码" required="required" />
                    <input id="password1" name="password1" type="password" placeholder="再次输入密码" required="required" />
                    <input id="submit2" type="submit" value="注册" />
                </form>
            </div>
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
	createCodee();
	$('.header span').animate({opacity:"1"},1200);
});
/*登录注册按钮*/
var indexBtn = 0;
$('.top_box li').click(function(){
	indexBtn = $('.top_box li').index(this);
	changeBtnClass(indexBtn);
	showBox(indexBtn);
	});
function changeBtnClass(indexBtn){
	$('.top_box li').removeClass('btn_now_show').eq(indexBtn).addClass('btn_now_show');
	}
function showBox(indexBtn){
	$('.main_box div').removeClass('box_show_now').eq(indexBtn).addClass('box_show_now');
	//$('.main_box div').eq(indexBtn).fadeIn('slow');
	//$('.main_box div').eq(indexBtn).siblings().fadeOut('fast');
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
$('.login_box input:nth-child(3)').focus(function(){
	$(this).css({
		//"width":"300px",
		"background":"#fff",
		"color":"rgba(138,234,193,1)",
		"border":"1px solid rgba(115,205,180,1)"
		});
	});
$('.login_box input:nth-child(3)').blur(function(){
	$(this).css({
		//"width":"250px",
		"background":"rgba(255,255,255,0.2)",
		"color":"#fff",
		"border":"1px solid rgba(255,255,255,1)"
		});
	});
/*密码input部分*/
$('.register_box input:nth-child(1)').focus(function(){
	$(this).css({
		"width":"300px",
		"background":"#fff",
		"color":"rgba(138,234,193,1)",
		"border":"1px solid rgba(115,205,180,1)"
		});
	});
$('.register_box input:nth-child(1)').blur(function(){
	$(this).css({
		"width":"250px",
		"background":"rgba(255,255,255,0.2)",
		"color":"#fff",
		"border":"1px solid rgba(255,255,255,1)"
		});
	});
$('.register_box input:nth-child(2)').focus(function(){
	$(this).css({
		//"width":"300px",
		"background":"#fff",
		"color":"rgba(138,234,193,1)",
		"border":"1px solid rgba(115,205,180,1)"
		});
	});
$('.register_box input:nth-child(2)').blur(function(){
	$(this).css({
		//"width":"250px",
		"background":"rgba(255,255,255,0.2)",
		"color":"#fff",
		"border":"1px solid rgba(255,255,255,1)"
		});
	});
$('.register_box input:nth-child(4)').focus(function(){
	$(this).css({
		"width":"300px",
		"background":"#fff",
		"color":"rgba(138,234,193,1)",
		"border":"1px solid rgba(115,205,180,1)"
		});
	});
$('.register_box input:nth-child(4)').blur(function(){
	$(this).css({
		"width":"250px",
		"background":"rgba(255,255,255,0.2)",
		"color":"#fff",
		"border":"1px solid rgba(255,255,255,1)"
		});
	});
$('.register_box input:nth-child(5)').focus(function(){
	$(this).css({
		"width":"300px",
		"background":"#fff",
		"color":"rgba(138,234,193,1)",
		"border":"1px solid rgba(115,205,180,1)"
		});
	});
$('.register_box input:nth-child(5)').blur(function(){
	$(this).css({
		"width":"250px",
		"background":"rgba(255,255,255,0.2)",
		"color":"#fff",
		"border":"1px solid rgba(255,255,255,1)"
		});
	});
$('.register_box input:nth-child(6)').focus(function(){
	$(this).css({
		"width":"300px",
		"background":"#fff",
		"color":"rgba(138,234,193,1)",
		"border":"1px solid rgba(115,205,180,1)"
		});
	});
$('.register_box input:nth-child(6)').blur(function(){
	$(this).css({
		"width":"250px",
		"background":"rgba(255,255,255,0.2)",
		"color":"#fff",
		"border":"1px solid rgba(255,255,255,1)"
		});
	});
/*获取验证码*/
$('.tel_yzm').click(function(){
	var tel = $('.form2 #tel').val();
	$.ajax({
		url:"user_sendMsg",
		data:"tel="+tel,
		dataType:"json",
		type:"post",
		success : function(data){
			if(data.result){
				alert("发送成功！");
			}else{
				alert("电话号码不能为空！");
			}
		},
		error : function(){
			alert("出错！");
		}
	});
}); 
var countdown = 60;
var timer = null;
function startTime(val){
	timer = setTimeout(function() { 
	startTime(val) 
	},1000)
	if (countdown == 0) { 
		clearTimeout(timer);
		val.removeAttribute("disabled"); 
		val.value="重新获取"; 
		countdown = 60; 
		$('.tel_yzm').css({"cursor":"pointer"});
	} else { 
		val.setAttribute("disabled", true); 
		val.value = "(" + countdown + ")后重新发送"; 
		countdown --; 
		$('.tel_yzm').css({"cursor":"not-allowed"});
	}  
	}
//验证码部分
		var code;
        function createCodee() {
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
				return false;
                createCode();
            }
            else 
            {
				return true;
            }       
        }
$(window).ready(function(e){
	$('.tel_yzm').attr("disabled",true);
});
$('.form2').mousemove(function(){
	var tel2 = $('.form2 #tel').val();
	if(tel2 == ''){
		$('.tel_yzm').attr("disabled",true);
	}
});
/*正则部分*/
/*注册*/
var b = 0;
var c = 0;
var d = 0;
$('.form2 #tel').blur(function(){
	var tel2Val = $('.form2 #tel').val();
	var tel2Ret = /^1[34578]\d{9}$/;
	if(tel2Val == ''){
		$('#error_register').html('');
		$('.tel_yzm').attr("disabled",true);
		}
	if(!tel2Ret.test(tel2Val) && tel2Val != ''){
		$('#error_register').html('不是正确的手机号');
		$('.tel_yzm').attr("disabled",true);
		b = 0;
		}
	if(tel2Ret.test(tel2Val) && tel2Val != ''){
			$('#error_register').html('');
			$('.tel_yzm').attr("disabled",false);
			b=1;
		}
	$.ajax({
		url : "user_checkExist.action",
		dataType : "json",
		type : "post",
		data : "tel="+tel2Val,
		success:function(data){
			if(data.result){
				$('#error_register').html('手机号已注册');
				$('.tel_yzm').attr("disabled",true);
				c=0;
			}else{
				//$('.tel_yzm').attr("disabled",false);
				c=1;
			}
		},
	});
	
	});
$('#username').blur(function(){
	var username = $(this).val();
	if(username!=''){
		$.ajax({
			url : "user_checkUsername",
			dataType : "json",
			data : "username="+username,
			type : "post",
			success :function(data){
				if(!data.result){
					$('#error_register').html('用户名已存在');
					d=0;
				}else{
					d=1;
				}
			},
		});
	}else{
		d=0;
	}
});

var flagLogin = false;
$('.form1 #tel').blur(function(){
	$('#error').empty();
	var telVal = $('.form1 #tel').val();
	var telRet = /^1[34578]\d{9}$/;
	if(telVal == ''){
		$('#error').html('');
		flagLogin = false
		}
	if(!telRet.test(telVal) && telVal != ''){
		$('#error').html('手机号格式不正确');
		flagLogin = false
		}
	if(telRet.test(telVal) && telVal != ''){
			$('#error').html('');
			flagLogin = true;
		}
	});
/*注册提交*/
var a = 0;
$('.form2 #password1').blur(function(){
	//alert('asd');
	var pwd = $('.form2 #password').val();
	var pwd1 = $('.form2 #password1').val();
	if(pwd == '' || pwd1 == ''){
		$('#error_register').html('您还没有输入密码');
		a = 0;
	}
	if(pwd != pwd1 && pwd != '' && pwd1 != ''){
		$('#error_register').html('两次密码不一致');
		a = 0;
	}
	if(pwd == pwd1 && pwd != '' && pwd1 != ''){
		$('#error_register').html('');
		a = 1;
	}
});
$('.form2').submit(function(){
	if(a == 1 && b== 1 && c==1 &&d==1){
		return true;
	}else{
		return false;
	}
});
/*登录提交*/
$('.form1').submit(function(){
	if(!flagLogin){
		return false;
	}
});

</script>
</html>
