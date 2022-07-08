package qnaboard;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/PetPlanet/like")
public class likeController extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int like_check = Integer.parseInt(req.getParameter("like_check"));
		String num = req.getParameter("num");
		String u_id = req.getParameter("u_id");
		String naver_id = req.getParameter("naver_id");
		
		System.out.println(naver_id);
		
		boolean id_check = true;
		if(u_id != "") {
			id_check = false;
		}
		
		System.out.println(id_check);
		
		// 좋아요 안한 상태
		if (like_check == 0) {
			
			// QNAboard 수정
			QNAboardDAO qao = new QNAboardDAO();
			// 전체 likecount 증가
			qao.likeCountPlus(num);
			
			qao.close();

			// like_table 수정
			likeTableDAO lao = new likeTableDAO();
			
			Map<String, Object> umap = new HashMap<String, Object>();

			if(id_check == true) {
				
				// map에 num과 id 저장하여..
				umap.put("num", num);
				umap.put("id", naver_id);
				// query의 where에 넣어 like_check를 1로 바꿈
				int result = lao.likeUpdate(umap);
				
				if(result == 1) {
					// 좋아요 반영 됨
					System.out.println("좋아요");
				} else {
					// 좋아요 한 번도 안한 상태
					System.out.println("좋아요 실패");
					// like_check를 수동으로 1로 지정해서
					umap.put("like_check", 1);
					// DB에 저장
					int prove = lao.likeInsert(umap);
					// 저장 상황 판단
					if(prove == 1) {
						System.out.println("insert 성공");
						
					} else {
						System.out.println("insert 실패");
					}
				}
			} else {
				umap.put("num", num);
				umap.put("id", u_id);
				// query의 where에 넣어 like_check를 1로 바꿈
				int result = lao.likeUpdate(umap);
				
				if(result == 1) {
					// 좋아요 반영 됨
					System.out.println("좋아요");
				} else {
					// 좋아요 한 번도 안한 상태
					System.out.println("좋아요 실패");
					// like_check를 수동으로 1로 지정해서
					umap.put("like_check", 1);
					// DB에 저장
					int prove = lao.likeInsert(umap);
					// 저장 상황 판단
					if(prove == 1) {
						System.out.println("insert 성공");
						
					} else {
						System.out.println("insert 실패");
					}
				}
			}
			
			lao.close();
		} else {
			// 위와 반대 상황
			QNAboardDAO qao = new QNAboardDAO();
			qao.likeCountMinus(num);
			qao.close();
			
			likeTableDAO lao = new likeTableDAO();
			
			Map<String, Object> dmap = new HashMap<String, Object>();
			
			if(id_check == true) {
				dmap.put("num", num);
				dmap.put("id", naver_id);
				
				int result = lao.likeDelete(dmap);
				
				if(result == 1) {
					System.out.println("좋아요 취소");
				} else {
					System.out.println("좋아요 취소 실패");
					dmap.put("like_check", 0);
					int prove = lao.likeInsert(dmap);
					if(prove == 1) {
						System.out.println("insert 성공");
					} else {
						System.out.println("insert 실패");
					}
				}
			} else {
				dmap.put("num", num);
				dmap.put("id", u_id);
				
				int result = lao.likeDelete(dmap);
				
				if(result == 1) {
					System.out.println("좋아요 취소");
				} else {
					System.out.println("좋아요 취소 실패");
					dmap.put("like_check", 0);
					int prove = lao.likeInsert(dmap);
					if(prove == 1) {
						System.out.println("insert 성공");
					} else {
						System.out.println("insert 실패");
					}
				}
			}
			
			lao.close();
			
		}
		
		
		resp.sendRedirect("./QNA?num=" + num);
	}
}
