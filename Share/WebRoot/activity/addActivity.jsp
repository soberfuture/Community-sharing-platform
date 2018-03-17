<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'addActivity.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
    <form action="activity_addActivity.action" method="post">
    	<table>
    		<tr><td>活动标题：</td><td><input id="title" name="title" type="text" required="required"> </td></tr>
    		<tr><td>图片：</td><td><input id="picture" name="picture" type="text" required="required"> </td></tr>
    		<tr><td>活动描述：</td><td><textarea rows="8" cols="20" id="aexplain" name="aexplain" required="required"></textarea> </td></tr>
    		<tr><td>开始时间：</td><td><input id="starttime" name="starttime" type="text" required="required"> </td></tr>
    		<tr><td>结束时间：</td><td><input id="stoptime" name="stoptime" type="text" required="required"> </td></tr>
    		<tr><td>咨询电话：</td><td><input id="phone" name="phone" type="text" required="required"> </td></tr>
    		<tr><td><button type="submit">提交</button> </td></tr>
    	</table>
    </form>
  </body>
</html>
