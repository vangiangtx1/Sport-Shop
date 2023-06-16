package admin.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import ptithcm.entity.KHACHHANG;
import ptithcm.entity.NHANVIEN;
import ptithcm.controller.LoginController;
import ptithcm.entity.CTDDH;
import ptithcm.entity.DONDATHANG;
import ptithcm.entity.DSTAIKHOAN;

@Controller
@Transactional
@RequestMapping("/admin/")
public class KhachHangController {  

	@Autowired
	SessionFactory factory;
	  
	@RequestMapping("KH")
	public String index(ModelMap model)
	{
		model.addAttribute("tk", LoginController.taikhoan);

		List<KHACHHANG> listKH = this.layAllKH();
		model.addAttribute("listKH", listKH);
		return "admin/view/list-customer";
	}
	
	@RequestMapping("KH/DDH/CTDDH/{id}.htm")
	public String chitietDDH(ModelMap model, @PathVariable("id") String id)
	{
		model.addAttribute("tk", LoginController.taikhoan);

		id=id.trim();
		DONDATHANG a = layDDH(id);
		Collection<CTDDH> ctddh = a.getCtddhlist();
		
		ArrayList<CTDDH> temp = new ArrayList<>(ctddh);
		 Float Tong = 0f; 
		 for(int i = 0 ;i<temp.size();i++) 
		 { 
			 if(temp.get(i).getSanpham().getSale()!=0)
			 {
				 Tong=Tong+temp.get(i).getSL()*temp.get(i).getSanpham().getDongia()*(1-temp.get(i).getSanpham().getSale());
			 }
			 else
			 {
				 Tong=Tong+temp.get(i).getSL()*temp.get(i).getSanpham().getDongia();
			 } 
		} 
		 Tong=(float) Math.round(Tong*100.0/100.0);
		model.addAttribute("tong", Tong);
		model.addAttribute("ctddh", ctddh);
		return "admin/view/chitiet-ddh";
	}
	
	@RequestMapping("KH/DDH/{id}.htm")
	public String chitietKH(ModelMap model, @PathVariable("id") String id)
	{
		model.addAttribute("tk", LoginController.taikhoan);

		id=id.trim();
		KHACHHANG a = this.layKH(id);
		Collection<DONDATHANG> ddh = a.getDdhlist();
		model.addAttribute("listddh", ddh);
		return "admin/view/list-ddh";
	}
	
	public DONDATHANG layDDH(String maddh)
	{
		maddh=maddh.trim();
		Session session = factory.getCurrentSession();
		String hql = "FROM DONDATHANG where MSDDH = :maddh";
		Query query = session.createQuery(hql);
		query.setParameter("maddh", maddh);
		DONDATHANG ddh = (DONDATHANG)query.list().get(0);
		return ddh;
	}
	
	public KHACHHANG layKH(String makh)
	{
		makh.trim();
		Session session = factory.getCurrentSession();
		String hql = "FROM KHACHHANG where MAKH = :makh";
		Query query = session.createQuery(hql);
		query.setParameter("makh", makh);
		KHACHHANG kh = (KHACHHANG)query.list().get(0);
		return kh;
	}
	
	public List<KHACHHANG> layAllKH()
	{
		Session session = factory.getCurrentSession();
		String hql = "FROM KHACHHANG";
		Query query = session.createQuery(hql);
		List<KHACHHANG> list = query.list();
		return list;
	}
}

