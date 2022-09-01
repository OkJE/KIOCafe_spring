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
   private Map map = new HashMap();
   public int cartCount(String did) {
      
      int num = session.selectOne(ns+"cartCount", did);
      return num;
   }
   
   public List<Cart> cartList(int pageInt, int limit, String did){
      
      map.clear();
      map.put("did", did);
      map.put("start", (pageInt-1)*limit+1);
      map.put("end", (pageInt*limit));
      //System.out.println(map);
      List<Cart> list = session.selectList(ns+"cartList",map);
      System.out.println(list);
      return list;
   }

public int insertCart(Cart cart) {
   System.out.println(cart);
   int num = session.insert(ns+"insertCart", cart);
   
   
   return num;
}
   //xml에 없음 
   public Cart cartOne(int dnum) {
      
	   Cart cart = session.selectOne(ns+"cartOne", dnum);
      
      return cart;
   }
   

public int cartUpdate(Cart cart) {
   
   int num = session.update(ns+"cartUpdate", cart);
   
   
   return num;
}
public int cartDelete(int num) {
   
   int n = session.delete(ns+"cartDelete", num);
   
   
   return n;
}

}   //end class