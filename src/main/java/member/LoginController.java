package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import utils.JSFunction;

@WebServlet("/PetPlanet/Login")
public class LoginController extends HttpServlet{
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		HttpSession session = req.getSession();
		
		String userId = req.getParameter("id");
		String userPw = req.getParameter("password");
		
		MemberDAO dao = new MemberDAO();
		
		MemberDTO dto = new MemberDTO();
		
		dto = dao.memberLogin(userId, userPw);
		
		dao.close();
		
		if(dto.getId() != null) {
			System.out.println("로그인 성공");
			session.setAttribute("u_id", dto.getId());
			session.setAttribute("u_name", dto.getName());
			
			resp.sendRedirect(req.getHeader("referer"));
		} else {
			JSFunction.alertBack(resp, "로그인 오류입니다.");
//			JSFunction.alertLogin(resp, "login_check", "아이디(로그인 전용 아이디) 또는 비밀번호를 잘못 입력했습니다.<br />입력하신 내용을 다시 확인해주세요.");
		}
	}
}
