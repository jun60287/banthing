package ban.controller.bean;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileReader;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;

import com.google.gson.JsonObject;
import com.google.gson.JsonParser;


public class Alram {
	 public void sendMes(String token,HttpServletRequest request) {
		    //    요청하는 클라이언트마다 가진 정보가 다를 수 있기에 HashMap타입으로 선언
		    String reqURL = "https://kapi.kakao.com/v2/api/talk/memo/default/send";
		    try {
		        URL url = new URL(reqURL);
		        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		        conn.setRequestMethod("POST");
		        conn.setDoOutput(true);
		        System.out.println(token);
		        //conn.setRequestProperty("Content-Type", "application/json");
		        conn.setRequestProperty("Authorization", "Bearer " + token);
		        conn.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
		        
		    	JsonParser parser = new JsonParser();
		    	String path=request.getRealPath("/WEB-INF/views/banThing/mes.json");
		        Object obj = parser.parse(new FileReader(path));
		        
		        JsonObject jo = (JsonObject)obj;
		        String json=jo.toString();
		        
		        OutputStreamWriter bw =new OutputStreamWriter(conn.getOutputStream());
	            StringBuilder sb = new StringBuilder();
	            sb.append("template_object=");
	            sb.append(json);
	            System.out.println(sb);
	            bw.write(sb.toString());
	            bw.flush();
		        
		        int responseCode = conn.getResponseCode();
		        System.out.println("responseCode : " + responseCode);
		        		
	            bw.close();
	            conn.disconnect();	


		    } catch (Exception e) {
		        e.printStackTrace();
		    }
	 }
	
		    
	
}
