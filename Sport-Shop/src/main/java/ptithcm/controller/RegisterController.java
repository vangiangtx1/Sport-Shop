package ptithcm.controller;
import javax.xml.bind.DatatypeConverter;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import ptithcm.entity.DSTAIKHOANk;
import ptithcm.entity.KHACHHANGk;
import ptithcm.entity.SANPHAMk;

@Transactional
@Controller
@RequestMapping("/register")
public class RegisterController {
	@Autowired
	SessionFactory factory;
	
	@RequestMapping(method = RequestMethod.GET)
	public String index(ModelMap model,HttpServletRequest request,HttpSession ss) {
		HttpSession session = request.getSession();
		if(session.getAttribute("user")==null)
		{
			model.addAttribute("login","Guest");
		}
		else
		{
			DSTAIKHOANk a= (DSTAIKHOANk) session.getAttribute("user");
			model.addAttribute("tk",a);
		}
		model.addAttribute("KHACHHANG",new KHACHHANGk());
		model.addAttribute("DSTAIKHOAN",new DSTAIKHOANk());
		return "register";
	}
	
	@RequestMapping(value = "/insert",method=RequestMethod.POST)
	public String insert(ModelMap model,@Validated @ModelAttribute("KHACHHANG") KHACHHANGk khachHang,HttpServletRequest request,BindingResult errors,HttpSession ss,@ModelAttribute("DSTAIKHOAN") DSTAIKHOANk taiKhoan) throws NoSuchAlgorithmException
	{
		HttpSession session1 = request.getSession();
		if(session1.getAttribute("user")==null)
		{
			
		}
		else
		{
			DSTAIKHOANk a= (DSTAIKHOANk) session1.getAttribute("user");
			model.addAttribute("tk",a);
			session1.removeAttribute("user");
		}
		
		
		
		String captcha = ss.getAttribute("captcha_security").toString();
		String verifyCaptcha = request.getParameter("captcha");
		boolean kt=true;
		if (khachHang.getHoTen().trim().toString().equals("")) {
			errors.rejectValue("hoTen", "KHACHHANG", "Username cannot be blank");
			kt=false;
		}
		if (khachHang.getDiaChi().trim().toString().equals("")) {
			errors.rejectValue("diaChi", "KHACHHANG", "Address cannot be blank");
			kt=false;
		}
		if (khachHang.getSdt().trim().toString().equals("")) {
			errors.rejectValue("sdt", "KHACHHANG", "Phone Number cannot be blank");
			kt=false;
		}
		if (khachHang.getTaiKhoan().getTaiKhoan().trim().toString().equals("")) {
			errors.rejectValue("taiKhoan.taiKhoan", "KHACHHANG", "Username cannot be blank");
			kt=false;
		}
		if (ktDSTAIKHOAN(khachHang.getTaiKhoan().getTaiKhoan().trim().toString())==false) {
			errors.rejectValue("taiKhoan.taiKhoan", "KHACHHANG", "Account already exists");
			kt=false;
		}
		if (khachHang.getTaiKhoan().getMatKhau().trim().toString().equals("")) {
			errors.rejectValue("taiKhoan.matKhau", "KHACHHANG", "Password cannot be blank");
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
			return "register";
		}
		 MessageDigest md = MessageDigest.getInstance("MD5");
		 md.update(khachHang.getTaiKhoan().getMatKhau().getBytes());
		 byte[] digest = md.digest();
	      String myHash = DatatypeConverter
	                .printHexBinary(digest).toUpperCase();
		khachHang.setDoanhSo(0);
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		taiKhoan.setTaiKhoan(khachHang.getTaiKhoan().getTaiKhoan());
		taiKhoan.setMatKhau(myHash);
		taiKhoan.setChucVu("KHACH");
		try
		{
			session.save(taiKhoan);
			session.save(khachHang);
			t.commit();
			
			model.addAttribute("tk",taiKhoan);
			ss.setAttribute("user", taiKhoan);
			return "index";
		}
		catch(Exception e)
		{
			t.rollback();
			model.addAttribute("message",e.getMessage());
			model.addAttribute("login","Login");
			return "register";
		}
		finally {
			session.close();
		}
		
	}
	public boolean ktDSTAIKHOAN(String tk)
	{
		Session session = factory.getCurrentSession();
		String hql = "FROM DSTAIKHOANk ";
		Query query = session.createQuery(hql);
		List<DSTAIKHOANk> list = query.list();
		for(DSTAIKHOANk k : list)
		{
			if(k.getTaiKhoan().trim().equals(tk))
			{
				return false;
			}
		}
		return true;
	}
	
	
	public List<SANPHAMk> getProducts(String dieuKien) {
		Session session = factory.getCurrentSession();
		String hql = "FROM SANPHAMk " + dieuKien;
		Query query = session.createQuery(hql);
		List<SANPHAMk> list = query.list();
		return list;
	}
	
}
