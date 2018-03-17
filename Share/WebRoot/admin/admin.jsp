<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>管理员界面</title>
	<link rel="stylesheet" type="text/css" href="jquery-easyui-1.3.3/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="jquery-easyui-1.3.3/themes/icon.css">
	<link rel="stylesheet" type="text/css" href="jquery-easyui-1.3.3/demo/demo.css">
	<script type="text/javascript" src="jquery-easyui-1.3.3/jquery.min.js"></script>
	<script type="text/javascript" src="jquery-easyui-1.3.3/jquery.easyui.min.js"></script>
</head>
<body>
	<s:if test="#session.admin==null">
		<jsp:forward page="login.jsp"></jsp:forward>
	</s:if>
	<s:else>
	<div class="easyui-layout" style="width:1600px;height:740px;">
		<div data-options="region:'north'" style="height:50px;position:relative;">
			<div style="padding: 0;display: block;position:absolute;bottom:0;right:0;">管理员：<s:property value="#session.admin.adminname"/> <a style="cursor: pointer;" class="exist">退出</a></div>
		</div>
		<div data-options="region:'west',split:true" title="管理" style="width:200px;">
			<a href="user.html" target="admin" style="margin-left: 10px;margin-top: 10px;" plain="true" class="easyui-linkbutton" data-options="iconCls:'icon-user'">用户管理</a><br>
			<a href="sales.html" target="admin" style="margin-left: 10px;margin-top: 10px;" plain="true" class="easyui-linkbutton" data-options="iconCls:'icon-sales'">销售物品管理</a><br>
			<a href="share.html" target="admin" style="margin-left: 10px;margin-top: 10px;" plain="true" class="easyui-linkbutton" data-options="iconCls:'icon-share'">共享物品管理</a><br>
			<a href="notice.html" target="admin" style="margin-left: 10px;margin-top: 10px;" plain="true" class="easyui-linkbutton" data-options="iconCls:'icon-notice'">公告管理</a><br>
			<a href="activity.html" target="admin" style="margin-left: 10px;margin-top: 10px;" plain="true" class="easyui-linkbutton" data-options="iconCls:'icon-activity'">活动管理</a><br>
			<a href="donate.html" target="admin" style="margin-left: 10px;margin-top: 10px;" plain="true" class="easyui-linkbutton" data-options="iconCls:'icon-xin'">爱心捐赠</a><br>
			<a href="activity_deal" target="admin" style="margin-left: 10px;margin-top: 10px;" plain="true" class="easyui-linkbutton" data-options="iconCls:'icon-deal'">活动处理</a><br>
		</div>
		<div data-options="region:'center'">
			<iframe name="admin" src="admin/user.html" width="100%" height="99%" frameborder="0" scrolling="no"></iframe>
		</div>
	</div>
	</s:else>
</body>
<script type="text/javascript">
	$('.exist').click(function(){
		$.ajax({
			url:"admin_Exist",
			type: "post",
			success:function(data){
				window.location.href = "admin/login.jsp";
			},
			error:function(){
				alert("出错");
			}
		});
	});
</script>
</html>