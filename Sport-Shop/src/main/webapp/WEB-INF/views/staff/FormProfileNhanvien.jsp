
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
	<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<c:url value="/resources/static" var="url"></c:url>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>List User</title>
<link href="${url}/css/bootstrap.css" rel="stylesheet" />
<!-- FONTAWESOME STYLES-->
<link href="${url}/css/font-awesome.css" rel="stylesheet" />
<!-- CUSTOM STYLES-->
<link href="${url}/css/custom.css" rel="stylesheet" />
<!-- GOOGLE FONTS-->
<link href="${url}/js/dataTables/dataTables.bootstrap.css"
	rel="stylesheet" />
<link href='http://fonts.googleapis.com/css?family=Open+Sans'
	rel='stylesheet' type='text/css' />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.0/font/bootstrap-icons.css">
<link href="<c:url value='resources/assets/dist/signin.css' />"
	rel="stylesheet">
		
    <link rel="canonical" href="https://getbootstrap.com/docs/5.0/examples/sign-in/">
	<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
	<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.0/font/bootstrap-icons.css">

    <!-- Bootstrap core CSS -->

	
	
	<style>
.order_sell {
	float: right !important;
}

.btn-setting:hover {
	opacity: 0.5;
}

.btn-setting {
	cursor: pointer
}

.btn:hover {
	background-color: #41464b;
	color: white;
	
}


#btn_huy, .btn_Oke {
	width: 90px;
}

.modal {
	position: fixed;
	top: 0;
	right: 0;
	bottom: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background: #00000040;
	display: block;
}

#modal-success {
	display: block;
	margin-top: 80px;
	margin-left: 120px;
	margin-top: 10%;
}

.bi-gear {
	color: black
}

.table {
	
}

.order {
	display: none;
}

.btn-mr20 {
	margin-right: 20px
}

a {
	color: white !important;
	text-decoration: none;
}

.sign-out:hover {
	opacity: 0.5;
}

.bd-placeholder-img {
	font-size: 1.125rem;
	text-anchor: middle;
	-webkit-user-select: none;
	-moz-user-select: none;
	user-select: none;
}

@media ( min-width : 768px) {
	.bd-placeholder-img-lg {
		font-size: 3.5rem;
	}
}

.product_image {
	width: 16px;
	height: 16px;
}

.form:input_order {
	width: 75%;
}

.form-control:focus {
    box-shadow: none;
    border-color: #BA68C8
}

.profile-button {
    background: rgb(99, 39, 120);
    box-shadow: none;
    border: none
}

.profile-button:hover {
    background: #682773
}

.profile-button:focus {
    background: #682773;
    box-shadow: none
}

.profile-button:active {
    background: #682773;
    box-shadow: none
}

.back:hover {
    color: #682773;
    cursor: pointer
}

.labels {
    font-size: 11px
}

.add-experience:hover {
    background: #BA68C8;
    color: #fff;
    cursor: pointer;
    border: solid 1px #BA68C8
}
a{
	color:white !important;
	text-decoration: none;
}
.sign-out:hover{
		opacity: 0.5;
	}
.body{
background-color: black;
}
.rounded-circle{
    border-radius: 50%!important;
        margin-top: 3rem!important;
        vertical-align: middle;
}
.col-md-12{
	padding-bottom: 10px;
}
</style>
</head>
<body>
	<div id="wrapper">

		<jsp:include page="/WEB-INF/views/admin/view/nav-bar.jsp"></jsp:include>

		<!-- /. NAV TOP  -->
		<jsp:include page="/WEB-INF/views/admin/view/slide-bar.jsp"></jsp:include>
		<!-- /. NAV SIDE  -->
		<div id="page-wrapper" style="background-color: #282a35!important;">
			<div id="page-inner" style="background: transparent!important;">
			
   <div style="display:flex;  justify-content: center; ; background: #ccc;margin-right: 64px;height: 500px;margin: auto;width: 853px;border: 2px solid; border-radius: 25px">
   <div class="col-md-3 border-right" style="margin-right: 8%;margin-top: 10%;">
            <div class="d-flex flex-column align-items-center text-center p-3 py-5">
            <div style="display: flex;flex-direction: column;">
            <img class="rounded-circle mt-5" style="    margin-left: 22%;margin-bottom: 8%;" src="/WebBanDoChoi/imageProducts/${Nhanvien.hinhanh}" width="100px" height="150px"  >
            <label>${Nhanvien.hoten}</label>
            <span>${Nhanvien.email}</span>
            </div>
            <span> </span></div>
        </div>
        <div class="col-md-5 border-right" style="    margin-top: -3%;">
          <form:form action="update.htm" modelAttribute="Nhanvien" method="POST">
            <div class="p-3 py-5" style="margin-top: 27%;">
                <div class="d-flex justify-content-between align-items-center mb-3">
                    <h4 class="text-left"style="font-size: x-large;font-weight: 600">Profile Settings</h4>
                </div>
               
                <div class="row mt-3">
                <div class="col-md-12"><label class="labels">Name</label><form:input type="text" class="form-control" placeholder="enter your name" path="hoten" /></div>
                <div class="col-md-12" style="display: none;"><label class="labels">MaNhanVien</label><form:input type="text" class="form-control" placeholder="enter phone number" path="manv" /></div>
                 <div class="col-md-12" style="display: none;"><label class="labels">HinhAnh</label><form:input type="text" class="form-control" placeholder="enter phone number" path="hinhanh" /></div>
                    <div class="col-md-12"><label class="labels">PhoneNumber</label><form:input type="text" class="form-control" placeholder="enter phone number" path="sdt" /></div>
                    <div class="col-md-12"><label class="labels">Address</label><form:input type="text" class="form-control" placeholder="enter address" path="diachi" /></div>
                    <div class="col-md-12"><label class="labels">Email ID</label><form:input type="text" class="form-control" placeholder="enter email id" path="email"/></div>
                   
                </div>
                
                <div class="mt-4 text-center"><button  class="btn btn-primary profile-button" type="submit" style="margin-top: 5%;padding: 11px;padding-left: 21px;padding-right: 21px;">Save Profile</button></div>
            </div>
          
          </form:form>
   </div>
</div>

			</div>
		</div>

		<!-- /. PAGE INNER  -->
	</div>
	<!-- /. PAGE WRAPPER  -->
	<!-- /. WRAPPER  -->
	<!-- SCRIPTS -AT THE BOTOM TO REDUCE THE LOAD TIME-->
	<!-- JQUERY SCRIPTS -->
	<script src="${url}/js/jquery-1.10.2.js"></script>
	<!-- BOOTSTRAP SCRIPTS -->
	<script src="${url}/js/bootstrap.min.js"></script>
	<!-- METISMENU SCRIPTS -->
	<script src="${url}/js/jquery.metisMenu.js"></script>
	<!-- DATA TABLE SCRIPTS -->
	<script src="${url}/js/dataTables/jquery.dataTables.js"></script>
	<script src="${url}/js/dataTables/dataTables.bootstrap.js"></script>
	<script>
		$(document).ready(function() {
			$('#dataTables-example').dataTable();
		});
	</script>
	
	<!-- CUSTOM SCRIPTS -->
	<script src="${url}/js/custom.js"></script>
	


</body>
</html>