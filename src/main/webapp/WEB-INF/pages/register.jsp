<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="header.jsp"%>
<section id="form">
		<div class="container">
			<div class="row">
				<div class="col-sm-4 col-sm-offset-1">
					<div class="login-form">
						<h2>登录您的账户</h2><%
    if(!(request.getAttribute("message")==null)){
    out.println("<h3>"+request.getAttribute("message")+"</h3>");
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
				<div class="col-sm-1">
					<h2 class="or">OR</h2>
				</div>
				<div class="col-sm-4">
					<div class="signup-form">
						<h2>注册新的账户</h2>
						
<%if(!(request.getAttribute("message")==null)){
    out.println("<h3>"+request.getAttribute("message")+"</h3>");
}%>
<form method="post" action="<%=basePath+"toregister"%>">
    <input type="text" name="username" placeholder="账户名" />  <input type="password" name="password" placeholder="密码" />   <input type="text" name="email" placeholder="邮箱地址">
 <label> 性别 </label><span> &nbsp;<input type="radio"
style="width: 15px; height: 15px; display:inline;" name="gender" value="男" />&nbsp;男&nbsp;<input type="radio" style="width: 15px; height: 15px;   display: inline;" name="gender" value="女"/>&nbsp;女</span>
   <span></span>
   <input type="text" name="birthdate" placeholder="出生日期(yyyy-mm-dd)">
    <button type="submit" class="btn btn-default">注册</button>
</form>
					</div>
				</div>
			</div>
		</div>
	</section>
<%@include file="footer.jsp"%>
