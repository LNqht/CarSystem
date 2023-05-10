<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.qiuhongtao.pojo.Product" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="com.qiuhongtao.service.ProductServiceImpl" %>
<%@ page import="com.qiuhongtao.service.ProductService" %>
<%@ include file="../header.jsp" %>
<section id="cart_items">
    <div class="container">
        <div class="breadcrumbs">
            <ol class="breadcrumb">
                <li><a href="<%=basePath%>admin/home">管理</a></li>
                <li class="active">产品</li>
            </ol>
        </div>
        <div class="col-sm-2">
            <div class="single-widget">
                <h2>模块</h2>
                <ul class="nav nav-pills nav-stacked">
                    <li><a href="<%=basePath%>admin/home">主页</a></li>
                    <li><a href="<%=basePath%>admin/productList.jsp">产品</a></li>
                    <li><a href="<%=basePath%>admin/orderList.jsp">订单</a></li>
                    <li><a href="<%=basePath%>admin/userList.jsp">用户</a></li>
                    <li><a href="<%=basePath%>admin/incomeList">收益</a></li>
                </ul>
            </div>
        </div>
        <div class="table-responsive col-sm-10">
            <h2 class="title text-center">编辑 <strong>产品信息</strong></h2>
                <%
                    int productId = Integer.parseInt(request.getParameter("productId"));
                    ProductService productService = (ProductService) request.getAttribute("productService");
                    Product p = productService.findById(productId);
                %>
                <div class="view-product">
                    <img src="<%=basePath%>getImg?id=<%=p.getProductId()%>" alt="" />
                </div>
            <div class="view-product">
                <form method="post" action="<%=basePath%>/admin/toproductEdit">
                    <label>价格 : </label><input type="text" name="price" placeholder="价格" value="<%=p.getPrice()%>"/>
                    <label>库存 : </label><input type="text" name="stock" placeholder="库存" value="<%=p.getStock()%>"/>
                    <label>描述 : </label><input type="text" name="productDescription" placeholder="描述" value="<%=p.getProductDescription()%>"/>
                    <input type="hidden" name="productId" value="<%=p.getProductId()%>">
                    <button type="submit" class="btn btn-default">更改</button>
                </form>
                </div>
            </div>
                </div>
    </div>
                </section>
                <%@include file="../footer.jsp" %>