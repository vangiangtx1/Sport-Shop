<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
    <head>
   	 <base href="${pageContext.servletContext.contextPath}/">
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>ToddleFun</title>

        <!-- Bootstrap core CSS -->
        <link rel="icon" href="<c:url value='/resources/images/favicon.png'/>"/>
        <link href="<c:url value='/resources/css/bootstrap.min.css'/>" rel="stylesheet"/>
        <!-- Custom styles for this template -->
        <link href="<c:url value='/resources/css/style.css'/>" rel="stylesheet"/>
        <link href="<c:url value='/resources/css/responsive.css'/>" rel="stylesheet"/>
        <link href="<c:url value='/resources/css/bxslider.css'/>" rel="stylesheet" type="text/css" />
        <link href="https://fonts.googleapis.com/css?family=Droid+Sans:400,700|Fredoka+One" rel="stylesheet"/> 
        <link href="https://fonts.googleapis.com/css?family=Baloo+Paaji" rel="stylesheet"/> 
        <link href="https://fonts.googleapis.com/css?family=Comfortaa:300,400,700" rel="stylesheet"/> 
        <link href="<c:url value='/resources/fonts/font-awesome/css/font-awesome.min.css'/>" rel="stylesheet" type="text/css" />
        <link href="<c:url value='/resources/fonts/website-font/stylesheet.css'/>" rel="stylesheet" type="text/css" />

        <script src="<c:url value='/resources/js/jquery.min.js'/>" type="text/javascript"></script>
        <script src="<c:url value='/resources/js/bootstrap.min.js'/>" type="text/javascript"></script>
        <script src="<c:url value='/resources/js/bxslider.js'/>" type="text/javascript"></script>
        <script src="<c:url value='/resources/js/instafeed.min.js'/>" type="text/javascript"></script>
        <script src="<c:url value='/resources/js/custom.js'/>" type="text/javascript"></script>

    </head>
    <body id="myPage">
        <header id="home">
            <div class="top-header pink-bgclr">
                <div class="container">
                    <div class="row header-style">
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <div class="phn-num">
                                <i class="fa fa-phone" aria-hidden="true"></i>
                                Call Us:<a href="tel:+1-202-555-0100"> +1-202-555-0100</a>
                            </div>
                            <div class="search-box">
                                <form id="demo-2">
                                    <input placeholder="Search" type="search">
                                </form>
                            </div>
                        </div>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <div class="user-value">
                                <ul>
                                    <li><a href="login.htm"> <i class="fa fa-user" aria-hidden="true"></i> Login</a> </li>
                                    <li><a href="register.htm"> <i class="fa fa-tag" aria-hidden="true"></i> Register</a> </li>
                                    <li><a href="#"><i class="fa fa-heart-o" aria-hidden="true"></i> Wishlist</a></li>
                                    <li class="cart-dropdown">
                                        <a class="dropdown-toggle"  data-toggle="dropdown"><i class="fa fa-shopping-basket" aria-hidden="true"></i><span class="cart-item">1</span><span class="cart-tag">cart</span></a>
                                        <div class="dropdown-menu btn-block cartView">
                                            <h4 class="title">My cart</h4>
                                            <div id="cart-content" class="cart-content">
                                                <div class="items">
                                                    <div class="items-inner">
                                                        <div class="row">
                                                            <div class="col-sm-4 col-xs-4 cart-item-image">
                                                                <a href="#">
                                                                    <img src="<c:url value='/resources/images/pro1.png'/>" alt="" style="width: 80px;">
                                                                </a>
                                                            </div>
                                                            <div class="col-sm-8 col-xs-8 cart-item-info">
                                                                <div class="cart-item-title">
                                                                    <a href="/products/blue-bandeau-bikini-top?variant=4052789956">Soft Teddy Bear</a>
                                                                    <a class="cart-close" href="javascript:;" data-cart-remove="1">
                                                                        <i class="fa fa-times" title="Remove"></i>
                                                                    </a>
                                                                </div>
                                                                <div class="cart-item-price">
                                                                    1
                                                                    <span class="x"> x </span>
                                                                    <span class="money" data-currency-usd="$50.00" data-currency="USD">$25.99</span>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="subtotal">
                                                    <span>SUBTOTAL</span>
                                                    <span class="cart-item-total-price">
                                                        <span class="money" data-currency-usd="$50.00" data-currency="USD">$25.99</span>
                                                    </span>
                                                </div>
                                                <div class="mid-title">
                                                    <a class="btn btn-default" href="cart.html"><span>View Cart</span></a>
                                                    <a class="btn btn-default" href="checkout.html"><span>Checkout</span></a>
                                                </div>
                                            </div>
                                        </div>
                                    </li>
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
                            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                                <span class="sr-only">Toggle navigation</span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                            </button>   
                            <a class="navbar-brand" href="home.html">
                                <img class="img-responsive" src="<c:url value='/resources/images/logo2.png'/>" alt="logo">
                            </a>   
                        </div>
                        <nav class="collapse navbar-collapse">
                            <ul class="nav navbar-nav navbar-left">                 
                                <li class="active"><a href="home.html" class="flip-animate"><span data-hover="Home">Home</span></a></li>
                                <li class="active"><a href="onsale.html" class="flip-animate"><span data-hover="On Sale">On Sale</span></a></li>
                                <li class="dropdown" ><a  class="dropdown-toggle flip-animate padding-bottom10" data-toggle="dropdown"><span data-hover="Shop">Shop</span></a>
                                    <ul class="dropdown-menu mega-menu shop-hover">
                                        <li class="mega-menu-column">
                                            <ul>
                                                <li class="nav-header">Heading 1</li>
                                                <li><a href="product.html">Product Link</a></li>
                                                <li><a href="product.html">Product Link</a></li>
                                                <li><a href="product.html">Product Link</a></li>
                                                <li><a href="product.html">Product Link</a></li>
                                                <li><a href="product.html">Product Link</a></li>
                                                <li><a href="product.html">Product Link</a></li>
                                            </ul>
                                        </li>
                                        <li class="mega-menu-column">
                                            <ul>
                                                <li class="nav-header">Heading 2</li>
                                                <li><a href="product.html">Product Link</a></li>
                                                <li><a href="product.html">Product Link</a></li>
                                                <li><a href="product.html">Product Link</a></li>
                                                <li><a href="product.html">Product Link</a></li>
                                                <li><a href="product.html">Product Link</a></li>
                                                <li><a href="product.html">Product Link</a></li>
                                            </ul>
                                        </li>
                                        <li class="mega-menu-column">
                                            <ul>
                                                <li class="nav-header">Heading 3</li>
                                                <li><a href="product.html">Product Link</a></li>
                                                <li><a href="product.html">Product Link</a></li>
                                                <li><a href="product.html">Product Link</a></li>
                                                <li><a href="product.html">Product Link</a></li>
                                                <li><a href="product.html">Product Link</a></li>
                                                <li><a href="product.html">Product Link</a></li>
                                            </ul>
                                        </li>
                                        <li class="mega-menu-column">
                                            <ul>
                                                <li class="nav-header">Heading 4</li>
                                                <li><a href="product.html">Product Link</a></li>
                                                <li><a href="product.html">Product Link</a></li>
                                                <li><a href="product.html">Product Link</a></li>
                                                <li><a href="product.html">Product Link</a></li>
                                                <li><a href="product.html">Product Link</a></li>
                                                <li><a href="product.html">Product Link</a></li>
                                            </ul>
                                        </li>
                                    </ul>
                                </li>                              
                            </ul>
                            <ul class="nav navbar-nav navbar-right">
                                <li><a href="blog.html" class="flip-animate"><span data-hover="Blog">Blog</span></a></li>
                                <li class="dropdown">
                                    <a href="#" class="dropbtn flip-animate"><span data-hover="Pages">Pages</span></a>
                                    <div class="dropdown-content">
                                        <a href="about.html">About Us</a>
                                        <a href="404-page.html">404</a>                                       
                                    </div>
                                </li>
                                <li><a href="contact.html" class="flip-animate"><span data-hover="Contact">Contact</span></a></li>
                            </ul>
                        </nav>
                    </div>
                </div><!--main-nav-->
            </div>
            <div class="main-banner">
                <div class="banner-box">
                    <div class="banner-title">
                        <h1>Friendly & Safe <span>Toys For Your Baby</span></h1>
                    </div>
                    <div class="site-btn">
                        <a href="" class="btn btn-1">
                            <span class="txt">Read More</span>
                            <span class="round"><i class="fa fa-chevron-right"></i></span>
                        </a>
                    </div>
                </div>
            </div>
        </header>
        <section class="offers">
            <div class="container">
                <div class="row">
                    <div class="col-md-6 col-sm-6 col-xs-12">
                        <div id="myCarousel" class="carousel slide" data-ride="carousel">
                            <!-- Indicators -->
                            <ol class="carousel-indicators">
                                <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                                <li data-target="#myCarousel" data-slide-to="1"></li>
                                <li data-target="#myCarousel" data-slide-to="2"></li>
                            </ol>

                            <!-- Wrapper for slides -->
                            <div class="carousel-inner">
                                <div class="item active">
                                    <div class="offer-image">
                                        <img src="<c:url value='/resources/images/offer-img2.jpg'/>" alt="offer-img" class="img-responsive">
                                    </div>
                                    <div class="carousel-caption">
                                        <h3>Solid food is fun!</h3>
                                        <p>Available @Baby Planet</p>
                                    </div>
                                </div>
                                <div class="item">
                                    <div class="offer-image">
                                        <img src="<c:url value='/resources/images/offer-img1.jpg'/>" alt="offer-img" class="img-responsive">
                                    </div>
                                    <div class="carousel-caption">
                                        <h3>Cradle to Walking</h3>
                                        <p>Babies keep moving...crawl, sit, climb</p>
                                    </div>
                                </div>
                                <div class="item">
                                    <div class="offer-image">
                                        <img src="<c:url value='/resources/images/offer-img3.jpg'/>" alt="offer-img" class="img-responsive">
                                    </div>
                                    <div class="carousel-caption">
                                        <h3>Our toys are safe</h3>
                                        <p>High quality plastic</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 col-sm-6 col-xs-12">
                        <ul class="row product-list">
                            <li class="col-md-6 col-sm-6 col-xs-6">
                                <div class="product-image">
                                    <img src="<c:url value='/resources/images/Product1.jpg'/>" alt="product" class="img-responsive">
                                    <div class="product-name">
                                        <h2 style="color:#fd5a0f;">Onesie</h2>                                        
                                    </div>
                                    <span class="text_count">20 Items</span>
                                </div>
                            </li>
                            <li class="col-md-6 col-sm-6 col-xs-6">
                                <div class="product-image">
                                    <img src="<c:url value='/resources/images/Product2.jpg'/>" alt="product" class="img-responsive">
                                    <div class="product-name">
                                        <h2 style="color:#35beea;">Baby Toys</h2>
                                    </div>
                                    <span class="text_count">100 Items</span>
                                </div>
                            </li>
                            <li class="col-md-6 col-sm-6 col-xs-6">
                                <div class="product-image">
                                    <img src="<c:url value='/resources/images/Product4.jpg'/>" alt="product" class="img-responsive">
                                    <div class="product-name">
                                        <h2 style="color:#87df2d;">Taddies</h2>
                                    </div>
                                    <span class="text_count">50 Items</span>
                                </div>
                            </li>
                            <li class="col-md-6 col-sm-6 col-xs-6">
                                <div class="product-image">
                                    <img src="<c:url value='/resources/images/Product3.jpg'/>" alt="product" class="img-responsive">
                                    <div class="product-name">
                                        <h2 style="color:#774be9;">Baby Shoes</h2>
                                    </div>
                                    <span class="text_count">10 Items</span>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </section>
        <section class="padding-top100 new-arrival">
            <div class="container">
                <div class="row">
                    <div class="border-title text-center">
                        <h2 class="section-header__title" style="color:#000;">
                            <span style="color: rgb(255, 51, 102);">N</span>
                            <span style="color: rgb(253, 90, 15);">e</span>
                            <span style="color: rgb(119, 75, 233);">w</span>
                            <span style="color: rgb(253, 90, 15);">&nbsp;</span>
                            <span style="color: rgb(253, 90, 15);">C</span>
                            <span style="color: rgb(247,173,10);">o</span>
                            <span style="color: rgb(119, 75, 233);">l</span>
                            <span style="color: rgb(253, 90, 15);">l</span>
                            <span style="color: rgb(53, 190, 234);">e</span>
                            <span style="color: rgb(248, 163, 42);">c</span>
                            <span style="color: rgb(253, 90, 15);">t</span>
                            <span style="color: rgb(119, 75, 233);">i</span>
                            <span style="color: rgb(53, 190, 234);">o</span>
                            <span style="color: rgb(247,173,10);">n</span>
                            <span style="color: rgb(255, 51, 102);">s</span>
                        </h2>
                        <p>Shop great Toy Store goodies for your kids.</p>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12 col-sm-12 col-xs-12">
                        <div class="products-details">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="related-item">
                                        <ul id="product-related" class="image-additional newarrival-product-slider">
                                            <li style="float: left; width: 33.3333333%; padding: 0 8px;"> 
                                                <div class="toy-block">
                                                    <div class="baby-image">
                                                        <div class="category-new">
                                                            <div class="green-new-tag new-tag">
                                                                <a class="funky-font" href="#">New</a>
                                                            </div>
                                                        </div>
                                                        <div class="toy-img">
                                                            <a href="single-details.html">
                                                                <img src="<c:url value='/resources/images/pro1.png'/>" class="img-responsive" alt="toy">
                                                            </a>
                                                        </div>  
                                                        <div class="toy-details">
                                                            <div class="button-action">
                                                                <ul>
                                                                    <li><a href="#"><i class="fa fa-heart-o"></i></a></li>
                                                                    <li><a href="#"><i class="fa fa-shopping-basket"></i></a></li>
                                                                    <li><a href="#"><i class="fa fa-compress"></i></a></li>
                                                                </ul>
                                                            </div>
                                                            <h4>Soft Teddy Bear</h4>
                                                            <ul class="rating">
                                                                <li><i class="fa fa-star" aria-hidden="true"></i></li>
                                                                <li><i class="fa fa-star" aria-hidden="true"></i></li>
                                                                <li><i class="fa fa-star" aria-hidden="true"></i></li>
                                                                <li><i class="fa fa-star" aria-hidden="true"></i></li>
                                                                <li><i class="fa fa-star-o" aria-hidden="true"></i></li>
                                                            </ul>
                                                            <hr class="divider">
                                                            <div class="toy-price">
                                                                <h4><small><del>$30.99</del></small> $25.99</h4>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </li>
                                            <li style="float: left; width: 33.3333333%; padding: 0 8px;"> 
                                                <div class="toy-block">
                                                    <div class="baby-image">
                                                        <div class="category-new">
                                                            <div class="green-new-tag new-tag">
                                                                <a class="funky-font" href="#">New</a>
                                                            </div>
                                                        </div>
                                                        <div class="toy-img">
                                                            <a href="single-details.html">
                                                                <img src="<c:url value='/resources/images/pro6.png'/>" class="img-responsive" alt="toy">
                                                            </a>
                                                        </div>  
                                                        <div class="toy-details">
                                                            <div class="button-action">
                                                                <ul>
                                                                    <li><a href="#"><i class="fa fa-heart-o"></i></a></li>
                                                                    <li><a href="#"><i class="fa fa-shopping-basket"></i></a></li>
                                                                    <li><a href="#"><i class="fa fa-compress"></i></a></li>
                                                                </ul>
                                                            </div>
                                                            <h4>Tickles Pink Doll</h4>
                                                            <ul class="rating">
                                                                <li><i class="fa fa-star" aria-hidden="true"></i></li>
                                                                <li><i class="fa fa-star" aria-hidden="true"></i></li>
                                                                <li><i class="fa fa-star" aria-hidden="true"></i></li>
                                                                <li><i class="fa fa-star" aria-hidden="true"></i></li>
                                                                <li><i class="fa fa-star-o" aria-hidden="true"></i></li>
                                                            </ul>
                                                            <hr class="divider">
                                                            <div class="toy-price">
                                                                <h4><small><del>$30.99</del></small> $25.99</h4>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </li>
                                            <li style="float: left; width: 33.3333333%; padding: 0 8px;"> 
                                                <div class="toy-block">
                                                    <div class="baby-image">
                                                        <div class="category-new">
                                                            <div class="green-new-tag sale-tag">
                                                                <a class="funky-font" href="#">Sale</a>
                                                            </div>
                                                        </div>
                                                        <div class="toy-img">
                                                            <a href="single-details.html">
                                                                <img src="<c:url value='/resources/images/pro3.png'/>" class="img-responsive" alt="toy">
                                                            </a>
                                                        </div>  
                                                        <div class="toy-details">
                                                            <div class="button-action">
                                                                <ul>
                                                                    <li><a href="#"><i class="fa fa-heart-o"></i></a></li>
                                                                    <li><a href="#"><i class="fa fa-shopping-basket"></i></a></li>
                                                                    <li><a href="#"><i class="fa fa-compress"></i></a></li>
                                                                </ul>
                                                            </div>
                                                            <h4>Rubber Duckies</h4>
                                                            <ul class="rating">
                                                                <li><i class="fa fa-star" aria-hidden="true"></i></li>
                                                                <li><i class="fa fa-star" aria-hidden="true"></i></li>
                                                                <li><i class="fa fa-star" aria-hidden="true"></i></li>
                                                                <li><i class="fa fa-star" aria-hidden="true"></i></li>
                                                                <li><i class="fa fa-star-o" aria-hidden="true"></i></li>
                                                            </ul>
                                                            <hr class="divider">
                                                            <div class="toy-price">
                                                                <h4><small><del>$30.99</del></small> $25.99</h4>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </li>
                                            
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <section class="padding-top100 offer-counter">
            <div class="container">
                <div class="row">
                    <div class="col-md-7 col-sm-12 col-xs-12 purple-bgclr">
                        <div class="offer-date">
                            <div class="offer-details">
                                <span>Deal Of The Week</span>
                                <hr>
                                <h2>Up to 25% off</h2>
                                <p>On all toys</p>
                            </div>
                            <div id="clockdiv">
                                <div>
                                    <div class="diamond-shape">
                                        <span class="months"></span>
                                    </div>
                                    <div class="smalltext">Months</div>
                                </div>
                                <div>
                                    <div class="diamond-shape">
                                        <span class="days"></span>
                                    </div>
                                    <div class="smalltext">Days</div>
                                </div>
                                <div>
                                    <div class="diamond-shape">
                                        <span class="hours"></span>
                                    </div>
                                    <div class="smalltext">Hours</div>
                                </div>
                                <div>
                                    <div class="diamond-shape">
                                        <span class="minutes"></span>
                                    </div>
                                    <div class="smalltext">Minutes</div>
                                </div>
                                <div>
                                    <div class="diamond-shape">
                                        <span class="seconds"></span>
                                    </div>
                                    <div class="smalltext">Seconds</div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-5 hidden-sm hidden-xs pink-bgclr no-padding display-nn">
                        <div class="counter-img">
                            <img src="<c:url value='/resources/images/counter-img.jpg'/>" alt="counter-img" class="img-responsive">
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <section class="padding-top100 best-seller">
            <div class="container">
                <div class="row">
                    <div class="border-title text-center">
                        <h2 class="section-header__title" style="color:#000;">
                            <span style="color: rgb(255, 51, 102);">B</span>
                            <span style="color: rgb(247,173,10);">e</span>
                            <span style="color: rgb(119, 75, 233);">s</span>
                            <span style="color: rgb(253, 90, 15);">t</span>
                            <span style="color: rgb(253, 90, 15);">&nbsp;</span>
                            <span style="color: rgb(53, 190, 234);">S</span>
                            <span style="color: rgb(253, 90, 15);">e</span>
                            <span style="color: rgb(119, 75, 233);">l</span>
                            <span style="color: rgb(253, 90, 15);">l</span>
                            <span style="color: rgb(53, 190, 234);">e</span>
                            <span style="color: rgb(248, 163, 42);">r</span>
                        </h2>
                        <p>Shop great Toy Store goodies for your kids.</p>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12 col-sm-12 col-xs-12">
                        <div class="products-details">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="related-item">
                                        <ul id="product-related" class="image-additional bestseller-product-slider">
                                            <li> 
                                                <div class="toy-block">
                                                    <div class="baby-image">
                                                        <div class="category-new">
                                                            <div class="green-new-tag new-tag">
                                                                <a class="funky-font" href="#">New</a>
                                                            </div>
                                                        </div>
                                                        <div class="toy-img">
                                                            <a href="single-details.html">
                                                                <img src="<c:url value='/resources/images/pro1.png'/>" class="img-responsive" alt="toy">
                                                            </a>
                                                        </div>  
                                                        <div class="toy-details">
                                                            <div class="button-action">
                                                                <ul>
                                                                    <li><a href="#"><i class="fa fa-heart-o"></i></a></li>
                                                                    <li><a href="#"><i class="fa fa-shopping-basket"></i></a></li>
                                                                    <li><a href="#"><i class="fa fa-compress"></i></a></li>
                                                                </ul>
                                                            </div>
                                                            <h4>Soft Teddy Bear</h4>
                                                            <ul class="rating">
                                                                <li><i class="fa fa-star" aria-hidden="true"></i></li>
                                                                <li><i class="fa fa-star" aria-hidden="true"></i></li>
                                                                <li><i class="fa fa-star" aria-hidden="true"></i></li>
                                                                <li><i class="fa fa-star" aria-hidden="true"></i></li>
                                                                <li><i class="fa fa-star-o" aria-hidden="true"></i></li>
                                                            </ul>
                                                            <hr class="divider">
                                                            <div class="toy-price">
                                                                <h4><small><del>$30.99</del></small> $25.99</h4>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </li>
                                            <li> 
                                                <div class="toy-block">
                                                    <div class="baby-image">
                                                        <div class="category-new">
                                                            <div class="green-new-tag new-tag">
                                                                <a class="funky-font" href="#">New</a>
                                                            </div>
                                                        </div>
                                                        <div class="toy-img">
                                                            <a href="single-details.html">
                                                                <img src="<c:url value='/resources/images/pro6.png'/>" class="img-responsive" alt="toy">
                                                            </a>
                                                        </div>  
                                                        <div class="toy-details">
                                                            <div class="button-action">
                                                                <ul>
                                                                    <li><a href="#"><i class="fa fa-heart-o"></i></a></li>
                                                                    <li><a href="#"><i class="fa fa-shopping-basket"></i></a></li>
                                                                    <li><a href="#"><i class="fa fa-compress"></i></a></li>
                                                                </ul>
                                                            </div>
                                                            <h4>Tickles Pink Doll</h4>
                                                            <ul class="rating">
                                                                <li><i class="fa fa-star" aria-hidden="true"></i></li>
                                                                <li><i class="fa fa-star" aria-hidden="true"></i></li>
                                                                <li><i class="fa fa-star" aria-hidden="true"></i></li>
                                                                <li><i class="fa fa-star" aria-hidden="true"></i></li>
                                                                <li><i class="fa fa-star-o" aria-hidden="true"></i></li>
                                                            </ul>
                                                            <hr class="divider">
                                                            <div class="toy-price">
                                                                <h4><small><del>$30.99</del></small> $25.99</h4>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </li>
                                            <li> 
                                                <div class="toy-block">
                                                    <div class="baby-image">
                                                        <div class="category-new">
                                                            <div class="green-new-tag sale-tag">
                                                                <a class="funky-font" href="#">Sale</a>
                                                            </div>
                                                        </div>
                                                        <div class="toy-img">
                                                            <a href="single-details.html">
                                                                <img src="<c:url value='/resources/images/pro3.png'/>" class="img-responsive" alt="toy">
                                                            </a>
                                                        </div>  
                                                        <div class="toy-details">
                                                            <div class="button-action">
                                                                <ul>
                                                                    <li><a href="#"><i class="fa fa-heart-o"></i></a></li>
                                                                    <li><a href="#"><i class="fa fa-shopping-basket"></i></a></li>
                                                                    <li><a href="#"><i class="fa fa-compress"></i></a></li>
                                                                </ul>
                                                            </div>
                                                            <h4>Rubber Duckies</h4>
                                                            <ul class="rating">
                                                                <li><i class="fa fa-star" aria-hidden="true"></i></li>
                                                                <li><i class="fa fa-star" aria-hidden="true"></i></li>
                                                                <li><i class="fa fa-star" aria-hidden="true"></i></li>
                                                                <li><i class="fa fa-star" aria-hidden="true"></i></li>
                                                                <li><i class="fa fa-star-o" aria-hidden="true"></i></li>
                                                            </ul>
                                                            <hr class="divider">
                                                            <div class="toy-price">
                                                                <h4><small><del>$30.99</del></small> $25.99</h4>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </li>
                                            <li> 
                                                <div class="toy-block">
                                                    <div class="baby-image">
                                                        <div class="category-new">
                                                            <div class="green-new-tag new-tag">
                                                                <a class="funky-font" href="#">New</a>
                                                            </div>
                                                        </div>
                                                        <div class="toy-img">
                                                            <a href="single-details.html">
                                                                <img src="<c:url value='/resources/images/pro2.png'/>" class="img-responsive" alt="toy">
                                                            </a>
                                                        </div> 
                                                        <div class="toy-details">
                                                            <div class="button-action">
                                                                <ul>
                                                                    <li><a href="#"><i class="fa fa-heart-o"></i></a></li>
                                                                    <li><a href="#"><i class="fa fa-shopping-basket"></i></a></li>
                                                                    <li><a href="#"><i class="fa fa-compress"></i></a></li>
                                                                </ul>
                                                            </div>
                                                            <h4>Remote Controlled Car</h4>
                                                            <ul class="rating">
                                                                <li><i class="fa fa-star" aria-hidden="true"></i></li>
                                                                <li><i class="fa fa-star" aria-hidden="true"></i></li>
                                                                <li><i class="fa fa-star" aria-hidden="true"></i></li>
                                                                <li><i class="fa fa-star" aria-hidden="true"></i></li>
                                                                <li><i class="fa fa-star-o" aria-hidden="true"></i></li>
                                                            </ul>
                                                            <hr class="divider">
                                                            <div class="toy-price">
                                                                <h4><small><del>$30.99</del></small> $25.99</h4>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </li>
                                            <li> 
                                                <div class="toy-block">
                                                    <div class="baby-image">
                                                        <div class="category-new">
                                                            <div class="green-new-tag sale-tag">
                                                                <a class="funky-font" href="#">Sale</a>
                                                            </div>
                                                        </div>  
                                                        <div class="toy-img">
                                                            <a href="single-details.html">
                                                                <img src="<c:url value='/resources/images/pro5.png'/>" class="img-responsive" alt="toy">
                                                            </a>
                                                        </div>  
                                                        <div class="toy-details">
                                                            <div class="button-action">
                                                                <ul>
                                                                    <li><a href="#"><i class="fa fa-heart-o"></i></a></li>
                                                                    <li><a href="#"><i class="fa fa-shopping-basket"></i></a></li>
                                                                    <li><a href="#"><i class="fa fa-compress"></i></a></li>
                                                                </ul>
                                                            </div>
                                                            <h4>Soft Stuffed Elephant</h4>
                                                            <ul class="rating">
                                                                <li><i class="fa fa-star" aria-hidden="true"></i></li>
                                                                <li><i class="fa fa-star" aria-hidden="true"></i></li>
                                                                <li><i class="fa fa-star" aria-hidden="true"></i></li>
                                                                <li><i class="fa fa-star" aria-hidden="true"></i></li>
                                                                <li><i class="fa fa-star-o" aria-hidden="true"></i></li>
                                                            </ul>
                                                            <hr class="divider">
                                                            <div class="toy-price">
                                                                <h4><small><del>$30.99</del></small> $25.99</h4>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="padding-top100">
                    <div class="row purple-bgclr">
                        <div class="subscribe-box">
                            <div class="col-md-5 col-sm-12 col-xs-12">
                                <h2>Subscribe to newsletter</h2>
                                <p>And get your 25% discount now!</p>
                            </div>
                            <div class="col-md-7 col-sm-12 col-xs-12">
                                <form class="form-wrapper">
                                    <input type="text" id="search" placeholder="Enter Email Id" required>
                                    <input type="submit" value="Subscribe" id="submit">
                                </form>
                            </div>
                            <div class="subscribe-img">
                                <img src="<c:url value='/resources/images/subscribe.png'/>" alt="subscribe" class="img-responsive">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <section class="padding-top100 best-seller">
            <div class="container">
                <div class="row">
                    <div class="border-title text-center padding-bottom80">
                        <h2 class="section-header__title" style="color:#000;">
                            <span style="color: rgb(255, 51, 102);">O</span>
                            <span style="color: rgb(247,173,10);">u</span>
                            <span style="color: rgb(119, 75, 233);">r</span>
                            <span style="color: rgb(253, 90, 15);">&nbsp;</span>
                            <span style="color: rgb(53, 190, 234);">B</span>
                            <span style="color: rgb(253, 90, 15);">r</span>
                            <span style="color: rgb(119, 75, 233);">a</span>
                            <span style="color: rgb(253, 90, 15);">n</span>
                            <span style="color: rgb(53, 190, 234);">d</span>
                            <span style="color: rgb(248, 163, 42);">s</span>
                        </h2>
                        <p>Shop great Toy Store goodies for your kids.</p>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12 col-sm-12 col-xs-12">
                        <div class="brand-list">
                            <ul id="brand-related" class="brand-slider">
                                <li> 
                                    <div class="brand-img">
                                        <a href="#">
                                            <img src="<c:url value='/resources/images/brand8.png'/>" class="img-responsive" alt="brand">
                                        </a>
                                    </div>                                          
                                </li>
                                <li> 
                                    <div class="brand-img">
                                        <a href="#">
                                            <img src="<c:url value='/resources/images/brand2.png'/>" class="img-responsive" alt="brand">
                                        </a>
                                    </div>                                          
                                </li>
                                <li> 
                                    <div class="brand-img">
                                        <a href="#">
                                            <img src="<c:url value='/resources/images/brand3.png'/>" class="img-responsive" alt="brand">
                                        </a>
                                    </div>                                          
                                </li>
                                <li> 
                                    <div class="brand-img">
                                        <a href="#">
                                            <img src="<c:url value='/resources/images/brand4.png'/>" class="img-responsive" alt="brand">
                                        </a>
                                    </div>                                          
                                </li>
                                <li> 
                                    <div class="brand-img">
                                        <a href="#">
                                            <img src="<c:url value='/resources/images/brand5.png'/>" class="img-responsive" alt="brand">
                                        </a>
                                    </div>                                          
                                </li>
                                <li> 
                                    <div class="brand-img">
                                        <a href="#">
                                            <img src="<c:url value='/resources/images/brand6.png'/>" class="img-responsive" alt="brand">
                                        </a>
                                    </div>                                          
                                </li>
                                <li> 
                                    <div class="brand-img">
                                        <a href="#">
                                            <img src="<c:url value='/resources/images/brand7.png'/>" class="img-responsive" alt="brand">
                                        </a>
                                    </div>                                          
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="row padding-top100">
                    <div class="col-md-6 col-sm-12 col-xs-12">
                        <div class="uniform-offer">
                            <div class="uniform-img">
                                <img src="<c:url value='/resources/images/uniform-offer.jpg'/>" alt="uniform" class="img-responsive">
                            </div>
                            <div class="featured-content">
                                <h6 style="color:#ff3366">Gift Pack</h6>
                                <h2 style="color:#774be9">
                                    Infant Care set
                                    <br>
                                    10 gift items
                                </h2>
                                <div class="site-btn">
                                    <a href="" class="btn btn-1">
                                        <span class="txt">Buy now</span>
                                        <span class="round"><i class="fa fa-chevron-right"></i></span>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 col-sm-12 col-xs-12">
                        <div class="uniform-offer">
                            <div class="uniform-img">
                                <img src="<c:url value='/resources/images/uniform-offer2.jpg'/>" alt="uniform" class="img-responsive">
                            </div>
                            <div class="featured-content">
                                <h6 style="color:#ff3366">Baby Planet's</h6>
                                <h2 style="color:#774be9">Babycare Kit</h2>
                                <div class="site-btn">
                                    <a href="" class="btn btn-1">
                                        <span class="txt">Buy now</span>
                                        <span class="round"><i class="fa fa-chevron-right"></i></span>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
        </section>
        <section class="padding-top100 best-seller">
            <div class="container">
                <div class="row">
                    <div class="border-title text-center padding-bottom80">
                        <h2 class="section-header__title" style="color:#000;">
                            <span style="color: rgb(255, 51, 102);">O</span>
                            <span style="color: rgb(247,173,10);">u</span>
                            <span style="color: rgb(119, 75, 233);">r</span>
                            <span style="color: rgb(253, 90, 15);">&nbsp;</span>
                            <span style="color: rgb(53, 190, 234);">B</span>
                            <span style="color: rgb(253, 90, 15);">l</span>
                            <span style="color: rgb(119, 75, 233);">o</span>
                            <span style="color: rgb(253, 90, 15);">g</span>
                            <span style="color: rgb(53, 190, 234);">s</span>
                        </h2>
                        <p>Shop great Toy Store goodies for your kids.</p>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-4 col-sm-4 col-xs-6 width-100">
                        <div class="blog-list">
                            <div class="blog-img">
                                <img src="<c:url value='/resources/images/blog1.jpg'/>" alt="blog" class="img-responsive    ">
                            </div>
                            <div class="blog-details">
                                <a class="post-title" href="single-blog.html">Standard Blog Post</a>
                                <ul class="post-meta">
                                    <li>
                                        <span class="fa fa-calendar"></span>
                                        <a href="#">6 Days Ago </a>
                                    </li>
                                    <li>
                                        <span class="fa fa-comments-o"></span>
                                        <a href="#">10</a>
                                    </li>
                                </ul>
                                <div class="post-detail">
                                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed neque magna, laoreet quis orci quis, venenatis eleifend augue. Pellentesque ultricies tellus urna. Cras neque leo, bibendum quis mollis a, mollis vel magna.</p>
                                </div>
                                <div class="site-btn">
                                    <a href="single-blog.html" class="btn btn-1">
                                        <span class="txt">Read More</span>
                                        <span class="round"><i class="fa fa-chevron-right"></i></span>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4 col-sm-4 col-xs-6 width-100">
                        <div class="blog-list">
                            <div class="blog-img">
                                <img src="<c:url value='/resources/images/blog2.jpg'/>" alt="blog" class="img-responsive    ">
                            </div>
                            <div class="blog-details">
                                <a class="post-title" href="single-blog.html">Standard Blog Post</a>
                                <ul class="post-meta">
                                    <li>
                                        <span class="fa fa-calendar"></span>
                                        <a href="#">6 Days Ago </a>
                                    </li>
                                    <li>
                                        <span class="fa fa-comments-o"></span>
                                        <a href="#">10</a>
                                    </li>
                                </ul>
                                <div class="post-detail">
                                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed neque magna, laoreet quis orci quis, venenatis eleifend augue. Pellentesque ultricies tellus urna. Cras neque leo, bibendum quis mollis a, mollis vel magna.</p>
                                </div>
                                <div class="site-btn">
                                    <a href="single-blog.html" class="btn btn-1">
                                        <span class="txt">Read More</span>
                                        <span class="round"><i class="fa fa-chevron-right"></i></span>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4 col-sm-4 col-xs-6 width-100">
                        <div class="blog-list">
                            <div class="blog-img">
                                <img src="<c:url value='/resources/images/blog3.jpg'/>" alt="blog" class="img-responsive    ">
                            </div>
                            <div class="blog-details">
                                <a class="post-title" href="single-blog.html">Standard Blog Post</a>
                                <ul class="post-meta">
                                    <li>
                                        <span class="fa fa-calendar"></span>
                                        <a href="#">6 Days Ago </a>
                                    </li>
                                    <li>
                                        <span class="fa fa-comments-o"></span>
                                        <a href="#">10</a>
                                    </li>
                                </ul>
                                <div class="post-detail">
                                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed neque magna, laoreet quis orci quis, venenatis eleifend augue. Pellentesque ultricies tellus urna. Cras neque leo, bibendum quis mollis a, mollis vel magna.</p>
                                </div>
                                <div class="site-btn">
                                    <a href="single-blog.html" class="btn btn-1">
                                        <span class="txt">Read More</span>
                                        <span class="round"><i class="fa fa-chevron-right"></i></span>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <footer class="padding-top100">
            <div class="footer-block">
                <div class="container">
                    <div class="row">
                        <div class="col-md-3 col-sm-6 col-xs-6 width-100">
                            <div class="footer-links">
                                <h3>Quick Links</h3>
                                <ul class="footer-header-links">
                                    <li><a href="about.html">About Us</a></li>
                                    <li><a href="login.html">Sign In</a></li>
                                    <li><a href="cart.html">View Cart</a></li>
                                    <li><a href="wishlist.html">My Wishlist</a></li>
                                    <li><a href="#">Help</a></li>
                                    <li><a href="contact.html">Contact Us</a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-md-4 col-sm-6 col-xs-6 marginTop-40px width-100">
                            <div class="footer-links">
                                <h3>Contact Us</h3>
                                <ul class="contact-list">
                                    <li>
                                        <i class="fa fa-map-marker fa-lg"></i>
                                        <p><a href="#"> 701 Old York Drive Richmond USA.</a></p>
                                    </li>
                                    <li>
                                        <i class="fa fa-phone fa-lg"></i>
                                        <p><a href="tel:+1-202-555-0100"> +1-202-555-0100</a></p>
                                    </li>
                                    <li>
                                        <i class="fa fa-envelope-o fa-lg"></i>
                                        <p><a href="mailto:demo@info.com"> demo@info.com</a></p>
                                    </li>
                                </ul>
                                <div class="footer-social-icon">
                                    <a href="#"><i class="fa fa-facebook"></i></a>
                                    <a href="#"><i class="fa fa-twitter"></i></a>                           
                                    <a href="#"><i class="fa fa-instagram"></i></a>
                                    <a href="#"><i class="fa fa-google-plus"></i></a>
                                    <a href="#"><i class="fa fa-youtube-play"></i></a>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-5 col-sm-12 col-xs-12 mt-40 width-100">
                            <div class="footer-links">
                                <h3>Instagram</h3>
                                <div id="instafeed"></div>
                            </div>
                        </div>
                    </div>
                    <hr>
                    <div class="copyright">
                        <!--Do not remove Backlink from footer of the template. To remove it you can purchase the Backlink-->
                        &copy; 2017 All right reserved. Designed by <a href="http://www.themevault.net/" target="_blank">ThemeVault.</a>
                        <div class="right-payment">
                            <ul>
                                <li>
                                    <a href="http://paypal.com" onclick="target = '_blank'">
                                        <i class="fa fa-cc-paypal"></i>
                                    </a>
                                </li>
                                <li>
                                    <a href="http://www.visa.com/" onclick="target = '_blank'">
                                        <i class="fa fa-cc-visa"></i>
                                    </a>
                                </li>
                                <li>
                                    <a href="http://www.mastercard.com" onclick="target = '_blank'">
                                        <i class="fa fa-cc-mastercard"></i>
                                    </a>
                                </li>
                                <li>
                                    <a href="https://www.americanexpress.com/" onclick="target = '_blank'">
                                        <i class="fa fa-cc-amex"></i>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </footer>
        <script>
            var $slider;
            function buildSliderConfiguration() {

                var windowWidth = $(window).width();
                var numberOfVisibleSlides;

                if (windowWidth < 420) {
                    numberOfVisibleSlides = 1;
                } else if (windowWidth < 768) {
                    numberOfVisibleSlides = 2;
                } else if (windowWidth < 1200) {
                    numberOfVisibleSlides = 3;
                } else {
                    numberOfVisibleSlides = 4;
                }

                return {
                    pager: false,
                    slideMargin: 30,
                    mode: 'horizontal',
                    slideWidth: 250,
                    infiniteLoop: true,
                    moveSlides: 1,
                    minSlides: numberOfVisibleSlides,
                    maxSlides: numberOfVisibleSlides
                };
            }

            function configureSlider() {
                var config = buildSliderConfiguration();

                if ($slider && $slider.reloadSlider) {
                    $slider.reloadSlider(config);
                } else {
                    $slider = $('.newarrival-product-slider').bxSlider(config);
                }
            }
            $(window).on("orientationchange resize", configureSlider);
            configureSlider();
        </script>
        <script>
            var $slider2;
            function buildSliderConfiguration() {

                var windowWidth = $(window).width();
                var numberOfVisibleSlides;

                if (windowWidth < 420) {
                    numberOfVisibleSlides = 1;
                } else if (windowWidth < 768) {
                    numberOfVisibleSlides = 2;
                } else if (windowWidth < 1200) {
                    numberOfVisibleSlides = 3;
                } else {
                    numberOfVisibleSlides = 4;
                }

                return {
                    pager: false,
                    slideMargin: 30,
                    mode: 'horizontal',
                    slideWidth: 250,
                    infiniteLoop: true,
                    moveSlides: 1,
                    minSlides: numberOfVisibleSlides,
                    maxSlides: numberOfVisibleSlides
                };
            }
            function configureSlider() {
                var config = buildSliderConfiguration();

                if ($slider2 && $slider2.reloadSlider) {
                    $slider2.reloadSlider(config);
                } else {
                    $slider2 = $('.bestseller-product-slider').bxSlider(config);
                }
            }
            $(window).on("orientationchange resize", configureSlider);
            configureSlider();
        </script>
        <script>
            var $slider1;
            function buildSliderConfiguration() {

                var windowWidth = $(window).width();
                var numberOfVisibleSlides;

                if (windowWidth < 420) {
                    numberOfVisibleSlides = 2;
                } else if (windowWidth < 768) {
                    numberOfVisibleSlides = 4;
                } else if (windowWidth < 1200) {
                    numberOfVisibleSlides = 6;
                } else {
                    numberOfVisibleSlides = 7;
                }

                return {
                    pager: false,
                    slideMargin: 30,
                    mode: 'horizontal',
                    slideWidth: 250,
                    infiniteLoop: true,
                    moveSlides: 1,
                    minSlides: numberOfVisibleSlides,
                    maxSlides: numberOfVisibleSlides
                };
            }
            function configureSlider() {
                var config = buildSliderConfiguration();

                if ($slider1 && $slider1.reloadSlider) {
                    $slider1.reloadSlider(config);
                } else {
                    $slider1 = $('.brand-slider').bxSlider(config);
                }
            }
            $(window).on("orientationchange resize", configureSlider);
            configureSlider();
        </script>
        <script>
            function getTimeRemaining(endtime) {
                var t = Date.parse(endtime) - Date.parse(new Date());
                var seconds = Math.floor((t / 1000) % 60);
                var minutes = Math.floor((t / 1000 / 60) % 60);
                var hours = Math.floor((t / (1000 * 60 * 60)) % 24);
                var days = Math.floor(t / (1000 * 60 * 60 * 24) % 30.5);
                var months = Math.floor(t / (1000 * 60 * 60 * 24 * 30.5) % 12);
                return {
                    'total': t,
                    'days': days,
                    'hours': hours,
                    'minutes': minutes,
                    'seconds': seconds,
                    'months': months
                };
            }

            function initializeClock(id, endtime) {
                var clock = document.getElementById(id);
                var monthSpan = clock.querySelector('.months');
                var daysSpan = clock.querySelector('.days');
                var hoursSpan = clock.querySelector('.hours');
                var minutesSpan = clock.querySelector('.minutes');
                var secondsSpan = clock.querySelector('.seconds');

                function updateClock() {
                    var t = getTimeRemaining(endtime);
                    monthSpan.innerHTML = (('0' + t.months).slice(-2));
                    daysSpan.innerHTML = (('0' + t.days).slice(-2));
                    hoursSpan.innerHTML = ('0' + t.hours).slice(-2);
                    minutesSpan.innerHTML = ('0' + t.minutes).slice(-2);
                    secondsSpan.innerHTML = ('0' + t.seconds).slice(-2);

                    if (t.total <= 0) {
                        clearInterval(timeinterval);
                    }
                }

                updateClock();
                var timeinterval = setInterval(updateClock, 1000);
            }

            var deadline = new Date(Date.parse(new Date()) + 15 * 24 * 60 * 60 * 1000);
            initializeClock('clockdiv', deadline);
        </script>
        <a id="back-to-top" class="scrollTop back-to-top" href="javascript:void(0);" style="display: none;">
            <img src="<c:url value='/resources/images/teddy-bear.png'/>" class="tv-bounce img-responsive" alt="back-to-top">
        </a>
    </body>
</html>
