<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
    <head>
    <title>登陆账号</title>
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
 <%@include file = "header.jsp"%>
        <div class="head-bread">
            <div class="container">
                <ol class="breadcrumb">
                    <li><a href="index.jsp">HOME</a></li>
                    <li class="active">LOGIN</li>
                </ol>
            </div>
        </div>
        <!--signup-->
        <!-- login-page -->
        <div class="login">
            <div class="container">
                <div class="login-grids">
                    <div class="col-md-6 log">
                             <h3>登录</h3>
                             <div class="strip"></div>
                             <p>欢迎，请输入您的用户名与密码</p>
                             <form action="UserServlet?method=login" method="post">
                                 <h5>用户名:</h5>	
                                 <input type="text" id="username" name="username">
                                 <h5>密码:</h5>
                                 <input type="password" id="password" name="password"><br>					
                                 <input type="submit" value="登录">

                             </form>
                            <a href="#">忘记密码？</a>
                    </div>
                    <div class="col-md-6 login-right">
                            <h3>注册新用户</h3>
                            <div class="strip"></div>
                            <p>通过在我们商店注册成为新用户, 你可以更快地获得电脑硬件的最新报价，更便利地选择电脑硬件并进行购买,祝您购物愉快！</p>
                            <a href="register.jsp" class="button">注册成为新用户</a>
                    </div>
                    <div class="clearfix"></div>
                </div>
            </div>
        </div>
 <%@include file = "footer.jsp"%>
    </body>
</html>