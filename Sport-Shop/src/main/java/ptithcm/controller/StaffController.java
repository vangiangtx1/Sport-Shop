package ptithcm.controller;
import java.lang.Math;
import ptithcm.controller.LoginController;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.Iterator;
import java.util.List;


import ptithcm.entity.*;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;

import org.apache.jasper.tagplugins.jstl.core.ForEach;
import org.dom4j.rule.Mode;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

@Transactional
@Controller
@SessionAttributes
public class StaffController {
	@Autowired
	SessionFactory factory;

	@RequestMapping("staff/profile")
	public String showProfile(ModelMap model) {
		model.addAttribute("tk", LoginController.taikhoan);
		Session session = factory.getCurrentSession();
		String hql = "FROM NHANVIEN A WHERE A.manv=:idnv ";
		Query query = session.createQuery(hql);
		query.setParameter("idnv", LoginController.nv.getManv());
		List<NHANVIEN> list = query.list();
		NHANVIEN nhanvien=list.get(0);
		model.addAttribute("Nhanvien",nhanvien);
		return "staff/FormProfileNhanvien";
	}
	
	@RequestMapping("logout")
	public String logout()
	{
		LoginController.taikhoan=new DSTAIKHOAN();
		return "redirect:/login.htm ";
	}

	
	@RequestMapping(value = "staff/update", method = RequestMethod.POST)
	public String UpdateNV(ModelMap model,@Validated@ModelAttribute("Nhanvien") NHANVIEN nv,BindingResult errors) 
	{
		
		
		
		
		model.addAttribute("tk", LoginController.taikhoan);
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		String hql = "FROM NHANVIEN A WHERE A.manv=:idnv ";
		Query query = session.createQuery(hql);
		query.setParameter("idnv", nv.getManv());
		
		List<NHANVIEN> list = query.list();
		NHANVIEN nhanvienSua=list.get(0);
		nhanvienSua.setHoten(nv.getHoten());
		nhanvienSua.setDiachi(nv.getDiachi());
		nhanvienSua.setSdt(nv.getSdt());
		nhanvienSua.setEmail(nv.getEmail());

		try {
			session.update(nhanvienSua);
			t.commit();
			model.addAttribute("message", "Successful employee update!");	
			model.addAttribute("link", "profile");
		} catch (Exception e) {

			model.addAttribute("message", "Employee update failed!"+e.getMessage());
			model.addAttribute("link", "profile");
		} 
		return "staff/Success-order";
	}
	
	
	public Integer laymaSP()
	{
		Session session = factory.getCurrentSession();
		String hql = "select max( CAST(masp AS int)) from SANPHAM";
		Query query = session.createQuery(hql);
		List<Integer> list = query.list();
		Integer masp=list.get(0);
		return masp;
	}
	public String taomaSP()
	{
		Integer ma=laymaSP();
		if(ma==null)
		{
			ma=1;
		}
		else
		{
			ma=ma+1;
		}
		return ma.toString();
	}
	public Integer laymaHD()
	{
		Session session = factory.getCurrentSession();
		String hql = "select max( CAST(sohd AS int)) from HOADON ";
		Query query = session.createQuery(hql);
		List<Integer> list = query.list();
		Integer mahd=list.get(0);
		return mahd;
	}
	public String taomaHD()
	{
		Integer ma=laymaHD();
		if(ma==null)
		{
			ma=1;
		}
		else {
			ma=ma+1;	
		}
		return ma.toString();
	}
	@RequestMapping("staff/products")
	public String showFormproduct(ModelMap model) {
		Session session = factory.getCurrentSession();
		String hql = "FROM SANPHAM A WHERE A.trangthaixoa='0'order by length(A.masp), masp";
		Query query = session.createQuery(hql);
		List<SANPHAM> list = query.list();
		model.addAttribute("products", list);
		model.addAttribute("tk", LoginController.taikhoan);
		
		
		return "staff/Product";
	}
	@RequestMapping("staff/products/edit")
	public String editProduct() {
		return "staff/EditProduct";
	}
	
