<%@page import="com.qiuhongtao.pojo.User" %>
<%@ page import="com.qiuhongtao.pojo.User" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>涛涛4S店</title>
	<link href="<%=basePath%>images/home/logo.png" rel="icon" type="image/x-ico">
    <link href="<%=basePath%>css/bootstrap.min.css" rel="stylesheet">
    <link href="<%=basePath%>css/font-awesome.min.css" rel="stylesheet">
    <link href="<%=basePath%>css/prettyPhoto.css" rel="stylesheet">
    <link href="<%=basePath%>css/price-range.css" rel="stylesheet">
    <link href="<%=basePath%>css/animate.css" rel="stylesheet">
	<link href="<%=basePath%>css/main.css" rel="stylesheet">
	<link href="<%=basePath%>css/responsive.css" rel="stylesheet">
    <script src="<%=basePath%>js/html5shiv.js"></script>
	<script src="<%=basePath%>js/jquery.js"></script>
</head>
<body>
	<header id="header">
		<div class="header_top">
			<div class="container">
				<div class="row">
					<div class="col-sm-6">
						<div class="contactinfo">
							<ul class="nav nav-pills">
								<li><a href="#"><i class="fa fa-phone"></i> +86 136 6794 8102</a></li>
								<li><a href="#"><i class="fa fa-envelope"></i> 1532283026@qq.com</a></li>
								<li><a href="#"><i class="fa fa-user"></i> 欢迎,
								<%if(session.getAttribute("user")!=null){
								User user=(User)session.getAttribute("user");
  									 out.print(user.getUsername());
  									 }else{out.print("客户");} %>
  									</a></li>
							</ul>
						</div>
					</div>
					<div class="col-sm-6">
						<div class="social-icons pull-right">
							<ul class="nav navbar-nav">
								<li><a href="#"><i class="fa fa-facebook"></i></a></li>
								<li><a href="#"><i class="fa fa-twitter"></i></a></li>
								<li><a href="#"><i class="fa fa-linkedin"></i></a></li>
								<li><a href="#"><i class="fa fa-dribbble"></i></a></li>
								<li><a href="#"><i class="fa fa-google-plus"></i></a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<div class="header-middle">
			<div class="container">
				<div class="row">
					<div class="col-md-4 clearfix">
						<div class="logo pull-left">
							<a href="home"><img src="<%=basePath%>images/home/logo.png" alt="" /></a>
						</div>
						<div class="btn-group pull-right clearfix">
							<div class="btn-group">
								<button type="button" class="btn btn-default dropdown-toggle usa" data-toggle="dropdown">
									中国
									<span class="caret"></span>
								</button>
								<ul class="dropdown-menu">
									<li><a href="">加拿大</a></li>
									<li><a href="">英国</a></li>
								</ul>
							</div>
							
							<div class="btn-group">
								<button type="button" class="btn btn-default dropdown-toggle usa" data-toggle="dropdown">
									人民币
									<span class="caret"></span>
								</button>
								<ul class="dropdown-menu">
									<li><a href="">加拿大元</a></li>
									<li><a href="">英镑</a></li>
								</ul>
							</div>
						</div>
					</div>
					<div class="col-md-8 clearfix">
						<div class="shop-menu clearfix pull-right">
							<ul class="nav navbar-nav">
								<li><a href="<%=basePath%>accountDetails"><i class="fa fa-user"></i> 账户</a></li>
								
								
								<li><a href="<%=basePath%>cart"><i class="fa fa-shopping-cart"></i> 购物车</a></li>
								<li><a href="<%=basePath%>register"><i class="fa fa-crosshairs"></i> 注册</a></li>
								<li><a href="<%=basePath%>login"><i class="fa fa-lock"></i> 登录</a></li>
								<li><a href="<%=basePath%>logout"><i class="fa fa-unlock"></i> 登出</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	
		<div class="header-bottom">
			<div class="container">
				<div class="row">
					<div class="col-sm-9">
						<div class="mainmenu pull-left">
							<ul class="nav navbar-nav collapse navbar-collapse">
								<li><a href="<%=basePath%>home" class="active">主页</a></li>
								<li class="dropdown"><a href="#">商店<i class="fa fa-angle-down"></i></a>
                                    <ul role="menu" class="sub-menu">
                                        <li><a href="<%=basePath%>shop">商品</a></li>

										<li><a href="<%=basePath%>cart">购物车</a></li>
										<li><a href="<%=basePath%>order">结算</a></li>

                                    </ul>
                                </li> 

								<li><a href="<%=basePath%>contactUS">联系</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</header>
