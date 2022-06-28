package admin;


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

import qnaboard.QNAboardDAO;
import qnaboard.QNAboardDTO;

@WebServlet("/admin/AdminQNA")
public class adminQNAListController extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		QNAboardDAO fao = new QNAboardDAO();
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		int totalCount = fao.adminQNACount();
		
		ServletContext application = getServletContext();
		
		int pageSize = Integer.parseInt(application.getInitParameter("POSTS_PER_PAGE"));
		int blockPage = Integer.parseInt(application.getInitParameter("PAGES_PER_BLOCK"));
		
		int pageNum = 1;
		String pageTemp = req.getParameter("pageNum");
		if (pageTemp != null && !pageTemp.equals(""))
			pageNum = Integer.parseInt(pageTemp);
		
		List<QNAboardDTO> QNAboard = fao.adminQNAListPage();
		
		fao.close();
		
		map.put("totalCount", totalCount);
		map.put("pageSize", pageSize);
		map.put("pageNum", pageNum);
		
		req.setAttribute("QNAboard", QNAboard);
		req.setAttribute("map", map);
		
		req.getRequestDispatcher("./admin_QNA.jsp").forward(req, resp);
	}
}