	@RequestMapping("staff/order/success")
	public String success() {
		return "staff/Success-order";
	}
	
	
	@RequestMapping("staff/order")
	public String index1(ModelMap model) {
		Session session = factory.getCurrentSession();
		String hql = "FROM DONDATHANG";
		Query query = session.createQuery(hql);
		List<DONDATHANG> list = query.list();
		model.addAttribute("tk", LoginController.taikhoan);
		
		model.addAttribute("dondh", list);
		return "staff/order";
	}
	
	@RequestMapping("staff/order/{id}")
	public String indexPersonal(ModelMap model) {
		Integer manv=LoginController.nv.getManv();
		Session session = factory.getCurrentSession();
		String hql = "FROM NHANVIEN WHERE manv= :nvx" ;
		Query query = session.createQuery(hql);
		query.setParameter("nvx", manv);
		List<NHANVIEN> list = query.list();
		NHANVIEN nv=list.get(0);
		List<DONDATHANG> dsddh=new ArrayList<DONDATHANG>();
		for(HOADON x:nv.getHoadonlist())
		{
			dsddh.add(x.getDondathang());
		}
		model.addAttribute("tk", LoginController.taikhoan);
		
		model.addAttribute("dondh", dsddh);
		
		return "staff/order";

	}
	@Autowired
	JavaMailSender mailer;
	@RequestMapping(value = "staff/order", method = RequestMethod.POST,params="btnAccept")
	public String UpdateDDH(@RequestParam("id") String id,ModelMap model)
	{
		
		try {
			model.addAttribute("tk", LoginController.taikhoan);
			
			MimeMessage mail=mailer.createMimeMessage();
			MimeMessageHelper helper=new MimeMessageHelper(mail);
			id=id.trim();
			HOADON hd=new HOADON();
			Session session = factory.getCurrentSession();
			String hql = "UPDATE DONDATHANG set trangthai=:success WHERE msddh=:idh";
			Query query = session.createQuery(hql);
			query.setParameter("success", "CONFIRMED");
			query.setParameter("idh", id);
			int result=query.executeUpdate();
			String hqlNV = "FROM NHANVIEN X WHERE manv=:idnv";
			Query queryNV= session.createQuery(hqlNV);
			queryNV.setParameter("idnv",LoginController.nv.getManv());
			List<NHANVIEN> list1 = queryNV.list();
			
			NHANVIEN nv=list1.get(0);
			String hqlDH = "FROM DONDATHANG Y WHERE msddh=:ms";
			Query queryDH= session.createQuery(hqlDH);
			queryDH.setParameter("ms",id);
			List<DONDATHANG> list2 = queryDH.list();
			DONDATHANG dh=list2.get(0);

			hd.setSohd(taomaHD());
			System.out.println(hd.getSohd());
			Date dNow=new Date();
			hd.setNgaylaphd(dNow);

			hd.setNhanvien(nv);
			hd.setDondathang(dh);
			Float Tong=0f;
			String listdh="";
			 for (CTDDH e: hd.getDondathang().getCtddhlist() ) 
			 {
				 listdh=listdh+"<br>"+e.getSanpham().getTensp()+"-Quantity: "+e.getSL();
				 Integer slt=e.getSanpham().getSoluongton()-e.getSL();
				 if(slt>=0) {
					 
					 if(e.getSanpham().getSale()!=0)
					 {
						 Tong=Tong+e.getSL()*e.getSanpham().getDongia()*(1-e.getSanpham().getSale());
					 }
					 else
					 {
						 Tong=Tong+e.getSL()*e.getSanpham().getDongia();
					 }
				 }
				 else {
					 	hd.getDondathang().setTrangthai("CANCELLED");
					 	helper.setTo(dh.getEmail());
						helper.setReplyTo("nguyenvana30520@gmail.com");	
						helper.setSubject("Order confirmation failed!");
						String body="We are very sorry for the inconvenience caused by the number of "+e.getSanpham().getTensp()+
								" products not enough to meet this order !";
						helper.setText(body,true);
						mailer.send(mail);
						
						model.addAttribute("message", "Order confirmation failed (insufficient quantity) !  ");
						
						model.addAttribute("link", "order");
						return "staff/Success-order";
				 }
				 
			 }
			 for (CTDDH e: hd.getDondathang().getCtddhlist() ) {
				 Integer slt=e.getSanpham().getSoluongton()-e.getSL();
				 e.getSanpham().setSoluongton(slt);
			 }
			 Tong=(float) Math.round(Tong*100.0/100.0);
			hd.setTonggia(Tong);
			dh.getKhachhang().setDoanhso(dh.getKhachhang().getDoanhso()+Tong);		
			session.save(hd);
			Calendar c = Calendar.getInstance();
			c.setTime(dNow);
			c.add(Calendar.DATE,4);
			 Date currentDatePlusOne = c.getTime();
			 SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
			 String strDate=formatter.format(currentDatePlusOne);
			
			helper.setTo(dh.getEmail());
			helper.setReplyTo("nguyenvana30520@gmail.com");	
			helper.setSubject("Order confirmation successful !");
			String body="<p>Bill ID: "+hd.getSohd()+"</p>"+"<p>Customer name: "+hd.getDondathang().getHotenkh()+ "</p>"+"<p>Address: "+hd.getDondathang().getDiachi()+"</p>"+"<p>Phone number: "+hd.getDondathang().getSDT()
					+"</p>"+"<p>Price: "+listdh+"</p>"
					+"<p>Sub total: "+hd.getTonggia()+"$"+"</p>"+"<p>Estimated delivery time: "+strDate+"</p>";
			helper.setText(body,true);
			mailer.send(mail);
			model.addAttribute("message", "Order confirmation successful !");
			model.addAttribute("link", "order");
			
		}
		catch(Exception e){
			model.addAttribute("message", "Order confirmation failed !"+e.getMessage());
			
			model.addAttribute("link", "order");
		}
		return "staff/Success-order";
	}
	
