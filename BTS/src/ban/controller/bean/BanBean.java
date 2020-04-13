package ban.controller.bean;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.ProtocolException;
import java.net.URI;
import java.net.URISyntaxException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.HttpClientErrorException;

import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import bts.model.dao.Bts_ChatDAO;
import bts.model.vo.Bts_ChatVO;

@Controller
@RequestMapping("/banThing/")
public class BanBean {
	Logins login=new Logins();
	Alram alram=new Alram();
	
	@Autowired
	Bts_ChatDAO chatDAO=null;
	
	HttpServletRequest request=null;
	HttpServletResponse response=null;
	HttpSession session=null;
	Model model=null;
	
	
	@ModelAttribute
	public void setting(HttpServletResponse response,HttpSession session,HttpServletRequest request,Model model) {
		this.request=request;
		this.response=response;
		this.session=session;
		this.model=model;
	}
	
	@RequestMapping("*.1")
	public String all1() {
		String uri=request.getRequestURI();
		return uri.split("/")[3];
	}

	@RequestMapping("*.2")
	public String all2() {
		String uri=request.getRequestURI();
		return uri.split("/")[3];
	}
	
	@RequestMapping("index.2")
	public String index2(String val) {
		String uri=request.getRequestURI();
		if(val != null) {
			if(val.equals("1")) {
				model.addAttribute("lat",37.5663174209601);
				model.addAttribute("lng",126.977829174031);
				model.addAttribute("level",10);
			}else if(val.equals("2")) {
				model.addAttribute("lat",35.17992598569);
				model.addAttribute("lng",129.07509523457);
				model.addAttribute("level",10);
			}else if(val.equals("3")) {
				model.addAttribute("lat",35.1600994105234);
				model.addAttribute("lng",126.851461925213);
				model.addAttribute("level",8);
			}else if(val.equals("4")) {
				model.addAttribute("lat",35.5379472830778);
				model.addAttribute("lng",129.311256608093);
				model.addAttribute("level",9);
			}else if(val.equals("5")) {
				model.addAttribute("lat",37.4562562632513);
				model.addAttribute("lng",126.704702815512);
				model.addAttribute("level",9);
			}
		}else {
			val = "0";
			model.addAttribute("lat",37.5663174209601);
			model.addAttribute("lng",126.977829174031);
			model.addAttribute("level",11);
		}
		return uri.split("/")[3];
	}
	
	
	@RequestMapping("kakaologin")
	public String kakaologin(String code) throws URISyntaxException, MalformedURLException{
		
		String token= login.kakaoToken(code);
		session.setAttribute("kakaotoken", token);
		Map userInfo=login.kakaoInfo(token);
		request.setAttribute("userInfo", userInfo);
		return "/banThing/logins";
	}
	
	@RequestMapping("naverlogin")
	public String naverlogin(String code) throws URISyntaxException, MalformedURLException{
		
		String token=login.naverToken(code);
		Map userInfo=login.naverInfo(token);
		session.setAttribute("navertoken", token);
		request.setAttribute("userInfo", userInfo);
		return "/banThing/logins";
	}
	@RequestMapping("kakaoAlram")
	public String kakaoAlram(String code) throws URISyntaxException, MalformedURLException{
		
		String token=(String)session.getAttribute("kakaotoken");
		alram.sendMes(token, request);
		return "index.2";
	}
	@RequestMapping("logOut")
	public String logOut() throws URISyntaxException, IOException{
		String reqURL = "https://kapi.kakao.com/v1/user/unlink";
		String token=(String)session.getAttribute("kakaotoken");
	       	URL url = new URL(reqURL);
	        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	        conn.setRequestMethod("POST");
	        conn.setDoInput(true);
	        
	        conn.setRequestProperty("Content-Type", "application/json");
	        conn.setRequestProperty("Accept-Charset", "UTF-8");
	        conn.setRequestProperty("Authorization", "Bearer " +token);
	        
	        int responseCode = conn.getResponseCode();
	        System.out.println(responseCode);
	        
	        conn.disconnect();
		return "index.2";
	}
	
   @ResponseBody
   @RequestMapping("chicken")
   public void chicken(HttpServletResponse response) throws Exception{
	  response.setHeader("Content-Type", "application/xml"); 
      response.setContentType("text/html;charset=UTF-8"); 
      response.setCharacterEncoding("utf-8");
      JsonObject jo=check();
      response.getWriter().print(jo.toString());
   }
	   	
	
    public JsonObject check() throws Exception{
    	JsonParser parser = new JsonParser();
    	String path=request.getRealPath("/WEB-INF/views/banThing/chicken.json");
    	System.out.println();
        Object obj = parser.parse(new FileReader(path));
        JsonObject jo = (JsonObject) obj;
        
        return jo;
    }


}
