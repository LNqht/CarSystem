<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="header.jsp" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<section>
		<div class="container">
			<div class="row">
			<div class="breadcrumbs">
				<ol class="breadcrumb">
				  <li><a href="<%=basePath%>home">主页</a></li>
				  <li class="active">商店</li>
				</ol>
			</div>
				<div class="col-sm-3">
					<div class="left-sidebar">
						<h2>商品类别</h2>
						<div class="panel-group category-products" id="accordian">
							<c:forEach var="c" items="${categoryList}">
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title"><a href="<%=basePath%>shop?categoryId=${c.categoryId}">${c.categoryName}</a></h4>
								</div>
							</div>
							</c:forEach>
						</div>
					</div>
				</div>
				
				<div class="col-sm-9 padding-right">
					<div class="features_items">
						<h2 class="title text-center">商品</h2>
							<c:forEach var="p" items="${productList}">
						<div class="col-sm-4 padding-right">
							<div class="product-image-wrapper">
								<div class="single-products">
									<div class="productinfo text-center">
										<img src="<%=basePath%>getImg?id=${p.productId}" alt="" style="height: 150px; width: 150px"/>
										<h2>${p.price}元</h2>
										<p>${p.productName}</p>
										<a href="<%=basePath %>cart?productId=${p.productId}&action=add" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>添加至购物车</a>
									</div>
								</div>
							<div class="choose">
									<ul class="nav nav-pills nav-justified">
										<li><a href="<%=basePath%>productDetails?id=${p.productId}"><i class="fa fa-plus-square"></i>商品详情</a></li>
									</ul>
								</div>
							</div>
							
						</div>
							</c:forEach>
					</div>
					<ul class="pagination">
							<li><a href="">&laquo;</a></li><li class="active"><a href="">1</a></li>
							<li><a href="">2</a></li>
							<li><a href="">3</a></li>
							<li><a href="">&raquo;</a></li>
						</ul>
				</div>
			</div>
		</div>
	</section>
	<br/>
	<%@include file="footer.jsp" %>
	

  
  