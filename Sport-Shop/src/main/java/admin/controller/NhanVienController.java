package admin.controller;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
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
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.dao.DataAccessException;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import ptithcm.entity.NHANVIEN;
import ptithcm.entity.SANPHAM;
import ptithcm.controller.LoginController;
import ptithcm.entity.CTDDH;
import ptithcm.entity.DSTAIKHOAN;
import ptithcm.entity.DSTAIKHOANk;
import ptithcm.entity.HOADON;

@Controller
@Transactional
@RequestMapping("/admin/")
public class NhanVienController {
	@Autowired
	SessionFactory factory;
	
	@RequestMapping("NV")
	public String index(ModelMap model,HttpServletRequest request)
	{
		model.addAttribute("tk", LoginController.taikhoan);
		List<NHANVIEN> listNV = this.layAllNV();
		model.addAttribute("listNV", listNV);
		return "admin/view/list-user";
	}
	
	@RequestMapping("NV/changepassword")
	public String index2(ModelMap model)
	{
		model.addAttribute("tk", LoginController.taikhoan);
		return "admin/view/doimatkhau";
	}
	
	@RequestMapping(value="NV/changepassword",method = RequestMethod.POST)
	public String doimk(ModelMap model,@RequestParam("oldpassword") String oldpass,
			@RequestParam("NewPassword") String newpass,@RequestParam("Reppassword") String reppass) throws NoSuchAlgorithmException
	{
		 MessageDigest md = MessageDigest.getInstance("MD5");
		 md.update(oldpass.trim().getBytes());
		 byte[] digest = md.digest();
	      String myHash = DatatypeConverter
	                .printHexBinary(digest).toUpperCase();
		
		if(myHash.equals(LoginController.taikhoan.getMatkhau().trim()))
		{
			if(!newpass.trim().equals(reppass.trim()))
			{
				model.addAttribute("tk", LoginController.taikhoan);
				model.addAttribute("message", "Confrimation password is not correct!");
				return "admin/view/doimatkhau";
			}
		}
		else
		{
			model.addAttribute("tk", LoginController.taikhoan);
			model.addAttribute("message", "Old password is not correct!");
			return "admin/view/doimatkhau";
		}
		
		MessageDigest md1 = MessageDigest.getInstance("MD5");
		 md1.update(newpass.trim().getBytes());
		 byte[] digest1 = md1.digest();
	      String myHash1 = DatatypeConverter
	                .printHexBinary(digest1).toUpperCase();
		Session session = factory.getCurrentSession();
		String hql = "UPDATE DSTAIKHOAN set matkhau = :mk WHERE taikhoan = :id";
		Query query = session.createQuery(hql);
		query.setParameter("mk", myHash1);
		query.setParameter("id", LoginController.taikhoan.getTaikhoan());
		int result = query.executeUpdate();
		model.addAttribute("message", "Change password successfully!");
		LoginController.taikhoan.setMatkhau(myHash1);
		model.addAttribute("tk", LoginController.taikhoan);
		model.addAttribute("link", "order");
		return "staff/Success-order";
	}
	
	
	@RequestMapping(value = "NV/insert", method = RequestMethod.GET)
	public String insert(ModelMap model,@ModelAttribute("NV") NHANVIEN NV)
	{
		model.addAttribute("tk", LoginController.taikhoan);
		Integer manv = laymaNVmax();
		if(manv==null)
		{
			NV.setManv(1);
		}else {
			Integer e = manv+1;
			NV.setManv(e);
		}
		return "admin/view/add-user";
	}
	
