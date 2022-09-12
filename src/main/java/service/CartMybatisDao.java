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
import model.Category;
import model.Member;

@Repository
public class CartMybatisDao {

	@Autowired
	SqlSessionTemplate session;

	private static final String ns = "cart.";
	private Map map = new HashMap<>();

	public List<Cart> cartList(String userId) {
		map.put("id", userId);
//		System.out.println("CartMybatisDao cartList start ");
		List<Cart> list = session.selectList(ns + "cartList", map);
		return list;
	}

	public List<Cart> orderList(String userId) {
		map.put("id", userId);
		List<Cart> list = session.selectList(ns + "orderList", map);

		return list;
	}

	public int cartInsert(Cart cart) {
		int num = session.insert(ns + "cartInsert", cart);
		return num;
	}

	public Cart cartOne(int dnum) {
		Cart cart = session.selectOne(ns + "cartOne", dnum);

		return cart;
	}

//	장바구니 제품 삭제
	public void cartDelete(String userId, String[] dids) {

		String[] didlist = dids;
		for (String string : didlist) {
//			System.out.println("cartDelete dids : " + string);
		}
		map.put("userid", userId);
		map.put("didlist", didlist);

//		System.out.println("didlist map : " + map.get("didlist"));
		session.delete(ns + "cartDelete", map);
	}

//	장바구니 물품 체크 후 -> 결제
	public void cartUpdate1(String userId, String[] dnum, ArrayList<String> dqtyArrList,
			ArrayList<String> dtotalArrList) {

		for (int i = 0; i < dnum.length; i++) {
			map.clear();
			map.put("dnum", dnum[i]);
			map.put("dqty", Integer.parseInt(dqtyArrList.get(i)));
			map.put("dtotal", Integer.parseInt(dtotalArrList.get(i)));
			session.update(ns + "cartUpdate1", map);
		}
	}

//	결제페이지 -> 결제
	public void cartUpdate2(String userId, String[] dnums) {

		String[] didlist = dnums;

		map.put("userid", userId);
		map.put("dnumlist", didlist);

		session.update(ns + "cartUpdate2", map);
	}

	public int cancleOrder(String userId, String[] dnums) {
		map.put("userid", userId);
		map.put("dnums", dnums);

		int c = session.update(ns + "cancleOrder", map);
		return c;
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
			System.out.println();
		}
		
		return 1;
	}

//	public int cartQtyUpdate(String userId, String[] dnums) {
//		String[] didlist = dnums;
//
//		map.clear();
//		for (String string : didlist) {
//			System.out.println("string : " + string);
//		}
//
//		map.put("userId", userId);
//		map.put("didlist", didlist);
//
//		int num = session.update(ns + "cartQtyUpdate", map);
//		return num;
//	}

} // end class
