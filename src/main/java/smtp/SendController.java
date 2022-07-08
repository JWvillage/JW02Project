package smtp;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import smtp.NaverSMTP;

@WebServlet("/PetPlanet/apply")
public class SendController extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		// 폼값(이메일 내용) 저장
		Map<String, String> emailInfo = new HashMap<String, String>();
		emailInfo.put("from", req.getParameter("from"));
		emailInfo.put("to", req.getParameter("to"));
		emailInfo.put("subject", req.getParameter("subject"));
		
		// 내용은 메일 포맷에 따라 다르게 처리(단, 나는 format을 하나로)
		String content = req.getParameter("content");
		String format = req.getParameter("format");
		if (format.equals("text")) {
		    // 텍스트 포맷일 때는 그대로 저장
		    emailInfo.put("format", "text/plain;charset=UTF-8");
		    emailInfo.put("content", content);
		}
		else if (format.equals("html")) { 
			content = content.replace("\r\n", "<br />");
			String htmlContent = ""; // HTML용으로 변환된 내용을 담을 변수
			try {
				
				ServletContext application = this.getServletContext();
				// HTML 메일용 템플릿 파일 읽기
				String templatePath = application.getRealPath("/PetPlanet/MailForm.html");
				
				BufferedReader br = new BufferedReader(new FileReader(templatePath));
				
				// 한 줄씩 읽어 htmlContent 변수에 저장
				String oneLine;
				while ((oneLine = br.readLine()) != null) {
					htmlContent += oneLine + "\n";
				}
				br.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			// 템플릿의 "__CONTENT__" 부분을 메일 내용으로 대체 (변환 완료)
			htmlContent = htmlContent.replace("__CONTENT__", content);
			// 변환된 내용을 저장
			emailInfo.put("content", htmlContent);
			emailInfo.put("format", "text/html;charset=UTF-8");
		}
		PrintWriter out = resp.getWriter();
		try {
			
			NaverSMTP smtpServer = new NaverSMTP();
			smtpServer.emailSending(emailInfo);
			out.print("이메일 전송 성공");
			
		} catch (Exception e) {
			
			out.print("이메일 전송 실패");
			e.printStackTrace();
			
		}
		resp.sendRedirect("../petplanet.do");
	}
}
