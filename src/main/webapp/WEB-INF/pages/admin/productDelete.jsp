<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.qiuhongtao.pojo.Product" %>
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
                ProductService productService = (ProductService) request.getAttribute("productService");
                int pid = Integer.parseInt(request.getParameter("productId"));
                Product p = productService.findById(pid);
            %>
            <div class="view-product">
                <img src="<%=basePath%>getImg?id=<%=p.getProductId()%>" alt="" />
            </div>
            <div class="col-sm-7">
                <div class="product-information">
                    <form method="post" action="<%=basePath%>admin/toproductDelete">
                        <h2>产品名: <%=p.getProductName()%></h2>
                        <h2>Web ID:<%=p.getProductId()%><input type="hidden" name="productId" value="<%=p.getProductId()%>"></h2>
                        <h2>价格: <%=p.getPrice()%></h2>
                        <h2>描述: <%=p.getProductDescription()%></h2>
                        <h2>库存: <%=p.getStock()%></h2>
                        <h2>销量: <%=p.getSell()%></h2>
                        <button type="submit" class="btn btn-default" >确认删除</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</section>
<%@include file="../footer.jsp" %>