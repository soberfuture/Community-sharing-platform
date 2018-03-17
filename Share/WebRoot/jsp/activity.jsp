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
		<link rel="stylesheet" type="text/css" href="css/news.css" />
		<script src="js/jquery-3.1.1.js"></script>
		<title>圈内新闻</title>
	</head>

<body>
	<!-- 回到顶部 -->
	<div class="toTop"><img src="images/move-up.png" /></div>
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
	        	<p>没有账号？<a class="to_register" href="user_registerPage.action">注册一个</a></p>
	        </div>
	    </div>
	</div>
	<div class="sales_more_top_box">
	    <div class="sales_more_top">
	        <div class="sales_more_top_left">圈内新闻</div>
	        	<div class="sales_more_top_right">
	        		<s:if test="#session.user==null">
	            	<span><a href="user_loginPage.action" title="登录">登录</a></span>
	            	</s:if>
	            	<s:else>
	                <div class="login_after">
	                    <img src="images/a6.png" class="firstImg" />
	                    <span class="username"><s:property value="#session.user.username"/> </span>
	                    <div class="userToolBox">
	                        <div class="userToolBox_userImg">
	                            <img src="images/a6.png" />
	                        </div>
	                        <div class="userToolBox_username">
	                            <s:property value="#session.user.username"/>
	                        </div>
	                        <div class="userToolBox_myProfile">
	                            <a href="#">我的资料</a>
	                        </div>
	                        <div class="userToolBox_exit">
	                            <a href="user_exit.action">退出</a>
	                        </div>
	                    </div>
	                </div>
	                </s:else>
	        	</div>
	     </div>
	</div>
	<!-- 主体部分 -->
	<div class="new_main_box">
		<div class="new_main_inner">
			<!-- 头部跳转 -->
	    	<div class="toutiao">
	        	<a href="jsp/news_more.jsp">所有&emsp;>&emsp;</a>
	                                    新闻中心
	        </div>
	    	<div class="newbox">
	    		<!-- 参与按钮 -->
	    	<s:if test="#session.isattend">
            <div class="join_box">
            	<a data-va="<s:property value="#session.activity.aid"/>" class="join_act_btn">我要参与</a>
                <span class="join_act_item_num">参与人数&emsp;<i><s:property value="#session.activity.number"/></i></span>
            </div>
	    	</s:if>
	    	<s:else>
	    		<div class="join_box">
            	<a data-va="<s:property value="#session.activity.aid"/>" class="quxiao_join">取消参与</a>
                <span class="join_act_item_num">参与人数&emsp;<i><s:property value="#session.activity.number"/> </i></span>
            </div>
	    	</s:else>
	    		<div class="new_title"><h2><s:property value="#session.activity.title"/></h2></div>
	            <div class="new_borline clearfix">
	            	<p class="artinfo">
	                	<span class="author">生活有个圈团队</span>
	                    <span class="time">时间：<s:property value="#session.activity.ptime"/></span>
	                </p>
	            </div>
	            <div class="article">
	                <p class="article_img"><img src="<s:property value="#session.activity.picture"/>" /></p>
	               	<p><s:property value="#session.activity.aexplain"/></p>
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
	/*toTop*/
	$(window).scroll(function(){
		if($(window).scrollTop() >= $('.new_main_box').position().top + 500){
			$('.toTop').css({display:"block"});
			}
		if($(window).scrollTop() < $('.new_main_box').position().top + 500){
			$('.toTop').css({display:"none"});
			}
		});
	$('.toTop').click(function(){
		$('body').animate({scrollTop:"0"}, 200, 'linear');
		});
	/*用户小窗口部分*/
	var indexLA = 0;
	$('.login_after').mouseover(function(){
		indexLA = $('.login_after').index(this);
		$('.login_after .userToolBox').eq(indexLA).css({"top":"60px"});
		});
	$('.login_after').mouseout(function(){
		$('.login_after .userToolBox').css({"top":"-360px"});
		});
	/*参与按钮*/
	$('.join_act_btn').click(function(){
		a=$(this).attr('data-va');
		$.ajax({
		        url : "attend_addAttend.action",
		        type : "post",
		        dataType : "json",
		        data : "aid="+a,
		        success : function(data) {
		            if(data.result){
		            	alert(data.message);
		            	window.location.reload();
		            }else{
		            	alert(data.message);
		            }
		        }
		    });
	});
	/*取消按钮*/
	$('.quxiao_join').click(function(){
		a=$(this).attr('data-va');
		var quxiao = confirm('是否取消活动');
		if(quxiao == true){
			$.ajax({
		        url : "attend_delAttend.action",
		        type : "post",
		        dataType : "json",
		        data : "aid="+a,
		        success : function(data) {
		            if(data.result){
		            	alert(data.message);
		            	window.location.reload();
		            }else{
		            	alert(data.message);
		            }
		        }
		    });
		}
	});
	</script>
</html>