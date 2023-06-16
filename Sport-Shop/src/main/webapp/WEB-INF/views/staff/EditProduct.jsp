<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
	<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<c:url value="/resources/static" var="url"></c:url>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>List User</title>
<!-- BOOTSTRAP STYLES-->
<link href="${url}/css/bootstrap.css" rel="stylesheet" />
<link href="${url}/css/container.css" rel="stylesheet" />
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
<style type="text/css">
.form-edit {width =662px;
	height: 531px;
	color: black;
}
.bodyform-edit{
	display: flex;
	flex-direction: column;
	background: #cccccc5c; 
	margin-right: 64px; 
	height: 670px;
 	margin: auto;
  	width: 900px; 
   	border-radius: 25px;
   	padding-left:90px;
  	padding-right: 30px;
  	margin-left: 8%;
    margin-top: 2%;
}
.order_sell {
	float: right !important;
}

.btn-setting:hover, .btn-delete:hover {
	opacity: 0.5;
}

.btn-setting, .btn-delete {
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

.modal-title {
	margin-left: 150px;
}

.modal-form {
	margin-top: 60px;
	margin-left: 400px;
}

.modal-body {
	display: flex;
	flex-direction: column;
	justify-content: center;
	margin-left: 28px;
}

.modal-content {
	border-radius: 12px;
	margin-right: 118px;
}

#modal-success {
	display: none;
	margin-top: 80px;
	margin-left: 120px;
}

.modal-footer {
	margin-right: 33px;
}

.bi-gear {
	color: #df1919;
	padding-right: 6px;
}

.bi-trash {
	color: #23af19;
}

.table {
	
}
#mota{
height: 100px;
}
.order {
	display: none;
}

.input_order {
	margin-bottom: 10px;
	width: 100%;
}

.btn-mr20 {
	margin-right: 20px
}
.btn-update{
	width: 25vh;
	margin-left: 90vh;
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

.anhsp {
	width: 36px;
	height: 36px;
}


.labels {
	font-weight: 500;
}

.heading-formProduct{
	padding-top: 20px;
	margin-bottom: 30px;
	margin-bottom: -2%;
    margin-left: -4%;
}
.row{
	padding-bottom: 20px;
	width: 119vh;
}
.col{
	
}
.title-form{
	margin-top: 36px;  
    color: #0d6efd;
    margin-left: 34%;
    font-size: 4rem;
    font-family: auto;
    
}
.id_sp{
	margin-left:5px;
	border: none;
	background: inherit;
	font-weight: 600;
}
 #loaisp ,	#nuocsx{
 	background: #0000000f;
 	font-weight: 500;
 }
  *[id$=errors]{
color:red;
font-style: italic;
}
.loi{
color:red;
font-style: italic;
}
.row_1,.row_2,.row_3{
margin-top: 40px;
margin-right: 5%;
margin-left: -4%;

}
.row_1{
justify-content: space-between;
    display: flex;

}
.row_2{
justify-content: space-between;
    display: flex;

}
.row_3{
justify-content: space-between;
    display: flex;
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
			
		<form:form action="update.htm" modelAttribute="product" method="POST" 
			class="bodyform-edit needs-validation"  >
			<h2 class="title-form">Product Edit</h2>
			
			<label class="labels heading-formProduct" style="">Product ID:<form:input 
				 type="text" value="" path="masp" class="id_sp" readonly="true" />
			</label>
			<div class="body-form">
				<div class="row_1" style="    margin-top: 56px;">
			
			  <div class="" style="width: 191px;" >
			  <label class="labels">Product name:</label><form:input placeholder="Please enter product name"
				class="input_order form-control " type="text" id="validationCustom01" value="" path="tensp" />
				<form:errors path="tensp"/>
				<div class="loi">${message}</div>
			  </div>
			  <div class="" style="width: 191px;">
			  <label class="labels">Sale:</label><form:input placeholder="Please enter sale"
				class="input_order form-control " type="number" min="0" step="0.1" max="1" value="" path="sale" />
				<form:errors path="sale"/>
			  </div>
			  <div class="" style="width: 191px;">
			  <label
				class="labels">Made in:</label><form:select path="nuocsx" items="${nuoc}"  style="height: 35px"
				class="input_order form-control"/>
				<form:errors path="nuocsx"/>
			  </div>
			</div>
			<div class="row_2">
			 <div class="" style="width: 350px;">
			 <label
				class="labels">Price:</label><form:input placeholder="Please enter price" class="input_order form-control" path="dongia"
				type="number" value=""/>
				<form:errors path="dongia"/>
			 </div>
			 <div class="" style="width: 350px;">
			  <label class="labels">Description</label>
			<form:textarea placeholder="Please enter description" rows="4" cols="10" class="input_order form-control" path="mota" />
			
			</div>
			</div>
			<div class="row_3">
			<div class="">
			<label class="labels">Quantity:</label><form:input  placeholder="Please enter quantity" class="input_order form-control" path="soluongton"
				type="number" value="" /> 
				<form:errors path="soluongton"/>
			</div>	
			<div class="">
			<label class="labels">Image :</label><form:input placeholder="Please choose a image" class="input_order form-control" type="text"  value="" path="hinhanh"/>
				</div>
				<div class="" style="width: 191px;">
				<label class="labels">Product type:</label><form:select path="loaisp" items="${loaisps}"  style="height: 36px"
				class="input_order form-control">
				</form:select>
				<form:errors path="loaisp"/>
			</div>
			</div>
			<button name="btnUpdate" type="submit" class="btn btn-primary btn-update" style="    margin-top: 5%; margin-left: 75%;">Update Products</button>
			</div>
			
			
		</form:form>
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
	<script type="text/javascript">   
	    const buyBtns = document.querySelectorAll('.js-delete')
	    console.log(buyBtns);
	    for(const buyBtn of buyBtns){
	        buyBtn.addEventListener('click', function(){
	        	if(confirm("Are you sure you want to delete this employee?")==false)
	        	{
	        		buyBtn.href="/java5/admin/NV.htm";
	        		

	        	}
	        	else
	        	{
	        		console.log(buyBtn.getAttribute("name"));
	        		var t = "/java5/admin/NV/delete/" + buyBtn.getAttribute("name") + ".htm";
	        		buyBtn.href= t ;

	        	}
	        });
	    }
	</script>


</body>
</html>