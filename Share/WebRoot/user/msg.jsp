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
	<link rel="stylesheet" type="text/css" href="css/myinfo.css" />
	<script src="js/jquery-3.1.1.js"></script>
	<title>用户信息</title>
</head>

<body>
<div class="main_box">
	<form id="userform" method="post">
	<ul class="info_list_box">
    	<li>
        	<div class="info_box">
                <p class="info_list_left">昵称：</p>
                <div class="info_list_right">
                    <input id="username" name="username" class="username_info in_input" disabled="disabled" type="text" value="<s:property value="#session.user.username"/>"/>
                </div>
            </div>
        </li>
        <li>
        	<div class="info_box">
                <p class="info_list_left">真实姓名：</p>
                <div class="info_list_right">
                    <input id="name" name="name" class="usertruename_info in_input" type="text" value="<s:property value="#session.user.name"/>"/>
                </div>
            </div>
        </li>
        <li>
        	<div class="info_box">
                <p class="info_list_left">我的签名：</p>
                <div class="info_list_right">
                    <textarea id="motto" name="motto"><s:property value="#session.user.motto"/></textarea>
                </div>
            </div>
        </li>
        <li>
        	<div class="info_box">
                <p class="info_list_left">性别：</p>
                <div class="info_list_right">
                    <input type="radio" name="sex" class="choose_input" id="sex" value="男" checked="checked" />男
                    <input type="radio" name="sex" class="choose_input" id="sex" value="女" />女
                </div>
            </div>
        </li>
        <li>
        	<div class="info_box">
                <p class="info_list_left">出生日期：</p>
                <div class="info_list_right">
                    <input id="birthday" name="birthday" class="userbirthday_info in_input" type="date" value="<s:property value="#session.user.birthday"/>" />
                </div>
            </div>
        </li>
        <li>
        	<div class="info_box">
                <p class="info_list_left">手机号码：</p>
                <div class="info_list_right">
                    <input id="tel" name="tel" class="usertel_info in_input" disabled="disabled" type="number" value="<s:property value="#session.user.tel"/>"/>
                </div>
            </div>
        </li>
        <li>
        	<div class="info_box">
                <p class="info_list_left">Email：</p>
                <div class="info_list_right">
                    <input id="email" name="email" class="userEmail_info in_input" type="text" value="<s:property value="#session.user.email"/>" />
                </div>
                <p class="error_email"></p>
            </div>
        </li>
        <li>
        	<div class="info_box">
                <p class="info_list_left">地址：</p>
                <div class="info_list_right">
                    <textarea id="address" name="address" class="useraddress_info"><s:property value="#session.user.address"/></textarea>
                </div>
            </div>
        </li>
        <li>
        	<div class="info_box">
                <p class="info_list_left">注册时间：</p>
                <div class="info_list_right">
                    <input id="time" name="time" class="userjointime_info in_input" disabled="disabled" type="text" value="<s:property value="#session.user.time"/>" />
                </div>
            </div>
        </li>
    </ul>
    <input type="submit" value="提交" class="user_info_submit_btn">
    </form>
</div>
</body>
<script>
	/*邮箱正则*/
	$('.userEmail_info').blur(function(){
		var EmailVal = $('.userEmail_info').val();
		var EmailRet = /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(.[a-zA-Z0-9_-])+/;
		if(!EmailRet.test(EmailVal)){
			$('.error_email').css({"color":"red"});
			$('.error_email').html('邮箱格式输入有误');
			}
		/* if(EmailRet.test(EmailVal)){
			$('.error_email').css({"color":"green"});
			$('.error_email').html('√');
			} */
		});
	$('.user_info_submit_btn').click(function(){
		$.ajax({
			cache: true,
			async: false,
			url : "user_revise",
			dataType :"json",
			data : $('#userform').serialize(),
			type : "post",
			success:function(data){
				if(data.result){
					alert("修改成功！");
					window.location.reload();
				}else{
					alert("修改失败！");
				}
			},
			error:function(){
				alert("出错！");
			}
		});
	});
</script>
</html>
