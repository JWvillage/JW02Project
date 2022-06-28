package member;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import utils.JSFunction;

@WebServlet("/PetPlanet/PwSearch")
public class PwSearchController extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		MemberDAO dao = new MemberDAO();
		
		String id = req.getParameter("search_id");
		String name = req.getParameter("search_name");
		
		MemberDTO dto = dao.pwSearch(id, name);
		
		dao.close();
		
		if(dto.getPass() != null) {
			resp.setContentType("text/html; charset=UTF-8");
			PrintWriter out = resp.getWriter();
    		out.println(String.format("<script>window.open('search_pass_check.jsp?pass=%s', 'PassCheck', 'width=500, height=300'); location.replace('../petplanet.do')</script>", dto.getPass()));
		} else {
			JSFunction.alertBack(resp, "비번 찾기 오류입니다.");
		}
	}
}
