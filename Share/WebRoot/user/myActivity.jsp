<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<link rel="shortcut icon" type="image/x-icon" href="images/HomeIcon.jpg" media="screen" />
		<link rel="stylesheet" type="text/css" href="css/myActivity.css" />
		<script src="js/jquery-3.1.1.js"></script>
		<script type="text/javascript" src="js/jedate.js"></script>
		<title>活动管理</title>
	</head>

<body>
<div class="act_list_box">
	<i class="add_btn" title="添加活动"></i>
	<ul class="act_list">
		<s:iterator value="activitylist" var="a">
    	<li class="act_list_item">
        	<div class="time_item">
            	<span class="start_time">开始时间：<p class="sttime"><s:property value="#a.starttime"/> </p></span>
                <span class="stop_time">结束时间：<p class="sptime"><s:property value="#a.stoptime"/></p></span>
            </div>
            <div class="content_item">
            	<p class="act_title"><s:property value="#a.title"/></p>
                <p class="act_content"><s:property value="#a.content"/></p>
            </div>
            <div class="img_item">
            	<img id="<s:property value="#a.aid"/>" src="<s:property value="#a.picture"/>" />
            </div>
            <a class="delete_btn" title="删除活动"></a>
        </li>
        </s:iterator>
    </ul>
    <div class="clear_fix"></div>
</div>
<div class="add_fixed">
	<div class="add_box">
    	<b class="close_add_box" title="关闭"></b>
    	<form id="activity_form" method="post" enctype="multipart/form-data">
    	<ul class="add_act_list">
        	<li>
            	<div class="act_item_box">
                	<p class="act_item_left">活动标题：</p>
                    <div class="act_item_right">
                    	<input type="text" class="act_title" id="title" name="title" />
                    </div>
                </div>
            </li>
            <li>
            	<div class="act_item_box">
                	<p class="act_item_left">图片：</p>
                    <div class="act_item_right">
                    	<div id="preview"></div>
                    	<input type="file" id="upload" name="upload" />
                    </div>
                </div>
            </li>
            <li>
            	<div class="act_item_box">
                	<p class="act_item_left">活动描述：</p>
                    <div class="act_item_right">
                    	<textarea type="text" id="aexplain" name="aexplain"></textarea>
                    </div>
                </div>
            </li>
            <li>
            	<div class="act_item_box">
                	<p class="act_item_left">开始时间：</p>
                    <div class="act_item_right">
                    	<input type="text" class="act_time" id="starttime" name="starttime" />
                    </div>
                </div>
            </li>
            <li>
            	<div class="act_item_box">
                	<p class="act_item_left">结束时间：</p>
                    <div class="act_item_right">
                    	<input type="text" class="act_time" id="stoptime" name="stoptime" />
                    </div>
                </div>
            </li>
            <li>
            	<div class="act_item_box">
                	<p class="act_item_left">咨询电话：</p>
                    <div class="act_item_right">
                    	<input type="number" id="phone" name="phone" />
                    </div>
                </div>
            </li>
        </ul>
        <input type="button" value="提交" class="act_submit">
        </form>
    </div>
</div>
</body>
<script>
/*添加框*/
$('.add_btn').click(function(){
	$('.add_fixed').fadeIn('slow');
	});
var flagShow = true;
$('.add_box').mouseover(function(){
	flagShow = false;
	});
$('.add_box').mouseout(function(){
	flagShow = true;
	});
$('.add_fixed').click(function(){
	if(flagShow){
		$('.add_fixed').fadeOut('slow');
		}
	else{
		return;
		}
	});
/*关闭添加框*/
$('.close_add_box').click(function(){
	$('.add_fixed').fadeOut('slow');
	});
/*活动LI*/
var indexLi = 0;
$('.act_list_box ul li').mouseover(function(){
	indexLi = $('.act_list_box ul li').index(this);
	moveLi(indexLi);
	});
$('.act_list_box ul li').mouseout(function(){
	indexLi = $('.act_list_box ul li').index(this);
	moveBackLi(indexLi);
	});
function moveLi(indexLi){
	$('.act_list_box ul li').eq(indexLi).css({"top":"-10px","transition":"0.3s"});
	}
function moveBackLi(indexLi){
	$('.act_list_box ul li').eq(indexLi).css({"top":"0px","transition":"0.4s"});
	}
/*显示图片*/
        function preview1(file) {
            var img = new Image(), url = img.src = URL.createObjectURL(file)
            var $img = $(img)
            img.onload = function() {
                URL.revokeObjectURL(url)
                $('#preview').empty().append($img)
            }
        }
        function preview2(file) {
            var reader = new FileReader()
            reader.onload = function(e) {
                var $img = $('<img>').attr("src", e.target.result)
                $('#preview').empty().append($img)
            }
            reader.readAsDataURL(file)
        }
         
        $(function() {
            $('[type=file]').change(function(e) {
                var file = e.target.files[0]
                preview1(file)
            })
        })
/*活动时间*/
jeDate({
		dateCell:"#starttime",
		format:"YYYY-MM-DD hh:mm:ss",
		isinitVal:false,
		isTime:true//, //isClear:false,
		//okfun:function(val){alert(val)}
	});
jeDate({
		dateCell:"#stoptime",
		format:"YYYY-MM-DD hh:mm:ss",
		isinitVal:false,
		isTime:true//, //isClear:false,
		//okfun:function(val){alert(val)}
	});
function getNowFormatDate() {
    var date = new Date();
    var seperator1 = "-";
    var seperator2 = ":";
    var month = date.getMonth() + 1;
    var strDate = date.getDate();
    if (month >= 1 && month <= 9) {
        month = "0" + month;
    }
    if (strDate >= 0 && strDate <= 9) {
        strDate = "0" + strDate;
    }
    var currentdate = date.getFullYear() + seperator1 + month + seperator1 + strDate
            + " " + date.getHours() + seperator2 + date.getMinutes()
            + seperator2 + date.getSeconds();
    return currentdate;
};
/*提交*/
$('.act_submit').click(function(){
	var formData = new FormData($( "#activity_form" )[0]);
	$.ajax({
		        url : "activity_addActivity.action",
		        type : "post",
		        processData : false, 
				contentType : false,
		        dataType : "json",
		        data:$('#activity_form').serialize(),
		        data: formData,
		        success : function(data) {
		          if(data.success){
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

$('.delete_btn').click(function(){
	var aid = $(this).parent('li.act_list_item').find('img').attr('id');
	$.ajax({
		url : "activity_delActivity",
		data : "aid="+aid,
		dataType : "json",
		type : "post",
		success:function(data){
			if(data.success){
				alert("删除成功！");
				window.location.reload();
			}else{
				alert("删除失败！");
			}
		},
		error: function(){
			alert("出错！");
		}
	});
});

</script>
</html>