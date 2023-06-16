<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/include/taglib.jsp"%>
<%@include file="/WEB-INF/views/include/header.jsp"%>
 <script>
 document.getElementById("TenPage").innerHTML = "Register";
 
 </script>
<style>
input[type="search"] {
    border: 1px solid transparent;
    border-radius: 0;
    box-sizing: content-box;
    padding: 9px 10px 9px 26px;
    transition: all 0.5s ease 0s;
}
#demo-2 input[type="search"]:focus {
    background-color: #fff;
    color: black;
    cursor: auto;
    padding-left: 32px;
    width: 130px;
    border-color: none !important;
    border-radius: 25px;
    border: none;
}
</style>
<section class="padding-top100 login-page">
	<div class="container">
		<div class="row" style="display: flex; justify-content: center">
			<div class="col-sm-6 col-xs-12 mt-40">
				<div class="login-content">
					<h4>Register</h4>
					<div>${message }</div>
					<form:form action="register/insert.htm" modelAttribute="KHACHHANG">
						<div class="form-group">
							<label for="input-email" class="control-label">Name</label>
							<form:input path="hoTen" type="text" class="form-control" />
							<p
								style="color: #ff3366; font-size: 12px; margin-top: 5px; margin-bottom: 0px;">
								<form:errors path="hoTen" cssClass="errors" />
							</p>
						</div>
						<div class="form-group">
							<label for="input-email" class="control-label">Address</label>
							<form:input path="diaChi" type="text" class="form-control" />
							<p
								style="color: #ff3366; font-size: 12px; margin-top: 5px; margin-bottom: 0px;">
								<form:errors path="diaChi" cssClass="errors" />
							</p>
						</div>
						<div class="form-group">
							<label for="input-email" class="control-label">Tel Number</label>
							<form:input path="sdt" type="text" class="form-control" />
							<p
								style="color: #ff3366; font-size: 12px; margin-top: 5px; margin-bottom: 0px;">
								<form:errors path="sdt" cssClass="errors" />
							</p>
							
						</div>
						<div class="form-group">
							<label for="input-email" class="control-label">Email</label>
							<form:input path="email" type="text" class="form-control" />
							<p
								style="color: #ff3366; font-size: 12px; margin-top: 5px; margin-bottom: 0px;">
								<form:errors path="email" cssClass="errors" />
							</p>
							
						</div>
						<div class="form-group">
							<label for="input-email" class="control-label">User Name</label>
							<form:input path="taiKhoan.taiKhoan" type="text"
								class="form-control" />
							<p
								style="color: #ff3366; font-size: 12px; margin-top: 5px; margin-bottom: 0px;">
								<form:errors path="taiKhoan.taiKhoan" cssClass="errors" />
							</p>
						</div>
						<div class="form-group">
							<label for="input-password" class="control-label">Password</label>
							<form:input path="taiKhoan.matKhau" type="password"
								class="form-control" />
							<p
								style="color: #ff3366; font-size: 12px; margin-top: 5px; margin-bottom: 0px;">
								<form:errors path="taiKhoan.matKhau" cssClass="errors" />
							</p>
							<br>
						</div>
						<div class="form-group">
							<img src="${pageContext.request.contextPath}/captcha/index.htm">
							<s:message code="login.Captcha.palceholder"
								var="placeHolderCaptcha" />
							<label for="input-email" class="control-label">${reCaptra}<span></span></label>
							<input style="margin-top: 10px; width: 50%;" name="captcha"
								type="text" class="form-control"
								placeholder="${placeHolderCaptcha}" style="" />
							<p style="color: #ff3366; font-size: 12px; margin-top: 5px; margin-bottom: 0px;">
								${errorCaptcha}</p>
						</div>
						<div class="site-btn">
							<button style="border-radius: 30px" name="btnCreateAccount"
								class="btn btn-1">
								<a class="btn btn-1"> <span class="txt">Create an
										Account</span> <span class="round"><i
										class="fa fa-chevron-right"></i></span>
								</a>
							</button>
						</div>

					</form:form>
				</div>
			</div>
		</div>
	</div>

</section>

<%@include file="/WEB-INF/views/include/footer.jsp"%>