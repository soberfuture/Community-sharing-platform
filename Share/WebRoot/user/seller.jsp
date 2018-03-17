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
    <title>卖家</title>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<link rel="stylesheet" type="text/css" href="css/buyer.css" />
		<script src="js/jquery-3.1.1.js"></script>
		<script src="js/jquery.raty.js" type="text/javascript"></script>
		<script src="js/x.js"></script>
		<title>我是买家</title>
	</head>

<body>
<div class="main_box">
	<!-- 两个固定导航 -->
   	<div class="fixed_choose_box">
       	<s:if test="#session.pagebean.mygoods=='sales'">
       		<a href="order_findByUUid?state=2" class="my_buy_order" id="a1">我的购物订单</a>
       	</s:if>
       	<s:else>
       		<a href="order_findByUUid?state=2" class="my_buy_order">我的购物订单</a>
       	</s:else>
       	<s:if test="#session.pagebean.mygoods=='share'">
        <a href="sorder_findByUUid?state=1" class="my_share_order" id="a1">我的分享订单</a>
        </s:if>
        <s:else>
        <a href="sorder_findByUUid?state=1" class="my_share_order">我的分享订单</a>
        </s:else>
    </div>
    
	<!-- 销售订单。。。。。。。。。。。。。。。。。。 -->
    <s:if test="#session.pagebean.mygoods=='sales'">
    <!-- 其他导航 -->
    <div class="other_choose_box">
    	
    	<s:if test="#session.pagebean.type==2">
        	<a href="order_findByUUid.action?state=2" class="paying" id="a1">待接单</a>
        </s:if>
    	<s:else>
    		<a href="order_findByUUid.action?state=2" class="paying">待接单</a>
    	</s:else>
   		<s:if test="#session.pagebean.type==4">
        	<a href="order_findByUUid.action?state=4" class="completed" id="a1">已完成</a>
         </s:if>
    	<s:else>
    		<a href="order_findByUUid.action?state=4" class="completed">已完成</a>
    	</s:else>
        <s:if test="#session.pagebean.type==6">
        	<a href="order_findByUUid.action?state=6" class="completed" id="a1">已评价</a>
         </s:if>
    	<s:else>
    		<a href="order_findByUUid.action?state=6" class="completed">已评价</a>
    	</s:else>
    	<s:if test="#session.pagebean.type==null">
    		<a href="order_findByUUid.action" class="all_order" id="a1">全部订单</a>
    	</s:if>
    	<s:else>
    		<a href="order_findByUUid.action" class="all_order">全部订单</a>
    	</s:else>
    </div>
    <div class="clearfix"></div>
    <!-- 中间部分 -->
    <div class="main_middle_box">
    	<div class="middle_section">
        	<table class="main_table" cellspacing="0">
            <!-- 表头部分  固定 -->
            	<thead>
                	<tr>
                    	<th width="700px">订单详情</th>
                        <th>数量</th>
                        <th>收货人</th>
                        <th>金额</th>
                        <th>状态</th>
                    </tr>
                </thead>
				<s:iterator status="staus" value="#session.pagebean.list" var="o">
            <!-- 表体部分  调用 -->
            	<tbody>
                	<tr class="sep-row">
                    	<td colspan="5"></td>
                    </tr>
                    <tr class="tr_th">
                    	<td class="order_time">
                        	<s:property value="#o.time"/>
                        </td>
                        <td colspan="4" class="address_td">
                        	收货地址：<span class="get_goods_address"><s:property value="#o.addr"/></span>
                        </td>
                    </tr>
                    <tr class="tr_tb" id="asdasd">
                    	<td rowspan="1" class="good_item_td">
                        	<div class="good_item">
                            	<!-- 商品图片 -->
                            	<div class="good_img">
                                	<img id="<s:property value="#o.oid"/>" src="<s:property value="#o.Sales.picture"/>" />
                                </div>
                                <div class="good_msg">
                                	<s:property value="#o.Sales.sname"/>
                                </div>
                            </div>
                        </td>
                        <td rowspan="1">
                        	<p class="good_number">X&emsp;<s:property value="#o.count"/></p>
                        </td>
                        <td rowspan="1" class="buyer_info_box">
                        	<p class="buyer_name"><s:property value="#o.name"/></p>
                            <p>联系电话：<span class="buyer_tel"><s:property value="#o.phone"/></span></p>
                        </td>
                        <td rowspan="1" class="good_price_box">
                        	<p class="good_Oneprice_box">单价：￥<span class="good_Oneprice"><s:property value="#o.price"/></span></p>
                            <p class="good_Allprice_box">总额：￥<span class="good_Allprice"><s:property value="#o.total"/></span></p>
                        </td>
                        <td rowspan="1" class="order_state">
                            <div>
							<s:if test="#o.state==1">
				    			未付款
				    		</s:if>
				    		<s:if test="#o.state==2">
				    			<a class="Agree" id="sales3" >接单</a>
				    			<a class="Refused" id="sales5">拒绝</a>
				    		</s:if>
				    		<s:if test="#o.state==3">
				    			已接单
				    		</s:if>
				    		<s:if test="#o.state==4">
				    			交易完成
				    		</s:if>
				    		<s:if test="#o.state==5">
				    			拒接，已退款
				    		</s:if>
				    		<s:if test="#o.state==6">
				    			已评价
				    		</s:if>                               
                            </div>
                        </td>
                    </tr>
                </tbody>
				</s:iterator>
            </table>
            <div class="clearfix"></div>
        </div>
    </div>
    <div class="clearfix"></div>
    <!-- 底部分页部分 -->
	<div class="bottom_box">
        <div class="pn_page_box">
			当前页：<s:property value="#session.pagebean.currentPage"/>/<s:property value="#session.pagebean.totalPage"/>
			总记录数：<s:property value="#session.pagebean.total"/>
			每页记录数：<s:property value="#session.pagebean.pageSize"/>
			<s:if test="#session.pagebean.currentPage>1">
            <a href="order_findByUUid.action?page=<s:property value="#session.pagebean.currentPage-1"/>" class="prev_btn">上一页</a>
			</s:if>
			<s:if test="#session.pagebean.currentPage<#session.pagebean.totalPage">
            <a href="order_findByUUid.action?page=<s:property value="#session.pagebean.currentPage+1"/>" class="next_btn">下一页</a>
			</s:if>
            <a href="order_findByUUid.action?page=1" class="first_btn">首页</a>
            <a href="order_findByUUid.action?page=<s:property value="#session.pagebean.totalPage"/>" class="end_btn">尾页</a>
        </div>
    </div>
	</s:if>
	
	
	<!-- 共享订单。。。。。。。。。。。。。。。。。。 -->
    <s:if test="#session.pagebean.mygoods=='share'">
    <!-- 其他导航 -->
    <div class="other_choose_box">
    	
    	<s:if test="#session.pagebean.type==1">
        	<a href="sorder_findByUUid.action?state=1" class="paying" id="a1">待接单</a>
        </s:if>
    	<s:else>
    		<a href="sorder_findByUUid.action?state=1" class="paying">待接单</a>
    	</s:else>
   		<s:if test="#session.pagebean.type==4">
        	<a href="sorder_findByUUid.action?state=4" class="completed" id="a1">已完成</a>
         </s:if>
    	<s:else>
    		<a href="sorder_findByUUid.action?state=4" class="completed">已完成</a>
    	</s:else>
        <s:if test="#session.pagebean.type==6">
        	<a href="sorder_findByUUid.action?state=6" class="completed" id="a1">已评价</a>
         </s:if>
    	<s:else>
    		<a href="sorder_findByUUid.action?state=6" class="completed">已评价</a>
    	</s:else>
    	<s:if test="#session.pagebean.type==null">
    		<a href="sorder_findByUUid.action" class="all_order" id="a1">全部订单</a>
    	</s:if>
    	<s:else>
    		<a href="sorder_findByUUid.action" class="all_order">全部订单</a>
    	</s:else>
    </div>
    <div class="clearfix"></div>
    <!-- 中间部分 -->
    <div class="main_middle_box">
    	<div class="middle_section">
        	<table class="main_table" cellspacing="0">
            <!-- 表头部分  固定 -->
            	<thead>
                	<tr>
                    	<th width="700px">订单详情</th>
                        <th>数量</th>
                        <th>收货人</th>
                        <th>金额</th>
                        <th>状态</th>
                    </tr>
                </thead>
				<s:iterator status="staus" value="#session.pagebean.list" var="o">
            <!-- 表体部分  调用 -->
            	<tbody>
                	<tr class="sep-row">
                    	<td colspan="5"></td>
                    </tr>
                    <tr class="tr_th">
                    	<td class="order_time">
                        	<s:property value="#o.time"/>
                        </td>
                        <td colspan="4" class="address_td">
                        	收货地址：<span class="get_goods_address"><s:property value="#o.addr"/></span>
                        </td>
                    </tr>
                    <tr class="tr_tb">
                    	<td rowspan="1" class="good_item_td">
                        	<div class="good_item">
                            	<!-- 商品图片 -->
                            	<div class="good_img">
                                	<img id="<s:property value="#o.soid"/>" src="<s:property value="#o.Share.picture"/>" />
                                </div>
                                <div class="good_msg">
                                	<s:property value="#o.Share.sname"/>
                                </div>
                            </div>
                        </td>
                        <td rowspan="1">
                        	<p class="good_number">X&emsp;1</p>
                        </td>
                        <td rowspan="1" class="buyer_info_box">
                        	<p class="buyer_name"><s:property value="#o.name"/></p>
                            <p>联系电话：<span class="buyer_tel"><s:property value="#o.phone"/></span></p>
                        </td>
                        <td rowspan="1" class="good_price_box">
                        	<p class="good_Oneprice_box">单价：￥<span class="good_Oneprice"><s:property value="#o.price"/></span></p>
                            <p class="good_Allprice_box">总额：￥<span class="good_Allprice"><s:property value="#o.total"/></span></p>
                        </td>
                        <td rowspan="1" class="order_state">
                            <div>
							<s:if test="#o.state==1">
				    			<a class="Agree" id="share2">接受</a>
				    			<a class="Refused" id="share5">拒绝</a>
				    		</s:if>
				    		<s:if test="#o.state==3">
				    			待归还
				    		</s:if>
				    		<s:if test="#o.state==4">
				    			交易完成
				    		</s:if>
				    		<s:if test="#o.state==5">
				    			拒绝分享
				    		</s:if>
				    		<s:if test="#o.state==6">
				    			已评价
				    		</s:if>
                            </div>
                        </td>
                    </tr>
                </tbody>
				</s:iterator>
            </table>
            <div class="clearfix"></div>
        </div>
    </div>
    <div class="clearfix"></div>
    <!-- 底部分页部分 -->
	<div class="bottom_box">
        <div class="pn_page_box">
			当前页：<s:property value="#session.pagebean.currentPage"/>/<s:property value="#session.pagebean.totalPage"/>
			总记录数：<s:property value="#session.pagebean.total"/>
			每页记录数：<s:property value="#session.pagebean.pageSize"/>
			<s:if test="#session.pagebean.currentPage>1">
            <a href="sorder_findByUUid.action?page=<s:property value="#session.pagebean.currentPage-1"/>" class="prev_btn">上一页</a>
			</s:if>
			<s:if test="#session.pagebean.currentPage<#session.pagebean.totalPage">
            <a href="sorder_findByUUid.action?page=<s:property value="#session.pagebean.currentPage+1"/>" class="next_btn">下一页</a>
			</s:if>
            <a href="sorder_findByUUid.action?page=1" class="first_btn">首页</a>
            <a href="sorder_findByUUid.action?page=<s:property value="#session.pagebean.totalPage"/>" class="end_btn">尾页</a>
        </div>
    </div>
	</s:if>
	
	
	
