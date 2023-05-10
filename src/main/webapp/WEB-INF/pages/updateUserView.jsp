<%@ page import="com.qiuhongtao.pojo.User" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="header.jsp"%>
<section id="form">
		<div class="container">
			<div class="row">
				<div class="col-sm-4 col-sm-offset-1">
					<div class="login-form">
						<h2>用户信息更改</h2>
<%
	if(!(session.getAttribute("user")==null)){
    
   com.qiuhongtao.pojo.User u = (com.qiuhongtao.pojo.User)session.getAttribute("user");
%>
<%if(!(request.getAttribute("message")==null)){
    out.println("<h3>"+request.getAttribute("message")+"</h3>");
}%>
<form method="post" action="toupdateUser">
    <label>密码 : </label><input type="text" name="password" placeholder="密码" value="<%=u.getPassword()%>"/>
    <label>邮箱地址 : </label><input type="text" name="email" placeholder="邮箱地址" value="<%=u.getEmail()%>"/><br/>
 	<label> 性别 </label>
 	 &nbsp;<input type="radio"  style="width: 15px; height: 15px; display:inline;" name="gender" value="男" <%="男".equals(u.getGender())? "checked":""%> />&nbsp;男&nbsp;
 	<input type="radio" style="width: 15px; height: 15px;   display: inline;" name="gender" value="女" <%="女".equals(u.getGender())? "checked":""%>/>&nbsp;女
 	<br/><br/>
   <label>出生日期 : </label><input type="text" name="birthdate" placeholder="出生日期(yyyy-mm-dd)" value="<%=u.getBirthdate()%>" />
	<input type="hidden" name="username" value="<%=u.getUsername()%>">
   <input type="hidden" name="id" value="<%=u.getId()%>">
    <button type="submit" class="btn btn-default">确认更改</button>
    <%}%>
</form>
</div>
				</div>
			</div>
		</div>
	</section>
<%@include file="footer.jsp"%>
