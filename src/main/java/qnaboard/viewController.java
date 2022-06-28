package qnaboard;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



@WebServlet("/PetPlanet/QNA")
public class viewController extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		// 게시물 정보 출력
		QNAboardDAO qao = new QNAboardDAO();
		String num = req.getParameter("num");
		QNAboardDTO qto = qao.selectView(num);
		qao.updateVisitCount(qto);
		qao.close();
		req.setAttribute("qto", qto);
		
		
		// 로그인 되어 있다면
		// like 정보 출력
		HttpSession session = req.getSession();
		// Session에 id 있는지 확인
		if(session.getAttribute("u_id") != null) {
			// DB 접속
			likeTableDAO lao = new likeTableDAO();
			// 변수 넣을 map 생성
			Map<String, Object> map = new HashMap<String, Object>();
			// 입력 값 셋팅
			map.put("num", num);
			map.put("id", session.getAttribute("u_id"));
			// 출력 값 담을 List 생성 및 담기
			likeTableDTO lto = lao.like_pickUp(map);
			lao.close();
			req.setAttribute("lto", lto);
		}
		
		// 나중에 입력된 파일 정보로 무언가 할 때 사용...
		if ( qto.getOfile() != null ) {
			String of = qto.getOfile();
			String ext = of.substring(of.lastIndexOf("."));			
			
			req.setAttribute("ext", ext);
		}
		
		// Q&A 게시판으로 전달
		req.getRequestDispatcher("./QNA.jsp").forward(req, resp);
	}
}
