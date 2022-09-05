package controller;

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
		System.out.println("cartList :  " + list);

		return "/cart/cartList";
	}

	@RequestMapping("cartDelete")
	public String basketDelete() throws Exception {
		String userId = "1";
		String[] dids = request.getParameterValues("did");

		cd.cartDelete(userId, dids);

		String referer = request.getHeader("Referer"); // 헤더에서 이전 페이지를 읽는다.
		return "redirect:" + referer; // 이전 페이지로 리다이렉

	}
	
	@RequestMapping("cartPro")
	public String cartPro(Cart cart) throws Exception {
		System.out.println("cartPro Controller ");
		System.out.println("cartPro : " + cart);
//		String userId = "1";
		int num = cd.cartInsert(cart);

		
		return "/cart/cartList";

	}

}
