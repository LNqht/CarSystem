<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@include file="../header.jsp" %>

<section id="z`z`">
		<div class="container">
		<div class="breadcrumbs">
				<ol class="breadcrumb">
				  <li><a href="<%=basePath %>admin/home">管理</a></li>
				  <li class="active">用户</li>
				</ol>
			</div>
					<div class="col-sm-2">
						<div class="single-widget">
							<h2>模块</h2>
							<ul class="nav nav-pills nav-stacked">
								<li><a href="<%=basePath %>admin/home">主页</a></li>
								<li><a href="<%=basePath %>admin/productList">产品</a></li>
								<li><a href="<%=basePath %>admin/orderList">订单</a></li>
								<li><a href="<%=basePath %>admin/userList">用户</a></li>
								<li><a href="<%=basePath%>admin/incomeList">收益</a></li>
							</ul>
						</div>
					</div>
		<div class="table-responsive col-sm-8">
		<h2 class="title text-center">用户 <strong>列表</strong></h2>
				<table class="table table-condensed">
					<thead>
						<tr class="cart_menu">
							<td class="description"><strong>用户名</strong></td>
							<td class="description"><strong>密码</strong></td>
							<td class="description"><strong>邮箱地址</strong></td>
							<td class="description"><strong>性别</strong></td>
							<td class="description"><strong>出生日期</strong></td>
						</tr>
					</thead>
					<tbody>
					<sql:setDataSource var="myDS"
									   driver="com.mysql.jdbc.Driver"
									   url="jdbc:mysql://localhost:3306/carsystem?useUnicode=true&characterEncoding=utf-8&serverTimezone=GMT%2B8"
									   user="root"
									   password="123456"/>
					<sql:query var="allUser" dataSource="${myDS}">
						select * from usertable;
					</sql:query>
					<c:forEach var="row" items="${allUser.rows}">
						<tr>
							<td class="cart_description">
								<p>${row.username}</p>
							</td>
								<td class="cart_description">
								<p>${row.password}</p>
							</td>
							<td class="cart_description">
								<p>${row.email} </p>
							</td>
							<td class="cart_description">
							<p>${row.gender} </p>
							</td>
							<td class="cart_description">
								<p >${row.birthdate}</p>
							</td>
						</tr>
					</c:forEach>
		</tbody>
		</table>
		<ul class="pagination">
		
		<li><a href="">&laquo;</a></li>
							<li class="active"><a href="">1</a></li>
							<li><a href="">2</a></li>
							<li><a href="">3</a></li>
							<li><a href="">&raquo;</a></li>
						</ul>
		</div>
		</div>
		</section>
 <%@include file="../footer.jsp" %>