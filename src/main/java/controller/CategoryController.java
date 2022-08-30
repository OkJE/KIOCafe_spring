package controller;


import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.el.lang.FunctionMapperImpl.Function;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import model.Category;
import service.CategoryMybatisDao;


@Controller 
@RequestMapping("/category/")
public class CategoryController {
	 @Autowired 
	 CategoryMybatisDao bd;
	
	HttpServletRequest request;
	   Model m;
	   HttpSession session;
	   @ModelAttribute
	   void init(HttpServletRequest request, Model m) {
	      this.request = request;
	      this.m = m;
	      this.session = request.getSession();
	   } 
	

	@RequestMapping("bakeryMain")	//handler처럼 사용하기 위해서 가져온다.
	public String bakeryMain()  {
		
		return "bakeryMain";
	}
	
	@RequestMapping("categoryForm")	//handler처럼 사용하기 위해서 가져온다.
	public String categoryForm(){
		
		
		return "bakeryMain";
	}
	@RequestMapping("categoryPro")
	public String categoryPro(@RequestParam("uploadfile") MultipartFile multipartFile, Category category) throws Exception {

		
		  String path = request.getServletContext().getRealPath("/") +
		 "view/category/img/";
		
		  if (!multipartFile.isEmpty()) {
				File file = new File(path, multipartFile.getOriginalFilename());
				multipartFile.transferTo(file);
				category.setCpicture(multipartFile.getOriginalFilename());
				
			}else {
				category.setCpicture("");
			}

		  String filename = null;
		String msg = "게시물을 등록 실패";
		String url = "categoryForm";
		HttpSession session = request.getSession();

		String boardid = (String) session.getAttribute("boardid");
		if (boardid == null)
			boardid = "1";
		category.setBoardid(boardid);	//우선 공지사항
		int num = bd.insertBoard(category);
		
			
			if (num > 0) {
				msg = "게시물을 등록 성공";
				url = "mainpage";
			}

			System.out.println(category);

		
		// request.setAttribute("filename", filename);
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return "alert";
	}
	
