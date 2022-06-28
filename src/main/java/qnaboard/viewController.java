package qnaboard;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



@WebServlet("/PetPlanet/QNA")
public class viewController extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		QNAboardDAO qao = new QNAboardDAO();
		String num = req.getParameter("num");
		QNAboardDTO qto = qao.selectView(num);
		
		qao.updateVisitCount(qto);
		
		if ( qto.getOfile() != null ) {
			String of = qto.getOfile();
			String ext = of.substring(of.lastIndexOf("."));			
			
			req.setAttribute("ext", ext);
		}
		
		qao.close();
		
		req.setAttribute("qto", qto);
		req.getRequestDispatcher("./QNA.jsp").forward(req, resp);
	}
}
