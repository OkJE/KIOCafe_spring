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

	public int orderInsert(String[] dnum, String[] dname, String[] dqty, String[] dprice, String[] dtotal, String did,
			String daddress, String dpaym) {

		for (int i = 0; i < dnum.length; i++) {
//		System.out.println(	dnum[i] + " " + dname[i] + " " + dqty[i] + " " + dprice[i]);
			map.clear();
			map.put("dnum", dnum[i]);
			map.put("dname", dname[i]);
			map.put("dqty", dqty[i]);
			map.put("dprice", dprice[i]);
			map.put("dtotal", dtotal[i]);
			map.put("did", did);
			map.put("daddress", daddress);
			map.put("dpaym", dpaym);
			int num = session.insert(ns + "orderInsert", map);
		}

		return 0;
	}
	
	public int modifyDqty(String userId, String[] dnums, String[] dqty) {
		map.clear();
		map.put("userid", userId);
		for (int i = 0; i < dnums.length; i++) {
			map.put("dnum", dnums[i]);
			map.put("dqty", dqty[i]);
			session.update(ns + "modifyDqty", map);
			System.out.println(dnums[i]);
			System.out.println(map.get("dnum"));
			System.out.println(map.get("dqty"));
		}

		return 1;
	}
	
	public int deleteCart(String userId, String[] dnums) {


		map.put("userid", userId);
		map.put("dnums", dnums);
		for (String string : dnums) {
			System.out.println("string :  " + string);
		}
		int confirm = session.update(ns + "deleteCart", map);
		return confirm;
	}
//	public int orderInsert(Order order) {
//		int num = session.insert(ns + "orderInsert", order);
//		return num;
//	}

	public List<Order> orderList(String did) {
		map.put("did", did);
		List<Order> list = session.selectList(ns + "orderList", map);
		return list;
	}
	public List<Object> myOrderListInfo(String did) {
		System.out.println("dao myOrderListInfo");
		map.put("did", did);
		List<Object> list = session.selectList(ns + "myOrderListInfo");
		for (Object object : list) {
			System.out.println("object : " + object);
		}
		System.out.println("list ===== " + list.get(0));
	 
		return list;
	}
	
	public List<Object> myOrderDateList(String did) {
		map.put("did", did);
		List<Object> list1 = session.selectList(ns + "myOrderDateList", map);
		System.out.println("list1 : " + list1);
		map.put(list1, list1);
		return list1;
	}
	public void selectOrderId() {
		int orderId = session.selectOne(ns + "selectOrderId" );
		System.out.println(orderId + " ============== ");
	}

} // end class