	@RequestMapping(value = "NV/insert", method = RequestMethod.POST)
	public String insert(@Validated @ModelAttribute("NV") NHANVIEN NV, BindingResult errors, ModelMap model
			,@RequestParam("da") String da) throws ParseException, NoSuchAlgorithmException
	{
		model.addAttribute("tk", LoginController.taikhoan);
		if(da.trim().length()==0)
		{
			model.addAttribute("message", "Date cannot be left blank!");
			return "admin/view/add-user";
		}
		if(NV.getDstaikhoan().getTaikhoan().trim().length()==0)
		{
			errors.rejectValue("dstaikhoan.taikhoan", "NV", "Account cannot be left blank!");
			return "admin/view/add-user";
		}
		if(NV.getDstaikhoan().getMatkhau().trim().length()==0)
		{
			errors.rejectValue("dstaikhoan.matkhau", "NV", "Password cannot be left blank!");
			return "admin/view/add-user";
		}
		if(errors.hasErrors())
		{
			return "admin/view/add-user";
		}
		DSTAIKHOAN tk = NV.getDstaikhoan();
		List<DSTAIKHOAN> listtk = layAllTK();
		for(DSTAIKHOAN t : listtk)
		{
			
			if(t.getTaikhoan().trim().equals(tk.getTaikhoan().trim()))
			{
				model.addAttribute("message1", "Account already exists!");
				return "admin/view/add-user";
			}
			
		}
		if(tk.getChucvu().trim().equals("Manager"))
		{
			tk.setChucvu("AD");
		}
		else
		{
			tk.setChucvu("NV");
		}
		MessageDigest md = MessageDigest.getInstance("MD5");
		 md.update(tk.getMatkhau().trim().getBytes());
		 byte[] digest = md.digest();
	      String myHash = DatatypeConverter
	                .printHexBinary(digest).toUpperCase();
	      tk.setMatkhau(myHash);
		this.insertTK(tk);
		SimpleDateFormat formatter = new SimpleDateFormat("MM/dd/yyyy");
		String[] time=da.split("-");
		Date date = formatter.parse(time[1]+"/"+time[2]+"/"+time[0]);
		Date d = (Date)date;
		NV.setNgayvaolam(date);
		this.insertNV(NV);
		List<NHANVIEN> list = this.layAllNV();
		model.addAttribute("listNV", list);
		return "redirect:/admin/NV.htm";
	}
	
	@RequestMapping("NV/delete/{id}.htm")
	public String deleteNV(ModelMap model, @PathVariable("id") String id)
	{	
		model.addAttribute("tk", LoginController.taikhoan);
		id=id.trim();
		NHANVIEN t = this.layNV(id);
		Collection<HOADON> hd = t.getHoadonlist();
		if(!(hd.isEmpty()))
		{
			model.addAttribute("message", "Billed employees cannot be deleted!");
			List<NHANVIEN> listNV = this.layAllNV();
			model.addAttribute("listNV", listNV);
			return "admin/view/list-user";
		}
		else {
			deleteTK(id);
			this.deleteNV(id);
			List<NHANVIEN> listNV = this.layAllNV();
			model.addAttribute("listNV", listNV);
			return "redirect:/admin/NV.htm";
		}
	}
	
	@RequestMapping(value = "NV/edit/{id}.htm", method = RequestMethod.GET)
	public String editNV(ModelMap model, @ModelAttribute("NV") NHANVIEN NV,
			@PathVariable("id") String id)
	{
		model.addAttribute("tk", LoginController.taikhoan);
		id=id.trim();
		NHANVIEN temp = this.layNV(id);
		Date da = temp.getNgayvaolam();
		String date = String.valueOf(da);
		model.addAttribute("da",date);
		model.addAttribute("NV",this.layNV(id));
		return "admin/view/add-user";
	}
	
