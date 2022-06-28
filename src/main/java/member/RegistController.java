package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import utils.JSFunction;

@WebServlet("/PetPlanet/regist")
public class RegistController extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.getRequestDispatcher("./registration.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String userId = req.getParameter("user_id");
		String userPw = req.getParameter("pass1");
		String userName = req.getParameter("name");
		String userEmail = req.getParameter("email");
		
		MemberDAO dao = new MemberDAO();
		
		MemberDTO dto = new MemberDTO();
		dto.setId(userId);
		dto.setPass(userPw);
		dto.setName(userName);
		dto.setEmail(userEmail);
		System.out.println(dto.getId());
		
		int success = dao.memberInsert(dto);
		
		if(success == 1) {
			JSFunction.alertLocation(resp, dto.getName() + "님 팻 플래닛에 오신걸 환영합니다!", "/J03Project/petplanet.do");
			System.out.println("회원가입 성공");
//			resp.sendRedirect("./main.jsp");
		} else {
			System.out.println("회원가입 실패");
			req.getRequestDispatcher("/J03Project/PetPlanet/regist").forward(req, resp);
		}
	}
}