<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<c:url value="/resources/static" var="url"></c:url>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Order Management</title>
<!-- BOOTSTRAP STYLES-->
<link href="${url}/css/bootstrap.css" rel="stylesheet" />
<!-- FONTAWESOME STYLES-->
<link href="${url}/css/font-awesome.css" rel="stylesheet" />
<!-- MORRIS CHART STYLES-->

<!-- CUSTOM STYLES-->
<link href="${url}/css/custom.css" rel="stylesheet" />
<!-- GOOGLE FONTS-->
<link href='http://fonts.googleapis.com/css?family=Open+Sans'
	rel='stylesheet' type='text/css' />
<!-- TABLE STYLES-->
<link href="${url}/js/dataTables/dataTables.bootstrap.css"
	rel="stylesheet" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<style type="text/css">
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

.bi-gear {
	color: black
}

.table {
	max-width: 520px;
	max-height: 300px;
}

.hr-form {
	max-width: 548px;
	margin: auto;
	margin-top: 22px;
	margin-left: 10%
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

.anhsp {
	width: 30px;
	height: 30px;
}

.input_order {
	width: 100%;
}

.row {
	margin-left: 10%;
	margin-top: 2%;
}

.col {
	
}

.form-detail {
	width: 700px;
	height: 500px;
	background: white;
	margin-left: 30%;
	margin-top: 30px;
	border: 2px solid black;
}

.form-border {
	width: 660px;
	height: 470px;
	margin-left: 18px;
	border: 2px solid #41464bb8;
	margin-top: 14px;
}

.header-form {
	height: 150px;
}

.tittle-header {
	max-width: 300px;
	margin-left: 30%;
	padding-top: 6%;
	margin-top: -1%;
	color: #002bff;
}

.body-form {
	height: 200px;
}

.footer-form {
	margin-left: 1%;
	margin-top: -1%;
}

.btn-close {
	float: right;
	margin-top: -9%;
	margin-right: 3%;
	opacity: 1;
	background: #000000c2;
	color: black;
	width: 24px;
	height: 24px;
	padding-left: 5px;
	padding-top: 2px;
	border-radius: 3px;
}

.btn-close:hover {
	cursor: pointer;
	opacity: 0.5;
}

label {
	font-weight: 600 !important;
}

.list-order {
	list-style-type: decimal;
	width: 516px;
	height: 151px;
	white-space: nowrap;
	border: 1px solid #000000;
	overflow: scroll;
	text-overflow: clip;
}

.title_sp, .formlist {
	margin-left: 12%;
	margin-top: 2%;
}

.noidung {
	font-weight: 450;
}

.table-responsive {
	max-height: 80%;
	max-width: 82%;
}

.my-custom-scrollbar {
	position: relative;
	height: 170px;
	overflow: auto;
}

.table-wrapper-scroll-y {
	display: block;
}
</style>
</head>
<body>
	<div id="wrapper">

		<jsp:include page="/WEB-INF/views/admin/view/nav-bar.jsp"></jsp:include>

		<!-- /. NAV TOP  -->
		<jsp:include page="/WEB-INF/views/admin/view/slide-bar.jsp"></jsp:include>
		<!-- /. NAV SIDE  -->
		<div id="page-wrapper">
			<div class="modal" id="modal">
				<div class="form-detail">
					<div class="form-border">
						<div class="header-form">
							<h3 class="tittle-header"
								style="FONT-WEIGHT: 600; margin-left: 33%;">Order details</h3>
							<a class="btn-close" href="/WebBanDoChoi/staff/${linkx}.htm"><i
								class="bi bi-x-lg"></i></a>
							<div class="info" style="display: flex; flex-direction: column;">
								<div class="row"
									style="margin-top: 5%; display: flex; justify-content: space-between; margin-right: 3%;position: relative;">
									<div class="col" style="margin-left: 3%;width: 347px;">
										<label>Receiver:<span class="noidung">${ctddh.hotenkh}</span></label>
										<br> <label>Address:<span class="noidung">
												${ctddh.diachi}</span></label>
									</div>
									<div class="col" style="    width: 300px;">
										<label>Phone number: <span class="noidung">${ctddh.SDT}</span></label>
										<br> <label>Email: <span class="noidung">${ctddh.email}</span></label>
									</div>
								</div>
							</div>
						</div>
						<hr class="hr-form">
						<div class="body-form">
							<h5 class="title_sp" style="font-weight: 600; font-size: larger;">List of products</h5>
							<div class="table-wrapper-scroll-y my-custom-scrollbar" style=" width: 524px;margin-left: 12%;">


								<table class="table table-bordered table-striped mb-0">
									<thead>
										<tr>
											<th scope="col">Product name</th>
											<th scope="col">Image</th>
											<th scope="col">Quantity</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="u" items="${ctddh.getCtddhlist()}">
											<tr>

												<th scope="row">${u.getSanpham().getTensp()}</th>
												<td><img alt="image" class="anhsp"
													src="/WebBanDoChoi/imageProducts/${u.getSanpham().getHinhanh()}">
												</td>
												<td>${u.getSL()}</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>




							</div>
						</div>
						<hr class="hr-form">
						<div class="footer-form">
							<div class="row"
								style="display: flex; justify-content: space-between; margin-right: 6%;">
								<div class="col" style="margin-left: -9%; margin-right: 34%;">
									<label style="">Total: ${Tonggia} $<span
										class="noidung"></span></label>

								</div>
								<div class="col">
									<label>Status: <span class="noidung"
										style="font-weight: 500">${ctddh.trangthai}</span></label> <br> <label>Ordering date: <span class="noidung">${ctddh.getHoadon().getNgaylaphd()}</span>
									</label>
								</div>
							</div>
						</div>
					</div>
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
