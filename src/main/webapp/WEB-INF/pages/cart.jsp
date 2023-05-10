<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="header.jsp" %>
		<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
		<section id="cart_items">
		<div class="container">
			<div class="breadcrumbs">
				<ol class="breadcrumb">
				  <li><a href="<%=basePath%>home">主页</a></li>
				  <li class="active">购物车</li>
				</ol>
			</div>
			<div class="table-responsive cart_info">
				<table class="table table-condensed">
					<thead>
						<tr class="cart_menu">
							<td class="image">产品</td>
							<td class="description"></td>
							<td class="price">价格</td>
							<td class="quantity">数量</td>
							<td class="total">总计</td>
							<td></td>
						</tr>
					</thead>
					<tbody>
					<c:choose>
					<c:when test="${ empty cart}">
					<tr><td colspan="5">
					<div class="content-404 text-center">
			<img src="<%=basePath %>images/cart/empty_cart.png" class="img-responsive" alt="" />
			<h1>您的购物车中没有物品</h1>
		
			<h2><a href="<%=basePath%>shop">单击此处继续购物</a></h2>
		</div>
					</td></tr>
					</c:when>
					<c:otherwise>
						<c:set var="cal" value="0.0"/>
						<c:forEach var="c" items="${cart}">
						<tr>
							<td class="cart_product">
								<a href="productDetails?productId=${c.product.productId}"><img src="getImg?id=${c.product.productId}" alt="" style="height: 150px; width: 150px"></a>
							</td>
							<td class="cart_description">
								<h4><a href="">${c.product.productName}</a></h4>
								<p>产品 ID: ${c.product.productId} </p>
							</td>
							<td class="cart_price">
								<p>${c.product.price}</p>
							</td>
							<td class="cart_price">
								<p>${c.quantity}</p>
								
							</td>
							<td class="cart_total">
							
								<p id="total" class="cart_total_price">${c.quantity*c.product.price}</p>
							</td>
							<td class="cart_delete">
								<a class="cart_quantity_delete" href="<%=basePath%>cart?action=remove&productId=${c.product.productId}"><i class="fa fa-times"></i></a>
							</td>
						</tr>
						<c:set var="cal" value="${cal+(c.quantity*c.product.price)}"/>
						</c:forEach>
						</c:otherwise>
					</c:choose>
					</tbody>
				</table>
			</div>
		</div>
	</section>
<c:if test="${!(empty cart)}">
	<section id="do_action">
		<div class="container">
			
			<div class="row">
			<div class="col-sm-6"></div>
									<div class="col-sm-6">
					<div class="total_area">
						<ul>
							<li>购物车小计<span><c:out value="${cal}"/></span></li>
							<li>运费 <span>免费</span></li>
							<li>总计 <span><c:out value="${cal}"/>元 </span></li>
						</ul>
							<a class="btn btn-default update" href="<%=basePath%>shop">更新</a>
							<a class="btn btn-default check_out" href="<%=basePath%>order">支付</a>
					</div>
				</div>
			</div>
		</div>
	</section>
</c:if>
	

<%@include file="footer.jsp" %>