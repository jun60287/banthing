package bts.controller.bean;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.MalformedURLException;
import java.net.URISyntaxException;
import java.net.HttpURLConnection;
import java.net.URI;
import java.net.URL;
import java.net.URLEncoder;
import java.util.Map;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.HttpClientErrorException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import bts.model.dao.Bts_MemberDAOImpl;
import bts.model.vo.Bts_MemberVO;

import ban.controller.bean.Logins;


@Controller
@RequestMapping("/banThing/")
public class Bts_MemberBean {
	Logins login = null;
	
	@Autowired
	private Bts_MemberDAOImpl memberDAO;
	
	public HttpServletRequest request=null;
	public HttpServletResponse response=null;
	public Model model = null;
	public HttpSession session = null;
	
	@ModelAttribute
	public void reqres(HttpServletRequest request,HttpServletResponse response, Model model, HttpSession session) {
		this.request=request;
		this.response=response;
		this.model = model;
		this.session = session;
	}
	@RequestMapping("signup.1")
	public String signupForm(Bts_MemberVO vo) throws Exception {
		if(request.getMethod().equals("GET")){
			return "signup.1";
		}else if(request.getMethod().equals("POST")){
			//주민번호로 성별 구별하여 vo.gender에 넣어주기
			String ssan = vo.getSsan();
			String gender = "";

			if (ssan.charAt(7) == '1' || ssan.charAt(7) == '3') {
				gender = "남자";
			}else if (ssan.charAt(7) == '2' || ssan.charAt(7) == '4') {
				gender = "여자";
			}else {
				model.addAttribute("ssan","err");
				return "signup.1";
			}
			vo.setGender(gender);
			
	 		memberDAO.signupMember(vo);
	 		model.addAttribute("signup","success");
			
		}
		return "signup.1";
	}
	
	
	@RequestMapping("apiLogin.1")
	public String kakaologin(String id, String nickname, String name, String email, HttpSession session) throws Exception {
		//1. 아이디 꺼내서 디비에서 확인
		String api = null;
		if(name == "" || email == "") { api = "k-"; id = api+id; }
		else { api = "n-"; id = "n-"+id; }
		
		int check = memberDAO.apiIdCheck(id);
		
		//2. 있으면 로그인
		if(check == 1) {
			session.setAttribute("sessionId", id);
			model.addAttribute("check", check);
			System.out.println("'"+id+"'"+"님이 로그인하셨습니다.");
			
			return "map-setting.1";
		}else {
		//3. 없으면 회원가입
				model.addAttribute("id", id);
				model.addAttribute("nick", nickname);				
				model.addAttribute("name", name);				
				model.addAttribute("email", email);				
			return "signup.1";
		}

	}
	
	@RequestMapping("login.1")
	public String loginForm (Bts_MemberVO vo, HttpSession session) throws Exception {
		
		if(request.getMethod().equals("GET")) {
			return "login.1";
		}else if(request.getMethod().equals("POST")){
			int check = memberDAO.loginCheck(vo);
			
			if (check == 1) {
				session.setAttribute("sessionId", vo.getId());
				model.addAttribute("check", check);
				System.out.println("'"+vo.getId()+"'"+"님이 로그인하셨습니다.");
				return "map-setting.1";
			}else {
				model.addAttribute("check", "err");
				return "login.1";
			}
		}
		return "login.1";
	}
	
	@RequestMapping("logout")
	public String logout () throws Exception {
		
		String id = (String)session.getAttribute("sessionId");
		if(id != null) {
			session.invalidate();
			model.addAttribute("logout","success");
		}
		
		return "login.1";
	}
	
	@RequestMapping("update.1")
	public String update (Bts_MemberVO vo,HttpSession session) throws Exception {
		if(request.getMethod().equals("GET")) {
			String id = (String)session.getAttribute("sessionId");
			System.out.println(id);
			Bts_MemberVO vo1 = memberDAO.selectMember(id);
			model.addAttribute("all",vo1);
			
			return "update.1";
		}else if(request.getMethod().equals("POST")){
			System.out.println(vo.getId());
			System.out.println(vo.getPw());
			System.out.println(vo.getNick());
			memberDAO.updateMember(vo);
			model.addAttribute("update","success");
			return "map-setting.1";
		}
		
		return "update.1";
	}

	@RequestMapping("checkPs.1")
	public String checkPs (Bts_MemberVO vo,HttpSession session) throws Exception {
		if(request.getMethod().equals("GET")) {
			return "checkPs.1";
		}else if(request.getMethod().equals("POST")){
			vo.setId((String)session.getAttribute("sessionId"));
			System.out.println(vo.getId());
			System.out.println(vo.getPw());
			int suc = memberDAO.loginCheck(vo);
			if (suc == 1) {
				model.addAttribute("check", "success");
				return "checkPs.1";
			}else {
				model.addAttribute("check", "err");
				return "checkPs.1";
			}
		}
		
		return "checkPs.1";
	}
	
	@RequestMapping("delete.1")
	public String delete (Bts_MemberVO vo,HttpSession session) throws Exception {
		if(request.getMethod().equals("GET")) {
			return "delete.1";
		}else if(request.getMethod().equals("POST")){
			String id = (String)session.getAttribute("sessionId");
			System.out.println(id);
			memberDAO.deleteMember(id);
			return "login.1";
		}	
		
		return "delete.1";
	}
}
	


