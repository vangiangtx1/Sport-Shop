
 package ptithcm.interceptor;
 
 import javax.servlet.http.HttpServletRequest; import
javax.servlet.http.HttpServletResponse; import
 javax.servlet.http.HttpSession;
 
 import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
 
public class LoggerInterceptor extends HandlerInterceptorAdapter {
  
  @Override public boolean preHandle (HttpServletRequest request,
  HttpServletResponse response,Object handler) throws Exception {
  System.out.println("interceptor"); HttpSession session =
  request.getSession(); if(session.getAttribute("user")==null) {
  response.sendRedirect(request.getContextPath() + "/login.htm"); return true;
  } return true; }
  
  
  }
 
