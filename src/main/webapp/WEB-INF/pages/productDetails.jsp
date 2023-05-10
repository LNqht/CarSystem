<%@ page contentType="text/html;charset=UTF-8" language="java" %>
	<%@include file="header.jsp" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<section>
		<div class="container">
			<div class="row">
				<div class="col-sm-3">
					<div class="left-sidebar">
						<h2>厂商</h2>
						<div class="panel-group category-products" id="accordian">
							<c:forEach var="c" items="${categoryList}">
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title"><a href="<%=basePath %>shop?categoryId=${c.categoryId}">${c.categoryName}</a></h4>
								</div>
							</div>
							</c:forEach>

						</div>
					</div>
				</div>
				<div class="col-sm-9 padding-right">
					<div class="product-details">
						<div class="col-sm-5">
							<div class="view-product">
								<img src="<%=basePath %>getImg?id=${p.productId}" alt="" />
							</div>
							<div id="similar-product" class="carousel slide" data-ride="carousel">
								  <a class="left item-control" href="#similar-product" data-slide="prev">
									<i class="fa fa-angle-left"></i>
								  </a>
								  <a class="right item-control" href="#similar-product" data-slide="next">
									<i class="fa fa-angle-right"></i>
								  </a>
							</div>

						</div>
						<div class="col-sm-7">
							<div class="product-information">
								<img src="images/product-details/new.jpg" class="newarrival" alt="" />
								<h2>${p.productName}</h2>
								<p>产品 ID: ${p.productId}</p>
								<img src="images/product-details/rating.png" alt="" />
									<p>库存: ${p.stock}</p>
									<p>价格: ${p.price}元</p>
									<form action="<%=basePath %>cart">

									<input type="hidden" value="${p.productId}" name="productId"/>
									<input type="hidden" value="add" name="action"/>
									<div><br/>
									<button type="submit" class="btn btn-fefault cart">
										<i class="fa fa-shopping-cart"></i>
										添加至购物车
									</button></div>
									</form>
								<a href=""><img src="images/product-details/share.png" class="share img-responsive"  alt="" /></a>
							</div>
						</div>
					</div>
					<div class="category-tab shop-details-tab">
						<div class="col-sm-12">
							<ul class="nav nav-tabs">
								<li><a class="active" href="#details" data-toggle="tab">描述</a></li>
							</ul>
						</div>
						<div class="tab-pane fade active in" id="details" >
								<div class="col-sm-12">
									<p>${p.productDescription}</p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
	</section>
	<br/><br/>
<%@include file="footer.jsp" %>
	
