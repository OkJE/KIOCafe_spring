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
import service.CartMybatisDao;

@Controller
@RequestMapping("/order/")
public class OrderController {

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

	//date 타입 http에서 받을 수 있게 하는 코드
	/*
	 * @InitBinder protected void initBinder(WebDataBinder binder) {
	 * CustomDateEditor dateEditor=new CustomDateEditor(new
	 * SimpleDateFormat("yyyyMMdd"), true); binder.registerCustomEditor(Date.class,
	 * dateEditor); }
	 * 
	 */

	@RequestMapping("myorder")
	public String cartList() throws Exception {
	
		return "/order/myorder";
	}
}
