package bts.controller.bean;

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
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
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
import bts.model.dao.Bts_DealDAO;
import bts.model.vo.Bts_ChatVO;
import bts.model.vo.Bts_DealVO;

//전체적인 사이트 컨트롤러
@Controller
@RequestMapping("/banThing/")
public class Bts_Bean {
	
	@Autowired
	Bts_ChatDAO chatDAO=null;
	@Autowired
	Bts_DealDAO dealDAO=null;
	
	HttpServletRequest request=null;
	HttpServletResponse response=null;
	HttpSession session=null;
	Model model=null;
	String uri=null;
	
	@ModelAttribute
	public void setting(HttpServletResponse response,HttpSession session,HttpServletRequest request,Model model) {
		this.request=request;
		this.response=response;
		this.session=session;
		this.model=model;
		uri=request.getRequestURI();
	}
	
	@RequestMapping("*.1")
	public String all1() {
		return uri.split("/")[3];
	}
	
	@RequestMapping("*.2")
	public String all2() {
		return uri.split("/")[3];
	}
	
	//기본 페이지 카테고리 등~
	@RequestMapping("index.2")
	public String index2(String addr, String options, String tag) {

		if(addr != null) {
			if(addr.equals("1")) {
				model.addAttribute("lat",37.5663174209601);
				model.addAttribute("lng",126.977829174031);
				model.addAttribute("level",10);
			}else if(addr.equals("2")) {
				model.addAttribute("lat",35.17992598569);
				model.addAttribute("lng",129.07509523457);
				model.addAttribute("level",10);
			}else if(addr.equals("3")) {
				model.addAttribute("lat",35.1600994105234);
				model.addAttribute("lng",126.851461925213);
				model.addAttribute("level",8);
			}else if(addr.equals("4")) {
				model.addAttribute("lat",35.5379472830778);
				model.addAttribute("lng",129.311256608093);
				model.addAttribute("level",9);
			}else if(addr.equals("5")) {
				model.addAttribute("lat",37.4562562632513);
				model.addAttribute("lng",126.704702815512);
				model.addAttribute("level",9);
			}
		}else {
			addr = "0";
			model.addAttribute("lat",37.5663174209601);
			model.addAttribute("lng",126.977829174031);
			model.addAttribute("level",11);
		}
		if(options==null) {
			options="전체";
		}
		if(tag==null) {
			tag="";
		}
		model.addAttribute("options",options);
		model.addAttribute("tag",tag);

		return uri.split("/")[3];
	}
	

}
