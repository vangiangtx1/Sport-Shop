<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tg" tagdir="/WEB-INF/tags"%>
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

input[type="search"] {
    border: 1px solid transparent;
    border-radius: 0;
    box-sizing: content-box;
    padding: 9px 10px 9px 26px;
    transition: all 0.5s ease 0s;
}
#demo-2 input[type="search"]:focus {
    background-color: #fff;
    color: black;
    cursor: auto;
    padding-left: 32px;
    width: 130px;
    border-color: none !important;
    border-radius: 25px;
    border: none;
}
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
	
	function addToCart(id, tenSP, gia, hinhAnh) {

		let a= "&"+id;
		document.getElementById("inputCart").value = document.getElementById("inputCart").value.replace(a,'');
		document.getElementById("inputCart1").value = document.getElementById("inputCart1").value.replace(a,'');
		document.getElementById("inputCart2").value = document.getElementById("inputCart2").value.replace(a,'');
		document.getElementById("inputCart3").value = document.getElementById("inputCart3").value.replace(a,'');
		
		
		var e=document.getElementById(id);
		if(e!=null)
		{
			e.remove();
			
		}
		
		document.getElementById("itemCart").innerHTML += '<div class="items-inner" id="'+id+'">\n<div class="row">\n<div class="col-sm-4 col-xs-4 cart-item-image">\n<a>\n <img src="'+hinhAnh+'" alt="" style="width: 80px;">\n</a>\n</div>\n<div class="col-sm-8 col-xs-8 cart-item-info">\n<div class="cart-item-title">\n  <a>'
				+ tenSP
				+ '</a>\n   <a onclick="removeCart(this)" class="btn-delete-cart"> <i class="fa fa-times"></i></a>\n </div>\n<div class="cart-item-price">1\n<span class="x"> x </span>\n<span class="money" data-currency-usd="$50.00" data-currency="USD"> $'
				+ gia + '</span>\n</div>\n</div>\n</div>';
		
		document.getElementById("inputCart").value += "&" + id;
		document.getElementById("inputCart1").value += "&" + id;
		document.getElementById("inputCart2").value += "&" + id;
		document.getElementById("inputCart3").value += "&" + id;
		
		
		console.log("input : "+document.getElementById("inputCart").value);
		console.log("input 1: "+document.getElementById("inputCart1").value);
		console.log("input 2: "+document.getElementById("inputCart2").value);
		console.log("input 3: "+document.getElementById("inputCart3").value);
	}
	function clickButton(id)
	{
		document.getElementById(id).click();
		
	}
	function clickButtonPage(id,x)
	{	
		document.getElementById('p1').value=x.href;
		
		document.getElementById(id).click();
	}
	function removeCart(element)
	{	
		
		let a= "&"+element.parentElement.parentElement.parentElement.parentElement.id;
		console.log(a);
		document.getElementById("inputCart").value = document.getElementById("inputCart").value.replace(a,'');
		document.getElementById("inputCart1").value = document.getElementById("inputCart1").value.replace(a,'');;
		document.getElementById("inputCart2").value = document.getElementById("inputCart2").value.replace(a,'');;
		document.getElementById("inputCart3").value = document.getElementById("inputCart3").value.replace(a,'');;
		element.parentElement.parentElement.parentElement.parentElement.remove();
		
		console.log(document.getElementById("inputCart").value);
	}
	
	
</script>

</head>

