package admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import faqboard02.FAQboard02DAO;
import faqboard02.FAQboard02DTO;
import fileupload.FileUtil;
import utils.JSFunction;

@WebServlet("/admin/deletePetSittersFAQ")
public class petsittersFAQDeleteController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		String num = req.getParameter("num");
		
		FAQboard02DAO qao = new FAQboard02DAO();
		FAQboard02DTO qto = qao.selectView(num);
		
		int result = qao.deleteFAQ(num);
		
		qao.close();
		
		if(result == 1) {
			String saveFileName = qto.getSfile();
			
			FileUtil.deleteFile(req, "/Uploads", saveFileName);
		}
		
		JSFunction.alertLocation(resp, "삭제되었습니다.", "./petsittersFAQ");
	}
}
