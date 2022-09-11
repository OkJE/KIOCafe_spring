package service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.Cart;
import model.Order;

@Repository
public class OrderMybatisDao {

	@Autowired
	SqlSessionTemplate session;

	private static final String ns = "order.";
	private Map map = new HashMap<>();

	
	public int orderInsert(Order order) {
		int num = session.insert(ns + "orderInsert", order);
		return num;
	}
	
	public List<Order> orderList(String did) {
		map.put("did", did);
		List<Order> list = session.selectList(ns + "orderList", map);
		return list;
	}


	

} // end class
