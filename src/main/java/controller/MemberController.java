package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

//import com.oreilly.servlet.MultipartRequest;

import model.Member;
import service.MemberMybatisDao;

@Controller
@RequestMapping("/member/")
public class MemberController {
	
	@Autowired
	MemberMybatisDao md;
	
	HttpServletRequest request;
	Model m;
	HttpSession session;
	
	@ModelAttribute
	void init(HttpServletRequest request, Model m) {
		this.request = request;
		this.m = m;
		this.session = request.getSession();
	}
	
	@RequestMapping("index")
	public String index() throws Exception {
		request.setAttribute("index", "member 입니다.");
		return "index";
	}

	@RequestMapping("joinForm")
	public String joinForm() throws Exception {

		return "member/joinForm";
	}

	@RequestMapping("joinPro")
	public String joinPro(Member mem) throws Exception {
		
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

		return "alert";
	
	}

	@RequestMapping("loginForm")
	public String loginForm() throws Exception {

		return "member/loginForm";
	}


	@RequestMapping("loginPro")
	public String loginPro(String id,String pass) throws Exception {
		
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

		return "alert";
	}

	@RequestMapping("logout")
	public String logout() throws Exception {
		String login = (String) session.getAttribute("id");
		session.invalidate();

		String msg = login + "님 로그아웃되었습니다.";
		String url = "/member/loginForm";

		request.setAttribute("msg", msg);
		request.setAttribute("url", url);

		return "alert";
	}

	@RequestMapping("myaccount")
	public String myaccount() throws Exception {
		String id = (String) session.getAttribute("id");

		if (id != null && !id.equals("")) {
			Member m = md.selectOne(id);
			request.setAttribute("m", m);
			return "member/myaccount";
			
		} else {
			String msg = "로그인이 필요 합니다.";
			String url = "/member/loginForm";
			request.setAttribute("msg", msg);
			request.setAttribute("url", url);
			return "alert";
		}
	}

	@RequestMapping("memberUpdateForm")
	public String memberUpdateForm() throws Exception {
		String id = (String) session.getAttribute("id");

		if (id != null && !id.equals("")) {
			Member m = new MemberMybatisDao().selectOne(id);
			request.setAttribute("m", m);
			return "member/memberUpdateForm";

		} else {
			String msg = "로그인이 필요 합니다.";
			String url = "/member/loginForm";
			request.setAttribute("msg", msg);
			request.setAttribute("url", url);
			return "alert";
		}
	}

	@RequestMapping("memberUpdatePro")
	public String memberUpdatePro(Member mem) throws Exception {
		String id = (String) session.getAttribute("id");
		String msg = "로그인이 필요합니다.";
		String url = "/member/loginForm";

		if (id != null && !id.equals("")) {
			Member dbm = md.selectOne(id);
			if (dbm != null) {
				if (dbm.getPass().equals(mem.getPass())) {
					int num = md.updateMember(mem);
					if (num > 0) {
						msg = mem.getName() + "님의 정보 수정이 되었습니다.";
						url = "/member/myaccount";
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

		return "alert";

	}

	@RequestMapping("memberDelete")
	public String memberDelete() throws Exception {
		String id = (String) session.getAttribute("id");
		String msg = "로그인이 필요합니다.";
		String url = "/member/loginForm";
		if (id != null && !id.equals("")) {
			return "member/memberDelete";
		}

		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return "alert";
	}

	@RequestMapping("memberDeletePro")
	public String memberDeletePro(String pass) throws Exception {
		HttpSession session = request.getSession();		
		String id = (String) session.getAttribute("id");
		String msg = "로그인이 필요합니다.";
		String url = "/member/loginForm";

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
		return "alert";
	}
	
	
	
	@RequestMapping("memberPassUpdate")
	public String memberPassUpdate() throws Exception {
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		String msg = "로그인이 필요합니다.";
		String url = "/member/loginForm";
		if (id != null && !id.equals("")) {
			return "member/memberPassUpdate";
		}

		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return "alert";
	}
	
	
	
	
	@RequestMapping("memberPassPro")
	public String memberPassPro(String pass,String chgpass1) throws Exception {
		String id=(String)session.getAttribute("id");
		String msg="로그인이 필요합니다.";
		String url="/member/loginForm";

		if(id!=null && !id.equals("")){
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
		return "alert";
	}
	
	
	
	@RequestMapping("memberList")
	public String memberList() throws Exception {
		HttpSession session = request.getSession();
		String id=(String)session.getAttribute("id");
		String msg="로그인이 필요합니다.";
		String url="/member/loginForm";
		
		if (id!= null && id.equals("admin")) {
			List<Member> li = new ArrayList<Member>();
			li = md.memberList();	
			request.setAttribute("li", li);
			return "/member/memberList";
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return "alert";
	}
	
	
		
}// end class
