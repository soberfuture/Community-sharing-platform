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
    
    <title>My JSP 'deal.jsp' starting page</title>
	<link rel="stylesheet" type="text/css" href="jquery-easyui-1.3.3/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="jquery-easyui-1.3.3/themes/icon.css">
	<link rel="stylesheet" type="text/css" href="jquery-easyui-1.3.3/demo/demo.css">
	<script type="text/javascript" src="jquery-easyui-1.3.3/jquery.min.js"></script>
	<script type="text/javascript" src="jquery-easyui-1.3.3/jquery.easyui.min.js"></script>
	<style>
		table{
		border-width: 0;
		border-style: dotted;
		}
		table td{
		border-width: 0 1px 1px 0;
		border-style: dotted;
		
		}
		table tbody tr td:nth-child(4) p{
			text-overflow: ellipsis;
			white-space: nowrap;
			width: 300px;
			height: 30px;
			overflow:hidden;
		}
		table th{
		border-width: 0 1px 1px 0;
		border-style: dotted;
		}
		table thead{
		background-color: #F3F3F3;
		}
	</style>
  </head>
  
  <body style="margin: 0;padding: 0;">
    <table title="活动处理" cellpadding="0" cellspacing="0">
    	<thead>
    		<tr>
    			<th width="100">编号</th>
                <th width="100">标题</th>
                <th width="150">图片</th>
                <th width="300">内容</th>
                <th width="150">活动开始时间</th>
                <th width="150">活动结束时间</th>
                <th width="50">参加人数</th>
                <th width="50">状态</th>
                <th width="50">发起人ID</th>
                <th width="100">咨询电话</th>
                <th width="150">发布时间</th>
                <th width="150">操作</th>
    		</tr>
    	</thead>
    	<tbody>
    	<s:iterator value="list" var="l">
    	<tr>
           	<td class="abc" id="<s:property value="#l.aid"/>"><s:property value="#l.aid"/> </td>
           	<td><s:property value="#l.title"/></td>
           	<td><s:property value="#l.picture"/></td>
           	<td><p><s:property value="#l.aexplain"/></p></td>
           	<td><s:property value="#l.starttime"/></td>
           	<td><s:property value="#l.stoptime"/></td>
           	<td><s:property value="#l.number"/></td>
           	<td><s:property value="#l.state"/></td>
           	<td><s:property value="#l.uid"/></td>
           	<td><s:property value="#l.phone"/></td>
           	<td><s:property value="#l.ptime"/></td>
           	<td><a class="agree">通过</a>&nbsp;<a class="refuse">拒绝</a></td>
          </tr>
          </s:iterator>
    	</tbody>
    		
    </table>
  </body>
  <script type="text/javascript">
  	$('.agree').click(function(){
  		var aid = $(this).parent().siblings('.abc').attr('id');
  		$.ajax({
  			cache: true,
			async: false,
  			url : 'activity_change',
  			data :'aid='+aid+"&state=1",
  			dataType:'json',
  			type:'post',
  			success:function(data){
  				alert("通过");
  				window.location.reload();
  			},
  			error:function(){
  				alert("失败");
  			}
  		});
  	});
  	$('.refuse').click(function(){
  		var aid = $(this).parent().siblings('.abc').attr('id');
  		$.ajax({
  			cache: true,
			async: false,
  			url : 'activity_change',
  			data :'aid='+aid+"&state=2",
  			dataType:'json',
  			type:'post',
  			success:function(data){
  				alert("通过");
  				window.location.reload();
  			},
  			error:function(){
  				alert("失败");
  			}
  		});
  	});
  </script>
</html>