<body id="myPage">
	
	
	<form action="product.htm">
		<input id="inputCart2" value=" " name="listCart" type="text"
			style="display: none;" />
		<button style="display: none" id="login" name="login"></button>
		<button style="display: none" id="changeInfor" name="changeInfor"></button>
		<button style="display: none" id="changePass" name="changePass"></button>
		<button style="display: none" id="logout" name="logout"></button>
		<button style="display: none" id="register" name="register"></button>
		<button style="display: none" id="product" name="product"></button>
		<button style="display: none" id="home" name="home"></button>
		<button style="display: none" id="productList" name="productList"></button>
	</form>
	<input style="display: none" id="DSCART" value="${DSCART }"/>
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
								<li class="dropdown"><a onclick="clickButton('login')"
									class="dropbtn flip-animate"> <i class="fa fa-user"
										aria-hidden="true"></i><span
										data-hover=" ${tk.taiKhoan }${login }"> ${tk.taiKhoan }${login }</span></a>
									<div class="dropdown-content" style="z-index: 2;">
										<a onclick="clickButton('changeInfor')"
											style="color: white !important;">Change Infor</a> <a
											onclick="clickButton('changePass')"
											style="color: white !important;">Change Password</a> 
											<a
											href="cart/historyOrder.htm" style="color: white !important;">Order History</a>
											<a
											href="user/logout.htm" style="color: white !important;">Log
											out</a>
									</div>
								<li><a onclick="clickButton('register')"> <i
										class="fa fa-tag" aria-hidden="true"></i> Register
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
														 <div class="items-inner" id='${p.maSP }' >
															<div class="row" >
																<div class="col-sm-4 col-xs-4 cart-item-image">
																	<a href=""><img 
																		src="<c:url value='/resources/images/${p.hinhAnh}'/>"
																		alt="" style="width: 80px;"> </a>
																</div>
																<div class="col-sm-8 col-xs-8 cart-item-info">

																	<div class="cart-item-title">
																		<a href=""> ${p.tenSP }</a> <a
																			onclick="removeCart(this)" class="btn-delete-cart">
																			<i class="fa fa-times"></i>
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
													<span></span> <span></span> <span
														class="cart-item-total-price"> <span>
															Product categories</span>
													</span>
												</div>
												<div class="mid-title">

													<button name="viewCart"
														style="color: #fff; font-size: 13px;"
														class="btn btn-default">
														<span>View Cart</span>
													</button>
												</div>
											</div>
										</div>

										<input id="inputCart" name="listCart" type="text" value=" "
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
						<a class="navbar-brand" href="index.htm"> 
						</a>
					</div>
					<nav class="collapse navbar-collapse">
						<ul class="nav navbar-nav navbar-left">
							<li class="active"><a href="index.htm" class="flip-animate"><span
									data-hover="Home">Home</span></a></li>
							<li class="active"><a href="product/index.htm"
								class="flip-animate"><span data-hover="On Sale">On
										Sale</span></a></li>
							<li class="active"><a onclick="clickButton('product')"
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
				<h1>Products</h1>
			</div>
		</div>
	</header>
	<script>

	window.onload = function() {
		window.scrollTo({
			top : 550,
			behavior : 'smooth',
		});
		document.getElementById("inputCart").value+=document.getElementById('DSCART').value;
		document.getElementById("inputCart1").value+=document.getElementById('DSCART').value;
		document.getElementById("inputCart2").value+=document.getElementById('DSCART').value;
		document.getElementById("inputCart3").value+=document.getElementById('DSCART').value;
		console.log(document.getElementById("DSCART").value);
		
		console.log(document.getElementById("inputCart").value);
		document.getElementById('SB'+${sb}).selected ='selected';
		document.getElementById('SP'+${sp}).selected ='selected'; 
	};
		
