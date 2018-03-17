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
		<link rel="stylesheet" type="text/css" href="css/goods_manage.css" />
		<script src="js/jquery-3.1.1.js"></script>
	</head>

<body>
<div class="main_box">
	<!-- 头部分类按钮 -->
    <div class="top_box">
    	<nav class="choose_box">
    		<s:if test="#session.pagebean.mygoods=='share'">
        		<a id="share" href="share_findByUid.action" class="myshare a1">我的分享</a>
        	</s:if>
        	<s:else>
        		<a id="share" href="share_findByUid.action" class="myshare">我的分享</a>
        	</s:else>
        	<s:if test="#session.pagebean.mygoods=='sales'">
            	<a id="sales" href="sales_findByUid.action" class="mysale a1">我的销售</a>
            </s:if>
        	<s:else>
        		<a id="sales" href="sales_findByUid.action" class="mysale">我的销售</a>
        	</s:else>
        </nav>
    </div>
    <!-- 中间部分 -->
	<!-- 这是共享模块 -->
    <s:if test="#session.pagebean.mygoods=='share'">
   	<div class="middle_box">
    	<div class="middle_section">
        	<!-- 添加按钮 -->
        	<a class="share_add">添加</a>
        	<!-- 我的共享 -->
        	<ul class="">
				<s:iterator value="#session.pagebean.list" var="s">
            	<li class="share_item">
                	<div class="item_img_box">
                    	<img src="<s:property value="#s.picture"/>" />
                    </div>
                    <div class="item_info_box">
                    	<p class="goods_name">物品名：&emsp;<span id="123"><s:property value="#s.sname"/></span></p>
                        <p class="goods_price">价格：&emsp;&emsp;<span>￥<s:property value="#s.price"/></span></p>
                        <p class="goods_state">状态：&emsp;&emsp;
                        	<s:if test="#s.state==0">
                        		<span>分享</span>
                        	</s:if>
                        	<s:if test="#s.state==1">
                        		<span>已分享</span>
                        	</s:if>
                        </p>
                        <p class="goods_operation">
                        	操作：
                        	<button  class="btn1" id="sc" data-x="<s:property value="#s.sid"/>" type="button">删除</button>
                            <button  class="btn1" id="xg" data-x="<s:property value="#s.sid"/>" type="button">修改</button>
                        </p>
                    </div>
                </li>
				</s:iterator>
            </ul>
            <div class="clearfix"></div>
            
            
        </div>
    </div>
    <div class="clearfix"></div>
	<!-- 底部按钮 -->
	<div class="bottom_box">
        <div class="pn_page_box">
			当前页：<s:property value="#session.pagebean.currentPage"/>/<s:property value="#session.pagebean.totalPage"/>
			总记录数：<s:property value="#session.pagebean.total"/>
			每页记录数：<s:property value="#session.pagebean.pageSize"/>
			<s:if test="#session.pagebean.currentPage>1">
            <a href="share_findByUid.action?page=<s:property value="#session.pagebean.currentPage-1"/>" class="prev_btn">上一页</a>
			</s:if>
			<s:if test="#session.pagebean.currentPage<#session.pagebean.totalPage">
            <a href="share_findByUid.action?page=<s:property value="#session.pagebean.currentPage+1"/>" class="next_btn">下一页</a>
			</s:if>
            <a href="share_findByUid.action?page=1" class="first_btn">首页</a>
            <a href="share_findByUid.action?page=<s:property value="#session.pagebean.totalPage"/>" class="end_btn">尾页</a>
        </div>
    </div>
    </s:if>
    
    <!-- 这是销售模块 -->
    <s:if test="#session.pagebean.mygoods=='sales'">
   	<div class="middle_box">
    	<div class="middle_section">
        	<!-- 添加按钮 -->
        	<a class="share_add">添加</a>
        	<!-- 我的共享 -->
        	<ul class="">
				<s:iterator value="#session.pagebean.list" var="s">
            	<li class="share_item">
                	<div class="item_img_box">
                    	<img src="<s:property value="#s.picture"/>" />
                    </div>
                    <div class="item_info_box">
                    	<p class="goods_name">物品名：&emsp;<span><s:property value="#s.sname"/></span></p>
                        <p class="goods_price">价格：&emsp;&emsp;<span>￥<s:property value="#s.price"/></span></p>
                        <p class="goods_state">状态：&emsp;&emsp;
                        	<s:if test="#s.number!=0">
                        		<span>还剩<s:property value="#s.number" /></span>
                        	</s:if>
                        	<s:if test="#s.number==0">
                        		<span>已售完</span>
                        	</s:if>
                        </p>
                        <p class="goods_operation">
                        	操作：
                        	<button  class="btn2" id="sc" data-x="<s:property value="#s.sid"/>" type="button">删除</button>
                            <button  class="btn2" id="xg" data-x="<s:property value="#s.sid"/>" type="button">修改</button>
                        </p>
                    </div>
                </li>
				</s:iterator>
            </ul>
            <div class="clearfix"></div>
        </div>
    </div>
    <div class="clearfix"></div>
	<!-- 底部按钮 -->
	<div class="bottom_box">
        <div class="pn_page_box">
			当前页：<s:property value="#session.pagebean.currentPage"/>/<s:property value="#session.pagebean.totalPage"/>
			总记录数：<s:property value="#session.pagebean.total"/>
			每页记录数：<s:property value="#session.pagebean.pageSize"/>
			<s:if test="#session.pagebean.currentPage>1">
            <a href="sales_findByUid.action?page=<s:property value="#session.pagebean.currentPage-1"/>" class="prev_btn">上一页</a>
			</s:if>
			<s:if test="#session.pagebean.currentPage<#session.pagebean.totalPage">
            <a href="sales_findByUid.action?page=<s:property value="#session.pagebean.currentPage+1"/>" class="next_btn">下一页</a>
			</s:if>
            <a href="sales_findByUid.action?page=1" class="first_btn">首页</a>
            <a href="sales_findByUid.action?page=<s:property value="#session.pagebean.totalPage"/>" class="end_btn">尾页</a>
        </div>
    </div>
    </s:if>
    