	@RequestMapping("categoryList")	//handler처럼 사용하기 위해서 가져온다.
	public String boardList()  {
		
		HttpSession session = request.getSession();
		if(request.getParameter("boardid") != null) {
			session.setAttribute("boardid", request.getParameter("boardid"));
			session.setAttribute("pageNum","1");
		}
		String boardid=(String)session.getAttribute("boardid");
		if(boardid==null) boardid="1";
		//다른 게시판으로 갈때 다시 1로 넘어갈수 있도록 명령어를 넣어준다. 만약 없으면 자동으로 동일한 page로 들어가서 해당 page의 갯수가 없으면 야예 없는 null이 뜨게 한다.
	
		if(request.getParameter("pageNum") !=null) {
			session.setAttribute("pageNum", request.getParameter("pageNum"));
		}
		
		String pageNum = request.getParameter("pageNum");
		if (pageNum==null) pageNum="1";
		int pageInt = Integer.parseInt(pageNum);
		int limit = 3;	//한 page당 게시물 갯수
		//100개이면 order by 최근 num desc		
		
		/*
		 * 스타트 페이지를 알아야 한다. 전체 페이지에서 찾을려면 startPage(pageInt-1)*limit+1, 
		 * end:startPage + limit -1을 하면 해당 값이 나온다.
		 * 예)
		 * 1 page : 1,2,3
		 * 		2 : 4,5,6      s: 4 , e: 6
		 * 		3 : 7,8,9      s: 7  ,e: 9
		 */
		
		
		int boardCount=bd.boardCount(boardid);
		
		System.out.println(boardCount);
		List<Category> list=bd.boardList(pageInt, limit, boardid);
		int bottomLine=3;
		int start = (pageInt-1)/bottomLine*bottomLine+1;
		int end = start + bottomLine -1;
		int maxPage = (boardCount/limit) + (boardCount%limit==0?0:1);
		if (end>maxPage) end=maxPage;
		/* 1P
		 * 2P
		 * 3 -- 페이지 보여줄 부분 수정
		 * */
		String boardName = "공지사항";
		switch(boardid) {
		case "1" : boardName = "공지사항"; break;
		case "2" : boardName = "자유게시판"; break;
		case "3" : boardName = "QnA"; break;
		}
		
		int boardNum = boardCount - (pageInt-1)*limit;
		
		request.setAttribute("pageInt", pageInt);
		request.setAttribute("list", list);
		request.setAttribute("boardName", boardName);
		request.setAttribute("boardCount", boardCount);
		request.setAttribute("boardNum", boardNum);
		request.setAttribute("start", start);
		request.setAttribute("end", end);
		request.setAttribute("bottomLine", bottomLine);
		request.setAttribute("maxPage", maxPage);
		
		
		return "category/boardList";
	}
	
	}
	
	/*@RequestMapping("loginForm")	//handler처럼 사용하기 위해서 가져온다.
	public String loginForm(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setAttribute("index", "board 입니다.");
		
		return "member/loginForm";
	}
	
	@RequestMapping("loginPro")	//handler처럼 사용하기 위해서 가져온다.
	public String loginPro(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setAttribute("index", "board 입니다.");
		HttpSession session = request.getSession();
		String id = request.getParameter("id");
		String pass = request.getParameter("pass");

		MemberMybatisDao md = new MemberMybatisDao();

		Member mem = md.selectOne(id);

		String msg = "아이디를 확인하세요.";
		String url = "/member/loginForm";

		if(mem != null){
			if(pass.equals(mem.getPass())){
				//pass가 String이어서 equals를 사용하는게 좋다.
				session.setAttribute("id", id);
				msg=mem.getName() + "님이 로그인 하셨습니다.";
				url="/member/index";
			}else{
				msg="비밀번호를 확이하세요.";
				url="/member/loginForm";
			}
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return "alert";
	}
	
	@RequestMapping("logout")	//handler처럼 사용하기 위해서 가져온다.
	public String logout(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setAttribute("index", "board 입니다.");
		HttpSession session = request.getSession();
		
		String login = (String)session.getAttribute("id");
		session.invalidate();
		
		String msg = login + "로그아웃 되었습니다.";
		String url = "/member/loginForm";
		
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return "alert";
	}
	
	@RequestMapping("memberInfo")	//handler처럼 사용하기 위해서 가져온다.
	public String memberInfo(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setAttribute("index", "board 입니다.");
		
		HttpSession session = request.getSession();		
		
		String id = (String)session.getAttribute("id");
		if (id !=null && !id.equals("")){
			Member m = new MemberMybatisDao().selectOne(id);
			request.setAttribute("m", m);
		
		return "member/memberInfo";
		} else {
			String msg = "로그인이 필요합니다.";
			String url = "/member/loginForm";
			request.setAttribute("msg", msg);
			request.setAttribute("url", url);
			return "alert";
		}
	}
	
	@RequestMapping("memberUpdateForm")	//handler처럼 사용하기 위해서 가져온다.
	public String memberUpdateForm(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setAttribute("index", "board 입니다.");
		
		HttpSession session = request.getSession();	
		String id = (String)session.getAttribute("id");
		if (id !=null && !id.equals("")){
			Member m = new MemberMybatisDao().selectOne(id); 
			request.setAttribute("m", m);
			return "member/memberUpdateForm";
		} else {
			String msg = "로그인이 필요합니다.";
			String url = "/member/loginForm";
			request.setAttribute("msg", msg);
			request.setAttribute("url", url);
			return "alert";
		}
		}

	
	@RequestMapping("memberUpdatePro")	//handler처럼 사용하기 위해서 가져온다.
	public String memberUpdatePro(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setAttribute("index", "board 입니다.");
		
		HttpSession session = request.getSession();	
		
		String id = (String) session.getAttribute("id"); 
		String msg = "로그인이 필요합니다.";
		String url =  "/member/loginForm";
		if(id !=null && !id.equals("")){

		request.setCharacterEncoding("utf-8");
		Member mem = new Member();
		mem.setId(id);
		// 위에 아이디가 다른 이유는 넘어온 정보를 가지고 있기 위해서 request 부문을 수정한 것이다.
		mem.setPass(request.getParameter("pass"));
		mem.setName(request.getParameter("name"));
		mem.setGender(Integer.parseInt(request.getParameter("gender")));
		mem.setTel(request.getParameter("tel"));
		mem.setEmail(request.getParameter("email"));
		mem.setPicture(request.getParameter("picture"));
		
		MemberMybatisDao md = new MemberMybatisDao();
		Member dbm = md.selectOne(id);
		//password 확인
		
		if(dbm !=null){
			if(dbm.getPass().equals(mem.getPass())){
				int num = md.updateMember(mem);	//정보수정
				
				if(num>0){
					msg=mem.getName()+"님의 정보 수정이 되었습니다.";
					url="/member/memberInfo";
				}else{
					msg="정보 수정이 실패 했습니다.";
					url="/member/memberUpdateForm";
				}
			} else{
				msg="비밀번호가 틀립니다.";
				url="/member/memberUpdateForm";
			}
		}
		}	
			request.setAttribute("msg", msg);
			request.setAttribute("url", url);
			return "alert";		
		}
	
	@RequestMapping("memberDelete")	//handler처럼 사용하기 위해서 가져온다.
	public String memberDelete(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setAttribute("index", "board 입니다.");
		
		HttpSession session = request.getSession();			
		String id = (String) session.getAttribute("id"); 
		if(id !=null && !id.equals("")){

			return "member/memberDelete";
		} else {
			String msg = "로그인이 필요합니다.";
			String url = "/member/loginForm";
			request.setAttribute("msg", msg);
			request.setAttribute("url", url);
			return "alert";
		}
		}
	
	@RequestMapping("memberDeletePro")	//handler처럼 사용하기 위해서 가져온다.
	public String memberDeletePro(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setAttribute("index", "board 입니다.");
		
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id"); 
		String pass = request.getParameter("pass"); 
		String msg = "로그인이 필요합니다.";
		String url = "/member/loginForm";
		if(id !=null && !id.equals("")){
		
		MemberMybatisDao md = new MemberMybatisDao();
		Member dbm = md.selectOne(id);
		
		if(dbm !=null){
			if(dbm.getPass().equals(pass)){
				int num = md.deleteMember(id);	//정보수정
				
				if(num>0){
					msg=id+"님이 탈퇴 처리되었습니다.";
					session.invalidate();
					url="/member/loginForm";
				}else{
					msg="회원탈퇴가 실패 했습니다.";
					url="/member/memberDelete";
				}
			} else{
				msg="비밀번호가 틀립니다.";
				url="/member/memberDelete";
			}
		}		
		}				
			request.setAttribute("msg", msg);
			request.setAttribute("url", url);
			return "alert";		
		}

	@RequestMapping("memberPassUpdate")	
	public String memberPassUpdate(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setAttribute("index", "board 입니다.");
		
		HttpSession session = request.getSession();					
		String id = (String) session.getAttribute("id"); 
		String msg = "로그인이 필요합니다.";
		String url = "/member/loginForm";
		if(id !=null && !id.equals("")){
			return "member/memberPassUpdate";
		}else{			
			request.setAttribute("msg", msg);
			request.setAttribute("url", url);
			return "alert";
		} 
	}
		
	
	@RequestMapping("memberPassPro")	//handler처럼 사용하기 위해서 가져온다.
	public String memberPassPro(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setAttribute("index", "board 입니다.");
		
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id"); 
		String pass = request.getParameter("pass"); 
		String chgpass = request.getParameter("chgpass1");
		String msg = "로그인이 필요합니다.";
		String url = "/member/loginForm";
		if(id !=null && !id.equals("")){
		
		MemberMybatisDao md = new MemberMybatisDao();
		Member dbm = md.selectOne(id);
		//password 확인
		
		if(dbm!=null){
			if(dbm.getPass().equals(pass)){
				int num = md.chagePass(id, chgpass);	//정보수정s
				
				if(num>0){
					msg=id+"의 비밀번호가 변경되었습니다.";
					url="/member/index";
				}else{
					msg="비밀번호 변경 실패했습니다.";
					url="/member/memberPassUpdate";
				}
			} else{
				msg="비밀번호가 틀립니다.";
				url="/member/memberPassUpdate";
			}
		}		
		}				
			request.setAttribute("msg", msg);
			request.setAttribute("url", url);
			return "alert";		
		}
	
	
	
	@RequestMapping("memberList")	
	public String memberList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setAttribute("index", "board 입니다.");
		
		HttpSession session = request.getSession();					
		String id = (String)session.getAttribute("id");
		
		String msg = "로그인이 필요합니다.";
		String url = "/member/loginForm";
		if (id !=null && id.equals("admin")){
		List<Member> li = new ArrayList<Member>();
		li = new MemberMybatisDao().memberList();
		request.setAttribute("li", li);
		return "member/memberList";
		}else{			
			request.setAttribute("msg", msg);
			request.setAttribute("url", url);
			return "alert";
		} 
	}
	
	@RequestMapping("pictureimgForm")	
	public String pictureimgForm(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
			return "member/pictureimgForm";		 
	}
	
	@RequestMapping("picturePro")	
	public String picturePro(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setAttribute("index", "board 입니다.");	
		
		String path = request.getServletContext().getRealPath("/")+"view/member/picture/";	//파일 저장 위치
		String filename = null;
		try{
		MultipartRequest multi = new MultipartRequest(request,path,10*1024*1024,"UTF-8");	//파일 크기이다.
		filename = multi.getFilesystemName("picture"); 
		
		filename = multi.getFilesystemName("picture");
		
		} catch (IOException e){
			e.printStackTrace();
		}
		request.setAttribute("filename", filename);
		
			return "member/picturePro";		 
	}
}*/

	