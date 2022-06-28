package admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import faqboard02.FAQboard02DAO;
import faqboard02.FAQboard02DTO;

@WebServlet("/admin/viewPetSittersFAQ")
public class petsittersFAQViewController extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		FAQboard02DAO fao = new FAQboard02DAO();
		String num = req.getParameter("num");
		FAQboard02DTO fto = fao.selectView(num);
		
		if ( fto.getOfile() != null ) {
			String of = fto.getOfile();
			String ext = of.substring(of.lastIndexOf("."));			
			
			req.setAttribute("ext", ext);
		}
		
		fao.close();
		
		req.setAttribute("qto", fto);
		req.getRequestDispatcher("./viewPetSitters_FAQ.jsp").forward(req, resp);
	}
}
