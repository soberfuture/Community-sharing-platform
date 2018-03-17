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
	<link rel="stylesheet" type="text/css" href="css/Home.css" />
	<script src="js/jquery-3.1.1.js"></script>
	<title>生活有个圈</title>

  </head>
  
<body>
<!-- 回到顶部 -->
<div class="toTop"><img src="images/move-up.png" /></div>
<div class="topHeader">
	<div class="topHeaderSection">
    	<span>详情请咨询：1688-8888-8888</span>
        <span>提意见请联系我们</span>
    </div>
</div>
<!-- 头部 -->
<div class="header">
<div class="headerActive">
	<div class="header_middle">
    	<div class="header_middle_leftBox">
        	<div class="HomeIcon">
                <a href="index.action" title="生活有个圈" style="display: block;z-index: 99999;">
                    <img src="images/HomeIcon.jpg" width="90" height="90" /> 
                </a>
            </div>
        </div>
        <div class="header_middle_middleBox">
        	<!-- <form> -->
            	<!-- <input type="text" class="search" placeholder="搜索您感兴趣的内容" /> -->
                <!-- <button><i><img src="images/search.png" width="30" height="35" /></i></button> -->
            <!-- </form> -->
        </div>
        <div class="header_middle_rightBox">
        	<s:if test="#session.user==null">
        	<span class="login_btn"><a href="user_loginPage.action" title="登录">登录</a></span>
            <span><a href="user_loginPage.action" title="注册">注册</a></span>
            </s:if>
            <s:else>
            <div class="login_after">
            	<img src="images/a6.png" class="firstImg" />
                <span class="username"><s:property value="#session.user.username"/> </span>
                <div class="userToolBox">
                	<div class="userToolBox_userImg">
                    	<a href="user/main.jsp"><img src="images/a6.png" /></a>
                    </div>
                    <div class="userToolBox_username">
                    	<s:property value="#session.user.username"/>
                    </div>
                    <div class="userToolBox_myProfile">
                    	<p class="money_num">
                    		<div class="money_box">
	                    		￥<b><s:property value="#session.user.lifecoin"/></b>&emsp;
	                    		<a href="javascript:;" class="cz_btn">充值</a>
                    		</div>
                    		<div class="cz_box">
                    			<img class="cz_box_close" src="images/closeR.png" width="20px" height="20px" />
                    			<input id="lifecoin" name="lifecoin" type="number" />
                    			<button class="cz_agree">确定</button>
                    		</div>
                    	</p>
                    	<p class="xy_num">信用：<b><s:property value="#session.user.credit"/></b></p>
                    </div>
                    <div class="userToolBox_other">
                    	<span class="gz">关注：<i><s:property value="#session.user.attention"/></i></span>
                    	<span class="fs">粉丝：<i><s:property value="#session.user.fans"/></i></span>
                    </div>
                    <a class="userToolBox_exit" href="user_exit.action">退出</a>
                </div>
            </div>
            </s:else>
        </div>
        <!-- 我的活动 -->
        <s:if test="#session.user!=null">
        <div class="header_middle_rightBox_shoppingCar">     	
        	<a class="my_act_icon">我的活动</a>
        	<div class="my_act_box">
        		
        	</div>        	
        </div>
        </s:if>
    </div>
</div>
</div>
<!-- 导航栏部分 -->
<div class="navBoxRe">
   	<div class="navBox">
        <ul class="navlist">
            <li class="navOn" id="nav_main">首页</li>
            <!--<li id="nav_log">日志</li>-->
            <li id="nav_market">销售</li>
            <li id="nav_share">共享</li>
        	<li id="nav_donation">捐赠</li>
    	</ul>
	</div>