</div>

<div class="add_fixed_box">
	<!-- 分享弹出框 -->
	<div class="xg_box tj_box" id="tj_box1">
    <a href="javascript:;" class="close_fixed_box">&times;</a>
	<form id="uploadForm1" class="form1" method="post" enctype="multipart/form-data">
	
    <div class="xg_box_right_describe" style="display: none;">
    	<input id="sid" name="sid" type="text" />
	</div>
	<div class="xg_box_left">
    	物品图片：
    </div>
    <div class="xg_box_right_describe">
    	<input id="upload" name="upload" type="file" />
	</div>
    <div class="xg_box_left">
    	物品描述：
    </div>
    <div class="xg_box_right_describe">
    	<input id="sexplain" name="sexplain" type="text" />
	</div>
	<div class="xg_box_left">
    	物品名：
    </div>
    <div class="xg_box_right">
    	<input id="sname" name="sname" type="text" />
	</div>
    <div class="xg_box_left">
    	物品类型：
    </div>
    <div class="xg_box_right">
    	<select id="stype" name="stype">
			<option value="1">食品</option>
			<option value="2">工具</option>
			<option value="3">电器</option>
			<option value="4">书籍</option>
			<option value="5">服装</option>
			<option value="6">玩具</option>
			<option value="7">运动</option>
			<option value="8">家具</option>
		</select>
	</div>
    <div class="xg_box_left">
    	物品价格：
    </div>
    <div class="xg_box_right">
    	<input id="price" name="price" type="text" />
	</div>
    <div class="xg_box_left">
    	押金：
    </div>
    <div class="xg_box_right">
    	<input id="deposit" name="deposit" type="text" />
	</div>
    <input class="submit_xg submit1" id="submit1" type="submit" value="添加" />
    </form>	
	</div>
	
	
	<!-- 销售弹出框 -->
	<div class="xg_box" id="tj_box2">
    <a href="javascript:;" class="close_fixed_box">&times;</a>
	<form id="uploadForm2" class="form2" method="post" enctype="multipart/form-data">
    <div class="xg_box_right_describe" style="display: none;">
    	<input id="sid" name="sid" type="text" />
	</div>
	<div class="xg_box_left">
    	物品图片：
    </div>
    <div class="xg_box_right_describe">
    	<input id="upload" name="upload" type="file" />
	</div>
    <div class="xg_box_left">
    	物品描述：
    </div>
    <div class="xg_box_right_describe">
    	<input id="sexplain" name="sexplain"  type="text" />
	</div>
	<div class="xg_box_left">
    	物品名：
    </div>
    <div class="xg_box_right">
    	<input id="sname" name="sname"  type="text" />
	</div>
    <div class="xg_box_left">
    	物品类型：
    </div>
    <div class="xg_box_right">
    	<select id="stype" name="stype">
			<option value="1">食品</option>
			<option value="2">工具</option>
			<option value="3">电器</option>
			<option value="4">书籍</option>
			<option value="5">服装</option>
			<option value="6">玩具</option>
			<option value="7">运动</option>
			<option value="8">家具</option>
		</select>
	</div>
    <div class="xg_box_left">
    	物品价格：
    </div>
    <div class="xg_box_right">
    	<input id="price" name="price"  type="text" />
	</div>
    <div class="xg_box_left">
    	拥有数量：
    </div>
    <div class="xg_box_right">
    	<input  id="number" name="number"  type="text" />
	</div>
    <input class="submit_xg submit2" type="submit" value="添加" />
    </form>	
	</div>
