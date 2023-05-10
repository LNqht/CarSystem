<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.qiuhongtao.pojo.Product" %>
<%@ page import="com.qiuhongtao.pojo.Category" %>
<%@ page import="org.springframework.context.ApplicationContext" %>
<%@ page import="org.springframework.web.context.support.WebApplicationContextUtils" %>
<%@ page import="com.qiuhongtao.service.CategoryService" %>
<%@include file="../header.jsp" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<section id="cart_items">
		<div class="container">
		<div class="breadcrumbs">
				<ol class="breadcrumb">
				  <li><a href="<%=basePath %>admin/home">管理</a></li>
				  <li class="active">产品</li>
				</ol>
			</div>
					<div class="col-sm-2">
						<div class="single-widget">
							<h2>模块</h2>
							<ul class="nav nav-pills nav-stacked">
								<li><a href="<%=basePath%>admin/home">主页</a></li>
								<li><a href="<%=basePath%>admin/productList">产品</a></li>
								<li><a href="<%=basePath%>admin/orderList">订单</a></li>
								<li><a href="<%=basePath%>admin/userList">用户</a></li>
								<li><a href="<%=basePath%>admin/incomeList">收益</a></li>
							</ul>
						</div>
					</div>
		<div class="table-responsive col-sm-10">
		<h2 class="title text-center">产品 <strong>列表</strong></h2>

					<table class="table table-condensed">
					
					<thead>
					<tr class="cart_menu">
						<td colspan="5">&nbsp;</td>
						<td  colspan="1">  <a class="btn btn-default update" id="buttonSubmit" href="<%=basePath %>admin/addProduct">添加产品</a></td>

					</tr>
						<tr class="cart_menu">
							<td class="image"><strong>产品</strong></td>
							<td class="description"></td>
							<td class="price"><strong>价格</strong></td>
							<td class="category"><strong>厂商</strong></td>
							<td class="description"><strong>描述</strong></td>
							<td class="stock"><strong>库存</strong></td>
							<td class="sell"><strong>销量</strong></td>
						</tr>
						</thead><tbody>
					<c:forEach var="p" items="${productList}">
						<tr>
							<td class="cart_product">
								<a href=""><img src="<%=basePath%>getImg?id=${p.productId}"
								style="border: 1px solid #F7F7F0; height: 100px;width: 80px;"/></a>
							</td>
							<td class="cart_description">
								<h4>${p.productName} </h4>
								<p>产品 ID: ${p.productId}</p>
							</td>
							<td class="cart_price">
								<p>${p.price}</p>
							</td>
							<%
								CategoryService categoryService = (CategoryService) request.getAttribute("categoryService");
								Product p = (Product) pageContext.getAttribute("p");
								int pid = p.getCategoryId();
								Category category = categoryService.findByCategoryId(pid);
								String catName = category.getCategoryName();
							%>
							<td class="cart_category"><%=catName%></td>
							
							<td class="cart_description">
								<p>${p.productDescription}</p>
							</td>
							<td class="cart_stock">
								<p>${p.stock}</p>
							</td>
							<td class="cart_sell">
								<p>${p.sell}</p>
							</td>
							<td class="">
							<a class="cart_quantity_delete" href="<%=basePath%>admin/productEdit?productId=${p.productId}" >
							<i class="fa fa-edit">编辑</i></a>&nbsp;
							<a class="cart_quantity_delete" href="<%=basePath%>admin/productDelete?productId=${p.productId}">
							<i class="fa fa-times">删除</i></a>
							</td>
							</tr>
					</c:forEach>
							
							<tr class="cart_menu">
							<td colspan="5">&nbsp;</td>
							<td  colspan="1">  <a class="btn btn-default update" id="buttonSubmit" href="<%=basePath %>admin/addProduct">添加产品</a></td>
							
						</tr>
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