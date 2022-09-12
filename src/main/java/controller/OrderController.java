package controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import model.Cart;
import model.Member;
import model.Order;
import service.OrderMybatisDao;

@Controller
@RequestMapping("/order/")
public class OrderController {

	@Autowired
	OrderMybatisDao cd;

	HttpServletRequest request;
	Model m;
	HttpSession session;

	@ModelAttribute
	void init(HttpServletRequest request, Model m) {
		this.request = request;
		this.m = m;
		this.session = request.getSession();
	}

	// date 타입 http에서 받을 수 있게 하는 코드
	/*
	 * @InitBinder protected void initBinder(WebDataBinder binder) {
	 * CustomDateEditor dateEditor=new CustomDateEditor(new
	 * SimpleDateFormat("yyyyMMdd"), true); binder.registerCustomEditor(Date.class,
	 * dateEditor); }
	 * 
	 */

	@RequestMapping("myOrderList")
	public String cartList() throws Exception {
		String did = "1";
		List<Order> list = cd.orderList(did);
		request.setAttribute("list", list);
		return "/order/myorder";
	}

	@RequestMapping("payment")
	public String payment(Order order) throws Exception {
		String msg = "";
		String url = "";
		String userId = "1";
		cd.selectOrderId();
		String[] dnum = request.getParameterValues("dnum");
		String[] dname = request.getParameterValues("dname");
		String[] dqty = request.getParameterValues("dqty");
		String[] dprice = request.getParameterValues("dprice");
		String[] dtotal = request.getParameterValues("dtotal");
		String did = request.getParameter("did");
		String daddress = request.getParameter("daddress");
		String dpaym = request.getParameter("dpaym");
		String dpay = request.getParameter("dpay");

		System.out.println("did : " + did);
		System.out.println("dpaym : " + dpaym);
		cd.orderInsert(dnum, dname, dqty, dprice, dtotal, did, daddress, dpaym);

		System.out.println();

		System.out.println();
		cd.modifyDqty(userId, dnum, dqty);
		int confirm = cd.deleteCart(userId, dnum);
		
		if (confirm > 0) {
			System.out.println("삭제");
			msg = "결제가 왼료되었습니다.";
			url = "/cart/cartList";
		} else {
			System.out.println("실패!");
			msg = "실패 하였습니다.";
			url = "/cart/cartList";
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return "alert";
	}
}