</div>
<!-- 活动部分 -->
<div class="activityBox">
	<div class="activitySection">
		<div class="activity_left">
        	<ul class="activity_left_picList">
            	<li>
                	<a href="javascript:;"><img id="" src="" /></a>
                </li>
                <li>
                	<a href="javascript:;"><img id="" src="" /></a>
                </li>
                <li>
                	<a href="javascript:;"><img id="" src="" /></a>
                </li>
                <li>
                	<a href="javascript:;"><img id="" src="" /></a> 
                </li>
                <li>
                	<a href="javascript:;"><img id="" src="" /></a>
                </li>
            </ul>
            <ul class="activity_left_btnList">
            	<li class="on" id="1"></li>
                <li id="2"></li>
                <li id="3"></li>
                <li id="4"></li>
                <li id="5"></li>
            </ul>
        </div>
        <div class="activity_right">
        	<div class="activity_right_title">
            	<ul class="activity_right_title_list">
                	<li class="titleOn">社区活动</li>
                    <li>社区公告</li>
                </ul>
            </div>
            <div class="activity_right_main">
            	<div class="activity_right_mainBox1">
                	<ul class="activity_right_main_list1">
                    	
                        <li class="act_item">
                        	<a title="活动一">
                            	<span class="activity_type">活动</span><i></i><span class="activity_date"></span>
                            </a>
                        </li>
                        <li class="act_item">
                        	<a title="活动二">
                            	<span class="activity_type">活动</span><i></i><span class="activity_date"></span>
                            </a>
                        </li>
                        <li class="act_item">
                        	<a title="活动三">
                            	<span class="activity_type">活动</span><i></i><span class="activity_date"></span>
                            </a>
                        </li>
                        <li class="act_item">
                        	<a title="活动四">
                            	<span class="activity_type">活动</span><i></i><span class="activity_date"></span>
                            </a>
                        </li>
                        <li class="act_item">
                        	<a title="活动五">
                            	<span class="activity_type">活动</span><i></i><span class="activity_date"></span>
                            </a>
                        </li>
                        <li class="act_item">
                        	<a title="活动六">
                            	<span class="activity_type">活动</span><i></i><span class="activity_date"></span>
                            </a>
                        </li>
                        <li class="act_item">
                        	<a title="活动七">
                            	<span class="activity_type">活动</span><i></i><span class="activity_date"></span>
                            </a>
                        </li>
                        <li class="first"><p class="activity_right_main_list1_title" title="最近活动"><a href="jsp/news_more.jsp">更多活动</a></p></li>
                    </ul>
                </div>
                <div class="activity_right_mainBox2">
                	<ul class="activity_right_main_list2">
                    	
                        <li class="an_item">
                        	<a href="javascript:;" title="公告一">
                            	<span class="announcement_type">公告</span><i></i><span class="announcement_date"></span>
                            </a>
                        </li>
                        <li class="an_item">
                        	<a href="javascript:;" title="公告二">
                            	<span class="announcement_type">公告</span><i></i><span class="announcement_date"></span>
                            </a>
                        </li>
                        <li class="an_item">
                        	<a href="javascript:;" title="公告三">
                            	<span class="announcement_type">公告</span><i></i><span class="announcement_date"></span>
                            </a>
                        </li>
                        <li class="an_item">
                        	<a href="javascript:;" title="公告四">
                            	<span class="announcement_type">公告</span><i></i><span class="announcement_date"></span>
                            </a>
                        </li>
                        <li class="an_item">
                        	<a href="javascript:;" title="公告五">
                            	<span class="announcement_type">公告</span><i></i><span class="announcement_date"></span>
                            </a>
                        </li>
                        <li class="an_item">
                        	<a href="javascript:;" title="公告六">
                            	<span class="announcement_type">公告</span><i></i><span class="announcement_date"></span>
                            </a>
                        </li>
                        <li class="an_item">
                        	<a href="javascript:;" title="公告七">
                            	<span class="announcement_type">公告</span><i></i><span class="announcement_date"></span>
                            </a>
                        </li>
                        <li class="first"><p class="activity_right_main_list2_title" title="最近活动"><a href="jsp/news_more.jsp">更多公告</a></p></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- 销售部分 -->
