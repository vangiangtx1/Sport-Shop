
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
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

.input_order {
	width: 75%;
}
.btn-close:hover{
opacity: 0.7;
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
			<div id="page-inner">
				<div class="modal" id="modal">
					<div id="modal-success" tabindex="-1">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" style="font-size: large;">
										Notification<a href="/WebBanDoChoi/staff/${link}.htm"><button
												style="float: right; margin-right: 2%; background-color: #242429; border: none; border-radius: 4px"
												type="button" class="btn-close" onclick="Close()"
												data-dismiss="modal" aria-label="Close">
												<span aria-hidden="true">&times;</span>
											</button></a>
									</h5>

								</div>
								<div class="modal-body"
									style="margin-left: 23%; margin-top: 2%;">
									<b
										style="align-content: center; font-size: larger; margin-left: 6%;">${message}</b>
									
								</div>
								<div class="modal-footer">
									<a href="/WebBanDoChoi/staff/${link}.htm"><button
											type="button" class="btn btn-primary btn_Oke"
											style="border-color: none!" onclick="Close()">OK</button></a>
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
	<script type="text/javascript">   
	    const buyBtns = document.querySelectorAll('.js-delete')
	    console.log(buyBtns);
	    for(const buyBtn of buyBtns){
	        buyBtn.addEventListener('click', function(){
	        	if(confirm("Bạn có chắc muốn xóa nhân viên này")==false)
	        	{
	        		buyBtn.href="/WebBanDoChoi/admin/NV.htm";
	        		

	        	}
	        	else
	        	{
	        		console.log(buyBtn.getAttribute("name"));
	        		var t = "/WebBanDoChoi/admin/NV/delete/" + buyBtn.getAttribute("name") + ".htm";
	        		buyBtn.href= t ;

	        	}
	        });
	    }
	</script>


</body>
</html>