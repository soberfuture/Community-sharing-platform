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
		<link rel="stylesheet" type="text/css" href="css/share_share.css" />
		<script src="js/jquery-3.1.1.js"></script>
		<script src="js/bigImg.js"></script>
		<title>齐分享</title>
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
        	
        </div>
    </div>
</div>
<div class="sales_more_top_box">
<div class="sales_more_top">
	<div class="sales_more_top_left">共享</div>
    <div class="sales_more_top_right">
    	
    </div>
</div>
</div>
<!-- 内容部分 -->
<div class="main_box clearfix">
	<div class="main_section clearfix">
    	<div class="toutiao">
        	<a>共享&emsp;>&emsp;</a>
            物品详情
        </div>
        <!-- 左边货物部分 -->
        <div class="main_left clearfix">
        	<!-- 货物图片部分 -->
        	<div class="main_left_img" id="magnifier">
            	<img src="<s:property value="#session.share.picture"/>" />
                <div id="Browser"></div>
            </div>
            <div id="mag">
            	<img id="magnifierImg" />
            </div>
            <!-- 货物信息部分 -->
            <div class="main_right_item_info">
            	<!-- 物品名称部分 -->
            	<p class="right_item_name"><s:property value="#session.share.sname"/></p>
                <p class="yinhao1"></p>
                <!-- 物品描述部分 -->
                <p class="right_item_details"><s:property value="#session.share.sexplain"/></p>
                <p class="yinhao2"></p>
                <!-- 物品价格部分 -->
                <div class="right_item_price">￥<s:property value="#session.share.price"/><span>/小时</span></div>
                <!-- 卖家部分 -->
                <div class="right_item_seller">
                	<div class="seller_img">
                    	<img src="images/donation_more_Bg.jpg" />
                    </div>
                	<div class="right_item_seller_introduce">
                    	物品来自&emsp;<span class="seller_name"><s:property value="#session.share.user.username"/></span>&emsp;的分享
                    </div>
                </div>
               	<!-- 联系电话部分 -->
                <div class="right_item_sellerTel">
                	<div class="sellerTel_left">
                    	联系电话
                    	<span class="sellerTel_right"><s:property value="#session.share.user.tel"/></span>
                    </div>
                </div>
                <form id="sorderform" method="post">
                <!-- 收货人部分 -->
                <div class="right_item_buyer">
                	<div class="right_item_title">收货人&emsp;</div>
                    <input id="name" name="name" type="text" required="required">
                </div>
                 <!-- 电话部分 -->
                <div class="right_item_tel">
                	<div class="right_item_title">电话&emsp;</div>
                    <input id="phone" name="phone" type="text" required="required">
                </div>
                 <!-- 收货地址部分 -->
                <div class="right_item_address">
                	<div class="right_item_title">收货地址&emsp;</div>
                    <input id="addr" name="addr" type="text" required="required">
                </div>
                <div class="right_item_submit">
                	<input class="submit" type="submit" value="申请共享" />
                </div>
                </form>
            </div>
        </div>
        <!-- 右边部分 -->
        <div class="main_right">
        	<!-- 卖家信息部分 -->
            <div class="main_right_top">
            	<div class="top_seller_img">
                	<img src="images/donation_more_Bg.jpg" />
                </div>
                <p class="top_seller_name"><s:property value="#session.share.user.username"/> </p>
                <p class="top_seller_sign">这个人很懒，什么都没留下</p>
            </div>
            <!-- 卖家其他货物 -->
            <div class="main_right_bottom">
            	<p class="main_right_bottom_title">卖家推荐</p>
                <em class="line"></em>
                <ul class="clearfix">
                	<s:iterator value="slist" var="s">
                	<li>
                    	<a class="clearfix">
                            <div class="pic_show">
                                <img src="<s:property value="#s.picture"/>" />
                            </div>
                            <div class="pic_text">
                                <p class="pic_goods_name"><s:property value="#s.sname"/></p>
                                <p class="goods_view_count">分享数：<s:property value="#s.count"/></p>
                            </div>
                        </a>
                    </li>
                    </s:iterator>
                </ul>
            </div>
        </div>
        <!-- 评论 -->
        <div class="main_leftBottom clearfix">
        	<div class="main_leftBottom_title">累计评论<em></em></div>
        	<ul>
        		<s:iterator value="clist" var="c">
            	<li class="comments_item clearfix">
                	<div class="comments_user_box">
                    	<img src="images/user.jpg" />
                        <p class="comments_user_name"><s:property value="#c.user.username"/></p>
                    </div>
                    <div class="comments_TTbox">
                    	<div class="start_box" id="<s:property value="#c.level"/>">
                    		
                    	</div>
                   		<p class="comments_text"><s:property value="#c.content"/></p>
                        <div class="comments_time">
                    		<s:property value="#c.ctime"/>
                    	</div>
                    </div>   
                </li>
                </s:iterator>
            </ul>
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
<script type="text/javascript">
$('.submit').click(function(){
	$.ajax({
		cache: true,
		async: false,
		url:"sorder_addSorder",
		data:$('#sorderform').serialize() ,
		dataType:"json",
		type:"post",
		success:function(data){
			if(data.result){
				alert("订单成功！");
			}else{
				alert("您还没有登录！");
			}
		},
		error:function(){
			alert('出错！');
		}
	});
});
/*评论星级*/
$('.main_leftBottom ul li').each(function(){
	var $thisLi = $(this);
	var startNum = $thisLi.children('.comments_TTbox').children('.start_box').attr('id');
	var $thisDiv = $thisLi.children('.comments_TTbox').children('.start_box');
	var str = "<img src='images/star-on-big.png' />"
	for(var i = 0;i < startNum;i ++){
		$thisDiv.append(str);
	}
});
</script>
</html>
