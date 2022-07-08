package qnaboard;

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

import fileupload.FileUtil;
import utils.JSFunction;

@WebServlet("/PetPlanet/edit")
public class EditController extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String num = req.getParameter("num");
		QNAboardDAO qao = new QNAboardDAO();
		QNAboardDTO qto = qao.selectView(num);
		qao.close();
		req.setAttribute("qto", qto);
		req.getRequestDispatcher("/PetPlanet/editQna.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String saveDirectory = req.getServletContext().getRealPath("/Uploads");
		
		ServletContext application = getServletContext();
		
		int maxPostSize = Integer.parseInt(application.getInitParameter("maxPostSize"));
		
		MultipartRequest mr = FileUtil.uploadFile(req, saveDirectory, maxPostSize);
		
		if (mr == null) {
			
			JSFunction.alertLocation(resp, "제한 용량 초과! or 디렉토리 경로 확인!", "../PetPlanet/writeQNA");
			
			return;
		}
		
		HttpSession session = req.getSession();
		
		String prevOfile = mr.getParameter("prevOfile");
		String prevSfile = mr.getParameter("prevSfile");
		int num = Integer.parseInt(mr.getParameter("num"));
		QNAboardDTO qto = new QNAboardDTO();
		qto.setNum(num);
		qto.setTitle(mr.getParameter("title"));
		qto.setContent(mr.getParameter("content"));
		if(session.getAttribute("u_id") != null) {
			qto.setId(session.getAttribute("u_id").toString());			
		} else {			
			qto.setId(session.getAttribute("naver_id").toString());
		}
		
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
			
			FileUtil.deleteFile(req, "/Uploads", prevSfile);
		} 
//		else {
//			
//			// 체크 박스 이용하여 기존 파일 삭제
//			String del = mr.getParameter("del");
//			if (del != null) {
//				FileUtil.deleteFile(req, "/Uploads", prevSfile);
//			} else {
//				qto.setOfile(prevOfile);
//				qto.setSfile(prevSfile);				
//			}
//		}
		
		QNAboardDAO dao = new QNAboardDAO();
		int result = dao.updateQNA(qto);
		dao.close();
		
		if (result == 1) {
			System.out.println("Q&A게시판 수정 성공");
			resp.sendRedirect("./QNA?num=" + num);
		} else {
			System.out.println("Q&A게시판 수정 실패");
			resp.sendRedirect("../PetPlanet/board");
		}
	}
}
