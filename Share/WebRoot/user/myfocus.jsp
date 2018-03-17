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
		<link rel="stylesheet" type="text/css" href="css/Focus.css" />
		<script src="js/jquery-3.1.1.js"></script>
		<title>我的关注</title>
	</head>

<body>
<div class="card_box">
	<ul class="card_list">
		<s:iterator value="userlist" var="u">
        <li class="card">
        	<div class="card_img">
            	<a href="user_findGoods?uid=<s:property value="#u.uid"/>" target="_top"><img id="<s:property value="#u.uid"/>" src="images/donation_more_Bg.jpg" /></a>
            </div>
            <div class="card_item">
            	<p class="item_name"><s:property value="#u.username"/> </p>
                <p class="item_gz_btn">
                	<a class="ygz_btn">√已关注</a>
                </p>
                <p class="item_gfnum">
                	<span class="td_gz">他的关注：<b><s:property value="#u.attention"/></b></span>
                    <br/>
                    <span class="td_fans">他的粉丝：<b><s:property value="#u.fans"/></b></span>
                </p>
            </div>
        </li>
        </s:iterator>
    </ul>
    <div class="clearfix"></div>
</div>
</body>
<script>

/*卡片盒子*/
var indexCard = 0;
$('.card_list li').mouseover(function(){
	indexCard = $('.card_list li').index(this);
	moveLi(indexCard);
	});
function moveLi(indexCard){
	$('.card_list li').eq(indexCard).css({"top":"-5px","box-shadow":"0 10px 10px 5px #ccc","transition":"0.3s"});
	}
$('.card_list li').mouseout(function(){
	indexCard = $('.card_list li').index(this);
	backLi(indexCard);
	});
function backLi(indexCard){
	$('.card_list li').eq(indexCard).css({"top":"0px","box-shadow":"0 8px 8px 3px #ccc","transition":"0.3s"});
	}
/*用户图片*/
$('.card_img img').mouseover(function(){
	$(this).animate({"top":"-5px"},200);
	});
$('.card_img img').mouseout(function(){
	$(this).animate({"top":"0px"},200);
	});
/*关注按钮*/
$('.ygz_btn').mouseover(function(){
	var $thisGz = $(this); 
	$thisGz.empty();
	$thisGz.html('取消关注');
	$thisGz.css({"color":"#ccc","border":"1px solid #ccc"});
	});
$('.ygz_btn').mouseout(function(){
	var $thisGz = $(this); 
	$thisGz.empty();
	$thisGz.html('√已关注');
	$thisGz.css({"color":"#000","border":"1px solid #000"});
	});
/*取消关注点击*/
$('.ygz_btn').click(function(){
	var as = $(this).parents('li.card').find('img').attr('id');
	$.ajax({
		url:"fans_del",  
		type:"post",
		dataType:"json",
		data:"uid="+as,
		success:function(data){
			if(data.result){
				alert("取消成功！");
				window.location.reload();
			}
		}
		
	});
});
</script>
</html>