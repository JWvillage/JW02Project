package admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import faqboard02.FAQboard02DAO;
import faqboard02.FAQboard02DTO;
import qnaboard.QNAboardDAO;
import qnaboard.QNAboardDTO;

@WebServlet("/admin/viewAdminQNA")
public class adminQNAViewController extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		QNAboardDAO fao = new QNAboardDAO();
		String num = req.getParameter("num");
		QNAboardDTO fto = fao.selectView(num);
		
		if ( fto.getOfile() != null ) {
			String of = fto.getOfile();
			String ext = of.substring(of.lastIndexOf("."));			
			
			req.setAttribute("ext", ext);
		}
		
		fao.close();
		
		req.setAttribute("qto", fto);
		req.getRequestDispatcher("./viewAdmin_QNA.jsp").forward(req, resp);
	}
}
