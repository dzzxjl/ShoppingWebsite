<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.ps.dao.UserDao" %>
<%@ page import="com.ps.model.User"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
    <head>
    <title>登陆账号</title>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="keywords" content="N-Air Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
		<script type="application/x-javascript"> addEventListener("load", function() {setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
		<!--bootstrap-->
			 <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
		<!--coustom css-->
			<link href="css/style.css" rel="stylesheet" type="text/css"/>
        <!--shop-kart-js-->
        <script src="js/simpleCart.min.js"></script>
		<!--default-js-->
			<script src="js/jquery-2.1.4.min.js"></script>
		<!--bootstrap-js-->
			<script src="js/bootstrap.min.js"></script>
		<!--script-->
         <!-- FlexSlider -->
            <script src="js/imagezoom.js"></script>
              <script defer src="js/jquery.flexslider.js"></script>
            <link rel="stylesheet" href="css/flexslider.css" type="text/css" media="screen" />

            <script>
            // Can also be used with $(document).ready()
            $(window).load(function() {
              $('.flexslider').flexslider({
                animation: "slide",
                controlNav: "thumbnails"
              });
            });
            </script>
        <!-- //FlexSlider-->
    </head>
    <body>
    <%
	UserDao userdao = new UserDao();
	List<User> users = userdao.getUsers();
	
%>
    
 <%@include file = "header.jsp"%>
        <div class="head-bread">
            <div class="container">
                <ol class="breadcrumb">
                    <li><a href="index.jsp">HOME</a></li>
                    <li class="active">Users</li>
                </ol>
            </div>
        </div>
        <div class="container">
<table class="table">
<tr>
<th>用户ID</th>
<th>用户账号</th>
<th>用户邮箱</th>
<th>用户简介</th>
<th>配送</th>
<th></th>
</tr>
<%
for(int i=0; i<users.size();i++)
{
%>
<tr>
<td><%=users.get(i).getUid()%></td>
<td><%=users.get(i).getUname()%></td>
<td><%=users.get(i).getUemail()%></td>
<td><%=users.get(i).getUintroduction()%></td>
<td>
<form method="post" action="UserServlet?method=delete">
	<input type="hidden" value="update" name="method" >
    <input type="hidden" value="<%=users.get(i).getUid()%>" name="id" >
	<button type="submit"  class="btn btn-default" align="center">删除用户</button>
	</form>
</td>
</tr>
<%
}
%>
</table>
</div>
        
        
 <%@include file = "footer.jsp"%>
    </body>
</html>