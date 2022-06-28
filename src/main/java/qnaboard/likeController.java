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

@WebServlet("/PetPlanet/like")
public class likeController extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		QNAboardDAO qao = new QNAboardDAO();
		
		String num = req.getParameter("num");
		String id = req.getParameter("id");
		
		qao.likeCountPlus(num);
		
		qao.close();
		
		HttpSession session = req.getSession();
		
		/*
		 * 테스트용 :
		 * 		단점 -> 한 페이지에서는 잘 되지만...
		 * 			다른 페이지에서 좋아요 한 뒤 처음 좋아요 한 페이지를 돌아오면...
		 * 			다시 좋아요가 가능함...
		 * */		
		session.setAttribute("likeCheck", 1);
		session.setAttribute("num", num);
		session.setAttribute("id", id);
		
		// DB에 저장할 예정
//		likeTableDAO lao = new likeTableDAO();
//		likeTableDTO lto = new likeTableDTO();
//		
//		Map<String, Object> umap = new HashMap<String, Object>();
//		
//		umap.put("num", num);
//		umap.put("id", id);
//		
//		List<likeTableDTO> ut = lao.pickUp(umap);
//		int result = lao.likeUpdate(umap);
//		
//		if(result == 1) {
//			System.out.println("like 1 증가");
//		} else {
//			System.out.println("like 1 증가 실패");
//		}
//		
//		req.setAttribute("umap", umap);
//		req.setAttribute("ut", ut);
//		resp.sendRedirect("./QNA?num=" + num);
//		req.getRequestDispatcher("./board.jsp").forward(req, resp);
	}
}
