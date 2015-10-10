<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>机票预订系统</title>
<link href="./public/js/lib/bootstrap/css/bootstrap.min.css"  rel="stylesheet">
<!-- Bootstrap theme -->
<link href="./public/main/main.css" rel="stylesheet">
<link href="./public/js/lib/bootstrap/css/bootstrap-theme.min.css" rel="stylesheet">
<script src="./public/js/lib/jquery/jquery-1.11.3.min.js"></script>
<script src="./public/js/lib/jquery/jquery.bootpag.min.js"></script>
<script src="./public/js/lib/bootstrap/js/bootstrap.min.js"></script>
<script src="./public/js/lib/bootstrap/js/bootstrap-datetimepicker.min.js"></script>
<script src="./public/js/lib/bootstrap/js/bootstrap-datetimepicker.zh-CN.js"></script>
<link href="./public/js/lib/bootstrap/css/bootstrap-datetimepicker.min.css" rel="stylesheet">

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