	@RequestMapping("/staff/products/{id}")
	public String deleteSP(@PathVariable String id,ModelMap model)
	{
		model.addAttribute("tk", LoginController.taikhoan);
		
		try {
			id=id.trim();
			Query query;
			String hql="";
			int result;
			Session session = factory.openSession();
			hql="FROM SANPHAM A "  + 
		             "WHERE A.masp = :ddh";
			query = session.createQuery(hql);
			query.setParameter("ddh", id);
			List<SANPHAM> list = query.list();
			SANPHAM sp=list.get(0);
			for (CTDDH e:sp.getCtddhlist() )
			{
				
			  if(e.getDondathang().getTrangthai().trim().equals("NEW"))
			  {
				  model.addAttribute("message",  "This product cannot be deleted  !");	
				  
					String hql1 = "FROM SANPHAM A WHERE A.trangthaixoa='0'";
					Query query1 = session.createQuery(hql1);
					List<SANPHAM> list1 = query1.list();
					model.addAttribute("products", list1);
				  return "staff/Product";
			  }
			}			
				hql="UPDATE FROM SANPHAM set trangthaixoa='1' "  + 
		         "WHERE masp = :product_id";
			 	query = session.createQuery(hql);
			 	query.setParameter("product_id", id);
			 	result = query.executeUpdate();
		}
		catch (Exception e) {
			model.addAttribute("message", "Remove failed !");	
			model.addAttribute("link", "products");
			return "staff/Success-order";
		}

		return "redirect:/staff/products.htm ";
	}
	@RequestMapping("/staff/order/delete")
	public String deleteOrder(@RequestParam("id") String id,ModelMap model)
	{
		model.addAttribute("tk", LoginController.taikhoan);
		
		
		id=id.trim();
		Session session = factory.getCurrentSession();
		String hql1 = "FROM DONDATHANG WHERE msddh=:ip";
		Query query1 = session.createQuery(hql1);
		query1.setParameter("ip", id);
		List<DONDATHANG> list = query1.list();
		DONDATHANG a=list.get(0);
		if(a.getTrangthai().trim().equals("CONFIRMED"))
		{
			for (CTDDH e: a.getCtddhlist() ) {
				 Integer slt=e.getSanpham().getSoluongton()+e.getSL();
				 e.getSanpham().setSoluongton(slt);
			 }
		}
		String hql = "UPDATE DONDATHANG set trangthai=:cancel WHERE msddh=:idh";
		Query query = session.createQuery(hql);
		query.setParameter("cancel", "CANCELLED");
		query.setParameter("idh", id);
		int result=query.executeUpdate();
		
		return "redirect:/staff/order.htm ";
	}
	