<div class="marketBox">
	<div class="hotGoods_title">
    	<div class="hotGoods_title_left">近期<span>热销</span></div>
    	<a href="sales_findByType" class="hotGoods_title_right">查看全部>></a>
    </div>
	<div class="marketSection">
    	<div class="hotGoods">
        	<ul class="hotGoods_list">
			<s:iterator value="saleshome" var="s">
            	<li>
                	<div class="goods_introduceBox">
                    	<a href="#" class="goods_name" target="_blank" title="商品名称"><s:property value="#s.sname"/></a>
                        <p class="goods_introduction" title="商品简介 功能介绍">
                        	商品简介 功能介绍 
                        </p>
                        <p class="goods_price">
                        	<span class="goods_new_price">￥<s:property value="#s.price"/></span>
                            <span class="goods_old_price">￥1998.00</span>
                        </p>
                        <p></p>
                        <a href="sales_findByID.action?sid=<s:property value="#s.sid"/>" class="goods_pic" target="_blank">
                        	<img src="<s:property value="#s.picture"/>" class="goods_pic_img" />
                        </a>	
                    </div>
                    <%-- <div class="goods_buttonBox">
                    	<a href="sales_findByID.action?sid=<s:property value="#s.sid"/>" class="goods_buttonBox_buy" target="_top">
                        	立即购买
                        </a>
                       <div class="goods_buttonBox_joinCarBox">
                            <a href="sales_findByID.action?sid=<s:property value="#s.sid"/>&way=2" target="_top" class="goods_buttonBox_joinCar" title="加入购物车">
                                <img src="images/joinCar.png" />
                            </a>
                        </div>
                    </div> --%>
                </li> 
			</s:iterator>				
            </ul>
        </div>
    </div>
</div>
<!-- 共享部分 -->
<div class="shareBox">
        <div class="other_shareTitle">
        	<span class="other_shareTitle_left">热门共享</span>
    		<a href="share_findByType.action" class="other_shareTitle_right">查看全部>></a>
        </div>
        <!--  余下部分 -->
        <div class="other_share">
        	<ul class="other_share_list">
			<s:iterator value="sharehome" var="s">
            	<li>
                	<div class="other_share_listBox">
                    	<div class="other_share_listBox_img">
                        	<a href="share_findByID.action?sid=<s:property value="#s.sid"/>"><img src="<s:property value="#s.picture"/>" /></a>
                        </div>
                        <div class="other_share_listBox_introduce">
                        	<div class="other_share_listBox_introduce_name" title="物品1"><s:property value="#s.sname"/></div>
                            <div class="listBoxCart">
                                <div class="priceBox">
                                    <div class="price">
                                        <!-- <div class="price_old">￥620.00</div> -->
                                        <div class="price_new">￥<s:property value="#s.price"/></div>	
                                        <a href="share_findByID.action?sid=<s:property value="#s.sid"/>"><div class="price_old">点击共享</div></a>
                                    </div>  
                                </div>
                        	</div>
                        </div> 
                    </div>
                </li>
			</s:iterator>
            </ul>
        </div>
