<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
 <%@include file="/WEB-INF/views/include/taglib.jsp"%>
 <%@include file="/WEB-INF/views/include/header.jsp"%>
 
  <script>
 document.getElementById("TenPage").innerHTML = "Change Password";
 
 </script>
	<section class="padding-top100 login-page">
		<div class="container">
			<div class="row" style="display: flex; justify-content: center">
				<div class="col-sm-6 col-xs-12 mt-40">
					<div class="login-content">
					<!--ĐIỀN CODE VÀO  -->
					<h4 >Password</h4>
						<div>${message }</div>
						<form method="post" action="user/updatePassword.htm">
                                <div class="form-group">
                                    <label for="input-email" class="control-label">Old Password<span>*</span></label>
                                    <input type="password" class="form-control" id="input-email" name="oldPass">
                                </div>
                                <div class="form-group">
                                    <label for="input-password" class="control-label">New Password<span>*</span></label>
                                    <input type="password" class="form-control" id="input-password" value="" name="newPass" >
                                    <br>
                                </div>
                                <div class="form-group">
                                    <label for="input-password" class="control-label">Confirm New Password<span>*</span></label>
                                    <input type="password" class="form-control" id="input-password" value="" name="confirmNewPass">
                                    <br>
                                </div>
                                <div class="site-btn" >
								<button style="border-radius: 30px" name="btnCreateAccount"
									class="btn btn-1">
									<a class="btn btn-1"> 
									<span class="txt">Update Password</span> 
									<span class="round"><i class="fa fa-chevron-right"></i></span>
									</a>
								</button>
							</div>
                            </form>
					</div>
				</div>
			</div>
		</div>

	</section>

<%@include file="/WEB-INF/views/include/footer.jsp"%>
