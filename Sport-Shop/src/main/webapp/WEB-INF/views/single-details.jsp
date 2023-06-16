<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/include/taglib.jsp"%>
<%@include file="/WEB-INF/views/include/header.jsp"%>
 <script>
 document.getElementById("TenPage").innerHTML = "Detail Product";
 
 </script>
        <section class="single-product padding-top100">
            <div class="container">
                <div class="row">   
                    <div class="col-sm-6 col-md-7 product_page-rigth mt-40">
                        <div class="in-stock">
                            <div class="stock-btn">In Stock</div>
                            <div class="qty-stock" style="">
                                <span id="stock">100 in stock</span>
                            </div>
                            <div class="pro-title"><h2>${SP.tenSP }</h2></div>
                            <ul class="rating">
                                <li><i class="fa fa-star" aria-hidden="true"></i></li>
                                <li><i class="fa fa-star" aria-hidden="true"></i></li>
                                <li><i class="fa fa-star" aria-hidden="true"></i></li>
                                <li><i class="fa fa-star" aria-hidden="true"></i></li>
                                <li><i class="fa fa-star-o" aria-hidden="true"></i></li>
                            </ul>
                            <div class="product-description">
                                <p>${SP.moTa }</p>
                            </div>
                           
                            <div class="clearfix"></div>
                            <div class="price price-product">
                                <h2 class="price">
                                    ${SP.donGia }
                                </h2>
                            </div>
                          
                            <div class="confirm-action">
                                <div class="site-btn">
                                    <a href="product/index.htm" class="btn btn-1">
                                        <span class="txt">Back to Shop</span>
                                        <span class="round"><i class="fa fa-chevron-right"></i></span>
                                    </a>
                                </div>
                               
                            </div>
                        </div>
                        <div class="row border_dash">
                            <div class="col-md-4 col-sm-4 col-xs-4 width-100">
                                <div class="features">
                                    <i class="fa fa-money" aria-hidden="true"></i>
                                    <p>Money Back</p>
                                </div>
                            </div>
                            <div class="col-md-4 col-sm-4 col-xs-4 width-100">
                                <div class="features">
                                    <i class="fa fa-cog" aria-hidden="true"></i>
                                    <p>30 Day Return Policy</p>
                                </div>
                            </div>
                            <div class="col-md-4 col-sm-4 col-xs-4 width-100">
                                <div class="features">
                                    <i class="fa fa-car" aria-hidden="true"></i>
                                    <p>Guaranteed 5 Day Delivery</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-6 col-md-5 product_page-left">
                        <div class="product-gallery">
                            <ul class="thumbnails list-unstyled">
                                <li class="main-image-set"><a class="thumbnail"><img src="<c:url value='/resources/images/${SP.hinhAnh }'/>" class="changeimg"></a></li>
                                <li class="image-additional"><a class="thumbnail"> <img class="galleryimg" src="<c:url value='/resources/images/${SP.hinhAnh }'/>"></a></li>
                            </ul>
                            <div class="clearfix"></div>
                        </div>
                    </div>
                    
                </div>
        </section>

        
<%@include file="/WEB-INF/views/include/footer.jsp"%>
