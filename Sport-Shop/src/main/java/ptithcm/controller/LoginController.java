package ptithcm.controller;
import javax.xml.bind.DatatypeConverter;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.net.http.HttpRequest;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;
import javax.validation.constraints.Null;

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

import ptithcm.entity.DSTAIKHOAN;
import ptithcm.entity.DSTAIKHOANk;
import ptithcm.entity.KHACHHANGk;
import ptithcm.entity.NHANVIEN;
import ptithcm.entity.SANPHAMk;


@Transactional
@Controller
@RequestMapping("/login")
public class LoginController {
	@Autowired
	SessionFactory factory;
	public static DSTAIKHOAN taikhoan=new DSTAIKHOAN();
	public static NHANVIEN nv=new NHANVIEN();
	@RequestMapping(method = RequestMethod.GET)
	public String index(ModelMap model,HttpServletRequest request,HttpSession ss) {
		
		HttpSession session = request.getSession();
		if(session.getAttribute("user")==null)
		{
			model.addAttribute("login","Login");
		}
		else
		{
			session.removeAttribute("user");
			model.addAttribute("login","Login");
		}
		return "login";
	}
	
	@RequestMapping(value = "/login",method=RequestMethod.POST)
	public String insert(ModelMap model,HttpServletRequest request,HttpSession ss) throws NoSuchAlgorithmException
	{
		HttpSession session1 = request.getSession();
		session1.removeAttribute("user");
		
		String captcha = ss.getAttribute("captcha_security").toString();
		String verifyCaptcha = request.getParameter("captcha");
		
		String username = request.getParameter("taiKhoan"); 
		String password = request.getParameter("matKhau");
		username.trim();
		password.trim();
		 MessageDigest md = MessageDigest.getInstance("MD5");
		 md.update(password.getBytes());
		 byte[] digest = md.digest();
	      String myHash = DatatypeConverter
	                .printHexBinary(digest).toUpperCase();
		
		
		boolean kt=true;
		if(username.equals("")==true)
		{
			model.addAttribute("errorTK", "Username is required !");
			kt=false;
		}
		if(password.equals("")==true)
		{
			model.addAttribute("errorMK", "Password is required !");
			kt=false;
		}
		if(captcha.equals(verifyCaptcha)==false)
		{
			model.addAttribute("errorCaptcha", "Please enter correct Captcha");
			kt=false;
		}
		if(kt==false)
		{
			model.addAttribute("login","Login");
			return "login";
		}
		
		
		Session session = factory.getCurrentSession(); 
		String hql = "FROM DSTAIKHOAN";
		Query query = session.createQuery(hql); 
		List<DSTAIKHOAN> list = query.list();
		
		for(DSTAIKHOAN u : list) {
			if(username.equals(u.getTaikhoan().trim())==true) {
				if(myHash.equals(u.getMatkhau().trim()) == false) { 
					model.addAttribute("messageA", "Wrong password !");
					model.addAttribute("login","Login");
					return "login";
				}
				else
				{
					if(u.getChucvu().trim().equals("NV"))
					{
						
						taikhoan=u;
						nv=taikhoan.getNhanvienlist().iterator().next();
						
						return "redirect:/staff/order.htm";
					}
					else if(u.getChucvu().trim().equals("AD"))
					{
						taikhoan=u;
						nv=taikhoan.getNhanvienlist().iterator().next();
						return "redirect:/admin/NV.htm";
					}
					else if(u.getChucvu().trim().equals("KHACH"))
					{
						DSTAIKHOANk a= new DSTAIKHOANk();
						a.setTaiKhoan(username);
						a.setMatKhau(password);
						
						model.addAttribute("tk",a);
						ss.setAttribute("user", a);
						return "index";
					}
					else
					{
						model.addAttribute("messageA", "Please re-enter!");
						model.addAttribute("login","Login");
						return "login";
					}
					
					
				}
			}
		}
		model.addAttribute("messageA", "Account does not exist !");
		model.addAttribute("login","Login");
		return "login";
	}

	
	public List<SANPHAMk> getProducts(String dieuKien) {
		Session session = factory.getCurrentSession();
		String hql = "FROM SANPHAMk " + dieuKien;
		Query query = session.createQuery(hql);
		List<SANPHAMk> list = query.list();
		return list;
	}
	@ModelAttribute("listCart")
	public  List<SANPHAMk> getListCart(HttpServletRequest request)
	{
		HttpSession session1 = request.getSession();
		List<SANPHAMk> list= (List<SANPHAMk>) session1.getAttribute("listCart");
		if(list !=null)
		{
			for(SANPHAMk a : list)
			{
				System.out.println(a.getMaSP());
			}
		}
		return list;
	}
}
