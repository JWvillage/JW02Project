package admin;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;

import faqboard02.FAQboard02DAO;
import faqboard02.FAQboard02DTO;
import fileupload.FileUtil;
import utils.JSFunction;

@WebServlet("/admin/writePetSittersFAQ")
public class petsittersFAQWriteController extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("./writePetSitters_FAQ.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String saveDirectory = req.getServletContext().getRealPath("/Uploads");
		
		ServletContext application = getServletContext();
		int maxPostSize = Integer.parseInt(application.getInitParameter("maxPostSize"));
		MultipartRequest mr = FileUtil.uploadFile(req, saveDirectory, maxPostSize);
		if (mr == null) {
			
			JSFunction.alertLocation(resp, "제한 용량 초과! or 디렉토리 경로 확인!", "./writePetSittersFAQ");
			
			return;
		}
		
		HttpSession session = req.getSession();
		
		FAQboard02DTO qto = new FAQboard02DTO();
		qto.setTitle(mr.getParameter("title"));
		qto.setContent(mr.getParameter("content"));
		qto.setId(session.getAttribute("u_id").toString());
		
		String fileName = mr.getFilesystemName("ofile");
		
		if (fileName != null) {
			
			String now = new SimpleDateFormat("yyyyMMdd_HmsS").format(new Date());
			String ext = fileName.substring(fileName.lastIndexOf("."));
			String newFileName = now + ext;
			
			File oldFile = new File(saveDirectory + File.separator + fileName);
			File newFile = new File(saveDirectory + File.separator + newFileName);
			oldFile.renameTo(newFile);
			
			qto.setOfile(fileName);
			qto.setSfile(newFileName);
		}
		
		FAQboard02DAO dao = new FAQboard02DAO();
		int result = dao.boardInsert(qto);
		dao.close();
		
		if (result == 1) {
			System.out.println("FAQ01게시판 입력 성공");
			resp.sendRedirect("./petsittersFAQ");
		} else {
			System.out.println("FAQ01게시판 입력 실패");
			resp.sendRedirect("./writePetSittersFAQ");
		}
	}
}
