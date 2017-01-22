<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.ps.model.Order" %>
<%@ page import="com.ps.util.JDBCUtil" %>
<%@ page import="com.ps.dao.OrderDao" %>
<!DOCTYPE html>
<html lang="en">
    <head>
    <title>我的主页</title>
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
  	request.setCharacterEncoding("utf-8");
  	int uid =Integer.parseInt(session.getAttribute("uid").toString()) ;
	OrderDao orderdao = new OrderDao();
	List<Order> list = orderdao.selectByUid(uid);
  %>
 <%@include file = "header.jsp"%>
        <div class="head-bread">
            <div class="container">
                <ol class="breadcrumb">
                    <li><a href="index.html">Home</a></li>
                    <li class="active">User</li>
                </ol>
            </div>
        </div>
        <!-- check-out -->
            <div class="check">
                <div class="container">	 
                   <div>
                   <h1>我的资料</h1>
                   <br>
                   <ul>
                   <li>&nbsp&nbsp&nbsp&nbsp我的ID:  ${sessionScope.user.uid}</li>
                   <li>&nbsp&nbsp&nbsp&nbsp我的账号:  ${sessionScope.user.uname}</li>
                   <li>&nbsp&nbsp&nbsp&nbsp我的密码:  ${sessionScope.user.upassword}</li>
                   <li>&nbsp&nbsp&nbsp&nbsp我的邮箱:  ${sessionScope.user.uemail}</li>
                   <li>&nbsp&nbsp&nbsp&nbsp我的介绍:  ${sessionScope.user.uintroduction}</li>
                   </ul>
                   </div>
				   
				   <br><hr>
                    <div>
                        <h1>我的订单</h1>
                            <script>$(document).ready(function(c) {
                                $('.close1').on('click', function(c){
                                    $('.cart-header').fadeOut('slow', function(c){
                                        $('.cart-header').remove();
                                    });
                                    });	  
                                });
                           </script>
				<%for(int i = 0 ;i<list.size();i++) 
{
%>
                        <div class="cart-header">
                            <div class="cart-sec simpleCart_shelfItem">
                                    <div class="cart-item cyc">
                                        <img src="images/grid8.jpg" class="img-responsive" alt=""/>
                                    </div>
									
                                   <div class="cart-item-info">
                                        <ul class="qty">
                                            <li><p>订单ID:<%=list.get(i).getId()%></p></li>
                                            <li>订单时间:<%=list.get(i).getTime()%></li>
                                            <li>商品编号PID:<%=list.get(i).getPid()%></li>
                                        </ul>
                                        <div class="delivery">
                                        	 <p>订单数量:<%=list.get(i).getNum()%>&nbsp&nbsp&nbsp&nbsp订单总价:<%=list.get(i).getPrice()%>RMB
                                        	 <form method="post" action="OrderServlet">
												<input type="hidden" value="update" name="method" >
											    <input type="hidden" value="<%=list.get(i).getId()%>" name="id" >
												<button type="submit"  class="btn btn-default" align="center">取消订单</button>
												</form></p>
                                             <span>是否取消:<%=list.get(i).getIsCancel()%></span>
											<span>  &nbsp&nbsp是否配送:<%=list.get(i).getIsDispatch()%></span>
											
                                        </div>	
                                   </div>
                                   <div class="clearfix"></div>

                              </div>
                         </div>		
						 <hr>
						   <%
}
  %>
                    </div>
                    <div class="clearfix"> </div>
                </div>
            </div>
 <%@include file = "footer.jsp"%>
    </body>
</html>