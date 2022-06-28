package member;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import utils.JSFunction;

@WebServlet("/PetPlanet/IdSearch")
public class IdSearchController extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		MemberDAO dao = new MemberDAO();
		
		String email = req.getParameter("search_email");
		String name = req.getParameter("search_name");
		
		MemberDTO dto = dao.idSearch(email, name);
		
		dao.close();
		
		if(dto.getId() != null) {
			resp.setContentType("text/html; charset=UTF-8");
			PrintWriter out = resp.getWriter();
    		out.println(String.format("<script>window.open('search_id_check.jsp?id=%s', 'IdCheck', 'width=500, height=300'); location.replace('../petplanet.do')</script>", dto.getId()));
		} else {
			JSFunction.alertBack(resp, "아이디 찾기 오류입니다.");
		}
	}
}
