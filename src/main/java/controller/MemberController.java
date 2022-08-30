package controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

//import com.oreilly.servlet.MultipartRequest;

import model.Member;
import service.MemberMybatisDao;

public class MemberController {
	
	@RequestMapping("index")
	public String index(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setAttribute("index", "member 입니다.");
		return "/view/index.jsp";
	}

	@RequestMapping("joinForm")
	public String joinForm(HttpServletRequest request, HttpServletResponse response) throws Exception {

		return "/view/member/joinForm.jsp";
	}

	@RequestMapping("joinPro")
	public String joinPro(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		Member mem = new Member();
		SimpleDateFormat formatter=new SimpleDateFormat("yyyy년 MM월 dd일");
		
		mem.setId(request.getParameter("id"));
		mem.setPass(request.getParameter("pass"));
		mem.setName(request.getParameter("name"));
		mem.setTel(request.getParameter("tel"));
		mem.setAdress(request.getParameter("adress"));
		mem.setBirthday(formatter.parse(request.getParameter("birthday")));
		mem.setEmail(request.getParameter("email"));
		mem.setNickname(request.getParameter("nickname"));

		MemberMybatisDao md = new MemberMybatisDao();
		int num = md.insertMember(mem);
		String msg = "";
		String url = "";

		if (num > 0) {
			if(mem.getNickname()!=null) {
			msg = mem.getNickname() + "님 반갑습니다^^!";
			url = "/member/loginForm";
			} else {
				msg = mem.getName() + "님 반갑습니다^^!";
				url = "/member/loginForm";
			}
			
			
		} else {
			if(mem.getId()==null) {
			msg = "아이디를 확인해 주세요!";
			url = "/member/joinForm";
			} else if(mem.getPass()==null) {
				msg = "비밀번호를 입력 해 주세요!";
				url = "/member/joinForm";
			} else if(mem.getName()==null) {
				msg = "이름을 입력 해 주세요!";
				url = "/member/joinForm";
			} else if(mem.getTel()==null) {
				msg = "전화번호를 입력 해 주세요!";
				url = "/member/joinForm";
			} else if(mem.getAdress()==null) {
				msg = "주소를 입력 해 주세요!";
				url = "/member/joinForm";
			}
			
		}
			
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);

		return "/view/alert.jsp";
	
	}

	@RequestMapping("loginForm")
	public String loginForm(HttpServletRequest request, HttpServletResponse response) throws Exception {

		return "/view/member/loginForm.jsp";
	}


	@RequestMapping("loginPro")
	public String loginPro(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		String id = request.getParameter("id");
		String pass = request.getParameter("pass");

		MemberMybatisDao md = new MemberMybatisDao();

		Member mem = md.selectOne(id);

		String msg = "아이디를 확인하세요";
		String url = "/member/loginForm";

		if (mem != null) {

			if (pass.equals(mem.getPass())) {
				session.setAttribute("id", id);
				msg = mem.getName() + "님이 로그인 하셨습니다.";
				url = "/member/index";

			} else {
				msg = "비밀번호를 확인하세요";
			}
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);

		return "/view/alert.jsp";
	}

	@RequestMapping("logout")
	public String logout(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		String login = (String) session.getAttribute("id");
		session.invalidate();

		String msg = login + "님 로그아웃되었습니다.";
		String url = "/member/loginForm";

		request.setAttribute("msg", msg);
		request.setAttribute("url", url);

		return "/view/alert.jsp";
	}

	@RequestMapping("memberInfo")
	public String memberInfo(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");

		if (id != null && !id.equals("")) {
			Member m = new MemberMybatisDao().selectOne(id);
			request.setAttribute("m", m);
			return "/view/member/myaccount.jsp";
		} else {
			String msg = "로그인이 필요 합니다.";
			String url = "/member/loginForm";
			request.setAttribute("msg", msg);
			request.setAttribute("url", url);
			return "/view/alert.jsp";
		}
	}