</div>
<!-- 捐赠部分 -->
<div class="donationBox">
	<div class="donationBox2">
        <div class="donationSection">
            <div class="donationTitle">
                <span class="donationTitle_left">爱心捐赠</span>
    			<!-- <a href="donate_findByType" class="donationTitle_right">查看全部>></a> -->
            </div>
            <div class="donationMain">
            	<ul class="donation_list">
                	<li>
                    	<div class="donation_list_box">
                        	<div class="donation_list_box_imgBox"><img src="" /></div>
                            <div class="donation_list_box_introduceBox">
                            	<p class="donation_act_title"></p>
                            	<p class="donation_act_fbtime">发布时间：<b></b>&emsp;&emsp;</p>
                            	<p class="donation_act_content"></p>
                            	<div class="donation_act_timebox">
                            		<p class="starttime">活动开始时间：<b></b></p>
                            		<p class="endtime">活动结束时间：<b></b></p>
                            	</div>
                            	<p class="donation_act_mtp">
                            		<span class="theman">负责人：<b></b> </span>
                            		<span class="thetel">电话：<b></b></span><br /><br />
                            		<span class="theaddress">地点：<b></b></span>
                            	</p>
                            </div>
                        </div>
                    </li>
                    <li>
                    	<div class="donation_list_box">
                        	<div class="donation_list_box_imgBox"><img src="" /></div>
                            <div class="donation_list_box_introduceBox">
                            	<p class="donation_act_title"></p>
                            	<p class="donation_act_fbtime">发布时间：<b></b>&emsp;&emsp;</p>
                            	<p class="donation_act_content"></p>
                            	<div class="donation_act_timebox">
                            		<p class="starttime">活动开始时间：<b></b></p>
                            		<p class="endtime">活动结束时间：<b></b></p>
                            	</div>
                            	<p class="donation_act_mtp">
                            		<span class="theman">负责人：<b></b> </span>
                            		<span class="thetel">电话：<b></b></span><br /><br />
                            		<span class="theaddress">地点：<b></b></span>
                            	</p>
                            </div>
                        </div>
                    </li>
                    <li>
                    	<div class="donation_list_box">
                        	<div class="donation_list_box_imgBox"><img src="" /></div>
                            <div class="donation_list_box_introduceBox">
                            	<p class="donation_act_title"></p>
                            	<p class="donation_act_fbtime">发布时间：<b></b>&emsp;&emsp;</p>
                            	<p class="donation_act_content"></p>
                            	<div class="donation_act_timebox">
                            		<p class="starttime">活动开始时间：<b></b></p>
                            		<p class="endtime">活动结束时间：<b></b></p>
                            	</div>
                            	<p class="donation_act_mtp">
                            		<span class="theman">负责人：<b></b> </span>
                            		<span class="thetel">电话：<b></b></span><br /><br />
                            		<span class="theaddress">地点：<b></b></span>
                            	</p>
                            </div>
                        </div>
                    </li>
                    <li>
                    	<div class="donation_list_box">
                        	<div class="donation_list_box_imgBox"><img src="" /></div>
                            <div class="donation_list_box_introduceBox">
                            	<p class="donation_act_title"></p>
                            	<p class="donation_act_fbtime">发布时间：<b></b>&emsp;&emsp;</p>
                            	<p class="donation_act_content"></p>
                            	<div class="donation_act_timebox">
                            		<p class="starttime">活动开始时间：<b></b></p>
                            		<p class="endtime">活动结束时间：<b></b></p>
                            	</div>
                            	<p class="donation_act_mtp">
                            		<span class="theman">负责人：<b></b> </span>
                            		<span class="thetel">电话：<b></b></span><br /><br />
                            		<span class="theaddress">地点：<b></b></span>
                            	</p>
                            </div>
                        </div>
                    </li>
                    <li>
                    	<div class="donation_list_box">
                        	<div class="donation_list_box_imgBox"><img src="" /></div>
                            <div class="donation_list_box_introduceBox">
                            	<p class="donation_act_title"></p>
                            	<p class="donation_act_fbtime">发布时间：<b></b>&emsp;&emsp;</p>
                            	<p class="donation_act_content"></p>
                            	<div class="donation_act_timebox">
                            		<p class="starttime">活动开始时间：<b></b></p>
                            		<p class="endtime">活动结束时间：<b></b></p>
                            	</div>
                            	<p class="donation_act_mtp">
                            		<span class="theman">负责人：<b></b> </span>
                            		<span class="thetel">电话：<b></b></span><br /><br />
                            		<span class="theaddress">地点：<b></b></span>
                            	</p>
                            </div>
                        </div>
                    </li>
                    <li>
                    	<div class="donation_list_box">
                        	<div class="donation_list_box_imgBox"><img src="" /></div>
                            <div class="donation_list_box_introduceBox">
                            	<p class="donation_act_title"></p>
                            	<p class="donation_act_fbtime">发布时间：<b></b>&emsp;&emsp;</p>
                            	<p class="donation_act_content"></p>
                            	<div class="donation_act_timebox">
                            		<p class="starttime">活动开始时间：<b></b></p>
                            		<p class="endtime">活动结束时间：<b></b></p>
                            	</div>
                            	<p class="donation_act_mtp">
                            		<span class="theman">负责人：<b></b> </span>
                            		<span class="thetel">电话：<b></b></span><br /><br />
                            		<span class="theaddress">地点：<b></b></span>
                            	</p>
                            </div>
                        </div>
                    </li>
                    <li>
                    	<div class="donation_list_box">
                        	<div class="donation_list_box_imgBox"><img src="" /></div>
                            <div class="donation_list_box_introduceBox">
                            	<p class="donation_act_title"></p>
                            	<p class="donation_act_fbtime">发布时间：<b></b>&emsp;&emsp;</p>
                            	<p class="donation_act_content"></p>
                            	<div class="donation_act_timebox">
                            		<p class="starttime">活动开始时间：<b></b></p>
                            		<p class="endtime">活动结束时间：<b></b></p>
                            	</div>
                            	<p class="donation_act_mtp">
                            		<span class="theman">负责人：<b></b> </span>
                            		<span class="thetel">电话：<b></b></span><br /><br />
                            		<span class="theaddress">地点：<b></b></span>
                            	</p>
                            </div>
                        </div>
                    </li>
                    <li>
                    	<div class="donation_list_box">
                        	<div class="donation_list_box_imgBox"><img src="" /></div>
                            <div class="donation_list_box_introduceBox">
                            	<p class="donation_act_title"></p>
                            	<p class="donation_act_fbtime">发布时间：<b></b>&emsp;&emsp;</p>
                            	<p class="donation_act_content"></p>
                            	<div class="donation_act_timebox">
                            		<p class="starttime">活动开始时间：<b></b></p>
                            		<p class="endtime">活动结束时间：<b></b></p>
                            	</div>
                            	<p class="donation_act_mtp">
                            		<span class="theman">负责人：<b></b> </span>
                            		<span class="thetel">电话：<b></b></span><br /><br />
                            		<span class="theaddress">地点：<b></b></span>
                            	</p>
                            </div>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
   	</div>
