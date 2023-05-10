<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="header.jsp" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="com.qiuhongtao.pojo.User" %>
<%@ page import="com.qiuhongtao.pojo.Payment" %>
<%@ page import="com.qiuhongtao.service.PaymentService" %>
<section id="z`z`">
		<div class="container">
			<div class="step-one">
				<h2 class="heading">账户信息</h2>
			</div>
 	
			<div class="col-sm-6">
				<div class="total_area">
					<%
						if(!(session.getAttribute("user")==null)){
								User u=(User)session.getAttribute("user");
					%>
						<ul>
							<li>账户名 :<span><%=u.getUsername()%></span></li>
							<li>密码 :<span><%=u.getPassword()%></span></li>
							<li>邮箱地址 :<span><%=u.getEmail()%></span></li>
							<li>性别 :<span><%=u.getGender()%></span></li>
							<li>出生日期 :<span><%=u.getBirthdate()%></span></li>
						</ul>
   						<a class="btn btn-default update" href="updateUser?id=<%=u.getId()%>">更改</a>
					<%}%>
	    					
	    				
	    		</div>
    		</div> 
    			  
    		
			<div class="table-responsive cart_info">
			
			<div  class="step-one" style="margin-top: 330px">
				<h2 class="heading" style="text-align: left">订单信息</h2>
			</div>	
						<div class="table-responsive col-sm-12">
			
				<table class="table table-condensed">
				
					
						<thead>
						<tr >
						<td><strong>订单号</strong></td>
						<td><strong>订单日期</strong></td>
						<td><strong>地址</strong></td>
						<td><strong>支付方式</strong></td>
							<td>&nbsp;</td>
						</tr></thead>
						<tbody>
						<c:choose>
					<c:when test="${ empty orderList}">
						<tr><td colspan="6">
						<div class="content-404 text-center">
			<h1>没有订单信息</h1>
		
		</div></td></tr>
					
					</c:when>
					<c:otherwise>

					<c:forEach var="o" items="${orderList}">
						<tr>
						<td>OID:${o.orderId}</td>
						<td>${o.orderDate}</td>
						<td><p>${o.name}</p>
						<p>${o.country}${o.state}${o.city}${o.address}</p>
						<p>${o.phone}</p>
						</td>
						<td class="cart_total">
						<%

							PaymentService paymentService = (PaymentService) request.getAttribute("paymentService");
							com.qiuhongtao.pojo.Order o=(com.qiuhongtao.pojo.Order)pageContext.findAttribute("o");
							int n=o.getPaymentId();
							java.sql.Connection con=(java.sql.Connection)application.getAttribute("con");
							Payment payment = paymentService.findByPaymentId(n);
							String paymentType = payment.getPaymentType();
							 %>
								<p class="cart_total_price"><%=paymentType %></p>
							</td>
						<td><button class="btn btn-default update" id="${o.orderId }">详细</button></td>
						
							</tr>
					</c:forEach>

							</c:otherwise></c:choose>
						
						<tr><td colspan="5">
							<ul class="pagination">
		
		<li><a href="">&laquo;</a></li>
							<li class="active"><a href="">1</a></li>
							<li><a href="">2</a></li>
							<li><a href="">3</a></li>
							<li><a href="">&raquo;</a></li>
						</ul>
							</td></tr>
					</tbody>
				</table>
				
						
		</div>
		
			
		

		</div>
	</section>
	
<div id="popup_box">
  
    <a id="popupBoxClose">关闭</a>

<div id="container">
    </div>
</div>
	
   <style type="text/css">  #popup_box {
     display:none;
     position:fixed;      
      _position:absolute;
       height:500px;      
        width:700px;       
        background:#FFFFFF;      
         left: 450px;     
         top: 50px;     
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
		});
	});
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
	<%@include file="footer.jsp" %>
	

