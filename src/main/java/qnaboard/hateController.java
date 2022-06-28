package qnaboard;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/PetPlanet/hate")
public class hateController extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		QNAboardDAO qao = new QNAboardDAO();
		String num = req.getParameter("num");
		String id = req.getParameter("id");
		qao.likeCountMinus(num);
		qao.close();
		
//		HttpSession session = req.getSession();
//		
//		session.setAttribute("likeCheck", 0);
//		session.setAttribute("num", num);
//		session.setAttribute("id", id);
		
		likeTableDAO lao = new likeTableDAO();
		
		Map<String, Object> dmap = new HashMap<String, Object>();
		
		dmap.put("num", num);
		dmap.put("id", id);
		
		int result = lao.likeDelete(dmap);
		
		if(result == 1) {
			System.out.println("like 1 감소");
		} else {
			System.out.println("like 1 감소 실패");
			dmap.put("like_check", 0);
			int prove = lao.likeInsert(dmap);
			if(prove == 1) {
				System.out.println("insert 성공");
			} else {
				System.out.println("insert 실패");
			}
		}
		lao.close();
		
		req.setAttribute("dmap", dmap);
		resp.sendRedirect("./QNA?num=" + num);
	}
}
