<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="header.jsp"%>
	<section id="slider">
		<div class="container">
			<div class="row">
				<div class="col-sm-12">
					<div id="slider-carousel" class="carousel slide" data-ride="carousel">
						<ol class="carousel-indicators">
							<li data-target="#slider-carousel" data-slide-to="0" class="active"></li>
							<li data-target="#slider-carousel" data-slide-to="1"></li>
							<li data-target="#slider-carousel" data-slide-to="2"></li>
						</ol>
						
						<div class="carousel-inner">
							<div class="item active">
								<div class="col-sm-13">
									<h1><span>Mercedes-Benz</span></h1>
									<h2>奔驰电动旗舰EQS</h2>
									<p>为你，世界</p>
									<button type="button" class="btn btn-default get"><a href="<%=basePath%>/cart?productId=1&action=add">立即购买</a></button>
									<img src="<%=basePath%>images/home/benchi.jpg" class="car img-responsive" alt="" />
								</div>
							</div>
							<div class="item">
								<div class="col-sm-13">
									<h1><span>一汽奥迪</span></h1>
									<h2>全新奥迪 A8L Horch 创始人版</h2>
									<p>时空重塑</p>
									<button type="button" class="btn btn-default get"><a href="<%=basePath%>/cart?productId=2&action=add">立即购买</a></button>
									<img src="<%=basePath%>images/home/aodi.jpg" class="car img-responsive" alt="" />
								</div>
							</div>
							
							<div class="item">
								<div class="col-sm-13">
									<h1><span>宝马BMW</span></h1>
									<h2>创新BMW i7</h2>
									<p>颠覆想象，蕴光于心</p>
									<button type="button" class="btn btn-default get"><a href="<%=basePath%>/cart?productId=3&action=add">立即购买</a></button>
									<img src="<%=basePath%>images/home/baoma.jpg" class="car img-responsive" alt="" />
								</div>
							</div>
						</div>
						
						<a href="#slider-carousel" class="left control-carousel hidden-xs" data-slide="prev">
							<i class="fa fa-angle-left"></i>
						</a>
						<a href="#slider-carousel" class="right control-carousel hidden-xs" data-slide="next">
							<i class="fa fa-angle-right"></i>
						</a>
					</div>
					
				</div>
			</div>
		</div>
	</section>
<%@include file="footer.jsp"%>

