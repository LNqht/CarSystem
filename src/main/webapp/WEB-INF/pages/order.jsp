<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="header.jsp" %>
	<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<section id="z`z`">
			<div class="container">
			<div class="breadcrumbs">
				<ol class="breadcrumb">
				  <li><a href="<%=basePath%>/home">主页</a></li>
				  <li class="active">支付</li>
				</ol>
			</div>

			<div class="step-one">
				<h2 class="heading">客户信息</h2>
			</div>
			<div class="shopper-informations">
				<div class="row">
					<div class="col-sm-5 clearfix">
						<div class="bill-to">
							<p>账单</p>
							<div class="form-one">
								<form action="<%=basePath%>toorder" method="post">
								<c:if test="${!empty user}">
								    <input type="hidden" name="customerId" value="${user.id}">
									</c:if>
									<input type="text" name="name" placeholder="姓名 *">
									<input type="text" name="phone" placeholder="手机号/电话 *">
									<input type="text" name="address" placeholder="地址 *">
									<input type="text" name="postalCode" placeholder="邮政编码 *">
									<input type="text" name="city" placeholder="城市 *">
									
							</div>
							<div class="form-two form-one">
									<select name="country">
										<option>-- 国家 --</option>
										<option value="中国">中国</option>
										<option value="美国">美国</option>
										<option value="英国">英国</option>
									</select><br/><br/>
									<select name="state">
										<option>-- 州/省/地区 --</option>
										<option value="江西">江西</option>
										<option value="孟加拉国">孟加拉国</option>
										<option value="英国">英国</option>
									</select><br/><br/>
							</div>
						</div>
					</div>
					<div class="col-sm-4">
						<div class="order-message">
							<p>装运通知单</p>
							<textarea name="notes"  placeholder="关于您订单的说明，交货的特别说明" rows="16"></textarea>
						</div>	
					</div>					
				</div>
			</div>
			<div class="review-payment">
				<h2>审查和付款</h2>
			</div>
			<section id="cart_items">
		<div class="container">
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
								<a href="">
								<img src="getImg?id=${c.product.productId}" alt="" style="height: 150px; width: 150px"></a>
							</td>
							<td class="cart_description">
								<h4><a href="">${c.product.productName} </a></h4>
								<p>Web ID:${c.product.productId} </p>
							</td>
							<td class="cart_price">
								<p>${c.product.price}元</p>
							</td>
							<td class="cart_price">
								<p>${c.quantity}</p>
							</td>
							<td class="cart_total">
								<p id="total" class="cart_total_price">${c.product.price}*${c.quantity}</p>
							</td>
							<td class="cart_delete">
		<a class="cart_quantity_delete" href="<%=basePath%>cart?action=remove&productId=${c.product.productId}"><i class="fa fa-times"></i></a>
							</td>
						</tr>
							<c:set var="cal" value="${cal+c.product.price*c.quantity}"/>
						</c:forEach>
						</c:otherwise>
						</c:choose>
					</tbody>
				</table>
			</div>
		</div>
	</section>
<c:if test="${!empty cart }">
	<section id="do_action">
		<div class="container">
			
			<div class="row">
			<div class="col-sm-6"></div>
									<div class="col-sm-6">
					<div class="total_area">
						<ul>
							<li>购物车总计<span><c:out value="${cal }"/>元</span></li>
							<li>运费 <span>免费</span></li>
						<input type="hidden" name="orderTotal" value="${cal}"/>
							<li>总计 <span><c:out value="${cal}"/>元</span></li>
						</ul>
							<a class="btn btn-default update" href="<%=basePath%>shop">更新</a>
							
					</div>
				</div>
			</div>
		</div>
	</section>
			<div class="payment-options">
			<c:forEach var="pType" items="${paymentTypeList}">
					<span>
						<label><input name="paymentId" type="checkbox" varStatus="status"  value="${pType.paymentId}">${pType.paymentType} </label>
					</span>
				</c:forEach>
					<span>
					<input type="submit" name="submit" class="btn btn-primary pull-right" value="提交"></span>
				</div>
				</c:if>
		</div>
		
		</form>
	</section>
<%@include file="footer.jsp" %>