</div>

</body>
  <script type="text/javascript">
	$(".btn1").click(function(){			//共享按钮。。。。。。。	
	if($(this).attr("id") == 'sc'){
		var r=confirm("是否确定删除该物品？")
		if (r==true){
	    	$.ajax({
		        url : "share_delShare.action",
		        type : "post",
		        dataType : "json",
		        data : "sid="+$(this).data("x"),
		        success : function(data) {
		           	if(data.result){
		           		alert("删除成功!");
		           	window.location.reload();
		           	}else{
		           		alert("删除失败！")
		           	}
		        }
		    });
	    }
	}
	if($(this).attr("id") == 'xg'){
		var shareId = $(this).data("x");
		$.ajax({
			url:"share_findBysid",
			dataType:"json",
			type:"post",
			data:"sid="+shareId,
			success:function(data){
				$('#tj_box1 #sid').val(data.share.sid);
				$('#tj_box1 #sexplain').val(data.share.sexplain);
				$('#tj_box1 #sname').val(data.share.sname);
				$('#tj_box1 .xg_box_right select').val(data.share.stype);
				$('#tj_box1 #price').val(data.share.price);
				$('#tj_box1 #deposit').val(data.share.deposit);
				$('.add_fixed_box').fadeIn('');
			},
			error:function(){
				alert('出错')
			}
		});
	}
	});

	$(".btn2").click(function(){			//销售按钮。。。。
	if($(this).attr("id") == 'sc'){
		var r=confirm("是否确定删除该物品？")
		if (r==true){
	    	$.ajax({
		        url : "sales_delSales.action",
		        type : "post",
		        dataType : "json",
		        data : "sid="+$(this).data("x"),
		        success : function(data) {
		           	if(data.result){
		           		alert("删除成功!");
		           	window.location.reload();
		           	}else{
		           		alert("删除失败！")
		           	}
		        }
		    });
	    }
	}
	if($(this).attr("id") == 'xg'){
		var salesId = $(this).data("x");
		$.ajax({
			url:"sales_findBysid",
			dataType:"json",
			type:"post",
			data:"sid="+salesId,
			success:function(data){
				$('.tj_box #sid').val(data.sales.sid);
				$('.tj_box #sexplain').val(data.sales.sexplain);
				$('.tj_box #sname').val(data.sales.sname);
				$('.tj_box .xg_box_right select').val(data.sales.stype);
				$('.tj_box #price').val(data.sales.price);
				$('.tj_box #number').val(data.sales.number);
				$('.add_fixed_box').fadeIn('');
			},
			error:function(){
				alert('出错')
			}
		});
	}
	});

	
