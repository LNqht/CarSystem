<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../header.jsp"%>
<div id="contact-page" class="container">
<div class="row">  	
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
	    		<div class="col-sm-8">
	    			<div class="contact-form">
	    				<h2 class="title text-center">添加产品</h2>
	    				<div class="status alert alert-success" style="display: none"></div>
				    	<form id="main-contact-form" class="contact-form row" name="contact-form" method="post" enctype="multipart/form-data" action="<%=basePath %>admin/toaddProduct">
				            <div class="form-group col-md-6">
				                <input type="text" name="productName" class="form-control" required="required" placeholder="产品名">
				            </div>
				            <div class="form-group col-md-6">
				                <input type="text" name="price" class="form-control" required="required" placeholder="价格">
				            </div>
				            <div class="form-group col-md-6">
				               	<select name="categoryId">
										<option >-- 商品厂商 --</option>
										<option value="1">奔驰</option>
										<option value="2">一汽奥迪</option>
										<option value="3">宝马BWM</option>
										<option value="4">大众</option>
										<option value="5">丰田</option>
										</select>
				            </div>
				            <div class="form-group col-md-6">
				                <input type="file" name="file" class="form-control" required="required" placeholder="picture">
				            </div>
							<div class="form-group col-md-6">
								<input type="text" name="stock" class="form-control" required="required" placeholder="库存">
							</div>
							<div class="form-group col-md-6">
								<input type="text" name="sell" class="form-control" required="required" placeholder="销量">
							</div>
				            <div class="form-group col-md-12">
				                <textarea name="productDescription" id="message"  class="form-control" cols="8" rows="8" placeholder="产品描述"></textarea>
				            </div>                        
				            <div class="form-group col-md-12">
				                <input type="submit" name="submit" class="btn btn-primary pull-right" value="提交">
				            </div>
				        </form>
	    			</div>
	    		</div>
	    		</div>
	    		</div>
<%@include file="../footer.jsp"%>
