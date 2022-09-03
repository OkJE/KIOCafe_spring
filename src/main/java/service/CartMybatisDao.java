package service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.Cart;

@Repository
public class CartMybatisDao {

	@Autowired
	SqlSessionTemplate session;

	private static final String ns = "cart.";
	private Map map = new HashMap<>();

	public List<Cart> cartList(String userId) {
		map.put("id", userId);
		System.out.println("CartMybatisDao cartList start ");
		List<Cart> list = session.selectList(ns + "cartList", map);
		System.out.println("Dao list : " + list);
		System.out.println("CartMybatisDao cartList end");
		return list;
	}

//	장바구니 제품 삭제
	public void cartDelete(String userId, String[] dids ) {
		map.put("userid", userId);
		String[] didlist = dids;
		for (String string : didlist ) {
			System.out.println("cartDelete dids : "+string);
		}
		map.put("didlist", didlist);
		
		session.delete(ns+"cartDelete", map);		
	}
} // end class
