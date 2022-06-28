package admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import faqboard01.FAQboard01DAO;
import faqboard01.FAQboard01DTO;

@WebServlet("/admin/viewCustomerFAQ")
public class customerFAQViewController extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		FAQboard01DAO fao = new FAQboard01DAO();
		String num = req.getParameter("num");
		FAQboard01DTO fto = fao.selectView(num);
		
		if ( fto.getOfile() != null ) {
			String of = fto.getOfile();
			String ext = of.substring(of.lastIndexOf("."));			
			
			req.setAttribute("ext", ext);
		}
		
		fao.close();
		
		req.setAttribute("qto", fto);
		req.getRequestDispatcher("./viewCustomer_FAQ.jsp").forward(req, resp);
	}
}
