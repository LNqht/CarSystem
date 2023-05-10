<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
	response.setContentType("text/html");
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="description" content="">
	<meta name="author" content="">
	<link href="<%=basePath%>css/bootstrap.min.css" rel="stylesheet">
	<link href="<%=basePath%>css/font-awesome.min.css" rel="stylesheet">
	<link href="<%=basePath%>css/prettyPhoto.css" rel="stylesheet">
	<link href="<%=basePath%>css/price-range.css" rel="stylesheet">
	<link href="<%=basePath%>css/animate.css" rel="stylesheet">
	<link href="<%=basePath%>css/main.css" rel="stylesheet">
	<link href="<%=basePath%>css/responsive.css" rel="stylesheet">
    <script src="<%=basePath%>js/html5shiv.js"></script>
    <script src="<%=basePath%>js/respond.min.js"></script>
</head>
<body>
<section id="z`z`">
	<div>
		<div class="table-responsive col-sm-12">
			<h4>OID :${ param.orderId }</h4>
			<table class="table table-condensed">
				<thead>
				<tr class="cart_menu">
					<td class="image"><strong>产品</strong></td>
					<td class="description"></td>
					<td class="price"><strong>价格</strong></td>
					<td class="quantity"><strong>数量</strong></td>
					<td class="total"><strong>总计</strong></td>
				</tr>
				</thead>
				<tbody>
				<c:set var="cal" value="0.0"/>
				<c:forEach var="i" items="${itemList}">
					<tr>
						<td class="cart_product">
							<a href=""><img src="<%=basePath%>getImg?id=${i.product.productId}" alt=""
											style="border: 1px solid #F7F7F0; height: 100px;width: 80px;"></a>
						</td>
						<td class="cart_description">
							<h4>${ i.product.productName}</h4>
							<p>产品 ID: ${ i.product.productId}</p>
						</td>
						<td class="cart_price">
							<p>${ i.product.price}</p>
						</td>
						<td class="cart_quantity"> ${ i.quantity}
						</td>
						<td class="cart_total">
							<p class="cart_total_price"> ${ i.product.price*i.quantity}元</p>
						</td>
					</tr>
					<c:set var="cal" value="${ cal+i.product.price*i.quantity}"/>
				</c:forEach>
				<tr>
					<td colspan="2">&nbsp;</td>
					<td colspan="3">
						<table class="table table-condensed total-result">
							<tr>
								<td>购物车总计</td>
								<td>${cal }元</td>
							</tr>
							<tr class="shipping-cost">
								<td>运费</td>
								<td>免费</td>
							</tr>
							<tr>
								<td>总计</td>
								<td><span>${cal }元</span></td>
							</tr>
						</table>
					</td>
				</tr>
				</tbody>
			</table>
		</div>
	</div>
</section>
</body>
</html>