	@RequestMapping(value = "staff/order/detail", method = RequestMethod.POST)
	public String DetailOrder(@ModelAttribute("id") String id,ModelMap model)
	{
		model.addAttribute("tk", LoginController.taikhoan);
		id.trim();
		Session session = factory.getCurrentSession();
		String hql="FROM DONDATHANG X "  + 
	             " WHERE X.msddh = :ddh";
		Query query = session.createQuery(hql);
		query.setParameter("ddh", id);
		List<DONDATHANG> list = query.list();
		DONDATHANG a=list.get(0);
		model.addAttribute("ctddh", a);
		model.addAttribute("linkx", "order");
		Float Tong=0f;
		   for (CTDDH e: a.getCtddhlist())
		   {
			   if(e.getSanpham().getSale()!=0)
				 {
					 Tong=Tong+e.getSL()*e.getSanpham().getDongia()*(1-e.getSanpham().getSale());
				 }
				 else
				 {
					 Tong=Tong+e.getSL()*e.getSanpham().getDongia();
				 }
		   }
		   Tong=(float) Math.round(Tong*100.0/100.0);
		   model.addAttribute("Tonggia", Tong);
		return "staff/Detail";
	}
	
	@RequestMapping(value = "staff/order/order/detail", method = RequestMethod.POST)
	public String DetailOrder2(@ModelAttribute("id") String id,ModelMap model)
	{
		model.addAttribute("tk", LoginController.taikhoan);
		id.trim();
		Session session = factory.getCurrentSession();
		String hql="FROM DONDATHANG X "  + 
	             " WHERE X.msddh = :ddh";
		Query query = session.createQuery(hql);
		query.setParameter("ddh", id);
		List<DONDATHANG> list = query.list();
		DONDATHANG a=list.get(0);
		model.addAttribute("ctddh", a);
		model.addAttribute("linkx", "order/personal");
		Float Tong=0f;
		   for (CTDDH e: a.getCtddhlist())
		   {
			   if(e.getSanpham().getSale()!=0)
				 {
					 Tong=Tong+e.getSL()*e.getSanpham().getDongia()*(1-e.getSanpham().getSale());
				 }
				 else
				 {
					 Tong=Tong+e.getSL()*e.getSanpham().getDongia();
				 }
		   }
		   Tong=(float) Math.round(Tong*100.0/100.0);
		   model.addAttribute("Tonggia", Tong);
		return "staff/Detail";
	}
	private String tensp="";
	@RequestMapping(value = "/staff/products/edit/{id}", method = RequestMethod.GET) 
	public String editProduct(@PathVariable String id ,ModelMap model) { 
		model.addAttribute("tk", LoginController.taikhoan);
		
		id=id.trim();
		Session session = factory.getCurrentSession();
		String hql="FROM SANPHAM X "  + 
	             " WHERE X.masp = :product_id";
		Query query = session.createQuery(hql);
		query.setParameter("product_id", id);
		List<SANPHAM> list = query.list();
		SANPHAM a=list.get(0);
		tensp=a.getTensp().trim();
		model.addAttribute("product", a);
        List<String> list2 = Arrays.asList("accessory","example","sport","clothes");
        List<String> list3 =Arrays.asList("USA","CHINA","VietNam","Australia","India","THAI","KOREA");
		model.addAttribute("loaisps", list2);
		model.addAttribute("nuoc", list3);
		return "staff/EditProduct";
	}
	@RequestMapping(value = "/staff/products/edit/update", method = RequestMethod.POST)
	public String Update(ModelMap model,@Validated@ModelAttribute("product") SANPHAM sp,BindingResult errors) {
		model.addAttribute("tk", LoginController.taikhoan);
		
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		List<String> list2 = Arrays.asList("accessory","example","sport","clothes");
	    List<String> list3 =Arrays.asList("USA","CHINA","VietNam","Australia","India","THAI","KOREA");
		model.addAttribute("loaisps", list2);
		model.addAttribute("nuoc", list3);
		try {
			if(errors.hasErrors())
			{
				
				return "staff/EditProduct";
			}
			if(sp.getTensp().trim().equals(tensp.trim())==false)
			{
				String hql = "FROM SANPHAM A WHERE A.tensp=:tenspx and trangthaixoa=0";
				Query query = session.createQuery(hql);
				query.setParameter("tenspx",sp.getTensp());
				List<SANPHAM> list = query.list();
				if(list.size()>0)
				{
					model.addAttribute("message", "Product already exists!");
					return "staff/EditProduct";
				}
				
			}
			sp.setTrangthaixoa(0);
			session.update(sp);
			t.commit();
			model.addAttribute("message", "Product update successful!");	
			model.addAttribute("link", "products");
		} catch (Exception e) {
			t.rollback();
			model.addAttribute("message", "Product update failed!");
			model.addAttribute("link", "products");
		} finally {
			session.close();
		}
		return "staff/Success-order";
	}
	@RequestMapping(value = "staff/products/create", method = RequestMethod.GET)
	public String insert(ModelMap model) {
		model.addAttribute("tk", LoginController.taikhoan);
		
		model.addAttribute("product", new SANPHAM());
		List<String> list2 = Arrays.asList("accessory","example","sport","clothes");
	    List<String> list3 =Arrays.asList("USA","CHINA","VietNam","Australia","India","THAI","KOREA");
		model.addAttribute("loaisps", list2);
		model.addAttribute("nuoc", list3);
		return "staff/CreateProduct";
	}
	
