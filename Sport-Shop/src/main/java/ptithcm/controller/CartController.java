package ptithcm.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;

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
import org.springframework.web.bind.annotation.RequestMapping;

import ptithcm.entity.CTDDHk;
import ptithcm.entity.DDHk;
import ptithcm.entity.DSTAIKHOANk;
import ptithcm.entity.HOADONk;
import ptithcm.entity.KHACHHANGk;
import ptithcm.entity.SANPHAMk;

@Transactional
@Controller
@RequestMapping("/cart")
public class CartController {
	@Autowired
	JavaMailSender mailer;
	@Autowired
	SessionFactory factory;
	@RequestMapping("/cancelOrder")
	public String index6(ModelMap model,HttpServletRequest request)
	{
		HttpSession session2 = request.getSession();
		if(session2.getAttribute("user")==null)
		{
			model.addAttribute("login","Guest");
			return "login";
		}
		else
		{
			DSTAIKHOANk a= (DSTAIKHOANk) session2.getAttribute("user");
			Session session1 = factory.getCurrentSession(); 
			String MSDDH= request.getParameter("cancelOrder").trim();
			String hql1 = "FROM DDHk where MSDDH="+MSDDH+"";
			Query query1 = session1.createQuery(hql1); 
			List<DDHk> list = query1.list();
			DDHk ddh = list.get(0);
			ddh.setTrangThai("CANCELLED");
			Session session = factory.openSession();
			Transaction t = session.beginTransaction();
			try
			{
				session.save(ddh);
				t.commit();
				
				model.addAttribute("tk",a);
			
			}
			catch(Exception e)
			{
				t.rollback();
				model.addAttribute("message",e.getMessage());
			}
			finally {
				session.close();
			}
		}
		
		return "redirect:/cart/historyOrder.htm";
	}
	@RequestMapping("/historyOrder")
	public String index5(ModelMap model,HttpServletRequest request) 
	{
		HttpSession session2 = request.getSession();
		if(session2.getAttribute("user")==null)
		{
			model.addAttribute("login","Guest");
			return "login";
		}
		else
		{
			DSTAIKHOANk a= (DSTAIKHOANk) session2.getAttribute("user");
			Session session1 = factory.getCurrentSession(); 
			
			String hql = "FROM KHACHHANGk where taiKhoan.taiKhoan='"+a.getTaiKhoan()+"'";
			Query query = session1.createQuery(hql); 
			KHACHHANGk user = (KHACHHANGk) query.list().get(0);
			
			String hql1 = "FROM DDHk where (trangThai='NEW' or trangThai='CANCELLED') and maKH="+user.getMaKH()+"";
			Query query1 = session1.createQuery(hql1); 
			List<DDHk> list = query1.list();
			for(DDHk tam: list)
			{
				for(CTDDHk tam1: tam.getCTDDH())
				{
					System.out.println("CTDDH: "+tam1.getDonDatHang().getMSDDH());
					float tongGia=tam1.getSanPham().getDonGia()*tam1.getSoLuong();
					tam.setTongGia(tongGia);
				}
			}
			model.addAttribute("order",list);
			
			String hql2 = "FROM HOADONk  where DDH.maKH ="+user.getMaKH()+"";
			Query query2 = session1.createQuery(hql2); 
			List<HOADONk> list2 = query2.list();
		}
		
		
		
		
		
		return "historyOrder";
	}
	@RequestMapping("/viewCart")
	public String index(ModelMap model,HttpServletRequest request) 
	{
		HttpSession session2 = request.getSession();
		
		if(session2.getAttribute("user")==null)
		{
			model.addAttribute("login","Guest");
		}
		else
		{
			DSTAIKHOANk a= (DSTAIKHOANk) session2.getAttribute("user");
			model.addAttribute("tk",a);
		}
		
		
		return "cart";
	}
	@RequestMapping("/confirmCart")
	public String index4 (ModelMap model,HttpServletRequest request,@Validated @ModelAttribute("DDH") DDHk donDatHang,BindingResult errors)
	{
		boolean kt=true;
		if (donDatHang.getHoTenKH().trim().toString().equals("")) {
			errors.rejectValue("hoTenKH", "DDH", "FullName cannot be blank");
			kt=false;
		}
		if (donDatHang.getDiaChi().trim().toString().equals("")) {
			errors.rejectValue("diaChi", "DDH", "Address cannot be blank");
			kt=false;
		}
		if (donDatHang.getSdt().trim().toString().equals("")) {
			errors.rejectValue("sdt", "DDH", "PhoneNumber cannot be blank");
			kt=false;
		}
		if (donDatHang.getEmail().trim().toString().equals("")) {
			errors.rejectValue("email", "DDH", "Email cannot be blank");
			kt=false;
		}
		
		HttpSession session2 = request.getSession();
		DDHk tam= (DDHk)session2.getAttribute("DDH");
		tam.setHoTenKH(donDatHang.getHoTenKH());
		tam.setDiaChi(donDatHang.getDiaChi());
		tam.setSdt(donDatHang.getSdt());
		tam.setEmail(donDatHang.getEmail());
		Date dNow=new Date();
		tam.setNgaylap(dNow);
		if(kt==false)
		{
			model.addAttribute("DDH", tam);
			return "checkout";
		}
		KHACHHANGk user=null;
		if(session2.getAttribute("user")!=null)
		{
			DSTAIKHOANk a= (DSTAIKHOANk) session2.getAttribute("user");
			Session session1 = factory.getCurrentSession(); 
			String hql = "FROM KHACHHANGk where taiKhoan.taiKhoan='"+a.getTaiKhoan()+"'";
			Query query = session1.createQuery(hql); 
			user = (KHACHHANGk) query.list().get(0);
			tam.setMaKH(user);
			
		}
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		tam.setTrangThai("NEW");
		try
		{
			System.out.println("DDHang");
			System.out.println(tam.getMSDDH());
			System.out.println(tam.getHoTenKH());
			System.out.println(tam.getDiaChi());
			System.out.println(tam.getSdt());
			System.out.println(tam.getTongGia());
			System.out.println(tam.getTrangThai());
			System.out.println(tam.getNgaylap());
			
			session.save(tam);
			for(CTDDHk x: tam.getCTDDH())
			{
				session.save(x);
			}
			if (!t.wasCommitted())
			    t.commit();
			model.addAttribute("DDH", tam);
			model.addAttribute("message","Successful");
			
			MimeMessage mail=mailer.createMimeMessage();
			MimeMessageHelper helper= new MimeMessageHelper(mail,true);
			
			Calendar c = Calendar.getInstance();
			c.setTime(dNow);
			 Date currentDatePlusOne = c.getTime();
			 SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
			 String strDate=formatter.format(currentDatePlusOne);

				 helper.setFrom("nguyenvana30520@gmail.com","nguyenvana30520@gmail.com");
				 helper.setTo(tam.getEmail());
				 helper.setReplyTo("nguyenvana30520@gmail.com","nguyenvana30520@gmail.com");
				 helper.setSubject("ORDER INFORMATION");
				 String body="Order ID: "+tam.getMSDDH()+"<br>Name: "+tam.getHoTenKH()+"<br>Address: "+tam.getDiaChi()+"<br>Phone number: "+ tam.getSdt()+"<br>Order details<br>";
				 body+="<h2>ORDER INFORMATION</h2>";
				 body+="<h4>Name: "+tam.getHoTenKH()+"</h4>";
				 body+="<h4>Address: "+tam.getDiaChi()+"</h4>";
				 body+="<h4>Phone number: "+tam.getSdt()+"</h4>";
				 body+="<h4>Ordering date: "+strDate+"</h4>";
				 body+="<h4>Total: $"+tam.getTongGia()+"</h4>";
				 body+="<h3>ORDER DETAILS</h3>";
				 body+="<table style='border: 1px solid black; border-collapse: collapse;'>\r\n"
				 		+ "  <tr  >\r\n"
				 		+ "    <th style=' border: 1px solid black' >Product Name</th>\r\n"
				 		+ "    <th  style=' border: 1px solid black' >Model</th>\r\n"
				 		+ "    <th style=' border: 1px solid black'  >Quantity</th>\r\n"
				 		+ "    <th style=' border: 1px solid black'  >Unit Price</th>\r\n"
				 		+ "    <th style=' border: 1px solid black'  >Total</th>\r\n"
				 		+ "  </tr>";
				 for(CTDDHk x: tam.getCTDDH())
				 {
					 body+="<tr   >\r\n"
					 		+ "    <td style=' border: 1px solid black' >"+x.getSanPham().getTenSP()+"</td>\r\n"
					 		+ "    <td style=' border: 1px solid black' >"+x.getSanPham().getLoaiSP()+"</td>\r\n"
					 		+ "    <td style=' border: 1px solid black'  >"+x.getSoLuong()+"</td>\r\n"
					 		+ "    <td style=' border: 1px solid black'  >"+x.getSanPham().getDonGia()+"</td>\r\n"
					 		+ "    <td style=' border: 1px solid black' >"+(x.getSanPham().getDonGia()*x.getSoLuong())+"</td>\r\n"
					 		+ "  </tr>";
				 }
				 body+="</table>";
				 body+="<h3>PLEASE WAIT FOR THE STAFF TO CONFIRM YOUR ORDER!</h3>";
				 helper.setText(body,true);
				 
				 mailer.send(mail);
				 
			// }
			
			return "Success";
		}
		catch(Exception e)
		{
			t.rollback();
			model.addAttribute("DDH", tam);
			model.addAttribute("message",e.getMessage());
			return "checkout";
		}
		finally {
			 session.close(); 		
			 }
	}
	@RequestMapping("/checkout")
	public String index2(ModelMap model,HttpServletRequest request) 
	{
		System.out.println("checkout controller");
		DDHk ddh=new DDHk();
		List<CTDDHk> chiTietDDH= new ArrayList<CTDDHk>();
		HttpSession session2 = request.getSession();
		
		if(session2.getAttribute("user")==null)
		{
			model.addAttribute("login","Guest");
		}
		else
		{
			DSTAIKHOANk a= (DSTAIKHOANk) session2.getAttribute("user");
			model.addAttribute("tk",a);
		}
		String thongTin= request.getParameter("inputSP").trim();
		thongTin=thongTin.substring(1,thongTin.length());
		String[] words = thongTin.split("&");
		for(String tam:words)
		{
			
			CTDDHk ctddh= new CTDDHk();
			String []tt= tam.split("#"); 
			SANPHAMk sp= this.getProducts(" where maSP='"+tt[0].trim()+"'").get(0);
			ctddh.setSanPham(sp);
			ctddh.setDonDatHang(ddh);
			ctddh.setSoLuong(Integer.parseInt(tt[1]));
			chiTietDDH.add(ctddh);
		}
		if(session2.getAttribute("user")!=null)
		{
			System.out.println("cua user");
			DSTAIKHOANk a= (DSTAIKHOANk) session2.getAttribute("user");
			System.out.println(a.getTaiKhoan());
			Session session = factory.openSession();
			String hql = "FROM KHACHHANGk where taiKhoan.taiKhoan='"+a.getTaiKhoan()+"'"; 
			Query query = session.createQuery(hql);
			List<KHACHHANGk> list = query.list();

			System.out.println("Trước add");
			ddh.setHoTenKH(list.get(0).getHoTen());
			ddh.setDiaChi(list.get(0).getDiaChi());
			ddh.setSdt(list.get(0).getSdt());
			ddh.setEmail(list.get(0).getEmail());
			System.out.println("sau add");
		}
		
		
		
		ddh.setCTDDH(chiTietDDH);
		
		System.out.println(ddh.getHoTenKH());
		System.out.println(ddh.getDiaChi());
		System.out.println(ddh.getSdt());
		float tongGia=0;
		for(CTDDHk a: ddh.getCTDDH())
		{
			tongGia+=a.getSoLuong()*a.getSanPham().getDonGia();
			System.out.println(a.getSanPham().getTenSP());
			System.out.println(a.getSanPham().getHinhAnh());
		}
		System.out.println("Tong gia "+ tongGia);
		ddh.setTongGia(tongGia);
		model.addAttribute("DDH",ddh);
		session2.setAttribute("DDH",ddh);
		//model.addAttribute("CTDDH",ddh.getCTDDH());
		
		
		System.out.println(ddh.getHoTenKH());
		return "checkout";
	}
	
	public List<SANPHAMk> getProducts(String dieuKien) {
		Session session = factory.getCurrentSession();
		String hql = "FROM SANPHAMk " + dieuKien;
		Query query = session.createQuery(hql);
		List<SANPHAMk> list = query.list();
		return list;
	}
}
