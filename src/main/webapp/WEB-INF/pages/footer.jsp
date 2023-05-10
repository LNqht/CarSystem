<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
String path1 = request.getContextPath();
String basePath1 = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path1+"/";
%>
<footer id="footer">
		<div class="footer-top">
			<div class="container">
				<div class="row">
					<div class="col-sm-2">
						<div class="companyinfo">
						</div>
					</div>
					<div class="col-sm-7">
						<div class="col-sm-3">
							<div class="video-gallery text-center">
								<a href="#">
									<div class="iframe-img">
										<img src="<%=basePath1%>images/home/benchi1.png" alt="" />
									</div>
									<div class="overlay-icon">
										<i class="fa fa-play-circle-o"></i>
									</div>
								</a>
								<p>轿车&敞篷跑车</p>
								<h2>2023年4月28日</h2>
							</div>
						</div>
						
						<div class="col-sm-3">
							<div class="video-gallery text-center">
								<a href="#">
									<div class="iframe-img">
										<img src="<%=basePath1%>images/home/benchi2.png" alt="" />
									</div>
									<div class="overlay-icon">
										<i class="fa fa-play-circle-o"></i>
									</div>
								</a>
								<p>SUV</p>
								<h2>2023年4月28日</h2>
							</div>
						</div>
						
						<div class="col-sm-3">
							<div class="video-gallery text-center">
								<a href="#">
									<div class="iframe-img">
										<img src="<%=basePath1%>images/home/aodi1.jpg" alt="" />
									</div>
									<div class="overlay-icon">
										<i class="fa fa-play-circle-o"></i>
									</div>
								</a>
								<p>奥迪 Q4 e-tron</p>
								<h2>2023年4月28日</h2>
							</div>
						</div>
						
						<div class="col-sm-3">
							<div class="video-gallery text-center">
								<a href="#">
									<div class="iframe-img">
										<img src="<%=basePath1%>images/home/baoma1.jpg" alt="" />
									</div>
									<div class="overlay-icon">
										<i class="fa fa-play-circle-o"></i>
									</div>
								</a>
								<p>全新BMW i3</p>
								<h2>2023年4月28日</h2>
							</div>
						</div>
					</div>
					<div class="col-sm-3">
						<div class="address">
							<img src="<%=basePath1%>images/home/map.png" alt="" />
							<p>江西省南昌市经济技术开发区双港东街808号电子邮箱\：hdjd@ecjtu.edu.cn</p>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<div class="footer-widget">
			<div class="container">
				<div class="row">
					<div class="col-sm-2">
						<div class="single-widget">
							<h2>服务</h2>
							<ul class="nav nav-pills nav-stacked">
								<li><a href="#">在线帮助</a></li>
								<li><a href="#">联系我们</a></li>
								<li><a href="#">订单状态</a></li>
								<li><a href="#">更改地址</a></li>
								<li><a href="#">常见问题解答</a></li>
							</ul>
						</div>
					</div>
					<div class="col-sm-2">
						<div class="single-widget">
							<h2>涛涛汽车4S店</h2>
							<ul class="nav nav-pills nav-stacked">
								<li><a href="#">奔驰</a></li>
								<li><a href="#">一汽奥迪</a></li>
								<li><a href="#">宝马</a></li>
								<li><a href="#">大众</a></li>
								<li><a href="#">丰田</a></li>
							</ul>
						</div>
					</div>
					<div class="col-sm-2">
						<div class="single-widget">
							<h2>政策</h2>
							<ul class="nav nav-pills nav-stacked">
								<li><a href="#">使用条款</a></li>
								<li><a href="#">隐私政策</a></li>
								<li><a href="#">退款政策</a></li>
								<li><a href="#">支付系统</a></li>
								<li><a href="#">售票系统</a></li>
							</ul>
						</div>
					</div>
					<div class="col-sm-2">
						<div class="single-widget">
							<h2>关于客户</h2>
							<ul class="nav nav-pills nav-stacked">
								<li><a href="#">公司信息</a></li>
								<li><a href="#">招聘</a></li>
								<li><a href="#">门店位置</a></li>
								<li><a href="#">附加程序</a></li>
								<li><a href="#">版权</a></li>
							</ul>
						</div>
					</div>
					<div class="col-sm-3 col-sm-offset-1">
						<div class="single-widget">
							<h2>关于客户</h2>
							<form action="#" class="searchform">
								<input type="text" placeholder="你的邮箱地址" />
								<button type="submit" class="btn btn-default"><i class="fa fa-arrow-circle-o-right"></i></button>
								<p>获取最新更新 <br />我们的网站和更新...</p>
							</form>
						</div>
					</div>
					
				</div>
			</div>
		</div>
		
		<div class="footer-bottom">
			<div class="container">
				<div class="row">
					<p class="pull-left">Copyright © 2023 ecjtu All rights reserved.</p>
					<p class="pull-left" style="width: 178px; margin-left: 300px; " >你是管理员吗？<a href='<%=basePath1+"admin/home"%>'>请点击这里</a></p>
					<p class="pull-right">Designed by <span><a target="_blank" href="http://www.ecjtu.jx.cn/">ECJTU</a></span></p>
				</div>
			</div>
		</div>
		
	</footer>
	

  
    <script src="<%=basePath1%>js/jquery.js"></script>
	<script src="<%=basePath1%>js/bootstrap.min.js"></script>
	<script src="<%=basePath1%>js/jquery.scrollUp.min.js"></script>
	<script src="<%=basePath1%>js/price-range.js"></script>
    <script src="<%=basePath1%>js/jquery.prettyPhoto.js"></script>
    <script src="<%=basePath1%>js/main.js"></script>
</body>
</html>