/*顶部按钮部分*/
var indexA = 0;
$('.choose_box a').click(function(){
	indexA = $('.choose_box a').index(this);
	showBtn(indexA);
	});
function showBtn(indexA){
	$('.choose_box a').removeClass('btn_show').eq(indexA).addClass('btn_show');
	}
/*Li部分*/
var index = 0;
$('.middle_section li').mouseover(function(){
	index = $('.middle_section li').index(this);
	showShadow(index);
	});
$('.middle_section li').mouseout(function(){
	index = $('.middle_section li').index(this);
	hiddenShadow(index);
	});
function showShadow(index){
	$('.middle_section li').eq(index).css({"box-shadow":"0 5px 18px 2px rgba(7,17,27,0.4)","transition":"0.4s"});
	$('.middle_section li .item_img_box img').eq(index).css({"transform":"scale(1.05)","transition":"0.5s"});
	}
function hiddenShadow(index){
	$('.middle_section li').eq(index).css({"box-shadow":"none","transition":"0.4s"});
	$('.middle_section li .item_img_box img').eq(index).css({"transform":"scale(1)","transition":"0.5s"});
	}
/*显示添加框*/
$('.share_add').click(function(){
	$('.add_fixed_box').fadeIn('slow');
	});
/*关闭添加框*/
$('.close_fixed_box').click(function(){
	$('.add_fixed_box').fadeOut('slow');
	$('.tj_box input:not(.submit_xg)').val('');
	});
/* var flagShow = true;
$('.xg_box').mouseover(function(){
	flagShow = false;
	});
$('.xg_box').mouseout(function(){
	flagShow = true;
	});
$('.add_fixed_box').click(function(){
	if(flagShow){
		$('.add_fixed_box').fadeOut('slow');
		}
	else{
		return;
		}
	}); */
/*不同添加框*/
$(window).ready(function(e){
	aaa = $('.choose_box').children('.a1').index();
	$('.add_fixed_box .xg_box').removeClass('tj_box').eq(aaa).addClass('tj_box');
});
$('.form1').submit(function(){
	var formData = new FormData($( "#uploadForm1" )[0]);
	$.ajax({
				cache: true,
				async: false,
		        url : "share_addShare.action",
		        type : "post",
		        processData : false, 
				contentType : false,
		        dataType : "json",
		        data:$('.form1').serialize(),
		        data: formData,
		        success: function(data){
		           	if(data.result){
		           		alert("保存成功！");
		           		window.location.reload();
		           	}else{
		           		alert("保存失败！")
		           	}
		        },
		        error:function(){
		        	alert("出错");
		        } 
		    });
});
$('.submit2').click(function(){
	var formData = new FormData($( "#uploadForm2" )[0]);
	$.ajax({
				cache: true,
				async: false,
		        url : "sales_addSales.action",
		        type : "post",
		        processData : false, 
				contentType : false,
		        dataType : "json",
		        data:$('.form1').serialize(),
		        data: formData,
		        success : function(data) {
		          if(data.result){
		           		alert("保存成功！");
		           		window.location.reload();
		           	}else{
		           		alert("保存失败！");
		           	}
		        },
		        error:function(){
		        	alert("出错");
		        } 
		    });
});
  </script>
</html>
