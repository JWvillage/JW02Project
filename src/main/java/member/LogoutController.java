package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import utils.JSFunction;

@WebServlet("/PetPlanet/Logout")
public class LogoutController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		HttpSession session = req.getSession();
		
		session.removeAttribute("u_id");
		session.removeAttribute("u_name");
		
		session.invalidate();
		
		JSFunction.alertLocation(resp, "다음에 또 뵙겠습니다.", req.getRequestURI());
	}
}
