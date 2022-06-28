package admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import fileupload.FileUtil;
import qnaboard.QNAboardDAO;
import qnaboard.QNAboardDTO;
import utils.JSFunction;

@WebServlet("/admin/deleteAdminQNA")
public class adminQNADeleteController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		String num = req.getParameter("num");
		
		QNAboardDAO qao = new QNAboardDAO();
		QNAboardDTO qto = qao.selectView(num);
		
		int result = qao.deleteQNA(num);
		
		qao.close();
		
		if(result == 1) {
			String saveFileName = qto.getSfile();
			
			FileUtil.deleteFile(req, "/Uploads", saveFileName);
		}
		
		JSFunction.alertLocation(resp, "삭제되었습니다.", "./AdminQNA");
	}
}