/*
	@RequestMapping("memberUpdateForm")
	public String memberUpdateForm(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");

		if (id != null && !id.equals("")) {
			Member m = new MemberMybatisDao().selectOne(id);
			request.setAttribute("m", m);
			return "/view/member/memberUpdateForm.jsp";

		} else {
			String msg = "로그인이 필요 합니다.";
			String url = "/member/loginForm";
			request.setAttribute("msg", msg);
			request.setAttribute("url", url);
			return "/view/alert.jsp";
		}
	}

	@RequestMapping("memberUpdatePro")
	public String memberUpdatePro(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		String msg = "로그인이 필요합니다.";
		String url = "/member/loginForm";

		if (id != null && !id.equals("")) {
			request.setCharacterEncoding("utf-8");
			Member mem = new Member();
			mem.setId(id);
			mem.setPass(request.getParameter("pass"));
			mem.setName(request.getParameter("name"));
			mem.setGender(Integer.parseInt(request.getParameter("gender")));
			mem.setTel(request.getParameter("tel"));
			mem.setEmail(request.getParameter("email"));
			mem.setPicture(request.getParameter("picture"));
			MemberMybatisDao md = new MemberMybatisDao();
			Member dbm = md.selectOne(id);
			if (dbm != null) {
				if (dbm.getPass().equals(mem.getPass())) {
					int num = md.updateMember(mem);
					if (num > 0) {
						msg = mem.getName() + "님의 정보 수정이 되었습니다.";
						url = "/member/memberInfo";
					} else {
						msg = "정보 수정이 실패했습니다.";
						url = "/member/memberUpdateForm";
					}
				} else {
					msg = "비밀번호가 틀렸습니다.";
					url = "/member/memberUpdateForm";
				}
			}

		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);

		return "/view/alert.jsp";

	}
*/
	@RequestMapping("memberDelete")
	public String memberDelete(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		String msg = "로그인이 필요합니다.";
		String url = "/member/loginForm";
		if (id != null && !id.equals("")) {
			return "/view/member/memberDelete.jsp";
		}

		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return "/view/alert.jsp";
	}

	@RequestMapping("memberDeletePro")
	public String memberDeletePro(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		String pass = request.getParameter("pass");
		String msg = "로그인이 필요합니다.";
		String url = "/view/member/loginForm";

		if (id != null && !id.equals("")) {
			MemberMybatisDao md = new MemberMybatisDao();
			Member dbm = md.selectOne(id);
			if (dbm != null) {
				if (dbm.getPass().equals(pass)) {

					int num = md.deleteMember(id);
					if (num > 0) {
						msg = id + "님이 탈퇴 처리 되었습니다.";
						session.invalidate();
						url = "/member/loginForm";
					} else {
						msg = "회원탈퇴가 실패 했습니다.";
						url = "/member/memberDelete";
					}
				} else {
					msg = "비밀번호가 틀렸습니다.";
					url = "/member/memberDelete";
				}
			}

		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return "/view/alert.jsp";
	}
	
	
	
	@RequestMapping("memberPassUpdate")
	public String memberPassUpdate(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		String msg = "로그인이 필요합니다.";
		String url = "/member/loginForm";
		if (id != null && !id.equals("")) {
			return "/view/member/memberPassUpdate.jsp";
		}

		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return "/view/alert.jsp";
	}
	
	
	
	
	@RequestMapping("memberPassPro")
	public String memberPassPro(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		String id=(String)session.getAttribute("id");
		String pass=(String)request.getParameter("pass");
		String chgpass1=(String)request.getParameter("chgpass1");
		String msg="로그인이 필요합니다.";
		String url="/member/loginForm";

		if(id!=null && !id.equals("")){
			MemberMybatisDao md = new MemberMybatisDao();
			Member dbm=md.selectOne(id);
		if(dbm!=null){
			if(dbm.getPass().equals(pass)){
				int num=md.changePass(id, chgpass1);
				if(num>0){
					msg=id+"님이 비멀번호가 수정 되었습니다.";
					url="/member/index";
				} else{
					msg="비밀번호 변경이 실패하였습니다.";
					url="/member/memberPassUpdate";
				}
			}else {
				msg="비밀번호가 틀렸습니다.";
				url="/member/memberPassUpdate";
			}
		}


		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return "/view/alert.jsp";
	}
	
	
	
	@RequestMapping("memberList")
	public String memberList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		String id=(String)session.getAttribute("id");
		String msg="로그인이 필요합니다.";
		String url="/member/loginForm";
		
		if (id!= null && id.equals("admin")) {
			List<Member> li = new ArrayList<Member>();
			li = new MemberMybatisDao().memberList();	
			request.setAttribute("li", li);
			return "/view/member/memberList.jsp";
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return "/view/alert.jsp";
	}
	
	
		
}// end class
