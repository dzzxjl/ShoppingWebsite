<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
    <title>N-Air a E-commerce category Flat Bootstrap Responsive Website Template | Contact :: w3layouts</title>
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
                    <li><a href="index.html">Home</a></li>
                    <li class="active">Admin</li>
                </ol>
            </div>
        </div>
        <!-- contact -->
        <div class="contact">
        
            <div class="container">
            <h2>&nbsp&nbsp尊敬的管理员用户</h2>
           	<hr>
			<div class="col-md-6 cart-total">
                <h3>添加产品</h3>
                <div class="contact-content">
                    <form method="post" action="ProductServlet?method=save" >
                        <label>名称型号</label>
						<input type="text"  class="textbox"  name="name" ><br><br>
						<label>描述</label>
						<textarea  class="textbox"  rows="3" name="description"  ></textarea><br><br>
						<label>类型</label>
						<input type="text"  class="textbox"  name="category"  ><br><br>
						<label>价格</label>
						<input type="text"  class="textbox"  name="price" ><br><br>
						<label>数量</label>
						<input type="text"  class="textbox"  name="num" ><br><br>
                       <div class="submit"> 
                            <input class="btn btn-default cont-btn" type="submit" value="提交" />
                      </div>
                    </form>
                </div>
            </div>
            <div class="col-md-6 cart-items">
			<a href="orders.jsp">管理用户订单并选择配送订单</a>
			<hr>
			</div>
            </div>
        </div>
		 <%@include file = "footer.jsp"%>
    </body>
</html>