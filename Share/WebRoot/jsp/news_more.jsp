<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
		<link rel="stylesheet" type="text/css" href="css/news_more.css" />
		<script src="js/jquery-3.1.1.js"></script>
		<title>新闻中心</title>
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
		        	
		        </div>
		    </div>
		</div>
		<div class="sales_more_top_box">
		    <div class="sales_more_top">
		        <div class="sales_more_top_left">新闻中心</div>
		        	<div class="sales_more_top_right">
		            	<span></span>
		               
		        	</div>
		     </div>
		</div>
		<!-- 主体部分 -->
		<div class="new_main_box">
			<div class="new_main_inner">
		    	
		        <!-- 主体部分 -->
		        <div class="news_box">
		        	<div class="news_box_title">
		            	<ul class="news_nav_list_box">
		                	<li>
		                		<a class="news_list_box_title">活动</a>
		                    </li>
		                    <li>
		                		<a class="">公告</a>
		                    </li>
		                </ul>
		            </div>
		            <div class="news_list_boxx">
			            <ul class="news_list_box ul_now_block">
			            	<div class="page_box" id="page_box1">
								<a class="page_prev" id="page_prev1">上一页</a>
								<a class="page_next" id="page_next1">下一页</a>
							</div>
			            </ul>
			            <ul class="news_list_box">
			            	<div class="page_box" id="page_box2">
								<a class="page_prev" id="page_prev2">上一页</a>
								<a class="page_next" id="page_next2">下一页</a>
							</div>
			            </ul>
					
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
	var page1 = 1;
	var page2 = 1;
	var total1 = 1;
	var total2 = 1;
	$(window).ready(function(e){
		
		$.ajax({
			url:'activity_AllPaging.action',
			type:'post',
			dataType:'json',
			success:function(data){
				page1 = data.page;
				page2 = data.page;
				var str = '';
				var href = '';
				//alert();
					for(var i = 0;i<data.result1.length;i++){
						href = "activity_findByAid.action?aid="+data.result1[i].aid;
						str = "<li class='news_list'><p><a "+"href='"+href+"'>"+data.result1[i].title+"</a></p><span class='date'>"+data.result1[i].ptime+"</span></li>";
						$('.news_list_boxx ul').eq(0).append(str);
					}
					for(var i = 0;i<data.result2.length;i++){
						href2 = "notice_reading.action?nid="+data.result2[i].nid;
						str2 = "<li class='news_list'><p><a "+"href='"+href2+"'>"+data.result2[i].title+"</a></p><span class='date'>"+data.result2[i].ptime+"</span></li>";
						$('.news_list_boxx ul').eq(1).append(str2);
					}
					total1 = Math.floor(data.total1/10) +1 ;
					total2 = Math.floor(data.total2/10) +1 ;
					$('#page_prev1').css({"display":"none"});
					$('#page_prev2').css({"display":"none"});
					if(total1 == 1){
						$('#page_prev1').css({"display":"none"});
						$('#page_next1').css({"display":"none"});
					}
					if(total2 == 1){
						$('#page_prev2').css({"display":"none"});
						$('#page_next2').css({"display":"none"});
					}
				
				}
		});
	});
	
	var indexA = 0;
	$('.news_nav_list_box li').click(function(){
		indexA = $(this).index();
		$('.news_nav_list_box li a').removeClass('news_list_box_title');
		$(this).children().addClass('news_list_box_title');
		changeUl(indexA);
	});
	function changeUl(indexA){
		$('.news_list_boxx ul').css({"display":"none"}).eq(indexA).css({"display":"block"});
		//alert('dfd')
	}
	/*活动下一页*/
	$('#page_next1').click(function(){
		$('#page_prev1').css({"display":"block"});
		$('#page_next1').css({"display":"block"});
		page1 += 1;
		$.ajax({
			url:'activity_APage.action',
			type:'post',
			dataType:'json',
			data:'page='+page1,
			success:function(data){
					$('.news_list_boxx ul').eq(0).children('li').empty();
					for(var i = 0;i<data.result1.length;i++){
					var href = "activity_findByAid.action?aid="+data.result1[i].aid;
					var str = "<li class='news_list'><p><a "+"href='"+href+"'>"+data.result1[i].title+"</a></p><span class='date'>"+data.result1[i].ptime+"</span></li>";
					$('.news_list_boxx ul').eq(0).append(str);
				}
			}
		});
		if(page1 == total1){
		$('#page_next1').css({"display":"none"});
		}
		if(page1 == 1){
			$('#page_prev1').css({"display":"none"});
		}
	});
	//活动上一页
	$('#page_prev1').click(function(){
		$('#page_prev1').css({"display":"block"});
		$('#page_next1').css({"display":"block"});
		page1 -= 1;
		$.ajax({
			url:'activity_APage.action',
			type:'post',
			dataType:'json',
			data:'page='+page1,
			success:function(data){
					$('.news_list_boxx ul').eq(0).children('li').empty();
					for(var i = 0;i<data.result1.length;i++){
					var href = "activity_findByAid.action?aid="+data.result1[i].aid;
					var str = "<li class='news_list'><p><a "+"href='"+href+"'>"+data.result1[i].title+"</a></p><span class='date'>"+data.result1[i].ptime+"</span></li>";
					$('.news_list_boxx ul').eq(0).append(str);
				}
			}
		});
		if(page1 == total1){
		$('#page_next1').css({"display":"none"});
		}
		if(page1 == 1){
			$('#page_prev1').css({"display":"none"});
		}
	})
	//公告上一页
	$('#page_prev2').click(function(){
		$('#page_prev2').css({"display":"block"});
		$('#page_next2').css({"display":"block"});
		page2 -= 1;
		$.ajax({
			url:'notice_APage.action',
			type:'post',
			dataType:'json',
			data:'page='+page2,
			success:function(data){
				$('.news_list_boxx ul').eq(1).children('li').empty();
				for(var i = 0;i<data.result2.length;i++){
					href2 = "notice_reading.action?nid="+data.result2[i].nid;
					str2 = "<li class='news_list'><p><a "+"href='"+href2+"'>"+data.result2[i].title+"</a></p><span class='date'>"+data.result2[i].ptime+"</span></li>";
					$('.news_list_boxx ul').eq(1).append(str2);
				}
			}
		});
		
		if(page2 == total2){
			$('#page_next2').css({"display":"none"});
		}
		
		if(page2 == 1){
			$('#page_prev2').css({"display":"none"});
		}
	})
	/*公告下一页*/
	$('#page_next2').click(function(){
		$('#page_prev2').css({"display":"block"});
		$('#page_next2').css({"display":"block"});
		page2 += 1;
		$.ajax({
			url:'notice_APage.action',
			type:'post',
			dataType:'json',
			data:'page='+page2,
			success:function(data){
				$('.news_list_boxx ul').eq(1).children('li').empty();
				for(var i = 0;i<data.result2.length;i++){
					href2 = "notice_reading.action?nid="+data.result2[i].nid;
					str2 = "<li class='news_list'><p><a "+"href='"+href2+"'>"+data.result2[i].title+"</a></p><span class='date'>"+data.result2[i].ptime+"</span></li>";
					$('.news_list_boxx ul').eq(1).append(str2);
				}
			}
		});
		
		if(page2 == total2){
			$('#page_next2').css({"display":"none"});
		}
		
		if(page2 == 1){
			$('#page_prev2').css({"display":"none"});
		}
	});
	</script>
</html>
