
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
</head>
<body>
	<div id="wrapper">

		<jsp:include page="/WEB-INF/views/admin/view/nav-bar.jsp"></jsp:include>

		<!-- /. NAV TOP  -->
		<jsp:include page="/WEB-INF/views/admin/view/slide-bar.jsp"></jsp:include>
		<!-- /. NAV SIDE  -->
		<div id="page-wrapper">
			<div id="page-inner">
				<div class="row">
					<div class="col-md-12">
						<h2>List of employee</h2>
						<h5>You can view, delete and edit employee information here</h5>
						<span style="color: red; font-style: italic; ">${message}</span>

					</div>
				</div>
				<!-- /. ROW  -->
				<hr />

				<div class="row">
					<div class="col-md-12">
						<!-- Advanced Tables -->
						
						 <a href="/WebBanDoChoi/admin/NV/insert.htm"><button type="button" class="btn btn-primary " style="float: right;
    margin-top: -6%;" >Add new employee</button></a>
						<div class="panel panel-default">
							<div class="panel-heading">Information table</div>
							<div class="panel-body">
								<div class="table-responsive">
									<table class="table table-striped table-bordered table-hover"
										id="dataTables-example">
										<thead>
											<tr>
												<th>ID</th>
												<th>Full name</th>
												<th>Phone number</th>
												<th>Email</th>
												<th>Address</th>
												<th>Working date</th>
												<th>Account</th>
												<th>Password</th>
												<th>Position</th>
												<th>Action</th>
												

											</tr>
										</thead>
										<tbody>
											<c:forEach items="${listNV}" var="listNV">
												<tr class="odd gradeX">
													<td class="id">${listNV.manv}</td>
													<td>${listNV.hoten.trim() }</td>
													<td>${listNV.sdt.trim() }</td>
													<td>${listNV.email.trim() }</td>
													<td>${listNV.diachi.trim() }</td>
													<td>${listNV.ngayvaolam }</td>
													<td>${listNV.dstaikhoan.taikhoan.trim() }</td>
													<td style="width: 100px;"><input style="border: none; background-color: #f9f9f9; width: 100%" type="password" value="${listNV.dstaikhoan.matkhau.trim() }" readonly="readonly"/></td>
													<td>${listNV.dstaikhoan.chucvu }</td>
													<td>
													<a
														href="/WebBanDoChoi/admin/NV/edit/${listNV.manv}.htm"
														class="center">Edit</a> | <a class="center js-delete" name="${listNV.manv}">Delete</a>
												
												</tr>
											</c:forEach>

										</tbody>
									</table>
								</div>

							</div>
						</div>
						<!--End Advanced Tables -->
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
	        	if(confirm("Are you sure you want to delete this employee ?")==false)
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