	@RequestMapping(value = "/staff/products/create", method = RequestMethod.POST)
	public String insert(ModelMap model, @Validated@ModelAttribute("product") SANPHAM sp,BindingResult errors) {
		model.addAttribute("tk", LoginController.taikhoan);
		
			Session session = factory.openSession();
			Transaction t = session.beginTransaction();
			List<String> list2 = Arrays.asList("accessory","example","sport","clothes");
		    List<String> list3 =Arrays.asList("USA","CHINA","VietNam","Australia","India","THAI","KOREA");
			model.addAttribute("loaisps", list2);
			model.addAttribute("nuoc", list3);
		try {
			if(errors.hasErrors())
			{
				
				return "staff/CreateProduct";
			}
		
			String hql = "FROM SANPHAM A WHERE A.tensp=:tenspx and trangthaixoa=0";
			Query query = session.createQuery(hql);
			query.setParameter("tenspx",sp.getTensp());
			List<SANPHAM> list = query.list();
			if(list.size()>0)
			{
				model.addAttribute("message", "Product already exists!");
				return "staff/CreateProduct";
				
			}
			
			sp.setTrangthaixoa(0);
			sp.setMasp(taomaSP());
			session.save(sp);
			t.commit();
			model.addAttribute("message", "Add products successful !");
			model.addAttribute("link", "products");
		} catch (Exception e) {
			t.rollback();
			model.addAttribute("message", "Failed to add product!"+e.getMessage());
		} finally {
			session.close();
		}
		return "staff/Success-order";

	}

}
