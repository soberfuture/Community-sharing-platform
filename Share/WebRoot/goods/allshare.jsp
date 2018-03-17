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
    
    <title>My JSP 'allshare.jsp' starting page</title>
    
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<link rel="shortcut icon" type="image/x-icon" href="images/HomeIcon.jpg" media="screen" />
	<link rel="stylesheet" type="text/css" href="css/share_more.css" />
	<script src="jq/jquery-3.1.1.js"></script>
	<title>更多共享</title>
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
<div class="sales_more_top_box">
<div class="sales_more_top">
	<div class="sales_more_top_left">共享</div>
    <div class="sales_more_top_right">
    	<s:if test="#session.user==null">
    	<span><a href="Login.html" title="登录">登录</a></span>
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
    	<span class="main_title_top">共享</span>
        <span class="main_title_bottom">更多共享&emsp;你来分享</span>
    </div>
	<div class="main_section">
    	<div class="nav_bigbox">
            <div class="nav_box" id="nav_box_P">
                <ul class="cls_list">
                    <s:if test="#session.pagebean.type==null">
                   	<a href="share_findByType"><li id="a0">全部</li></a>
                   	</s:if>
                   	<s:else>
                   	<a href="share_findByType"><li>全部</li></a>
                   	</s:else>
                   	<s:if test="#session.pagebean.type==1">
                    <a href="share_findByType?type=1"><li id="a0">食品</li></a>
                    </s:if>
                    <s:else>
                   	<a href="share_findByType?type=1"><li>食品</li></a>
                   	</s:else>
                   	<s:if test="#session.pagebean.type==2">
                    <a href="share_findByType?type=2"><li id="a0">工具</li></a>
                    </s:if>
                    <s:else>
                   	<a href="share_findByType?type=2"><li>工具</li></a>
                   	</s:else>
                   	<s:if test="#session.pagebean.type==3">
                    <a href="share_findByType?type=3"><li id="a0">电器</li></a>
                    </s:if>
                    <s:else>
                   	<a href="share_findByType?type=3"><li>电器</li></a>
                   	</s:else>
                   	<s:if test="#session.pagebean.type==4">
                    <a href="share_findByType?type=4"><li id="a0">书籍</li></a>
                    </s:if>
                    <s:else>
                   	<a href="share_findByType?type=4"><li>书籍</li></a>
                   	</s:else>
                   	<s:if test="#session.pagebean.type==5">
                    <a href="share_findByType?type=5"><li id="a0">服装</li></a>
                    </s:if>
                    <s:else>
                   	<a href="share_findByType?type=5"><li>服装</li></a>
                   	</s:else>
                   	<s:if test="#session.pagebean.type==6">
                    <a href="share_findByType?type=6"><li id="a0">玩具</li></a>
                    </s:if>
                    <s:else>
                   	<a href="share_findByType?type=6"><li>玩具</li></a>
                   	</s:else>
                   	<s:if test="#session.pagebean.type==7">
                    <a href="share_findByType?type=7"><li id="a0">运动</li></a>
                    </s:if>
                    <s:else>
                   	<a href="share_findByType?type=7"><li>运动</li></a>
                   	</s:else>
                   	<s:if test="#session.pagebean.type==8">
                    <a href="share_findByType?type=8"><li id="a0">家具</li></a>
                    </s:if>
                    <s:else>
                   	<a href="share_findByType?type=8"><li>家具</li></a>
                   	</s:else>
                </ul>
            </div> 
        </div>
    	<div class="share_box">
        	<ul>
			<s:if test="#session.pagebean.total!=0">
			<s:iterator value="#session.pagebean.list" var="s">
            	<li>
                	<div class="share_list_box">
                    	<div class="share_img_box">
                        	<img src="<s:property value="#s.picture"/>" />
                        </div>
                        <div class="item_info">
                            <div class="item_name">
                                <p><s:property value="#s.sname"/></p>
                            </div>
                            <div class="item_num">
                            	<span class="item_num_sharenum">
                                	<i>分享次数：</i>
                                    <b>321</b>
                                </span>
                                <span class="item_num_praisenum">
                                	<i>赞：</i>
                                    <b>666</b>
                                </span>
                                
                            </div>
                        </div>
                        <div class="share_box_bottom">
                            <div class="share_price">
                            	<%-- <span class="share_price_old">￥1/h</span> --%>
                                <span class="share_price_new">￥<s:property value="#s.price"/>/h</span>
                            </div>
                            <a href="share_findByID.action?sid=<s:property value="#s.sid"/>" class="share_btn">发起共享</a>
                        </div>
                    </div>
                </li>
				</s:iterator>
				</s:if>
				<s:else>
					<div>没有此类物品</div>
				</s:else>
            </ul>
            <div class="clear_fix" style="clear: both;display: block;height: 1px;"></div>
            
        </div>
    </div>
    <div class="pn_page_box">
    	<s:if test="#session.pagebean.total!=0">
			当前页：<s:property value="#session.pagebean.currentPage"/>/<s:property value="#session.pagebean.totalPage"/>
			总记录数：<s:property value="#session.pagebean.total"/>
			每页记录数：<s:property value="#session.pagebean.pageSize"/>
			<s:if test="#session.pagebean.currentPage!=1">
	    	<a href="share_findByType.action?page=<s:property value="#session.pagebean.currentPage-1"/>&type=<s:property value="#session.pagebean.type"/>" class="prev_btn">上一页</a>
			</s:if>
			<s:if test="#session.pagebean.currentPage!=#session.pagebean.totalPage">
	    	<a href="share_findByType.action?page=<s:property value="#session.pagebean.currentPage+1"/>&type=<s:property value="#session.pagebean.type"/>" class="next_btn">下一页</a>
			</s:if>
	    	<a href="share_findByType.action?page=1&type=<s:property value="#session.pagebean.type"/>" class="first_btn">首页</a>
	    	<a href="share_findByType.action?page=<s:property value="#session.pagebean.totalPage"/>&type=<s:property value="#session.pagebean.type"/>" class="end_btn">尾页</a>
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
/*固定栏nav_box*/
$(window).scroll(function(){
	if($(window).scrollTop() >= $('.nav_bigbox').position().top + 60){
		$('#nav_box_P').removeAttr("nav_box_P").attr('id',"nav_box_F");
		}
	if($(window).scrollTop() < $('.nav_bigbox').position().top + 60){
		$('#nav_box_F').removeAttr("nav_box_F").attr('id',"nav_box_P");
		}
	});

/*共享列表*/
var index1 = 0;
$('.share_box ul li').mouseover(function(){
	index1 = $(".share_box ul li").index(this);
	showBoxshadow1(index1);
	changeBigImg(index1);
	});
$('.share_box ul li').mouseout(function(){
	index1 = $(".share_box ul li").index(this);
	hiddenBoxshadow1(index1);
	changeMinImg(index1)
	});
function showBoxshadow1(index1){
	$('.share_box ul li').eq(index1).css({"box-shadow":"0 8px 8px 5px rgba(7,17,27,0.1)","transition":"0.4s"});
	}
function hiddenBoxshadow1(index1){
	$('.share_box ul li').eq(index1).css({"box-shadow":"none","transition":"0.4s"});
	}
function changeBigImg(index1){
	$('.share_box ul li .share_img_box img').eq(index1).css({"transform":"scale(1.1)","transition":"0.4s"});
	}
function changeMinImg(index1){
	$('.share_box ul li .share_img_box img').eq(index1).css({"transform":"scale(1)","transition":"0.4s"});
	}
</script>
</html>
