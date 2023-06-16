<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/include/taglib.jsp"%>
<%@include file="/WEB-INF/views/include/header.jsp"%>
 <script>
 document.getElementById("TenPage").innerHTML = "History Order";
 
 </script>
<script type="text/javascript">
function cancelButtonClick(x)
{
	var ip=document.getElementById("ipCancelOrder");
	var bt=document.getElementById("cancelButton");
	ip.value=x;
	bt.click();
}
</script>
<section class="padding-top100">
	<div class="container">
		<div class="row">
			<div class="col-md-12 col-sm-12 col-xs-12">
				<form action="cart/cancelOrder.htm">
					<c:forEach var="p" items="${order}">
						<div class="panel-group confirm-payment">
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title" style="display: inline-block;">
										<a class="accordion-toggle">Order ID: ${p.MSDDH} <i
											class="fa fa-caret-down"></i></a>
									</h4>
									<h4 class="panel-title"
										style="display: inline-block; float: right;">
										
										<c:choose>
         										<c:when test = "${p.trangThai.trim() =='NEW'}">
           											 <a class="accordion-toggle">WAITING </a>
        										 </c:when>
         										<c:when test = "${p.trangThai.trim() =='CANCELLED'}">
           											 <a class="accordion-toggle">CANCELLED </a>
        										 </c:when>
         										<c:otherwise>
											          <a class="accordion-toggle">${p.trangThai } </a>
											     </c:otherwise>
   										   </c:choose>
									</h4>
								</div>
								<div id="collapse-checkout-confirm"
									class="panel-collapse collapse" aria-expanded="true"
									style="display: block;">
									<div class="panel-body">
										<div class="table-responsive complete-order">
											<label for="input-email" class="control-label"
												style="display: inline;"><h5
													style="color: #ff3366; display: inline;">Full Name:</h5>
												${p.hoTenKH }</label> <br> <br> <label for="input-email"
												class="control-label" style="display: inline"><h5
													style="color: #ff3366; display: inline;">Address:</h5>
												${p.diaChi }</label> <br> <br> <label for="input-email"
												class="control-label" style="display: inline"><h5
													style="color: #ff3366; display: inline;">Phone Number:
												</h5> ${p.sdt }</label> <br> <br>

											<table class="table table-bordered table-hover">
												<thead>
													<tr>
														<th class="text-left">Product Name</th>
														<th class="text-left">Model</th>
														<th class="text-right">Quantity</th>
														<th class="text-right">Unit Price</th>
														<th class="text-right">Total</th>
													</tr>
												</thead>
												<tbody>
													<c:forEach var="x" items="${p.getCTDDH()}">
														<tr>
															<td class="text-left"><a
																style="display: inline-block;"> <img
																	src="<c:url value='/resources/images/${x.getSanPham().getHinhAnh()}'/>"
																	class="img-responsive"
																	style="width: 40px; display: inline; margin-right: 10px">

															</a> ${x.getSanPham().getTenSP()}</td>
															<td class="text-left">${x.getSanPham().getLoaiSP()}</td>
															<td class="text-right">${x.getSoLuong()}</td>
															<td class="text-right">${x.getSanPham().getDonGia()}</td>
															<td class="text-right">${x.getSanPham().getDonGia()*x.getSoLuong()}</td>
														</tr>

													</c:forEach>
												</tbody>
												<tfoot>
													<tr>
														<td class="text-right" colspan="4"><strong>Sub-Total:</strong></td>
														<td class="text-right">${p.tongGia }</td>
													</tr>

												</tfoot>
											</table>
										</div>

									<c:if test = "${p.trangThai.trim()!='CANCELLED'}">
										<div class="buttons">
											<div class="pull-right">
												<div class="site-btn" style="margin: 0;">
													<button id="cancelButton" style="display: none;"></button>
													<a
														onclick="cancelButtonClick('${p.MSDDH}')"
														style="background-color: #ff3366;" class="btn btn-1">
														<span class="txt">Cancel</span> <span class="round"
														style="background-color: #ff3366;"><i
															class="fa fa-chevron-right"></i></span>
													</a>
												</div>
											</div>
										</div>
									</c:if>
									</div>
								</div>
							</div>
						</div>
						
				</c:forEach>
				<input id="ipCancelOrder" name="cancelOrder" value="" style="display: none;" />
				</form>

				<c:forEach var="p" items="${HD}">
					<div class="panel-group confirm-payment">
						<div class="panel panel-default">
							<div class="panel-heading">
								<h4 class="panel-title" style="display: inline-block;">
									<a class="accordion-toggle">Order ID: ${p.DDH.MSDDH } -
										HD${p.soHoaDon} <i class="fa fa-caret-down"></i>
									</a>
								</h4>
								<h4 class="panel-title"
									style="display: inline-block; float: right;">
									<a class="accordion-toggle">Success </a>
								</h4>
							</div>
							<div id="collapse-checkout-confirm"
								class="panel-collapse collapse" aria-expanded="true"
								style="display: block;">
								<div class="panel-body">
									<div class="table-responsive complete-order">
										<label for="input-email" class="control-label"
											style="display: inline;"><h5
												style="color: #ff3366; display: inline;">Full Name:</h5>
											${p.DDH.hoTenKH }</label> <br> <br> <label
											for="input-email" class="control-label"
											style="display: inline"><h5
												style="color: #ff3366; display: inline;">Address:</h5>
											${p.DDH.diaChi }</label> <br> <br> <label for="input-email"
											class="control-label" style="display: inline"><h5
												style="color: #ff3366; display: inline;">Phone Number:
											</h5> ${p.DDH.sdt }</label> <br> <br> <label for="input-email"
											class="control-label" style="display: inline"><h5
												style="color: #ff3366; display: inline;">DATE:</h5>
											${p.ngayLapHoaDon }</label> <br> <br>

										<table class="table table-bordered table-hover">
											<thead>
												<tr>
													<th class="text-left">Product Name</th>
													<th class="text-left">Model</th>
													<th class="text-right">Quantity</th>
													<th class="text-right">Unit Price</th>
													<th class="text-right">Total</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach var="x" items="${p.DDH.getCTDDH()}">
													<tr>
														<td class="text-left"><a
															style="display: inline-block;"> <img
																src="<c:url value='/resources/images/${x.getSanPham().getHinhAnh()}'/>"
																class="img-responsive"
																style="width: 40px; display: inline; margin-right: 10px">

														</a> ${x.getSanPham().getTenSP()}</td>
														<td class="text-left">${x.getSanPham().getLoaiSP()}</td>
														<td class="text-right">${x.getSoLuong()}</td>
														<td class="text-right">${x.getSanPham().getDonGia()}</td>
														<td class="text-right">${x.getSanPham().getDonGia()*x.getSoLuong()}</td>
													</tr>

												</c:forEach>
											</tbody>
											<tfoot>
												<tr>
													<td class="text-right" colspan="4"><strong>Sub-Total:</strong></td>
													<td class="text-right">${p.tongGia}</td>
												</tr>

											</tfoot>
										</table>
									</div>

								</div>
							</div>
						</div>
					</div>

				</c:forEach>
			</div>
		</div>
	</div>
</section>

<%@include file="/WEB-INF/views/include/footer.jsp"%>
