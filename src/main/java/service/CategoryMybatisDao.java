package service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.stereotype.Repository;

import model.Category;


@Repository
public class CategoryMybatisDao {
	
	@Autowired
	SqlSessionTemplate session;
	
	private static final String ns = "board."; 
	private Map map = new HashMap();
	public int boardCount(String boardid) {
		
		int num = session.selectOne(ns+"boardCount", boardid);
		return num;
	}
	
	public List<Category> boardList(int pageInt, int limit, String boardid){
		
		map.clear();
		map.put("boardid", boardid);
		map.put("start", (pageInt-1)*limit+1);
		map.put("end", (pageInt*limit));
		List<Category> list = session.selectList(ns+"boardList",map);
		System.out.println(list);
		return list;
	}

public int insertBoard(Category board) {
	
	int num = session.insert(ns+"insertBoard", board);
	
	
	return num;
}

	public Category boardOne(int num) {
		
		Category board = session.selectOne(ns+"boardOne", num);
		
		return board;
	}
	
	public void readCountUp(int num) {
		
		
		session.update(ns+"readCountUp", num);
		
		
	}
	
public void refStepAdd(int ref, int refstep) {
		
	
	map.clear();
	map.put("ref", ref);
	map.put("refstep", refstep);
	session.insert(ns+"insertBoard", map);
	

	}

public int insertReply(Category board) {
	
	int num = session.insert(ns+"insertReply", board);
	
	
	return num;
	
}
public int boardUpdate(Category board) {
	
	int num = session.update(ns+"boardUpdate", board);
	
	
	return num;
}
public int boardDelete(int num) {
	
	int n = session.delete(ns+"boardDelete", num);
	
	
	return n;
}

}	//end class