</script>


	<div class="product-grid padding-top100">
		<div class="container">
			<div class="row block-filter">
				<div class="col-md-2 col-sm-12 col-xs-12">
					<div class="total-product">
						<h3>
							Toys - <span>Products</span>
						</h3>
					</div>
				</div>
				<form action="product/select.htm" method="post">
					<div class="col-md-4 col-sm-6 col-xs-12">
						<div class="form-group input-group input-group-sm sort-by">
							<label style="font-family: 'Fredoka One', cursive;"
								for="input-sort" class="input-group-addon">CATEGORIES</label> <select
								style="font-family: 'Fredoka One', cursive; color: #f7ad0a;"
								name="loaiSP" class="form-control" onchange="this.form.submit()">
								<option
									style="font-family: 'Fredoka One', cursive; color: #f7ad0a;"
									id="SPAll" value="All">All</option>
								<c:forEach var="p" items="${loaiSP}">
									<option
										style="font-family: 'Fredoka One', cursive; color: #f7ad0a;"
										id="SP${p}" value="${p}">${p}</option>
								</c:forEach>
							</select>
						</div>
					</div>
					<div class="col-md-4 col-sm-6 col-xs-12">
						<div class="form-group input-group input-group-sm sort-by">
							<label for="input-limit" class="input-group-addon"
								style="font-family: 'Fredoka One', cursive;">SORT BY</label> <select
								style="font-family: 'Fredoka One', cursive; color: #f7ad0a;"
								class="form-control" name="sapXep" id="input-limit"
								onchange="this.form.submit()">
								<option
									style="font-family: 'Fredoka One', cursive; color: #f7ad0a;"
									id="SB0" value="0">None</option>
								<option
									style="font-family: 'Fredoka One', cursive; color: #f7ad0a;"
									id="SB1" value="1">Price: Low to High</option>
								<option
									style="font-family: 'Fredoka One', cursive; color: #f7ad0a;"
									id="SB2" value="2">Price: High to Low</option>
							</select>

						</div>
					</div>
					<input id="inputCart1" name="listCart" type="text" value=" "
						style="display: none;" />
				</form>
				<div class="col-md-2 col-sm-6 col-xs-12">
					<div class="btn-group grid-list-btn">
						<a class="btn btn-default" id="list-view"
							onclick="clickButton('productList')"><i class="fa fa-th-list"></i></a>
						<a class="btn btn-default active" id="grid-view"
							onclick="clickButton('product')"><i class="fa fa-th"></i></a>
					</div>
				</div>
			</div>
			<div class="row padding-top100">
				<jsp:useBean id="pagedListHolder" scope="request"
					type="org.springframework.beans.support.PagedListHolder" />
				<c:url value="product/index.htm" var="pagedLink">
					<c:param name="p" value="~" />
				</c:url>
				<div class="product-grid-layout">
					<ul class="toy-products-list">
						<c:forEach var="p" items="${pagedListHolder.pageList}">
							<li class="col-md-3 col-sm-4 col-xs-6 width-100">
								<div class="toy-block">
									<div class="baby-image">
										<c:if test="${p.sale!=0 }">
											<div class="category-new">
												<div class="green-new-tag new-tag">
													<a class="funky-font" href="">Sale</a>
												</div>
											</div>
										</c:if>
										<form action="product/single.htm" >
										<button id="singleProductButton${p.maSP }" style="display: none;"></button>
										<input name="singleProduct" id="singleProduct" value='${p.maSP }' style="display: none;" />
										<div class="toy-img">
											<a onclick="document.getElementById('singleProductButton${p.maSP }').click()"> <img
												src="<c:url value='/resources/images/${p.hinhAnh }'/>"
												class="img-responsive" alt="toy">
											</a>
										</div>
										</form>
										<div class="toy-details">
											<div class="button-action">
												<ul>
													<li><a href=""><i class="fa fa-heart-o"></i></a></li>
													<li><a
														onclick="addToCart('${p.maSP}','${p.tenSP }','${p.donGia }','<c:url value='/resources/images/${p.hinhAnh }'/>')"><i
															class="fa fa-shopping-basket"></i></a></li>

													<li><a><i class="fa fa-compress"></i></a></li>
												</ul>
											</div>
											<h4>${p.tenSP}</h4>
											<ul class="rating">
												<li><i class="fa fa-star" aria-hidden="true"></i></li>
												<li><i class="fa fa-star" aria-hidden="true"></i></li>
												<li><i class="fa fa-star" aria-hidden="true"></i></li>
												<li><i class="fa fa-star" aria-hidden="true"></i></li>
												<li><i class="fa fa-star" aria-hidden="true"></i></li>
											</ul>
											<hr class="divider">
											<div class="toy-price">
												<h4>
													<c:choose>
														<c:when test="${p.sale == 0}">
												 $${p.donGia}
												</c:when>
														<c:otherwise>
															<small><del>$${p.donGia}</del></small> $<c:set
																var="result" value="${p.donGia * p.sale}" />
														</c:otherwise>
													</c:choose>

												</h4>
											</div>
										</div>
									</div>
								</div>
							</li>
						</c:forEach>

					</ul>
				</div>
			</div>
			<div style="display: flex; justify-content: center">
				<form action="page.htm" method="post">
					<input id='p1' name='page' value="" style="display: none" /> <input
						id='inputCart3' name='listCart' value=" " style="display: none" />
					<button id="pageButton" style="display: none"></button>
					<tg:paging pagedListHolder="${pagedListHolder}"
						pagedLink="${pagedLink}" />

				</form>
			</div>
	</div>
	<%@include file="/WEB-INF/views/include/footer.jsp"%>