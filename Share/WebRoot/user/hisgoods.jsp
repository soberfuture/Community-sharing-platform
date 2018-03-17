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
<link rel="stylesheet" type="text/css" href="css/his.css" />
<script src="js/jquery-3.1.1.js"></script>
<title>他的</title>
</head>

<body>
<!-- 头部部分 -->
<div class="top_header">
	<div class="top_header_section">
    	<div class="top_header_left">
            <a class="to_home" href="index.action">
            	<span class="backHome"></span>
            	<p>返回主页</p>
            </a>
        </div>
        <div class="top_header_right">
        	<p>没有账号？<a class="to_register" href="Register.html">注册一个</a></p>
        </div>
    </div>
</div>
<div class="main_box">
	<div class="main_top_box">
    	<div class="main_top_section">
        	<div class="his_icon">
            	<a href="#"><img src="images/donation_more_Bg.jpg" /></a>
            </div>
            <p class="his_name"><s:property value="#session.concern.username"/> </p>
            <ul class="gz_fans">
            	<li>
                	<a href="javascript:;">
                    	<strong class="his_num"><s:property value="#session.concern.attention"/></strong>
                        <span class="gzfans">关注</span>
                    </a>
                </li>
                <li>
                	<a href="javascript:;">
                    	<strong class="his_num"><s:property value="#session.concern.fans"/></strong>
                        <span class="gzfans">粉丝</span>
                    </a>
                </li>
            </ul>
        </div>
    </div>
    <!-- 分类 -->
    <div class="main_middle_box">
    	<ul>
        	<li class="his_share"><a class="fl_btn aa" href="javascript:;">他的分享</a></li>
            <li class="his_sales"><a class="fl_btn" href="javascript:;">他的销售</a></li>
        </ul>
    </div>
    <!-- 商品部分 -->
    <div class="main_bottom_box">
    	<ul class="goods_list" id="a2">
    		<s:iterator value="sharelist" var="s">
        	<li>
            	<div class="goods_img_box">
                	<a href="share_findByID.action?sid=<s:property value="#s.sid"/>"><img src='<s:property value="#s.picture"/>' /></a>
                </div>
               	<div class="goods_introduce_box">
                	<a class="goods_introduce_name" href="#"><s:property value="#s.sname"/></a>
                	<p class="goods_introduce_introduce">商品简介 功能介绍</p>
                </div>
                <p class="goods_introduce_price">
                    <span class="new_price">￥<s:property value="#s.price"/></span>
                    <span class="old_price">￥1998.00</span>
                </p>
        	</li>
        	</s:iterator>
        </ul>
        <ul class="goods_list">
        	<s:iterator value="saleslist" var="s">
        	<li>
            	<div class="goods_img_box">
                	<a href="sales_findByID.action?sid=<s:property value="#s.sid"/>"><img src="<s:property value="#s.picture"/>" /></a>
                </div>
               	<div class="goods_introduce_box">
                	<a class="goods_introduce_name" href="#"><s:property value="#s.sname"/></a>
                	<p class="goods_introduce_introduce">商品简介 功能介绍</p>
                </div>
                <p class="goods_introduce_price">
                    <span class="new_price">￥<s:property value="#s.price"/></span>
                    <span class="old_price">￥1998.00</span>
                </p>
        	</li>
        	</s:iterator>
        </ul>
        <div class="clear_fix"></div>
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
var indexLi = 0;
$('.goods_list li').mouseover(function(){
	indexLi = $('.goods_list li').index(this);
	move(indexLi);
	});
$('.goods_list li').mouseout(function(){
	indexLi = $('.goods_list li').index(this);
	changeBack(indexLi);
	});
function move(indexLi){
	$('.goods_list li').eq(indexLi).css({
		"box-shadow":"0 5px 18px 0px rgba(7,17,27,0.4)",
		"top":"-5px",
		"transition":"0.3s"
		});
	$('.goods_list li .goods_img_box img').eq(indexLi).css({"bottom":"10px","transition":"0.3s"});
	}
function changeBack(indexLi){
	$('.goods_list li').eq(indexLi).css({
		"box-shadow":"none",
		"top":"0px",
		"transition":"0.3s"
		});
	$('.goods_list li .goods_img_box img').eq(indexLi).css({"bottom":"0px","transition":"0.3s"});
	}
/*切换按钮*/
var indexFl = 0;
$('.main_middle_box ul li').click(function(){
	indexFl = $('.main_middle_box ul li').index(this);
	if($('.main_bottom_box ul').eq(indexFl).css("display") == 'block'){
		//alert('asd');
	}else{
		showUl(indexFl);
		changeFl(indexFl);
	}
});
function showUl(indexFl){
	$('.main_bottom_box ul').fadeOut();
	$('.main_bottom_box ul').eq(indexFl).fadeIn();
}
function changeFl(indexFl){
	//alert('asd');
	$('.main_middle_box ul li a').removeClass('aa');
	$('.main_middle_box ul li').eq(indexFl).children('a').addClass('aa');
}
</script>
</html>
