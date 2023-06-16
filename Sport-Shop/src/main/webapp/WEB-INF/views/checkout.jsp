<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/include/taglib.jsp"%>
<%@include file="/WEB-INF/views/include/header.jsp"%>
 <script>
 document.getElementById("TenPage").innerHTML = "Checkout";
 
 </script>
<section class="padding-top100">
	<div class="container">
		<div class="row">
			<div class="col-md-12 col-sm-12 col-xs-12">
				<form:form action="cart/confirmCart.htm" modelAttribute="DDH">
					<div class="panel-group confirm-payment">
						<!--id="accordion"  -->

						<div class="panel panel-default">
							<div class="panel-heading">
								<h4 class="panel-title">
									<a class="accordion-toggle">Step 1: Information <i
										class="fa fa-caret-down"></i></a>
								</h4>
							</div>
							<div class="panel-collapse collapse"
								id="collapse-payment-address"
								style="height: auto; display: block">
								<div class="panel-body">
									<div class="row"
										style="display: flex; justify-content: center;">
										<div class="col-sm-6">
											<fieldset id="account">
												<legend>Your Personal Details</legend>
												<p>${message }</p>
												<div style="display: none;" class="form-group">
													<label class="control-label">Customer Group</label>
													<div class="radio">
														<label> <input type="radio" checked="checked"
															value="1" name="customer_group_id"> Default
														</label>
													</div>
												</div>
												<div class="form-group required">
													<label for="input-payment-firstname" class="control-label">Full
														Name</label>
													<form:input path="hoTenKH" type="text" class="form-control" />
													<p
														style="color: #ff3366; font-size: 12px; margin-top: 5px; margin-bottom: 0px;">
														<form:errors path="hoTenKH" cssClass="errors" />
													</p>
												</div>

												<div class="form-group required">
													<label for="input-payment-email" class="control-label">Adress</label>
													<form:input path="diaChi" type="text" class="form-control" />
													<p
														style="color: #ff3366; font-size: 12px; margin-top: 5px; margin-bottom: 0px;">
														<form:errors path="diaChi" cssClass="errors" />
													</p>
												</div>
												<div class="form-group required">
													<label for="input-payment-telephone" class="control-label">Telephone</label>
													<form:input path="sdt" type="text" class="form-control" />
													<p
														style="color: #ff3366; font-size: 12px; margin-top: 5px; margin-bottom: 0px;">
														<form:errors path="sdt" cssClass="errors" />
													</p>
												</div>
												<div class="form-group required">
													<label for="input-payment-telephone" class="control-label">Email</label>
													<form:input path="email" type="text" class="form-control" />
													<p
														style="color: #ff3366; font-size: 12px; margin-top: 5px; margin-bottom: 0px;">
														<form:errors path="email" cssClass="errors" />
													</p>
												</div>
											</fieldset>
										</div>
									</div>
								</div>
							</div>
						</div>

						<div class="panel panel-default">
							<div class="panel-heading">
								<h4 class="panel-title">
									<a class="accordion-toggle">Step 2: Confirm Order <i
										class="fa fa-caret-down"></i></a>
								</h4>
							</div>
							<div id="collapse-checkout-confirm"
								class="panel-collapse collapse" aria-expanded="true"
								style="display: block;">
								<div class="panel-body">
									<div class="table-responsive complete-order">
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
												<c:forEach var="p" items="${DDH.CTDDH}">
													<tr>
														<td class="text-left"><a><img
																src="<c:url value='/resources/images/${p.getSanPham().getHinhAnh() }'/>"
																class="img-responsive"
																style="width: 80px; display: inline-block; margin-right: 10px">
														</a> ${p.getSanPham().getTenSP()}</td>
														<td class="text-left">${p.getSanPham().getLoaiSP()}</td>
														<td class="text-right">${p.getSoLuong() }</td>
														<td class="text-right">$${p.getSanPham().getDonGia()}</td>
														<td class="text-right">$${p.getSanPham().getDonGia()*p.getSoLuong()
															}</td>
													</tr>
												</c:forEach>
											</tbody>
											<tfoot>
												<tr>
													<td class="text-right" colspan="4"><strong>Sub-Total:</strong></td>
													<td class="text-right">$${DDH.tongGia }</td>
												</tr>

											</tfoot>
										</table>
									</div>
									<div class="buttons">
										<div class="pull-right">
											<div class="site-btn">
												<button id="confirmButton" style="display: none;"></button>
												<a
													onclick="document.getElementById('confirmButton').click()"
													class="btn btn-1"> <span class="txt">Confirm</span> <span
													class="round"><i class="fa fa-chevron-right"></i></span>
												</a>
											</div>
										</div>
									</div>

									<div class="buttons">
										<div class="pull-left">
											<div class="site-btn">
												<a href="" class="btn btn-1"> <span class="txt">Back
														to Cart</span> <span class="round"><i
														class="fa fa-chevron-left"></i></span>
												</a>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</form:form>
			</div>
		</div>
	</div>
</section>

<%@include file="/WEB-INF/views/include/footer.jsp"%>
