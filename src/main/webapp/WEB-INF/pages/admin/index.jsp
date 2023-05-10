<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../header.jsp"%>
<div class="container">
	    	<div class="row">    		
	    		<div class="col-sm-12">    			   			
					<h2 class="title text-center">管理员 <strong>主页</strong></h2>
					</div>			 		
<div class="col-sm-8"  style="left: 18%">
						<div class="col-sm-3" style="height: 350px;">
							<div class="video-gallery text-center" >
								<a href="<%=basePath%>admin/productList">
									<div class="iframe-img">
										<img src="<%=basePath%>images/home/productmgmt.png" alt="" />
									</div>
									
								</a>
								<h2>产品管理</h2>
							</div>
						</div>
						
						<div class="col-sm-3">
							<div class="video-gallery text-center">
								<a href="<%=basePath%>admin/orderList">
									<div class="iframe-img">
										<img src="<%=basePath%>images/home/ordermgmt.png" alt="" />
									</div>
									
								</a>
								<h2>订单管理</h2>
							</div>
						</div>
						
						<div class="col-sm-3">
							<div class="video-gallery text-center">
								<a href="<%=basePath%>admin/userList">
									<div class="iframe-img">
										<img src="<%=basePath%>images/home/usermgmt.png" alt="" />
									</div>
									</a>
								<h2>用户管理</h2>
							</div>
						</div>
						<div class="col-sm-3">
							<div class="video-gallery text-center">
								<a href="<%=basePath%>admin/incomeList">
									<div class="iframe-img">
										<img src="<%=basePath%>images/home/income.jpg" alt="" />
									</div>
								</a>
								<h2>收益统计</h2>
							</div>
						</div>
					</div>
					</div></div>
<div style="height: 194px; "></div>

 <%@include file="../footer.jsp" %>
