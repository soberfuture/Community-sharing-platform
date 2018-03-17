<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
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
	<link rel="stylesheet" type="text/css" href="css/donation_more.css" />
	<script src="js/jquery-3.1.1.js"></script>
	<title>爱心捐赠</title>
</head>

<body>
<!-- 头部部分 -->
<div class="top_header">
	<div class="top_header_section">
    	<div class="top_header_left">
            <a class="to_home" href="index.action">
            	<span class="backHome"></span>
            	返回主页
            </a>
        </div>
        <div class="top_header_right">
        	<p>没有账号？<a class="to_register" href="Register.html">注册一个</a></p>
        </div>
    </div>
</div>
<div class="sales_more_top_box">
<div class="sales_more_top">
	<div class="sales_more_top_left">爱心榜</div>
    <div class="sales_more_top_right">
    	<s:if test="#session.user==null">
    	<span><a href="Login.html" title="登录">登录</a></span>
		</s:if>
		<s:else>
            <div class="login_after">
            	<img src="images/a6.png" class="firstImg" />
                <span class="username"><s:property value="#session.user.username"/></span>
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
                    	<a href="#">退出</a>
                    </div>
                </div>
            </div>
         </s:else>
    </div>
</div>
</div>
<!-- 内容部分-->
<div class="main_box">
	<div class="main_title">
    	<span class="main_title_top">爱心榜</span>
        <span class="main_title_bottom">奉献爱心&emsp;期待您的加入</span>
    </div>
	<div class="main_section">
    	<div class="donation_box">
        	<ul>
				<s:iterator value="#session.pagebean.list" var="s">
            	<li>
                	<div class="donation_img_box">
                    	<img src="<s:property value="#s.picture"/>" />
                    </div>
                    <div class="item_info">
                        <div class="item_name">
                        	<p><s:property value="#s.dname"/></p>
                        </div>
                    	<div class="item_num">
                            <span class="item_num_sharenum">
                                <i>捐赠数量：</i>
                            	<b>30</b>
                            </span>
                            <span class="item_num_praisenum">
                                	<i>赞：</i>
                                    <b>666</b>
                        	</span>       
                    	</div>
                    </div>
                    <div class="donation_box_bottom">
                        <a href="#" class="details_btn">查看详情</a>
                    	<a href="#" class="praise_btn"><img src="images/praise_btn.png" /></a>
                    </div>
                </li>
				</s:iterator>
            </ul>
            <div class="clear_fix" style="clear: both;display: block;height: 0;"></div>
            
        </div>
    </div>
    <div class="pn_page_box">
    	<s:if test="#session.pagebean.total!=0">
	     	当前页：<s:property value="#session.pagebean.currentPage"/>/<s:property value="#session.pagebean.totalPage"/>
			总记录数：<s:property value="#session.pagebean.total"/>
			每页记录数：<s:property value="#session.pagebean.pageSize"/>
	     	<s:if test="#session.pagebean.currentPage!=1">
	     	<a href="donate_findByType.action?page=<s:property value="#session.pagebean.currentPage-1"/>&type=<s:property value="#session.pagebean.type"/>" class="prev_btn">上一页</a>
	     	</s:if>
	     	<s:if test="#session.pagebean.currentPage!=#session.pagebean.totalPage">
	         <a href="donate_findByType.action?page=<s:property value="#session.pagebean.currentPage+1"/>&type=<s:property value="#session.pagebean.type"/>" class="next_btn">下一页</a>
	         </s:if>
	         <a href="donate_findByType.action?page=1&type=<s:property value="#session.pagebean.type"/>" class="first_btn">首页</a>
	         <a href="donate_findByType.action?page=<s:property value="#session.pagebean.totalPage"/>&type=<s:property value="#session.pagebean.type"/>" class="end_btn">尾页</a>
    	</s:if>
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
/*用户小窗口部分*/
var indexLA = 0;
$('.login_after').mouseover(function(){
	indexLA = $('.login_after').index(this);
	$('.login_after .userToolBox').eq(indexLA).css({"top":"60px"});
	});
$('.login_after').mouseout(function(){
	$('.login_after .userToolBox').css({"top":"-360px"});
	});
/*li动态*/
var indexPr = 0;
$('.donation_box ul li').mouseover(function(){
	indexPr = $('.donation_box ul li').index(this);
	showBoxshadow1(indexPr);
	})
$('.donation_box ul li').mouseout(function(){
	indexPr = $('.donation_box ul li').index(this);
	hiddenBoxshadow1(indexPr);
	})
	
$('.praise_btn').mouseover(function(){
	indexPr = $('.praise_btn').index(this);
	movePraiseUp(indexPr);
	})
$('.praise_btn').mouseout(function(){
	indexPr = $('.praise_btn').index(this);
	movePraiseDown(indexPr);
	})

function movePraiseUp(indexPr){
	$('.praise_btn').eq(indexPr).css({"margin-top":"-7px"});
	}
function movePraiseDown(indexPr){
	$('.praise_btn').eq(indexPr).css({"margin-top":"0px"});
	}
function showBoxshadow1(indexPr){
	$('.donation_box ul li').eq(indexPr).css({"box-shadow":"0 8px 8px 5px rgba(7,17,27,0.1)","transition":"0.4s"});
	}
function hiddenBoxshadow1(indexPr){
	$('.donation_box ul li').eq(indexPr).css({"box-shadow":"none","transition":"0.4s"});
	}
</script>
</html>