	@RequestMapping(value ="NV/edit/{id}.htm", method = RequestMethod.POST)
	public String editNV1(ModelMap model,@ModelAttribute("NV") NHANVIEN NV,
			@RequestParam("da") String da) throws ParseException, NoSuchAlgorithmException
	{
		model.addAttribute("tk", LoginController.taikhoan);
		DSTAIKHOAN tk = NV.getDstaikhoan();
		if(tk.getChucvu().trim().equals("Manager"))
		{
			tk.setChucvu("AD");
		}
		else
		{
			tk.setChucvu("NV");
		}
		MessageDigest md = MessageDigest.getInstance("MD5");
		 md.update(tk.getMatkhau().trim().getBytes());
		 byte[] digest = md.digest();
	      String myHash = DatatypeConverter
	                .printHexBinary(digest).toUpperCase();
	     tk.setMatkhau(myHash);
		this.updateTK(tk);
		SimpleDateFormat formatter = new SimpleDateFormat("MM/dd/yyyy");
		String[] time=da.split("-");
		Date date = formatter.parse(time[1]+"/"+time[2]+"/"+time[0]);
		Date d = (Date)date;
		NV.setNgayvaolam(date);
		
		this.updateNV(NV);
		List<NHANVIEN> list = this.layAllNV();
		model.addAttribute("listNV", list);
		return "redirect:/admin/NV.htm";
	}
	
	public List<NHANVIEN> layAllNV()
	{
		Session session = factory.getCurrentSession();
		String hql = "FROM NHANVIEN";
		Query query = session.createQuery(hql);
		List<NHANVIEN> list = query.list();
		return list;
	}
	
	public List<DSTAIKHOAN> layAllTK()
	{
		Session session = factory.getCurrentSession();
		String hql = "FROM DSTAIKHOAN";
		Query query = session.createQuery(hql);
		List<DSTAIKHOAN> list = query.list();
		return list;
	}
	
	public NHANVIEN layNV(String id)
	{
		id.trim();
		Session session = factory.getCurrentSession();
		String hql = "FROM NHANVIEN where MANV = :id";
		Query query = session.createQuery(hql);
		query.setParameter("id", id);
		NHANVIEN nv = (NHANVIEN)query.list().get(0);
		return nv;
	}
	
	public Integer laymaNVmax()
	{
		Session session = factory.getCurrentSession();
		String hql = "SELECT MAX(A.manv) FROM NHANVIEN A";
		Query query = session.createQuery(hql);
		List<Integer> list = query.list();
		Integer manv = list.get(0);
		return manv;
	}
	
	public void insertNV(NHANVIEN nv)
	{
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		
		try {
			session.save(nv);
			t.commit();
		}catch(Exception e){
			t.rollback();
		}
		finally {
			session.close();
		}
	}
	
	public void updateNV(NHANVIEN nv)
	{
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		
		try {
			session.update(nv);
			t.commit();
		}catch(Exception e){
			t.rollback();
		}
		finally {
			session.close();
		}
	}
	
	public void insertTK(DSTAIKHOAN tk)
	{
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		
		try {
			session.save(tk);
			t.commit();
		}catch(Exception e){
			t.rollback();
		}
		finally {
			session.close();
		}
	}
	
	public void updateTK(DSTAIKHOAN tk)
	{
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		
		try {
			session.update(tk);
			t.commit();
		}catch(Exception e){
			t.rollback();
		}
		finally {
			session.close();
		}
	}
	
	public void deleteNV(String id)
	{
		id=id.trim();
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		String hql ="DELETE FROM NHANVIEN "  + 
	             "WHERE MANV = :id";
		Query query = session.createQuery(hql);
		query.setParameter("id", id);
		int rs = query.executeUpdate();
		t.commit();

	}
	
	public void deleteTK(String id)
	{
		id=id.trim();
		Session session = factory.getCurrentSession();
		String hql = "FROM NHANVIEN where MANV = :id";
		Query query = session.createQuery(hql);
		query.setParameter("id", id);
		NHANVIEN nv = (NHANVIEN)query.list().get(0);
		String tk = nv.getDstaikhoan().getTaikhoan();
		session = factory.openSession();
		Transaction t = session.beginTransaction();
		String hql1 ="DELETE FROM DSTAIKHOAN "  + 
	             "WHERE TAIKHOAN = :tk";
		Query query1 = session.createQuery(hql1);
		query1.setParameter("tk", tk);
		int rs = query1.executeUpdate();
		t.commit();

	}
	
	
}