</div>
<!-- 弹出框 -->
<div class="Evaluation_fixed_box">
	<div class="Evaluation_fixed_section">
    	<textarea class="Evaluation_text" placeholder="请评价。。。。。。"></textarea>
        <div class="Evaluation_start">
        	<b style="float: left;">评分：</b>
        	<div id="starbox1"></div>
            <div id="starbox2"></div>
            <p class="Evaluation_num">0</p>
        </div>
        <button type="button" class="Evaluation_submit">评论</button>
    </div>
</div>
</body>
<script>
/*顶部按钮部分*/
var indexA = 0;
$('.choose_box a').click(function(){
	indexA = $('.choose_box a').index(this);
	showBtn(indexA);
	});
function showBtn(indexA){
	$('.choose_box a').removeClass('btn_show').eq(indexA).addClass('btn_show');
	}
/*弹出评论框*/
$('.Evaluation').click(function(){
	$('.Evaluation_fixed_box').fadeIn('slow');
	$('.Evaluation_text').val('');
	
	});
$('.Evaluation_fixed_section').x({
	move: true,
	close: true,
	resize: true
	});
/*星级*/
rat('starbox1','starbox2',1);
function rat(star,result,m){
	star= '#' + star;
	result= '#' + result;
	$(result).hide();//将结果DIV隐藏
	$(star).raty({
		hints: ['0.5','1.0', '1.5', '2.0', '2.5','3.0', '3.5', '4.0', '4.5', '5.0'],
		path: "images",
		starOff: 'star-off-big.png',
		starOn: 'star-on-big.png',
		size: 24,
		start: 40,
		showHalf: true,
		target: result,
		targetKeep : true,
		click: function (score, evt) {
			//第一种方式：直接取值
			$('.Evaluation_num').html(score*m);
			//alert('你的评分是'+score*m+'分');
		}
	});
}
$('.Evaluation_submit').click(function(){
	alert($('.Evaluation_num').text());
});
//接受销售
$('#sales3').click(function(){
	var $this = $(this);
	var a =	$this.parents('.order_state').siblings('.good_item_td').children().children('.good_img').children('img').attr('id');
	$.ajax({
		url:"order_change.action",
		dataType:"json",
		type:"post",
		data:"oid="+a+"&state=3",
		success:function(data){
			if(data.result){
				alert("接单成功！");
				window.location.reload();
			}else{
				alert("接单失败！");
			}
		},
		error: function(){
			alert("接单失败！");
		}
	});
});
//拒绝销售
$('#sales5').click(function(){
	var $this = $(this);
	var a =	$this.parents('.order_state').siblings('.good_item_td').children().children('.good_img').children('img').attr('id');
	$.ajax({
		url:"order_change.action",
		dataType:"json",
		type:"post",
		data:"oid="+a+"&state=5",
		success:function(data){
			if(data.result){
				alert("拒绝成功！");
				window.location.reload();
			}else{
				alert("发生失败！");
			}
		},
		error: function(){
			alert("发生失败！");
		}
	});
});
//接受共享
$('#share2').click(function(){
	var $this = $(this);
	var a =	$this.parents('.order_state').siblings('.good_item_td').children().children('.good_img').children('img').attr('id');
	$.ajax({
		url:"sorder_change.action",
		dataType:"json",
		type:"post",
		data:"soid="+a+"&state=2",
		success:function(data){
			if(data.result){
				alert("接单成功！");
				window.location.reload();
			}else{
				alert("接单失败！");
			}
		},
		error: function(){
			alert("接单失败！");
		}
	});
});
//拒绝共享
$('#share5').click(function(){
	var $this = $(this);
	var a =	$this.parents('.order_state').siblings('.good_item_td').children().children('.good_img').children('img').attr('id');
	$.ajax({
		url:"sorder_change.action",
		dataType:"json",
		type:"post",
		data:"soid="+a+"&state=5",
		success:function(data){
			if(data.result){
				alert("拒绝成功！");
				window.location.reload();
			}else{
				alert("发生错误！");
			}
		},
		error: function(){
			alert("发生错误！");
		}
	});
});
</script>
</html>
