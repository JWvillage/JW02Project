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

import faqboard01.FAQboard01DAO;
import faqboard01.FAQboard01DTO;
import utils.BoardPage;

@WebServlet("/admin/customerFAQ")
public class customerFAQListController extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		FAQboard01DAO fao = new FAQboard01DAO();
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		int totalCount = fao.customerFAQCount();
		
		ServletContext application = getServletContext();
		
		int pageSize = Integer.parseInt(application.getInitParameter("POSTS_PER_PAGE"));
		int blockPage = Integer.parseInt(application.getInitParameter("PAGES_PER_BLOCK"));
		
		int pageNum = 1;
		String pageTemp = req.getParameter("pageNum");
		if (pageTemp != null && !pageTemp.equals(""))
			pageNum = Integer.parseInt(pageTemp);
		
		List<FAQboard01DTO> FAQboard = fao.customerFAQListPage();
		
		fao.close();
		
		map.put("totalCount", totalCount);
		map.put("pageSize", pageSize);
		map.put("pageNum", pageNum);
		
		req.setAttribute("FAQboard", FAQboard);
		req.setAttribute("map", map);
		
		req.getRequestDispatcher("./customer_FAQ.jsp").forward(req, resp);
	}
}