</div>
<!-- 捐赠固定div部分 -->
<div class="donation_fixed_box">
	<div class="donation_fixed1">捐赠1</div>
</div>
<!-- 关闭按钮 -->
<div class="closeIcon" title="点击关闭">
	<img src="images/closeW.png" width="50" height="50" />
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
var num = 0;
$(window).ready(function(e) {
	$.ajax({
		        url : "activity_findAll.action",
		        type : "post",
		        dataType : "json",
		        success : function(data) {
		        		
		        		$('.activity_left_picList li').each(function(){//循环输出图片
			        		num = $(this).index();
			        		$(this).children().children('img').attr('src',data.rows[num].picture);
			        		$(this).children().children('img').attr('id',data.rows[num].aid);
			        		//alert($(this).children().children('img').attr('id'));
		        		})
		        		
		        		$('.activity_left_btnList li').each(function(){//循环输出活动名
			        		num = $(this).index();
			        		$(this).html(data.rows[num].title);
		        		})
		        		
		        		$('.activity_right_main_list1 li').each(function(){//循环输出最新活动标题
			        		num = $(this).index();
			        		$(this).children().children('i').html(data.rows[num].title);
			        		$(this).children('a').attr('id',data.rows[num].aid);
			        		
		        		})
		        		
		        		$('.activity_right_main_list1 li .activity_date').each(function(){//循环输出日期
		        			num = $(this).parents('li').index();
		        			var ptime = data.rows[num].ptime;
		        			var ntime = ptime.charAt(6)+"/"+ptime.charAt(8)+ptime.charAt(9);
		        			$(this).html(ntime);
		        		});	
		        }
		       
	});
	$.ajax({
		        url : "notice_findAll.action",
		        type : "post",
		        dataType : "json",
		        success : function(data) {
		        
		        	$('.activity_right_main_list2 li').each(function(){//循环输出最新公告标题
			        		num = $(this).index();
			        		$(this).children().children('i').html(data.rows[num].title);
			        		$(this).children().attr('id',data.rows[num].nid);
			        		
		        		})
		        	$('.activity_right_main_list2 li .announcement_date').each(function(){//循环输出日期
		        			num = $(this).parents('li').index();
		        			var ptime = data.rows[num].ptime;
		        			var ntime = ptime.charAt(6)+"/"+ptime.charAt(8)+ptime.charAt(9);
		        			
		        			$(this).html(ntime);
		        		});
		        }
	});
	$.ajax({
		url:'donate_All',
		dataType:'json',
		type:'post',
		success:function(data){
			$('.donation_list li').each(function(){
				var $thisLi = $(this);
				var thisEq = $thisLi.index();
				//donation_act_fbtime
				$thisLi.children('.donation_list_box').children('.donation_list_box_imgBox').children('img').attr('src',data.rows[thisEq].picture);
				$thisLi.children('.donation_list_box').children('.donation_list_box_introduceBox').children('.donation_act_title').html(data.rows[thisEq].title);
				$thisLi.children('.donation_list_box').children('.donation_list_box_introduceBox').children('.donation_act_fbtime').children('b').html(data.rows[thisEq].ptime);
				$thisLi.children('.donation_list_box').children('.donation_list_box_introduceBox').children('.donation_act_content').html(data.rows[thisEq].content);
				$thisLi.children('.donation_list_box').children('.donation_list_box_introduceBox').children('.donation_act_timebox').children('.starttime').children('b').html(data.rows[thisEq].starttime);
				$thisLi.children('.donation_list_box').children('.donation_list_box_introduceBox').children('.donation_act_timebox').children('.endtime').children('b').html(data.rows[thisEq].stoptime);
				$thisLi.children('.donation_list_box').children('.donation_list_box_introduceBox').children('.donation_act_mtp').children('.theman').children('b').html(data.rows[thisEq].name);
				$thisLi.children('.donation_list_box').children('.donation_list_box_introduceBox').children('.donation_act_mtp').children('.thetel').children('b').html(data.rows[thisEq].phone);
				$thisLi.children('.donation_list_box').children('.donation_list_box_introduceBox').children('.donation_act_mtp').children('.theaddress').children('b').html(data.rows[thisEq].site);
			});
		}
	});
});
/*轮播图点击事件*/
var a = 0;
$('.activity_left_picList li a').click(function(){
	a = $('.activity_left_picList li a').index(this);
	aa(a);
});
function aa(a){
	b = $('.activity_left_picList li a img').eq(a).attr('id');//获得轮番图a标签的id值，即是aid
	window.location.href="activity_findByAid.action?aid="+b;
}
/*活动点击*/
$('.activity_right_main_list1 a').click(function(){
	actAid = $(this).attr('id')
	window.location.href="activity_findByAid.action?aid="+actAid;
});
/*公告点击*/
$('.activity_right_main_list2 a').click(function(){
	actNid = $(this).attr('id')
	window.location.href="notice_reading.action?nid="+actNid;
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
/*轮播图部分*/
var len = $(".activity_left_btnList li").length;
    var index = 0;  //图片序号
    var adTimer;
    $(".activity_left_btnList li").mouseover(function() {
        index = $(".activity_left_btnList li").index(this);  //获取鼠标悬浮 li 的index
        showImg(index);
    }).eq(0).mouseover();
    //滑入停止动画，滑出开始动画.
    $('.activity_left').hover(function() {
        clearInterval(adTimer);
    }, function() {
        adTimer = setInterval(function() {
            showImg(index)
            index++;
            if (index == len) {       //最后一张图片之后，转到第一张
                index = 0;
            }
        }, 2000);
    }).trigger("mouseleave");

    function showImg(index) {
        var adWidth = $(".activity_left_picList>li:first").width();
        $(".activity_left_picList").stop(true, false).animate({
            "marginLeft": -adWidth * index + "px"    //改变 marginTop 属性的值达到轮播的效果
        }, 600);
        $(".activity_left_btnList li").removeClass("on")
            .eq(index).addClass("on");
    }
/*公告部分*/
var indexAct = 0;
$('.activity_right_title_list li').hover(function(){
	indexAct = $('.activity_right_title_list li').index(this);
	changeAct(indexAct);
	});
function changeAct(indexAct){
	$(".activity_right_title_list li").removeClass("titleOn").eq(indexAct).addClass("titleOn");
	}
$('.activity_right_title_list li:nth-child(1)').hover(function(){
	$('.activity_right_mainBox1').css({"display":"block"});
	$('.activity_right_mainBox2').css({"display":"none"});
	});
$('.activity_right_title_list li:nth-child(2)').hover(function(){
	$('.activity_right_mainBox2').css({"display":"block"});
	$('.activity_right_mainBox1').css({"display":"none"});
	});
/*toTop*/
$('.toTop').click(function(){
	$('body').animate({scrollTop:"0"}, 200, 'linear');
	});
$('#nav_main').click(function(){
	$('body').animate({scrollTop:"0"}, 200, 'linear');
	});
/*顶部栏目部分*/
$(window).scroll(function(){
	if($(window).scrollTop() >= $('.activityBox').position().top){
		$('.toTop').css({display:"block"});
		$('.headerActive').removeClass('headerActive').addClass('headerr');
		$('.navBox').removeClass('navBox').addClass('navBoxActive');
		}
	if($(window).scrollTop() < $('.activityBox').position().top){
		$('.toTop').css({display:"none"});
		$('.headerr').removeClass('headerr').addClass('headerActive');
		$('.navBoxActive').removeClass('navBoxActive').addClass('navBox');
		}
	if($(window).scrollTop() < $('.hotGoods').position().top - 200){
		$('.navlist li').removeClass('navOn');
		$('#nav_main').addClass('navOn');
		}
	if($(window).scrollTop() >= $('.hotGoods').position().top - 230 && $(window).scrollTop() < $('.shareBox').position().top - 100){
		$('.navlist li').removeClass('navOn');
		$('#nav_market').addClass('navOn');
		}
	if($(window).scrollTop() >= $('.shareBox').position().top - 120 && $(window).scrollTop() < $('.donationBox').position().top - 150){
		$('.navlist li').removeClass('navOn');
		$('#nav_share').addClass('navOn');
		}
	if($(window).scrollTop() >= $('.donationBox').position().top - 150 && $(window).scrollTop()){
		$('.navlist li').removeClass('navOn');
		$('#nav_donation').addClass('navOn');
		}
	});
/*导航栏跳转*/
$('#nav_market').click(function(){
	$('body').animate({scrollTop:$('.hotGoods').offset().top - 200}, 200, 'linear');
	});
$('#nav_share').click(function(){
	$('body').animate({scrollTop:$('.shareBox').offset().top - 100}, 200, 'linear');
	});
$('#nav_donation').click(function(){
	$('body').animate({scrollTop:$('.donationBox').offset().top - 100}, 200, 'linear');
	});
/*显示捐赠详情*/
$(window).ready(function(e) {
	$('.donation_fixed_box').css({"height":$(window).height(),"width":"100%"});
	});
$('.closeIcon').click(function(){
	hiddenFixed();
	});
function hiddenFixed(){
	$('.donation_fixed_box').css({"display":"none"});
	$('.closeIcon').css({"display":"none"});
	$('.donation_fixed_box div').css({"display":"none"});
	}
var indexDon = 0;
$('.donationMain i').click(function(){
	indexDon = $('.donationMain i').index(this);
	showFixed(indexDon);
	});
function showFixed(indexDon){
	$('.donation_fixed_box').css({"display":"block"});
	$('.closeIcon').css({"display":"block"});
	$('.donation_fixed_box div').eq(indexDon).css({"display":"block"});
	}
/*热门共享*/
var index1 = 0;
$('.share_toplist li').mouseover(function(){
	index1 = $(".share_toplist li").index(this);
	showBoxshadow1(index1);
	});
$('.share_toplist li').mouseout(function(){
	index1 = $(".share_toplist li").index(this);
	hiddenBoxshadow1(index1);
	});
function showBoxshadow1(index1){
	$('.share_toplist li').eq(index1).css({"box-shadow":"0 5px 18px 2px rgba(7,17,27,0.4)","border-radius":"10px","transition":"0.4s"});
	}
function hiddenBoxshadow1(index1){
	$('.share_toplist li').eq(index1).css({"box-shadow":"none","border-radius":"0px","transition":"0.4s"});
	}
/*其他共享*/
var index2 = 0;
$('.other_share_listBox').mouseover(function(){
	index2 = $(".other_share_listBox").index(this);
	showBoxshadow2(index2);
	});
$('.other_share_listBox').mouseout(function(){
	index2 = $(".other_share_listBox").index(this);
	hiddenBoxshadow2(index2);
	});
function showBoxshadow2(index2){
	$('.other_share_listBox').eq(index2).css({"box-shadow":"0 5px 18px 2px rgba(255,255,255,.9)","transition":"0.4s"});
	$('.other_share_listBox .other_share_listBox_img img').eq(index2).css({"transform":"scale(1.1)","transition":"0.5s"});
	}
function hiddenBoxshadow2(index2){
	$('.other_share_listBox').eq(index2).css({"box-shadow":"none","transition":"0.4s"});
	$('.other_share_listBox .other_share_listBox_img img').eq(index2).css({"transform":"scale(1)","transition":"0.5s"});
	}
/*热门销售*/
var index3 = 0;
$('.goods_pic').mouseover(function(){
	index3 = $(".goods_pic").index(this);
	moveRight(index3);
	});
$('.goods_pic').mouseout(function(){
	index3 = $(".goods_pic").index(this);
	backRight(index3);
	});
function moveRight(index3){
	$(".goods_pic .goods_pic_img").eq(index3).css({"right":"15px","transition":"0.3s"});
	}
function backRight(index3){
	$(".goods_pic .goods_pic_img").eq(index3).css({"right":"0px","transition":"0.3s"});
	}
/*我的活动*/
$(window).ready(function(e){
	$.ajax({
		url : "attend_findByUid.action",
		type : "post",
		dataType :"json",
		success : function(data){
			if(data.result){
				var str = '';
				var aText = '';
				var hr = '';
				for(var i = 0;i<data.message.length;i++){
					aText = data.message[i].activity.title;
					hr = "activity_findByAid.action?aid="+data.message[i].activity.aid;
					str = "<a class='my_act_list'" + "href='"+hr+"'>"+aText+"</a>";
					$('.my_act_box').append(str);
				}		
			}else{
				$('.my_act_box').html(data.message);
			}	
		}
	});
});
var showAct = true;
$('.my_act_icon').click(function(){
	if(showAct){
		$('.my_act_box').css({"display":"block"});
		showAct = !showAct;
	}
	else{
		$('.my_act_box').css({"display":"none"});
		showAct = !showAct;
	}
});

/*活动*/
$('.my_act_list').click(function(){
	a = $(this).attr('href')
	alert(a);
});
/*充值*/
$('.cz_btn').click(function(){
	$('.cz_box').css({"display":"block"});
	$('.money_box').css({"display":"none"});
}); 
$('.cz_box_close').click(function(){
	$('.cz_box').css({"display":"none"});
	$('.money_box').css({"display":"block"});
});
$('.cz_agree').click(function(){
	var lifecoin = $(this).siblings('input#lifecoin').val();
	$.ajax({
		url : "user_topup",
		dataType : "json",
		data : "lifecoin="+lifecoin,
		type : "post",
		success:function(data){
			if(data.result){
				alert("充值成功！");
				window.location.reload();
			}else{
				alert("充值失败！");
			}
		},
		error:function(){
			alert("出错！");
		}
	});
});
</script>
</html>
