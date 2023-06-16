package ptithcm.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import ptithcm.entity.SANPHAMk;
@Transactional
@Controller
@RequestMapping("/page")
public class PageController {
	@Autowired
	SessionFactory factory;
	@RequestMapping(method = RequestMethod.POST)
	public ModelAndView  index(ModelMap model,HttpServletRequest request,HttpSession ss) 
	{
		String page = request.getParameter("page").trim();
		System.out.println(page);
		
		String dsCart = request.getParameter("listCart").trim();
		String[] words = dsCart.split("&");
		for(String a : words)
		{
			a=a.trim();
		}
		List<SANPHAMk> listCart= new ArrayList<SANPHAMk>();
		for(int i=1;i<words.length;i++)
		{
			List<SANPHAMk> tam= this.getProducts(" where maSP = '"+words[i]+"'");
			listCart.add(tam.get(0));
		}
		HttpSession session1 = request.getSession();
		List<SANPHAMk> listCartBefore= (List<SANPHAMk>) session1.getAttribute("listCart");	
		if(listCartBefore==null)
		{
			session1.setAttribute("listCart", listCart);
			model.addAttribute("listCart",listCart);
		}
		else
		{
			for(SANPHAMk a: listCart)
			{
				listCartBefore.add(a);
			}
			
			session1.setAttribute("listCart", listCartBefore);
			model.addAttribute("listCart",listCartBefore);
		}
		
		return new ModelAndView("redirect:" + page);
	}
	public List<SANPHAMk> getProducts(String dieuKien) {
		Session session = factory.getCurrentSession();
		String hql = "FROM SANPHAMk " + dieuKien;
		Query query = session.createQuery(hql);
		List<SANPHAMk> list = query.list();
		return list;
	}
}
