package ptithcm.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import ptithcm.controller.LoginController;

public class LoggerInterceptorAD extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		System.out.println("taikbao"+LoginController.taikhoan.getTaikhoan());
		if(LoginController.taikhoan.getTaikhoan()==null ||LoginController.taikhoan.getChucvu().trim().equals("AD")==false)
	{
		 response.sendRedirect(request.getContextPath() + "/login.htm");
		 
	}
	return true;
	}
}
