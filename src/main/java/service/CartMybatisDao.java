package service;

import java.util.HashMap;
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
		System.out.println("Dao cartList userId : " + userId);
		map.put("id", userId);
		System.out.println("CartMybatisDao cartList start ");
		List<Cart> list = session.selectList(ns + "cartList", map);
		System.out.println("Dao list : " + list);
		System.out.println("CartMybatisDao cartList end");
		return list;
	}
	
	public List<Cart> orderList(String userId) {
		System.out.println("Dao cartList userId : " + userId);
		map.put("id", userId);
		System.out.println("CartMybatisDao orderList start ");
		List<Cart> list = session.selectList(ns + "orderList", map);
		System.out.println("Dao list : " + list); 
		
		return list;
	}


	public int cartInsert(Cart cart) {
		System.out.println("insertCart ");
		System.out.println("insertCart cart : " + cart);
		int num = session.insert(ns + "cartInsert", cart);
		return num;
	}
	
	//
	public Cart cartOne(int dnum) {

		Cart cart =session.selectOne(ns+"cartOne",dnum);
	
		return cart;
	}
//	장바구니 제품 삭제
	public void cartDelete(String userId, String[] dids ) {
		
		String[] didlist = dids;
		for (String string : didlist ) {
			System.out.println("cartDelete dids : "+string);
		}
		System.out.println("userId : " + userId);
		map.put("userid", userId);
		map.put("didlist", didlist);
		
		session.delete(ns+"cartDelete", map);		
	}

	public void cartUpdate1(String userId, String[] dnums) {
		System.out.println("Dao cartUpdate1 " + userId);
		
		String[] didlist = dnums;

		for (String string : didlist) {
			System.out.println(string);
		}
		System.out.println("userId : " + userId);
		map.put("userid", userId);
		map.put("dnumlist", didlist);
		
		
		session.update(ns + "cartUpdate1", map);

	}

	public void cartUpdate2(String userId, String[] dnums) {
	System.out.println("Dao cartUpdate2 " + userId);
		
		String[] didlist = dnums;

		/*
		 * for (String string : didlist) { System.out.println("string : "+string); }
		 */
		System.out.println("userId : " + userId);
		map.put("userid", userId);
		map.put("dnumlist", didlist);
		
		session.update(ns + "cartUpdate2", map);
	}
	
	public int cartQtyUpdate(String userId,String[] dnums) {
		String[] didlist = dnums;
	
		map.clear();
		for (String string : didlist) {
			System.out.println("string : "+string);
		}
		
		map.put("userId", userId);
		map.put("didlist", didlist);
		
		
		int num=session.update(ns + "cartQtyUpdate", map);
		return num;
	}
	
/*	
	public int modifyDqty(Cart cart) {
		
		return modifyDqty(cart);
	}
*/
} // end class
