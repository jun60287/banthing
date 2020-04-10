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
    
    @RequestMapping("pay")
    public void pay(HttpServletRequest request,String requestURL,HttpServletResponse response) {
	    String reqURL = "https://api.iamport.kr/users/getToken";
	    try {
	        URL url = new URL(reqURL);
	        HttpURLConnection conn = (HttpURLConnection)url.openConnection();
	        conn.setRequestMethod("POST");
	        conn.setDoOutput(true);
	        
	        conn.setRequestProperty("Authorization", "KakaoAK 57db4de065a116961a65a942b594e3ad");
	        conn.setRequestProperty("Content-Type", "application/x-www-form-urlencoded;charset=utf-8");
	        
	        OutputStreamWriter bw =new OutputStreamWriter(conn.getOutputStream());
            StringBuilder sb = new StringBuilder();
            sb.append("cid=TC0ONETIME&");
            sb.append("partner_order_id=partner_order_id&");
            sb.append("partner_user_id=partner_user_id&");
            sb.append("item_name=초코파이&");
            sb.append("quantity=1&");
            sb.append("total_amount=2200&");
            sb.append("vat_amount=200&");
            sb.append("tax_free_amount=0&");
            sb.append("approval_url=http://localhost:8080/success&");
            sb.append("fail_url=http://localhost:8080/fail&");
            sb.append("cancel_url=http://localhost:8080/cancel");
            conn.getOutputStream().write(sb.toString().getBytes());
//            bw.write(sb.toString());
//            bw.flush();
	        
	        int responseCode = conn.getResponseCode();
	        System.out.println("responseCode : " + responseCode);
	        
	        BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            String line = "";
            String result = "";
            
            while ((line = br.readLine()) != null) {
                result += line;
            }
//            System.out.println("response body : " + result);
            
            //    Gson 라이브러리에 포함된 클래스로 JSON파싱 객체 생성
            JsonParser parser = new JsonParser();
            JsonElement element = parser.parse(result);		
            
            String app=element.getAsJsonObject().get("next_redirect_app_url").getAsString();
            String pc=element.getAsJsonObject().get("next_redirect_pc_url").getAsString();
            String mobile=element.getAsJsonObject().get("next_redirect_mobile_url").getAsString();
            System.out.println(app);
            System.out.println(pc);
            System.out.println(mobile);
            bw.close();
            conn.disconnect();	


	    } catch (Exception e) {
	        e.printStackTrace();
	    }
 }
    @RequestMapping("success")
    public void ss() {
    	System.out.println("성공 ㅋㅋ");
    }
    @RequestMapping("fail")
    public void aa() {
    	System.out.println("실패");
    }
    @RequestMapping("cancel")
    public void dd() {
    	System.out.println("취소ㅋㅋ");
    }
    
}
