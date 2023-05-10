<%@ page import="com.qiuhongtao.service.UserService" %>
<%@ page import="com.qiuhongtao.service.PaymentService" %>
<%@ page import="com.qiuhongtao.pojo.Payment" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../header.jsp" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
     <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
       <script src="https://code.jquery.com/jquery-1.10.2.js" type="text/javascript"></script>
        <script>
           $(document).ready(function() {
	$('button').click(function() {
		var t = $(this).attr('id'); 
		$.ajax({
			url : '<%=basePath%>orderDetails',
			data : {
				orderId : t
			},
			success : function(responseText) {
				loadPopupBox();
				$('#container').html(responseText);
				 $("#container").dialog();
				 
			}
		});//ajax
	});//click
	 $('#popupBoxClose').click( function() {           
         unloadPopupBox();
     });
    
     $('#container').click( function() {
         unloadPopupBox();
     });
	
	   function unloadPopupBox() {
            $('#popup_box').fadeOut("slow");
            $("#container").css({
                "opacity": "0.3" 
            });
        }   
        
	 function loadPopupBox() {
            $('#popup_box').fadeIn("slow");
            $("#container").css({
                "opacity": "1" 
            });        
        }       
});

        </script>
<section id="z`z`">
		<div class="container">
		<div class="breadcrumbs">
				<ol class="breadcrumb">
				  <li><a href="<%=basePath %>admin/home">管理</a></li>
				  <li class="active">订单</li>
				</ol>
			</div>
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
			<div class="table-responsive col-sm-10">
				<h2 class="title text-center">订单 <strong>列表</strong></h2>
				<table class="table table-condensed">
				<thead>
						<tr >
						<td><strong>订单 ID</strong></td>
						<td><strong>订单日期</strong></td>
						<td><strong>客户</strong></td>
						<td><strong>地址</strong></td>
						<td><strong>支付方式</strong></td>
						<td>&nbsp;</td>
						</tr>
						</thead>
						<tbody>
					<c:forEach var="o" items="${orderList}">
						<tr>
						<td>OID:${o.orderId}</td>
						<td>${o.orderDate}</td>
						<%
							UserService userService = (UserService) request.getAttribute("userService") ;
							com.qiuhongtao.pojo.Order o=(com.qiuhongtao.pojo.Order)pageContext.findAttribute("o");
							int userId=o.getCustomerId();
							String customerName=userService.findById(userId).getUsername();
							 %>
						 <td><%=customerName %></td>
						<td>
						<p>${o.name}<p>
							<p>${o.country}${o.state}${o.city}${o.address}</p>
							<p>${o.phone}</p>
						</td>
						<td class="cart_total">
						<%
							PaymentService paymentService = (PaymentService) request.getAttribute("paymentService");
							int n=o.getPaymentId();
							Payment payment = paymentService.findByPaymentId(n);
							String paymentType = payment.getPaymentType();
							 %>
								<p class="cart_total_price"><%=paymentType %></p>
							</td>
						<td><button class="btn btn-default update" id="${o.orderId }">详细</button></td>
							</tr>
							<tr>
								</c:forEach>
					</tbody>
				</table>
				<ul class="pagination">
		
		<li><a href="">&laquo;</a></li>
							<li class="active"><a href="">1</a></li>
							<li><a href="">2</a></li>
							<li><a href="">3</a></li>
							<li><a href="">&raquo;</a></li>
						</ul>
		</div>
			</div>
					
						
		
		</section>
<div id="popup_box">
  
    <a id="popupBoxClose">关闭</a>

<div id="container">
    </div>
</div>
	
  <style type="text/css">
   #popup_box {    
     display:none;
     position:fixed;      
      _position:absolute;
       height:500px;      
        width:700px;       
        background:#FFFFFF;      
         left: 300px;     
         top: 100px;  
         z-index:100;
         margin-left: 15px;
         border:2px solid #FE980F;          
          padding:15px;       
          font-size:15px;       
          -moz-box-shadow: 0 0 5px #ff0000;   
            -webkit-box-shadow: 0 0 5px #ff0000;   
              box-shadow: 0 0 5px #ff0000;      } 
               #container {     background: #FFFFFF;  overflow-y:auto;    width:100%;     height:100%; }
               a{   cursor: pointer;   text-decoration:none;   }
               #popupBoxClose {     font-size:15px;       line-height:15px;       right:5px;       top:5px;       position:absolute;       color:#6fa5e2;       font-weight:500;       }
                </style>    

 <%@include file="../footer.jsp" %>