package qnaboard;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/PetPlanet/qna")
public class QnaController extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		QNAboardDAO dao = new QNAboardDAO();
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		String searchField = req.getParameter("searchField");
		String searchWord = req.getParameter("searchWord");
		
		if (searchWord != null) {
			map.put("searchField", searchField);
			map.put("searchWord", searchWord);
		}
		
		int totalCount = dao.selectQNACount(map);
		
		ServletContext application = getServletContext();
		
		int pageSize = Integer.parseInt(application.getInitParameter("POSTS_PER_PAGE"));
		
		int pageNum = 1;
		String pageTemp = req.getParameter("pageNum");
		if (pageTemp != null && !pageTemp.equals(""))
			pageNum = Integer.parseInt(pageTemp);
		
		int endNum = 1;
		String endTemp = req.getParameter("end_num");
		if (endTemp != null && !endTemp.equals("")) {
			endNum = Integer.parseInt(endTemp);
		}
		System.out.println(endNum);
		int end = endNum * pageSize;
		if(end >= totalCount) {
			end = totalCount;
		}
		map.put("start", 1);
		map.put("end", end);
		
		List<QNAboardDTO> boardLists = dao.selectQNAListPage(map);
		dao.close();
		
		map.put("totalCount", totalCount);
		map.put("pageSize", pageSize);
		map.put("pageNum", pageNum);

		req.setAttribute("boardLists", boardLists);
		req.setAttribute("map", map);
//		resp.sendRedirect("./board01");
		req.getRequestDispatcher("/PetPlanet/board01.jsp").forward(req, resp);
	}
}
