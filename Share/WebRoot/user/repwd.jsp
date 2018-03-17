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
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<link rel="shortcut icon" type="image/x-icon" href="images/HomeIcon.jpg" media="screen" />
		<link rel="stylesheet" type="text/css" href="css/change_password.css" />
		<script src="js/jquery-3.1.1.js"></script>
		<title>修改密码</title>
	</head>

<body>
<div class="pswbox">
	<form class="form">
    	<div class="title"><h4>请填写所需的信息</h4></div>
        <table cellspacing="0" cellpadding="0" class="formtable">
            <tbody>
                <tr>
                    <th>旧密码：</th>
                    <th><input id="password1" name="password1" type="password" class="old_psw" required="required"/></th>
                    <th><label class="err_old_psw"><s:actionerror/></label></th>
                </tr>
                <tr>
                    <th>新密码：</th>
                    <th><input id="password2" name="password2"  type="password" class="new_psw" required="required"/></th>
                    <th><label class="err_new_psw"></label></th>
                </tr>
                <tr>
                    <th>重新输入密码：</th>
                    <th><input id="password3" name="password3"  type="password" class="new_psw2" required="required"/></th>
                    <th><label class="err_new_psw2"></label></th>
                </tr>
                <tr>
                    <th>&nbsp;</th>
                    <th><input type="submit" value="修改密码" class="sub" /></th>
                    <th>&nbsp;</th>
                </tr>
            </tbody>
        </table>
   	</form>   
</div>
</body>
<script>
var a = 0;
var b = 0;
var c = 0;
var index = 0;
$('.form input:not(.sub)').focus(function(){
	index = $('.form input:not(.sub)').index(this);
	$('.form label').eq(index).html('');
	});
$('.old_psw').blur(function(){
	if($('.old_psw').val().length>=6&&$('.old_psw').val().length<=16){
		a = 1;
	}else{
		$('.err_old_psw').css({"color":"#FB404B"});
		$('.err_old_psw').html('请输入6~16位密码！');
	}
});
$('.new_psw').blur(function(){
	if($(".old_psw").val() == ''){
		$('.err_new_psw').css({"color":"#FB404B"});
		$('.err_new_psw').html('请输入旧密码！');
		}
	else if($(".new_psw").val() == ''){
		$('.err_new_psw').css({"color":"#FB404B"});
		$('.err_new_psw').html('请输入！');
		}
	else if($(".old_psw").val() == $(".new_psw").val()){
		$('.err_new_psw').css({"color":"#FB404B"});
		$('.err_new_psw').html('新密码与旧密码一致！');
		}
	else if($(".new_psw").val().length < 6 || $(".new_psw").val().length > 16){
		$('.err_new_psw').css({"color":"#FB404B"});
		$('.err_new_psw').html('请输入6~16位密码！');
		} 
	else{
		$('.err_new_psw').css({"color":"green"});
		$('.err_new_psw').html('√');
		b = 1;
		}
	});
$('.new_psw2').blur(function(){
	if($(".new_psw2").val() != $(".new_psw").val()){
		$('.err_new_psw2').css({"color":"#FB404B"});
		$('.err_new_psw2').html('两次密码不一致！');
		}
	else if($(".new_psw2").val() == ''){
		$('.err_new_psw2').css({"color":"#FB404B"});
		$('.err_new_psw2').html('请输入！');
		}
	else if($(".new_psw").val().length < 6 || $(".new_psw").val().length > 16){
		$('.err_new_psw2').css({"color":"#FB404B"});
		$('.err_new_psw2').html('请输入6~16位密码！');
		} 
	else if($(".new_psw2").val() == $(".new_psw").val()){
		$('.err_new_psw2').css({"color":"green"});
		$('.err_new_psw2').html('√');
		c = 1;
		}
	});
//提交前判断
function panduan(){
	if(a + b + c == 3){
		return true;
	}else{
		alert('填写有误，请改正！');
		return false;
	}
	}
$('.sub').click(function(){
	var oldp = $('.old_psw').val();
	var newp = $('.new_psw').val();
	$.ajax({
		cache: true,
		async: false,
		url:"user_checkpwd",
		data:"password1="+oldp+"&password2="+newp,
		dataType:"json",
		type:"post",
		success:function(data){
			if(data.result){
				alert("修改成功！");
				window.location.reload();
			}else{
				$('.err_old_psw').html("密码错误！");
			}
		},
		error:function(){
		alert("出错！");
		}
	});
	
});
</script>
</html>
