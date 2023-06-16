package admin.controller;

import java.util.Collection;
import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import ptithcm.controller.LoginController;
import ptithcm.entity.CTDDH;
import ptithcm.entity.CTHD;
import ptithcm.entity.HOADON;


@Controller
@Transactional 
@RequestMapping("/admin/")
public class HoaDonController {
	@Autowired 
	SessionFactory factory;   
	
	@RequestMapping("HD")
	public String index(ModelMap model)
	{
		model.addAttribute("tk", LoginController.taikhoan);

		List<HOADON> listHD = this.layAllHD();
		model.addAttribute("listHD", listHD);
		return "admin/view/list-hoadon";
	}
	  
	
	@RequestMapping("HD/{id}.htm")
	public String chitietHD(ModelMap model, @PathVariable("id") String id) {
		model.addAttribute("tk", LoginController.taikhoan);

		id = id.trim();
		HOADON hd = this.layHD(id);
		Collection<CTDDH> ctddh = hd.getDondathang().getCtddhlist();
		
		model.addAttribute("HD", hd);
		model.addAttribute("listcthd", ctddh);
		return "admin/view/chitiet-hoadon";
	}
	 
	
	public List<HOADON> layAllHD()
	{
		Session session = factory.getCurrentSession();
		String hql = "FROM HOADON";
		Query query = session.createQuery(hql);
		List<HOADON> list = query.list();
		return list;
	}
	
	public HOADON layHD(String sohd)
	{
		sohd.trim();
		Session session = factory.getCurrentSession();
		String hql = "FROM HOADON where SOHD = :sohd";
		Query query = session.createQuery(hql);
		query.setParameter("sohd", sohd);
		HOADON hd = (HOADON)query.list().get(0);
		return hd;
	}
}
