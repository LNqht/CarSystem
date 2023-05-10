<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="header.jsp"%>
<section id="form">
		<div class="container">
			<div class="row">
				<div class="col-sm-4 col-sm-offset-1">
					<div class="login-form">
					<h2>登录您的账户</h2>	<%
    if(!(request.getAttribute("message")==null)){
    out.println("<h2>"+request.getAttribute("message")+"</h2>");
}%>
<%
    Cookie[] cookies=request.getCookies();
    String username="";
    String password="";
    String rememberMe="";
    if (cookies!=null){
        for (Cookie cookie:cookies){
            if (cookie.getName().equals("cUsername")){
                username=cookie.getValue();
            }
            if (cookie.getName().equals("cPassword")){
                password=cookie.getValue();
            }
            if (cookie.getName().equals("cRememberMe")){
                rememberMe=cookie.getValue();
            }
        }
    }
%>

<form method="post" action="<%=basePath+"tologin"%>">
    <input type="text" name="username" placeholder="账户名" value="<%=username%>"><br>
   <input type="password" name="password" placeholder="密码" value="<%=password%>">
    <br/>
    <span>
		<input type="checkbox" class="checkbox" name="remember" value="1" <%="1".equals(rememberMe)? "checked":""%>/> 记住账户
   </span>
    <button type="submit" class="btn btn-default">登录</button>
</form>	
					</div>
				</div>
				
				
			</div>
		</div>
	</section>
<%@include file="footer.jsp"%>
