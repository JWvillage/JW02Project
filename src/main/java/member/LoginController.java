package member;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import utils.CookieManager;
import utils.JSFunction;

@WebServlet("/PetPlanet/Login")
public class LoginController extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String clientId = "U9I7zy8HU6FYjYNSOeBV";//애플리케이션 클라이언트 아이디값";
	    String clientSecret = "9LZGW8zSGl";//애플리케이션 클라이언트 시크릿값";
	    String code = req.getParameter("code");
	    String state = req.getParameter("state");
	    String redirectURI = URLEncoder.encode("http://localhost:8088/J03Project/petplanet.do", "UTF-8");
	    String apiURL;
	    apiURL = "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code&";
	    apiURL += "client_id=" + clientId;
	    apiURL += "&client_secret=" + clientSecret;
	    apiURL += "&redirect_uri=" + redirectURI;
	    apiURL += "&code=" + code;
	    apiURL += "&state=" + state;
	    String access_token = "";
	    String refresh_token = "";
	    // System.out.println("apiURL="+apiURL);
	    try {
	    	URL url = new URL(apiURL);
	    	HttpURLConnection con = (HttpURLConnection)url.openConnection();
	    	con.setRequestMethod("GET");
	    	int responseCode = con.getResponseCode();
	    	BufferedReader br;
	    	System.out.print("responseCode="+responseCode);
	    	if(responseCode==200) { // 정상 호출
	    		br = new BufferedReader(new InputStreamReader(con.getInputStream()));
	    	} else {  // 에러 발생
	    		br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
	    	}
	        String inputLine;
	        StringBuffer res = new StringBuffer();
	        while ((inputLine = br.readLine()) != null) {
	        	res.append(inputLine);
	        }
	        br.close();
	        if(responseCode==200) {
	        	System.out.println(res.toString());
	        	JSONParser parsing = new JSONParser();
	        	Object obj = parsing.parse(res.toString());
	        	JSONObject jsonObj = (JSONObject)obj;
    			        
	        	access_token = (String)jsonObj.get("access_token");
	        	refresh_token = (String)jsonObj.get("refresh_token");
	        	System.out.println(access_token);
	        }
	    } catch (Exception e) {
	      System.out.println(e);
	    }
		
	    if(access_token != null) { // access_token을 잘 받아왔다면
	    	try {
	    		String token = access_token; // 네이버 로그인 접근 토큰;
	            String header = "Bearer " + token; // Bearer 다음에 공백 추가
	    		String apiurl = "https://openapi.naver.com/v1/nid/me";
	    		URL url = new URL(apiurl);
	    		HttpURLConnection con = (HttpURLConnection)url.openConnection();
	    		con.setRequestMethod("GET");
	    		con.setRequestProperty("Authorization", header);
	    		int responseCode = con.getResponseCode();
	    		BufferedReader br;
	    		if(responseCode==200) { // 정상 호출
	    			br = new BufferedReader(new InputStreamReader(con.getInputStream()));
	    		} else {  // 에러 발생
	    			br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
	    		}
	    		String inputLine;
	    		StringBuffer res = new StringBuffer();
	    		while ((inputLine = br.readLine()) != null) {
	    			res.append(inputLine);
	    			JSONParser parsing = new JSONParser();
	    			Object obj = parsing.parse(res.toString());
	    			JSONObject jsonObj = (JSONObject)obj;
	    			JSONObject resObj = (JSONObject)jsonObj.get("response");
	    			String splitToken = access_token.substring(1, 5) + access_token.substring(40, 44);
	    			//왼쪽 변수 이름은 원하는 대로 정하면 된다. 
	    			//단, 우측의 get()안에 들어가는 값은 와인색 상자 안의 값을 그대로 적어주어야 한다.
	    			String email = (String)resObj.get("email");
	    			String name = (String)resObj.get("name");
	    			String id = resObj.get("id").toString().substring(1, 10);
	    			String pw = splitToken;
	    			System.out.println(name);
	    			System.out.println(email);
	    			System.out.println(id);
	    			System.out.println(pw);
	    			HttpSession session = req.getSession();
	    			session.setAttribute("naver_name", name);
	    			session.setAttribute("naver_email", email);
	    			session.setAttribute("naver_id", id);
	    			
	    			MemberDAO dao = new MemberDAO();
	    			
	    			MemberDTO dto = dao.idValidate(id);
	    			if (dto.getId() == null) {
	    				dto.setId(id);
	    				dto.setPass(pw);
	    				dto.setName(name);
	    				dto.setEmail(email);
	    				
	    				int success = dao.memberInsert(dto);
	    				System.out.println(success);
	    			} else {
	    				System.out.println("이미 있는 아이디");
	    			}
	    			
	    			dao.close();
	    		}
	    		br.close();
	        } catch (Exception e) {
	        	e.printStackTrace();
	        }
	    }
//	    req.getRequestDispatcher("../petplanet.do").forward(req, resp);
	    resp.sendRedirect("../petplanet.do");
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		HttpSession session = req.getSession();
		
		String userId = req.getParameter("id");
		String userPw = req.getParameter("password");
		String save_check = req.getParameter("save_check");
		String naver_name = req.getParameter("naver_name");
		System.out.println(naver_name);
		MemberDAO dao = new MemberDAO();
		
		MemberDTO dto = new MemberDTO();
		
		dto = dao.memberLogin(userId, userPw);
		
		dao.close();
		
		if(dto.getId() != null) {
			System.out.println("로그인 성공");
			session.setAttribute("u_id", dto.getId());
			session.setAttribute("u_name", dto.getName());
			if (save_check != null && save_check.equals("Y")) {
				// 쿠키 생성. 쿠키값은 로그인 아이디, 유효기간은 1일로 설정
				CookieManager.makeCookie(resp, "loginId", userId, 86400);
			} else {
				// 체크를 해제한 경우에는 쿠키 삭제.
				CookieManager.deleteCookie(resp, "loginId");
			}
			
			// resp.sendRedirect(req.getHeader("referer"));
			// session.setAttribute("naver_name", naver_name);
			resp.sendRedirect("../petplanet.do");
		} else {
			JSFunction.alertBack(resp, "로그인 오류입니다.");
//			JSFunction.alertLogin(resp, "login_check", "아이디(로그인 전용 아이디) 또는 비밀번호를 잘못 입력했습니다.<br />입력하신 내용을 다시 확인해주세요.");
		}
	}
}
