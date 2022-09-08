package controller;

import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import model.Cart;
import service.CartMybatisDao;

@Controller
@RequestMapping("/cart/")
public class CartController {

	@Autowired
	CartMybatisDao cd;

	HttpServletRequest request;
	Model m;
	HttpSession session;

	@ModelAttribute
	void init(HttpServletRequest request, Model m) {
		this.request = request;
		this.m = m;
		this.session = request.getSession();
	}

	@RequestMapping("cartList")
	public String cartList() throws Exception {

		System.out.println("Controller cartList start");

		String userId = "1";
		List<Cart> list = cd.cartList(userId);
		
		request.setAttribute("list", list);
	    Object mylistObj =	request.getAttribute("list");
//	    List<String> mylistStr =	(List<String>) request.getAttribute("list");

//	  List<Integer> dnumList = null ;
	    
//	    for (Cart string : list) {
//			System.out.println("num : " + string.getDnum());
//			dnumList.add(string.getDnum());
//		}
//		request.setAttribute("dnumList", dnumList);
		
		System.out.println("cartList :  " + list);
		return "/cart/cartList";
	}

	@RequestMapping("orderList")
	public String orderList() throws Exception {

		System.out.println("Controller cartList start");

		String userId = "1";
		List<Cart> list = cd.orderList(userId);
		request.setAttribute("list", list);
		System.out.println("orderList :  " + list);

		return "/cart/orderList";
	}

	@RequestMapping("cartDelete")
	public String basketDelete() throws Exception {
		String userId = "1";
		String[] dids = request.getParameterValues("did");

		String msg = "";
		String url = "/cart/cartList";

		if (dids == null) {
			msg = "삭제할 상품의 체크박스를 클릭해주세요";
			request.setAttribute("msg", msg);
			request.setAttribute("url", url);

			return "alert";
		} else {
			cd.cartDelete(userId, dids);

		}
		String referer = request.getHeader("Referer"); // 헤더에서 이전 페이지를 읽는다.

		return "redirect:" + referer; // 이전 페이지로 리다이렉

	}

	@RequestMapping("cartPro")
	public String cartPro(Cart cart) throws Exception {
		cart.setDpay("0");
		// 수량 0이면 다른 List로 일단 돌려보내기
		if (cart.getDqty()  == 0) {
			System.out.println("getDqty : " + cart.getDqty());
			return "redirect:/cart/cartList";	
		}
		System.out.println("cartPro Controller ");
		System.out.println("cartPro : " + cart);
//		String userId = "1";
		int num = cd.cartInsert(cart);

		return "redirect:/cart/cartList";
	}
	
	@RequestMapping("cartPro1")
	public String cartPro1(Cart cart) throws Exception {
		cart.setDpay("1");
		System.out.println("cartPro Controller ");
		System.out.println("cartPro : " + cart);
//		String userId = "1";
		int num = cd.cartInsert(cart);
		
		return "/cart/cartList";
	}

	@RequestMapping("cartUpdatePro")
	public String cartUpdatePro(Cart cart) throws Exception {
		System.out.println("Controller cartUpdatePro  ");
		String userId = "1";

		String[] dnums = request.getParameterValues("did");
		
		String dpay = request.getParameter("dpay");
		
		System.out.println("Ctr dpay :" + dpay);
		System.out.println(dpay.getClass().getName());
		System.out.println(dpay.getClass());
	
		if (dpay.equals("0")) {
			System.out.println("Ctr cartUpdatePro dpay = 1");
			cd.cartUpdate1(userId, dnums);
		}

		if (dpay.equals("1")) {
			System.out.println("Ctr cartUpdatePro dpay = 2");
			cd.cartUpdate2(userId, dnums);
		}
		else {
			System.out.println(" dpay : " + dpay);
		}
		
		
		cd.cartQtyUpdate(userId,dnums);
		
		System.out.println("ctr end");
		return "redirect:/cart/orderList";

	}
/*	
	@RequestMapping("updateDqtyPro")
	public String updateDqtyPro(Cart cart) {
		cd.modifyDqty(cart);
		
		return "redirect:/cart/cartList";
				
	}
	*/
}
