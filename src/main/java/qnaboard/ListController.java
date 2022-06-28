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

import faqboard01.FAQboard01DAO;
import faqboard01.FAQboard01DTO;
import faqboard02.FAQboard02DAO;
import faqboard02.FAQboard02DTO;
import utils.BoardPage;

@WebServlet("/PetPlanet/board")
public class ListController extends HttpServlet{

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
		int blockPage = Integer.parseInt(application.getInitParameter("PAGES_PER_BLOCK"));
		
		int pageNum = 1;
		String pageTemp = req.getParameter("pageNum");
		if (pageTemp != null && !pageTemp.equals(""))
			pageNum = Integer.parseInt(pageTemp);
		
		int start = (pageNum - 1) * pageSize + 1;
		int end = pageNum * pageSize;
		map.put("start", start);
		map.put("end", end);
		
		List<QNAboardDTO> boardLists = dao.selectQNAListPage(map);
		dao.close();
		
		String pagingImg = BoardPage.pagingStr(totalCount, pageSize, blockPage, pageNum, "/J03Project/PetPlanet/board");
		map.put("pagingImg", pagingImg);
		map.put("totalCount", totalCount);
		map.put("pageSize", pageSize);
		map.put("pageNum", pageNum);

		req.setAttribute("boardLists", boardLists);
		req.setAttribute("map", map);
		
		//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		
		FAQboard01DAO fao = new FAQboard01DAO();
		
		Map<String, Object> map01 = new HashMap<String, Object>();
		
		String searchField01 = req.getParameter("searchField01");
		String searchWord01 = req.getParameter("searchWord01");
		
		if (searchWord01 != null) {
			map01.put("searchField01", searchField01);
			map01.put("searchWord01", searchWord01);
		}
		
		int totalCount01 = fao.selectFAQCount(map01);
		
		int pageSize01 = Integer.parseInt(application.getInitParameter("POSTS_PER_PAGE"));
		int blockPage01 = Integer.parseInt(application.getInitParameter("PAGES_PER_BLOCK"));
		
		int pageNum01 = 1;
		String pageTemp01 = req.getParameter("pageNum01");
		if (pageTemp01 != null && !pageTemp01.equals(""))
			pageNum01 = Integer.parseInt(pageTemp01);
		
		int start01 = (pageNum01 - 1) * pageSize01 + 1;
		int end01 = pageNum01 * pageSize01;
		map01.put("start01", start01);
		map01.put("end01", end01);
		
		List<FAQboard01DTO> FAQboard01 = fao.selectFAQListPage(map01);
		fao.close();
		
		String pagingImg01 = BoardPage.pagingStr01(totalCount01, pageSize01, blockPage01, pageNum01, "/J03Project/PetPlanet/board");
		map01.put("pagingImg01", pagingImg01);
		map01.put("totalCount01", totalCount01);
		map01.put("pageSize01", pageSize01);
		map01.put("pageNum01", pageNum01);

		req.setAttribute("FAQboard01", FAQboard01);
		req.setAttribute("map01", map01);
		
		///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		
		FAQboard02DAO qao = new FAQboard02DAO();
		
		Map<String, Object> map02 = new HashMap<String, Object>();
		
		String searchField02 = req.getParameter("searchField02");
		String searchWord02 = req.getParameter("searchWord02");
		
		if (searchWord02 != null) {
			map02.put("searchField02", searchField02);
			map02.put("searchWord02", searchWord02);
		}
		
		int totalCount02 = qao.selectFAQ01Count(map02);
		
//		ServletContext application = getServletContext();
		
		int pageSize02 = Integer.parseInt(application.getInitParameter("POSTS_PER_PAGE"));
		int blockPage02 = Integer.parseInt(application.getInitParameter("PAGES_PER_BLOCK"));
		
		int pageNum02 = 1;
		String pageTemp02 = req.getParameter("pageNum02");
		if (pageTemp02 != null && !pageTemp02.equals(""))
			pageNum02 = Integer.parseInt(pageTemp02);
		
		int start02 = (pageNum02 - 1) * pageSize02 + 1;
		int end02 = pageNum02 * pageSize02;
		map02.put("start02", start02);
		map02.put("end02", end02);
		
		List<FAQboard02DTO> FAQboard02 = qao.selectFAQ01ListPage(map02);
		qao.close();
		
		String pagingImg02 = BoardPage.pagingStr02(totalCount02, pageSize02, blockPage02, pageNum02, "/J03Project/PetPlanet/board");
		map02.put("pagingImg02", pagingImg02);
		map02.put("totalCount02", totalCount02);
		map02.put("pageSize02", pageSize02);
		map02.put("pageNum02", pageNum02);

		req.setAttribute("FAQboard02", FAQboard02);
		req.setAttribute("map02", map02);		
		
		req.getRequestDispatcher("/PetPlanet/board.jsp").forward(req, resp);
	}
}
