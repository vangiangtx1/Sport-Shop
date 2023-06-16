package ptithcm.controller;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;
import javax.xml.bind.DatatypeConverter;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import ptithcm.entity.DSTAIKHOANk;
import ptithcm.entity.KHACHHANGk;
import ptithcm.entity.SANPHAMk;

@Transactional
@Controller
@RequestMapping("/user/")
public class UserController {
	@Autowired
	SessionFactory factory;
	
	@RequestMapping("logout")
	public String logout(ModelMap model,HttpServletRequest request,HttpSession ss)
	{
		HttpSession session = request.getSession();
		if(session.getAttribute("user")!=null)
		{
			session.removeAttribute("user");
			model.addAttribute("login","Login");
			return "login";
			
		}
		return "login";
	}
	
	@RequestMapping("changeInfor")
	public String index(ModelMap model,HttpServletRequest request,HttpSession ss) {
		HttpSession session = request.getSession();
		if(session.getAttribute("user")==null)
		{
			model.addAttribute("login","Login");
			return "login";
		}
		else
		{
			DSTAIKHOANk a= (DSTAIKHOANk) session.getAttribute("user");
			model.addAttribute("tk",a);
			Session session1 = factory.getCurrentSession(); 
			String hql = "FROM KHACHHANGk where taiKhoan.taiKhoan='"+a.getTaiKhoan()+"'";
			Query query = session1.createQuery(hql); 
			KHACHHANGk user = (KHACHHANGk) query.list().get(0);
			model.addAttribute("KHACHHANG",user);
		}
		return "changeInfor";
	}
	@RequestMapping(value ="updateInfor",method=RequestMethod.POST)
	public String update(ModelMap model,HttpSession ss,HttpServletRequest request,@ModelAttribute("KHACHHANG") KHACHHANGk khachHang) {
		
		HttpSession session1 = request.getSession();
		khachHang.setTaiKhoan((DSTAIKHOANk) session1.getAttribute("user"));
		
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try
		{
			session.update(khachHang);
			t.commit();
			model.addAttribute("message","Update successful !");
		}
		catch(Exception e)
		{
			t.rollback();
			model.addAttribute("message","Update failed !");
		}
		finally {
			session.close();
		}
		return "changeInfor";
	}
	
	@RequestMapping("changePassword")
	public String index1(ModelMap model,HttpServletRequest request,HttpSession ss) {
		HttpSession session = request.getSession();
		if(session.getAttribute("user")==null)
		{
			return "login";
		}
		else
		{
			DSTAIKHOANk a= (DSTAIKHOANk) session.getAttribute("user");
			model.addAttribute("tk",a);
			return "changePassword";
		}
	}
	
	@RequestMapping(value = "updatePassword",method=RequestMethod.POST)
	public String updatePass(ModelMap model,HttpSession ss,HttpServletRequest request) throws NoSuchAlgorithmException {
		String oldPass = request.getParameter("oldPass"); 
		String newPass = request.getParameter("newPass");
		String cfnewPass = request.getParameter("confirmNewPass");
		MessageDigest md = MessageDigest.getInstance("MD5");
		 md.update(oldPass.trim().getBytes());
		 byte[] digest = md.digest();
	      String myHash = DatatypeConverter
	                .printHexBinary(digest).toUpperCase();
		HttpSession session1 = request.getSession();
		DSTAIKHOANk a= (DSTAIKHOANk) session1.getAttribute("user");
		
		if(oldPass .equals(a.getMatKhau()))
		{
			if(newPass.equals(cfnewPass))
			{
				MessageDigest md1 = MessageDigest.getInstance("MD5");
				 md1.update(newPass.trim().getBytes());
				 byte[] digest1 = md1.digest();
			      String myHash1 = DatatypeConverter
			                .printHexBinary(digest1).toUpperCase();
				a.setMatKhau(myHash1);
			}
			else
			{
				model.addAttribute("message", "New password does not match !");
				return "changePassword";
			}
		}
		else
		{
			model.addAttribute("message", "Old password is not correct !");
			return "changePassword";
		}
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try
		{
			session.update(a);
			t.commit();
			model.addAttribute("message","Update successful !");
		}
		catch(Exception e)
		{
			t.rollback();
			model.addAttribute("message","Update failed !");
		}
		finally {
			session.close();
		}
		return "changePassword";
	}
	@ModelAttribute("login")
	public void fillLogin(ModelMap model,HttpServletRequest request)
	{
		HttpSession session = request.getSession();
		if(session.getAttribute("user")==null)
		{
			model.addAttribute("login","Login");
		}
		
	}
	
	public List<SANPHAMk> getProducts(String dieuKien) {
		Session session = factory.getCurrentSession();
		String hql = "FROM SANPHAMk " + dieuKien;
		Query query = session.createQuery(hql);
		List<SANPHAMk> list = query.list();
		return list;
	}
}
