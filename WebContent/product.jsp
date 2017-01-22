<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.ps.dao.ProductDao" %>
<%@ page import="com.ps.model.Product"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>产品</title>
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
 int pid = Integer.parseInt(request.getParameter("pid"));
System.out.println(pid);
 ProductDao productdao = new ProductDao();
 Product product = productdao.getProduct(pid);
System.out.println(product.getName());
%>
 <%@include file = "header.jsp"%>
        <div class="head-bread">
            <div class="container">
                <ol class="breadcrumb">
                    <li><a href="#">Home</a></li>
                    <li class="active">Product</li>
                </ol>
            </div>
        </div>
		
		
		
		
		<div class="showcase-grid">
            <div class="container">
                <div class="col-md-8 showcase">
                    <div class="flexslider">
                          <ul class="slides">
                            <li data-thumb="images/grid4.jpeg">
                                <div class="thumb-image"> <img src="images/grid4.jpeg" data-imagezoom="true" class="img-responsive"> </div>
                            </li>
                            <li data-thumb="images/grid4.jpeg">
                                 <div class="thumb-image"> <img src="images/grid4.jpeg" data-imagezoom="true" class="img-responsive"> </div>
                            </li>
                            <li data-thumb="images/grid4.jpeg">
                               <div class="thumb-image"> <img src="images/grid4.jpeg" data-imagezoom="true" class="img-responsive"> </div>
                            </li>
                            <li data-thumb="images/grid4.jpeg">
                               <div class="thumb-image"> <img src="images/grid4.jpeg" data-imagezoom="true" class="img-responsive"> </div>
                            </li>
                          </ul>
                        <div class="clearfix"></div>
                    </div>
                </div>
                <div class="col-md-4 showcase">
                    <div class="showcase-rt-top">
                        <div class="pull-left shoe-name">
                            <h3>商品名称：<%=product.getName() %></h3>
                            <p>PID：<%=product.getId() %></p>
                            <p>库存数量：<%=product.getNum() %></p>
                            <h4>商品价格: <%=product.getPrice() %>RMB</h4>
                        </div>
                        <div class="pull-left rating-stars">
                            <ul>
    <li><a href="#" class="active"><span class="glyphicon glyphicon-star star-stn" aria-hidden="true"></span></a></li>
    <li><a href="#" class="active"><span class="glyphicon glyphicon-star star-stn" aria-hidden="true"></span></a></li>
    <li><a href="#" class="active"><span class="glyphicon glyphicon-star star-stn" aria-hidden="true"></span></a></li>
    <li><a href="#" class="active"><span class="glyphicon glyphicon-star star-stn" aria-hidden="true"></span></a></li>
    <li><a href="#" class="active"><span class="glyphicon glyphicon-star star-stn" aria-hidden="true"></span></a></li>
                            </ul>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                    <hr class="featurette-divider">
                    <form action="OrderServlet">
                    <input type="hidden" value="submit" name="method" >
                    <input type="hidden" value="<%=session.getAttribute("uid")%>" name="uid" >
					<input type="hidden" value="<%=product.getId() %>" name="pid" >
					<input type="hidden" value="<%=product.getPrice() %>" name="price" >
                    <div class="shocase-rt-bot">
                        <div class="float-qty-chart">
                        <ul>
                            <li class="qty">
                                <h4>选择购买数量</h4>
                                <select  name = "num" class="form-control qnty-chrt">
                                  <option>1</option>
                                  <option>2</option>
                                  <option>3</option>
                                  <option>4</option>
                                  <option>5</option>
                                  <option>6</option>
                                  <option>7</option>
                                </select>
                            </li>
                        </ul>
                        <div class="clearfix"></div>
                        </div>
                        <ul>
                            <li class="ad-2-crt simpleCart_shelfItem">
                                <input  class="btn item_add" type="submit" value="点击购买">	
                            </li>
                            
                        </ul>
                    </div>
                    
					</form>
                    <div class="showcase-last">
                        <h3>详细描述</h3>
						<%=product.getDescription() %>
                    </div>
                </div>
        <div class="clearfix"></div>
            </div>
        </div>
        
 <%@include file = "footer.jsp"%>
</body>
</html>