<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page isELIgnored="false" %>

<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>机票预订系统</title>
<link href="../public/js/lib/bootstrap/css/bootstrap.min.css"  rel="stylesheet">
<!-- Bootstrap theme -->
<link href="../public/main/main.css" rel="stylesheet">
<link href="../public/js/lib/bootstrap/css/bootstrap-theme.min.css" rel="stylesheet">
<script src="../public/js/lib/jquery/jquery-1.11.3.min.js"></script>
<script src="../public/js/lib/jquery/jquery.bootpag.min.js"></script>
<script src="../public/js/lib/bootstrap/js/bootstrap.min.js"></script>
<script src="../public/js/lib/bootstrap/js/bootstrap-datetimepicker.min.js"></script>
<script src="../public/js/lib/bootstrap/js/bootstrap-datetimepicker.zh-CN.js"></script>
<link href="../public/js/lib/bootstrap/css/bootstrap-datetimepicker.min.css" rel="stylesheet">

</head>
<style>
.list-group-item {
	margin-bottom: 2px;
}
</style>
<body>
	<nav class="navbar navbar-inverse navbar-fixed-top">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#navbar" aria-expanded="false"
					aria-controls="navbar">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#">机票预订系统</a>
			</div>
			<div id="navbar" class="collapse navbar-collapse">
				<ul class="nav navbar-nav">
					<li class="active"><a href="/airticketbooking/index">机票预订查询</a></li>
					<li class="active"><a href="/airticketbooking/myOrders">我的订单</a></li>
					<li><a href="/airticketbooking/user/login">登录</a></li>
					<li><a href="#contact">Contact</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<div class="container">
	<div class="row">
        <div class="col-sm-8">
        	<h3>订票确认</h3>
        	<hr>
        	<ul class="list-group">			
				<li class="list-group-item">
					<span >出发地：${ticket.from_city}</span><br><br/>
					<span >目的地：${ticket.to_city}</span><br><br/>
					<span >时&nbsp;&nbsp;&nbsp;间：${ticket.departing}</span>&nbsp;&nbsp;&nbsp; &nbsp;<span class="glyphicon glyphicon-arrow-right"></span>&nbsp;&nbsp;&nbsp;${ticket.landing}<br><br/>
					<span >日&nbsp;&nbsp;&nbsp;期：     ${ticket.date}</span><br><br/>
					<span >航&nbsp;&nbsp;&nbsp;班：     ${ticket.flight_name}</span><br><br/>
					<span >航班编号：${ticket.flight_no}</span><br><br/>
					<span >价格：${ticket.price} 元</span><br><br/>
					<div class="alert alert-success"  style="display:none" role="alert" >恭喜您订票成功！</div>
					<div class="alert alert-danger" style="display:none"  role="alert" > <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>&nbsp;&nbsp;<span id="errMsg">呜呜呜呜</span></div>
				</li>
			</ul>
			
			<button type="button" class="btn btn-warning" style="margin-left:240px" flight_id="${ticket.id}" >确认购买</button>
		</div>
		<div class="col-sm-3 col-sm-offset-1 ">
			<div class="sidebar-module sidebar-module-inset">
            <h4>欢迎使用订票系统</h4>
            <p>为了您方便的预定机票，请您提前登陆系统，进行帐户充值</p>
          </div>
		</div>
	</div>
	<script>
		$(function(){
			$('.btn-warning').click(function(){
				var that  =this;
				var flight_id = $(that).attr('flight_id');
				$('.alert-danger').hide();
				$.ajax({
					url : '/airticketbooking/buy',// 跳转到 action    
					data : {id:flight_id},
					type : 'get',
					dataType : 'json',
					success : function(data) {
						console.info(data);
						if(data.code==1){
							$('.alert-success').show();
						}else{
							$('#errMsg').html(data.errMessage);
							$('.alert-danger').show();
						}
					}
				});
			});
		});
	</script>
