<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<c:url value="/resources/static" var="url"></c:url>
<!DOCTYPE html>
<html>
<head>
<script src="<c:url value="/ckeditor/ckeditor.js" />"></script>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Edit User</title>
<!-- BOOTSTRAP STYLES-->
<link href="${url}/css/bootstrap.css" rel="stylesheet" />
<!-- FONTAWESOME STYLES-->
<link href="${url}/css/font-awesome.css" rel="stylesheet" />
<!-- CUSTOM STYLES-->
<link href="${url}/css/custom.css" rel="stylesheet" />
<!-- GOOGLE FONTS-->
<link href='http://fonts.googleapis.com/css?family=Open+Sans'
	rel='stylesheet' type='text/css' />
	<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.0/font/bootstrap-icons.css">
	
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
	display: none;
}

.modal-form {
	margin-top: 25px;
	margin-left: 18%;
}

.modal-body {
	display: flex;
	flex-direction:column;
	justify-content: center;
	margin-left: 30px;
}
.modal-title{
    margin-left: 30px;
    }
.modal-content{
	border-radius: 16px;
}
#modal-delete{
    padding-top: 6%;
    padding-left: 8%;

}

#modal-success {
	display: none;
	margin-top: 9%;
    margin-left: 14%;
}

.bi-gear {
	color: black
}

