<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="ptithcm.bean.ListCart"%>
<%@include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<base href="${pageContext.servletContext.contextPath }/">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>ToddleFun</title>

<link rel="icon" href="<c:url value='/resources/images/favicon.png'/>" />
<link href="<c:url value='/resources/css/bootstrap.min.css'/>"
	rel="stylesheet">
<!-- Custom styles for this template -->
<link href="<c:url value='/resources/css/style.css" rel="stylesheet'/>">
<link
	href="<c:url value='/resources/css/responsive.css" rel="stylesheet'/>">
<link href="<c:url value='/resources/css/bxslider.css'/>"
	rel="stylesheet" type="text/css" />
<link
	href="https://fonts.googleapis.com/css?family=Droid+Sans:400,700|Fredoka+One"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Baloo+Paaji"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Comfortaa:300,400,700"
	rel="stylesheet">
<link
	href="<c:url value='/resources/fonts/font-awesome/css/font-awesome.min.css'/>"
	rel="stylesheet" type="text/css" />
<link
	href="<c:url value='/resources/fonts/website-font/stylesheet.css'/>"
	rel="stylesheet" type="text/css" />


<style type="text/css">
.btn-delete-cart {
	float: right;
	margin-right: 20px;
	background-color: #ffffff;
	border: none;
}

</style>

<script type="text/javascript">
	function displayCart() {
		if (document.getElementById("cart").style.display == "block") {
			document.getElementById("cart").style.display = "none";
		} else {
			document.getElementById("cart").style.display = "block";
		}
	}
	window.onload = function() {
		window.scrollTo({
			top : 550,
			behavior : 'smooth',
		});
		
	};
	
</script>
</head>
<body id="myPage">
	<header id="home">
		<div class="top-header pink-bgclr">
			<div class="container">
				<div class="row header-style">
					<div class="col-md-6 col-sm-6 col-xs-12">
						<div class="phn-num">
							<i class="fa fa-phone" aria-hidden="true"></i> Call Us:<a
								href="tel:+1-202-555-0100"> +1-202-555-0100</a>
						</div>
						<div class="search-box">
							<form id="demo-2" action="product/search.htm" method="post">
							<script type="text/javascript">
							var input = document.getElementById("searchProduct");
						    input.addEventListener("keyup", function(event) {
						      if (event.keyCode === 13) {
						    	  console.log("value:" +input.value);
						    	  document.getElementById("btnSearchProduct").click();
						      }
						      }
							</script>
								<input id="searchProduct" name="searchProduct"  placeholder="Search" type="search" value=""/>
								<button id="btnSearchProduct" style="display: none;"></button>
							</form>
						</div>
					</div>
					<div class="col-md-6 col-sm-6 col-xs-12">
						<div class="user-value">
							<ul>
								<li class="dropdown"><a href="login.htm"
									class="dropbtn flip-animate"> <i class="fa fa-user"
										aria-hidden="true"></i><span
										data-hover=" ${tk.taiKhoan }${login }"> ${tk.taiKhoan }${login}</span></a>
									<div class="dropdown-content" style="z-index: 2;">
										<a href="user/changeInfor.htm"
											style="color: white !important;">Change Infor</a> 
											<a
											href="user/changePassword.htm"
											style="color: white !important;">Change Password</a> 
											<a
											href="cart/historyOrder.htm" style="color: white !important;">Order History</a>
											<a
											href="user/logout.htm" style="color: white !important;">Log
											out</a>
									</div>
								<li><a href="register.htm"> <i class="fa fa-tag"
										aria-hidden="true"></i> Register
								</a></li>
								<li><a href=""><i class="fa fa-heart-o"
										aria-hidden="true"></i> Wishlist</a></li>
								<li class="cart-dropdown">
								
								<a onclick="displayCart()">
								<i class="fa fa-shopping-basket" aria-hidden="true"></i> Cart</a>
									<form action="product.htm" method="post">
										<div id="cart" class="dropdown-menu btn-block cartView"
											style="display: none;">
											<h4 class="title">My cart</h4>
											<div id="cart-content" class="cart-content">
												<div class="items" id="itemCart">
													<c:forEach var="p" items="${listCart}">
													
														<div class="items-inner" id="'+id+'">
															<div class="row">
																<div class="col-sm-4 col-xs-4 cart-item-image">
																	<a href=""><img src="<c:url value='/resources/images/${p.hinhAnh}'/>" alt=""
																		style="width: 80px;"> </a>
																</div>
																<div class="col-sm-8 col-xs-8 cart-item-info">

																	<div class="cart-item-title">
																		<a
																			href="">
																			${p.tenSP }</a> <a class="cart-close" href="javascript:;"
																			data-cart-remove="1">
																			<a  class="btn-delete-cart">
																				<i class="fa fa-times"></i>
																			</a>
																		</a>
																	</div>

																	<div class="cart-item-price">
																		1<span class="x"> x </span><span class="money"
																			data-currency-usd="$50.00" data-currency="USD">
																			$ ${p.donGia }</span>
																	</div>

																</div>

															</div>

														</div>
													</c:forEach>
												</div>
												<div class="subtotal">
													<span></span> <span ></span> <span
														class="cart-item-total-price"> <span>
															Product categories</span>
													</span>
												</div>
												
											</div>
										</div>

										<input id="inputCart" name="listCart" type="text"
											style="display: none;" />
									</form></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="main-header">
			<div class="main-nav">
				<div class="container">
					<div class="navbar-header">
						<button type="button" class="navbar-toggle" data-toggle="collapse"
							data-target=".navbar-collapse">
							<span class="sr-only">Toggle navigation</span> <span
								class="icon-bar"></span> <span class="icon-bar"></span> <span
								class="icon-bar"></span>
						</button>
						<a class="navbar-brand" href="index.htm"> <img
							class="img-responsive"
							src="<c:url value='/resources/images/logo2.png'/>" alt="logo">
						</a>
					</div>
					<nav class="collapse navbar-collapse">
						<ul class="nav navbar-nav navbar-left">
							<li class="active"><a href="index.htm" class="flip-animate"><span
									data-hover="Home">Home</span></a></li>
							<li class="active"><a href="product/index.htm"
								class="flip-animate"><span data-hover="On Sale">On
										Sale</span></a></li>
							<li class="active"><a href="product/index.htm"
								class="flip-animate"><span data-hover="Shop">Shop</span></a></li>
						</ul>
						<ul class="nav navbar-nav navbar-right">
							<li><a href="" class="flip-animate"><span
									data-hover="Blog">Blog</span></a></li>
							<li class="dropdown"><a href="#"
								class="dropbtn flip-animate"><span data-hover="Pages">Pages</span></a>
								<div class="dropdown-content">
									<a href="">About Us</a> <a href="404-page.html">404</a>
								</div></li>
							<li><a href="" class="flip-animate"><span
									data-hover="Contact">Contact</span></a></li>
						</ul>
					</nav>
				</div>
			</div>
			<!--main-nav-->
		</div>
		<div class="inner-banner">
			<div class="inner-wrapper">
				<h1 id="TenPage">Products</h1>
			</div>
		</div>
	</header>