package service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.Category;


@Repository
public class CategoryMybatisDao {
	
	@Autowired
	SqlSessionTemplate session;
	
	private static final String ns = "category."; 
	private Map map = new HashMap();
	public int categoryCount(String cid) {
		
		int num = session.selectOne(ns+"categoryCount", cid);
		return num;
	}
	
	public List<Category> categoryList(int pageInt, int limit, String cid){
		
		map.clear();
		map.put("boardid", cid);
		map.put("start", (pageInt-1)*limit+1);
		map.put("end", (pageInt*limit));
		List<Category> list = session.selectList(ns+"categoryList",map);
		System.out.println(list);
		return list;
	}

public int insertCategory(Category category) {
	
	int num = session.insert(ns+"insertCategory", category);
	
	
	return num;
}
	//xml에 없음 
	public Category category(int num) {
		
		Category category = session.selectOne(ns+"category", num);
		
		return category;
	}
	

public int categoryUpdate(Category category) {
	
	int num = session.update(ns+"categoryUpdate", category);
	
	
	return num;
}
public int categoryDelete(int num) {
	
	int n = session.delete(ns+"categoryDelete", num);
	
	
	return n;
}

}	//end class
