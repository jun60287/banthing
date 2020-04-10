package bts.controller.bean;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.eclipse.jdt.internal.compiler.ast.JavadocSingleNameReference;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import bts.model.dao.Bts_ChatDAO;
import bts.model.vo.Bts_ChatVO;

@Controller
@RequestMapping("/banThing/")
public class Bts_ChatBean {
	
	@Autowired
	private Bts_ChatDAO chatDAO;
	
	public HttpServletRequest request=null;
	public HttpServletResponse response=null;
	public Model model = null;

	
	@ModelAttribute
	public void reqres(HttpServletRequest request,HttpServletResponse response, Model model) {
		this.request=request;
		this.response=response;
		this.model = model;
	}
	
	@RequestMapping(value = "chatinfo", headers="Accept=*/*",  produces="application/json")
	@ResponseBody
	public Map ChatInfo(){
		List chatList =new ArrayList();
		chatList=chatDAO.getChatInfo();
		/*
		 * request.removeAttribute("chatList"); request.setAttribute("chatList",
		 * chatList);
		 */
		 Map map=new HashMap(); 
		 map.put("chatList", chatList);
		 
		return map;
	}
//	    response.setHeader("Content-Type", "application/xml"); 
//        response.setContentType("text/html;charset=UTF-8"); 
//        response.setCharacterEncoding("utf-8");

//		JSONObject all=new JSONObject();
//		JSONArray jsonarr=new JSONArray();
//		JSONArray aa=new JSONArray();
//		for(int i=0;i<chatList.size();i++) {
//			JSONObject placeInfo=new JSONObject();
//			String xyInfo=chatList.get(i).getPlaceInfo();
//			String x=xyInfo.split("-")[0];
//			String y=xyInfo.split("-")[1];
//			
//			placeInfo.put("x", y);
//			placeInfo.put("y", x);
//			jsonarr.add(placeInfo);
//		}
//			all.put("position",jsonarr);
//			
//	        response.getWriter().print(all.toString());
   
	@RequestMapping("submit")
	public void createChat (Bts_ChatVO vo, MultipartHttpServletRequest multireq) throws Exception {
		
		if (request.getMethod().equals("POST")) {
			System.out.println("ㅎ2ㅎ2");
			
			MultipartFile mf = null;
			String newName = null;
			try {
				// # 파일이름 중복처리  :  날짜 + 오리지널파일명
				mf = multireq.getFile("orgImg");									//0. 파일 정보 담기
				String orgName = mf.getOriginalFilename();//1. 오리지널 파일명
				String imgName = orgName.substring(0, orgName.lastIndexOf('.')); 	//2. 파일명만 추출
				String ext = orgName.substring(orgName.lastIndexOf('.'));			//3. 확장자 추출
				long date = System.currentTimeMillis();								//4. 날짜 받아오기
				newName = date + imgName + ext;										//5. 최종 파일이름
				
				// # DB에 form 저장
				vo.setImg(newName);
				chatDAO.createChat(vo);
				
				// # 서버에 이미지 저장 : WEB-INF  >  chatImg
				String path = multireq.getRealPath("chatImg");
				String imgPath = path+ "\\" + newName;
				File copyFile = new File(imgPath);
				mf.transferTo(copyFile);
				
				model.addAttribute("createChat","success");
				
				System.out.println(multireq.getRealPath("chatImg"));
				
				
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				response.sendRedirect("index.2");
			}
		}
	}
	
	
}
