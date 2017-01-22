<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.ps.dao.OrderDao" %>
<%@ page import="com.ps.model.Order"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>所有订单</title>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="keywords" content="N-Air Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
		<script type="application/x-javascript"> addEventListener("load", function() {setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
		<meta charset utf="8">
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
	OrderDao orderdao = new OrderDao();
	List<Order> orders = orderdao.getOrders();
	
%>



 <%@include file = "header.jsp"%>
<div class="container">
<table class="table">
<tr>
<th>订单编号</th>
<th>订单用户编号</th>
<th>订单时间</th>
<th>订单总价</th>
<th>订单货物编号</th>
<th>订单数量</th>
<th>订单是否取消</th>
<th>订单是否配送</th>
<th>配送</th>
<th></th>
</tr>
<%
for(int i=0; i<orders.size();i++)
{
%>
<tr>
<td><%=orders.get(i).getId()%></td>
<td><%=orders.get(i).getUid()%></td>
<td><%=orders.get(i).getTime()%></td>
<td><%=orders.get(i).getPrice()%></td>
<td><%=orders.get(i).getPid()%></td>
<td><%=orders.get(i).getNum()%></td>
<td>
<%
if(orders.get(i).getIsCancel() == 0){
	out.println("否");
}else{
	out.println("是");
} 
%>
</td>
<td>
<%
if(orders.get(i).getIsDispatch() == 0){
	out.println("否");
}else{
	out.println("是");
} 

%>
</td>
<td>
<form method="post" action="OrderServlet">
	<input type="hidden" value="update" name="method" >
    <input type="hidden" value="<%=orders.get(i).getId()%>" name="id" >
	<button type="submit"  class="btn btn-default" align="center">配送</button>
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