.table {
	
}
.input_order{
	width: 92%;
	margin-bottom: 10px;
	background: #0000001c;
	border-radius: 4px;
	border: 1px solid black;
}
 .btn_detail{
	margin-right: 38px;
}
 .btn_submit{
 	margin-right: 5px;
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

.input_order {
}
.labels{
	    font-weight: 500;
	}
.bi-trash{
	color:#000000bf;
	padding-left: 5px;
}	
.bi-check-circle-fill{
	color: blue;
}
.modal-ct{
	    margin-left: 25%;
   	 	height: 50px;
   	 	margin-top: 18px;
   	 	
}	
	
.border-form{
	width: 100%;
	margin-top: 3%;
	border: 1px solid black;
	border-radius:5px;
	margin-left: 3%;
    margin-right: 3%;
	}
	.table-view{
	width: 96%;
    margin-left: 2%;
    margin-top: 5%;
	}
	.bi-gear {
    color: #df1919;
  
    
}
.bi-trash {
    color: #23af19;
}
	.title-table{
	background: #120d0db0;
	}
 	.content-title{
 	text-align: inherit;
    padding-top: 11px;
    margin-left: 21px;
    padding-bottom: 14px;
 	color: white;
 	font-family: auto;
 	}
 	.bi-check-circle-fill{
	color: blue;
	padding-right: 5px;
	
}
.bi-exclamation-circle-fill{
	color: #ff5000;
	padding-right: 5px;
}	
.link-history
{
	color: #dc3545!important;
	font-weight: 500;
	float: right;
    margin-bottom: 8px;
}
.link-history:hover {
	opacity: 0.8;
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
			<div class="border-form" style="">
    <div class="title-table">
 		<h4 class="content-title">Order List</h4>
 		</div>
 		
 	<div class="table-view">
 	<a style=""  href="/WebBanDoChoi/staff/order/personal.htm" class="link-history">Your application confirmation history</a>
			<table id="table" class="table table-hover table-bordered" id="table_order">
				<thead style="background-color: #0000000d;">
					<tr>
						<th scope="col">Order ID</th>
						<th scope="col">Customer</th>
						<th scope="col">Phone number</th>
						<th scope="col">Email</th>
						<th scope="col">Address</th>
						<th scope="col">Status</th>
						<th scope="col">Action</th>
					</tr>
				</thead>
				<tbody id="table_sanpham">

					<c:forEach var="u" items="${dondh}">
						<tr>
							<th scope="row">${u.msddh}</th>
							<td>${u.hotenkh}</td>
							<td>${u.SDT}</td>
							<td>${u.email}</td>
							<td>${u.diachi}</td>
							<td>${u.trangthai}</td>
							<td><a class="btn-setting ${u.trangthai.trim()}" 
								><i class="bi bi-gear"></i></a>
								<a class="btn-delete ${u.trangthai.trim()}" ><i class="bi bi-trash" ></i></a>
								</td>
								
						</tr>
					</c:forEach>


				</tbody>
			</table>
		</div>
		</div>
		<div class="modal" id="modal">


			<form:form action="order.htm" method="POST" >
			<div class="modal-form" id="modal-form" tabindex="-1" role="dialog">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title">Xác nhận đơn đặt hàng</h5>
							<button type="button" class="close" onclick="Close()"
								data-dismiss="modal" aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						
							<div class="modal-body">
							<label class="labels">ID:</label><input
									class="input_order form-control" type="text" id="ID" name="id" value=""  readonly="readonly">
								<label class="labels" >Customer:</label><input
									class="input_order form-control" type="text" id="name" value=""  readonly="readonly"> <label
									class="labels">Phone number:</label><input id="SDT" class="input_order form-control"
									type="text" value=""  readonly="readonly"> <label class="labels">Email:</label><input
									class="input_order form-control" type="text" id="email" value=""  readonly="readonly"> <label
									class="labels">Address:</label><input class="input_order form-control" id="diachi"
									type="text" value=""  readonly="readonly"> 
							</div>
						
						<div class="modal-footer">
				
							<button type="submit" name="btnAccept" class="btn btn-primary btn_submit"  formaction="order.htm" >Confirm</button>
								<button type="submit" name="btnCT" class="btn btn-primary btn_detail" formaction="order/detail.htm" >
							View details
							</button>
							
						</div>
					</div>
				</div>
			</div>
			
			<div id="modal-success" tabindex="-1">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title">Notification</h5>
							<button type="button" class="btn-close" data-mdb-dismiss="modal"
								aria-label="Close" onclick="Close()"></button>
						</div>
						<div class=" modal-ct" style=""><i class="bi check " style=""></i>
						<b id="Content" style="align-content: center"> </b>
							
						</div>
						<div class="modal-footer">
							<a onclick="Close()" ><button type="button" class="btn btn-primary btn_Oke" style="border-color: none !"
								onclick="Close()">OK</button></a>
								<button name="btnCT"  class="btn btn-primary btn_detail" formaction="order/detail.htm">
							View details
							</button>
						</div>
					</div>
				</div>
			</div>
			<div id="modal-delete" tabindex="-1">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title">Notification</h5>
							<button type="button" class="btn-close" data-mdb-dismiss="modal"
								aria-label="Close" onclick="Close()"></button>
						</div>
						<div class="modal-body" style="margin-left: 13%;">
						<b style="align-content: center"><i class="bi check-icon bi-exclamation-circle-fill" style="color: #ff5000;padding-right: 10px"></i>Do you really want to delete this order ?</b>
							
						</div>
						<div class="modal-footer">
							
								<button name="btnCT"  class="btn btn-primary btn_detail" formaction="order/delete.htm">
								Confirm
							</button>
						</div>
					</div>
				</div>
			</div>
			</form:form>
		</div>
			<!-- /. PAGE INNER  -->
		</div>
		<!-- /. PAGE WRAPPER  -->
	</div>
	<!-- /. WRAPPER  -->
	<!-- SCRIPTS -AT THE BOTOM TO REDUCE THE LOAD TIME-->
	<!-- JQUERY SCRIPTS -->
	<script src="${url}/js/jquery-1.10.2.js"></script>
	<!-- BOOTSTRAP SCRIPTS -->
	<script src="${url}/js/bootstrap.min.js"></script>
	<!-- METISMENU SCRIPTS -->
	<script src="${url}/js/jquery.metisMenu.js"></script>
	<!-- CUSTOM SCRIPTS -->
	<script src="${url}/js/custom.js"></script>
<script type="text/javascript" language="javascript">
   CKEDITOR.replace('editer', {width: '700px',height: '300px'});
</script>

<script type="text/javascript">
	var btnContainer = document.getElementById("list_item");
	var btns = btnContainer.getElementsByClassName("nav-link");

	// Loop through the buttons and add the active class to the current/clicked button
	for (var i = 0; i < btns.length; i++) {
		btns[i].addEventListener("click", function() {
			var current = document.getElementsByClassName("active");
			current[0].className = current[0].className.replace(" active", "");
			this.className += " active";
		});
	}
</script>

<script type="text/javascript">
	var btns = document.getElementsByClassName("NEW");

	// Loop through the buttons and add the active class to the current/clicked button
	for (var i = 0; i < btns.length; i++) {
		btns[i].addEventListener("click", function() {
			document.getElementById('modal').style.display = "block";
			document.getElementById('modal-success').style.display = "none";
			document.getElementById('modal-form').style.display = "block";
			document.getElementById('modal-delete').style.display = "none";
		});
	}
	
	var btns = document.getElementsByClassName("btn-delete ");

	// Loop through the buttons and add the active class to the current/clicked button
	for (var i = 0; i < btns.length; i++) {
		btns[i].addEventListener("click", function() {
			document.getElementById('modal').style.display = "block";
			document.getElementById('modal-success').style.display = "none";
			document.getElementById('modal-form').style.display = "none";
			document.getElementById('modal-delete').style.display = "block";
			
		});
	}
	
	
</script>


<script type="text/javascript">
	var btns = document.getElementsByClassName("btn-setting CONFIRMED");

	// Loop through the buttons and add the active class to the current/clicked button
	for (var i = 0; i < btns.length; i++) {
		
		btns[i].addEventListener("click", function() {
			var current = document.getElementsByClassName("bi check");
			console.log(current);
			current[0].className = current[0].className="bi check bi-check-circle-fill";
			
			document.getElementById('Content').innerHTML = "This order has been confirmed !"; 
			document.getElementById('modal').style.display = "block";
			document.getElementById('modal-success').style.display = "block";
			document.getElementById('modal-form').style.display = "none";
			document.getElementById('modal-delete').style.display = "none";
			 
		});
	}
	
	var btnss = document.getElementsByClassName("CANCELLED");
	

	// Loop through the buttons and add the active class to the current/clicked button
	for (var i = 0; i < btnss.length; i++) {
		btnss[i].addEventListener("click", function() {
			var current = document.getElementsByClassName("bi check");
			current[0].className = current[0].className="bi check bi-exclamation-circle-fill"
			console.log(current);
			document.getElementById('Content').innerHTML = "This order has been canceled !"; 
			document.getElementById('modal').style.display = "block";
			document.getElementById('modal-success').style.display = "block";
			document.getElementById('modal-form').style.display = "none";
			document.getElementById('modal-delete').style.display = "none";
			
			
		});
	}
</script>

<script type="text/javascript">

	function Close() {

		document.getElementById('modal').style.display = "none";

	}

</script>
<script>
	var table = document.getElementById('table');

	for (var i = 1; i < table.rows.length; i++) {
		table.rows[i].onclick = function() {
			//rIndex = this.rowIndex;
			document.getElementById("ID").value = this.cells[0].innerHTML;
			document.getElementById("name").value = this.cells[1].innerHTML;
			document.getElementById("SDT").value = this.cells[2].innerHTML;
			document.getElementById("email").value = this.cells[3].innerHTML;
			document.getElementById("diachi").value = this.cells[4].innerHTML;
			
		};
	}
</script>

</body>
</html>