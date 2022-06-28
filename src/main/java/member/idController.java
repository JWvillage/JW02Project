package member;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import utils.JSFunction;

@WebServlet("/PetPlanet/idDuple")
public class idController extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html; charset=UTF-8");
		HttpSession session = req.getSession();
		PrintWriter out = resp.getWriter();
		
		String u_id = req.getParameter("user_id");
//		System.out.println(input);
//		String u_id01 = input.split("=")[1];
//		System.out.println(u_id01);
//		String u_id = u_id01.split("&")[0];
		System.out.println(u_id);
		
		String result;
		
		if(u_id == "") {
	        
			result = "아이디 입력하세요";
			System.out.println(result);
			out.print(result);
			return;
			
	    // 아이디 입력 O
		} else {
	        // 아이디가 8 ~ 16자리인지 확인
	        if(u_id.length() >= 8 && u_id.length() <= 12) {
	        	boolean check = true;
	          	for(int i = 0; i < u_id.length(); i++) {
		            int ascii = u_id.charAt(i);
		            if(!((ascii >= 48 && ascii <= 57)
		                || (ascii >= 65 && ascii <= 90) || (ascii >= 97 && ascii <= 122))) {
		            	check = false;
		            	break;
		            }
	          	}
				// check가 false이면 영문, 숫자 이외의 문자가 입력되었으므로 새로 입력하라는 문구 출력
				if(check == false) {
					
					result = "아이디는 영문과 숫자의 조합으로 입력하세요";
					System.out.println(result);
					out.print(result);
					return;
					
				} else {
					
					MemberDAO dao = new MemberDAO();
					
					MemberDTO dto = dao.idValidate(u_id);
					
					System.out.println(dto.getId());
					
					dao.close();
					
					if(dto.getId() == null) {
						
						result = "사용 가능합니다";
						System.out.println(result);
						out.print(result);
						return;
						
					} else if (dto.getId().equals(u_id)) {
						
						result = "중복되었습니다";
						System.out.println(result);
						out.print(result);
						return;
					}
	            }
	        } else {
	        	
	        	result = "아이디는 8자리에서 12자리로 입력하세요";
	        	System.out.println(result);
	        	out.print(result);
	        	return;
	        }
		}
	}
}
