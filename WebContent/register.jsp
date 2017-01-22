<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html lang="en">
    <head>
    <title>N-Air a E-commerce category Flat Bootstrap Responsive Website Template | Checkout :: w3layouts</title>
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
		
		<script type="text/javascript">
	function check(){
		var name=document.getElementById("name");
		var pwd=document.getElementById("pwd");
		var pwd1=document.getElementById("pwd1");
		if(name.value=="admin"){
			alert("用户名已存在");
			return false;
		}else if(name.value==null||name.value==""){
			alert("用户名不能为空");
			return false;
		}else if(pwd.value==null||pwd.value==""){
			alert("密码不能为空");	
			return false;
		}else if(pwd1.value==null||pwd1.value==""){
			alert("确认密码不能为空");
			return false;
		}else if(pwd.value!=pwd1.value){
			alert("密码和确认密码不一致");
			return false;
		}else if(name.value.length>10){
			alert("用户名长度不符");
			return false;
		}else if(pwd.value.length>10){
			alert("密码长度不符");	
			return false;
		}else if(pwd1.value.length>10){
			alert("确认密码长度不符");
			return false;
		}
		else{
			return true;
		}
	}
</script>
    </head>
    <body>
 <%@include file = "header.jsp"%>
        <div class="head-bread">
            <div class="container">
                <ol class="breadcrumb">
                    <li><a href="index.html">Home</a></li>
                    <li><a href="register.html">LOGIN</a></li>
                    <li class="active">REGISTER</li>
                </ol>
            </div>
        </div>
        <!-- reg-form -->
	<div class="reg-form">
		<div class="container">
			<div class="reg">
				<h3>Register Now</h3>
				<p>Welcome, please enter the following details to continue.</p>
				<p>If you have previously registered with us, <a href="#">click here</a></p>
				<form id="form1" name="form1" method="post" action="<%=request.getContextPath()%>/UserServlet?method=register" onsubmit="return check()">
					<ul>
						<li class="text-info">用户名：</li>
        				<li><input type="text" name="name" id="name" value=""/></li>
					</ul>
					<ul>
						<li class="text-info">密码：</li>
						<li><input type="password" name="pwd" id="pwd" /></li>
					 </ul>				 
					<ul>
						<li class="text-info">确认密码：</li>
						<li><input type="password" name="pwd1" id="pwd1" /></</li>
					</ul>
					<ul>
						<li class="text-info">昵称：</li>
						<li><input type="text" name="name" id="name" /></li>
					</ul>
					<ul>
						<li class="text-info">个人简介：</li>
						<li><input type="text" name="introduction" id="introduction" /></li>
					</ul>
					<ul>
						<li class="text-info">邮箱：</li>
						<li><input type="text" name="email" id="email" /></li>
					</ul>						
					<input type="submit" value="提交"/>
					<p class="click">By clicking this button, you are agree to my  <a href="#">Policy Terms and Conditions.</a></p> 
				</form>
			</div>
		</div>
	</div>
 <%@include file = "footer.jsp"%>
    </body>
</html>
