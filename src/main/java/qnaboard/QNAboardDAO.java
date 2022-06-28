package qnaboard;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import common.DBConnPool;

public class QNAboardDAO extends DBConnPool {

	public QNAboardDAO() {
		super();
	}
	
	// Q&A write
	public int boardInsert(QNAboardDTO qto) {
		
		int result = 0;
		
		try {
			
			String query = "insert into QNAboard values (seq_b_num.nextval, ?, ?, ?, sysdate, ?, ?, 0, 0)";
			
			psmt = con.prepareStatement(query);
			psmt.setString(1, qto.getId());
			psmt.setString(2, qto.getTitle());
			psmt.setString(3, qto.getContent());
			psmt.setString(4, qto.getOfile());
			psmt.setString(5, qto.getSfile());
			
			result = psmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("Q&A 입력 중 에러 발생");
			e.printStackTrace();
		}
		
		return result;
	}
	
	// Q&A DB에서 가져오기
	public int selectQNACount(Map<String, Object> map) {
		
		int totalCount = 0;
		
		String query = "select count(*) from QNAboard";
		if (map.get("searchWord") != null) {
			query += " WHERE " + map.get("searchField") + " " + " LIKE '%" + map.get("searchWord") + "%' ";
		}
		
		try {
			psmt = con.prepareStatement(query);
			rs = psmt.executeQuery();
			rs.next();
			totalCount = rs.getInt(1);
		} catch (Exception e) {
			System.out.println("게시물 수를 구하는 중 예외 발생");
			e.printStackTrace();
		}
		return totalCount;
	}			
	
	// Q&A 게시판 출력
	public List<QNAboardDTO> selectQNAListPage(Map<String, Object> map) {
		
		List<QNAboardDTO> board = new ArrayList<QNAboardDTO>();

		String query = " SELECT * FROM ( select tb.*, rownum rNum from ( select * from QNAboard ";
		if (map.get("searchWord") != null) {
			query += " WHERE " + map.get("searchField") + " " + " LIKE '%" + map.get("searchWord") + "%' ";
		}
		query += " ORDER BY num DESC) tb) where rNum between ? and ? ";

		
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, map.get("start").toString());
			psmt.setString(2, map.get("end").toString());
			
			rs = psmt.executeQuery();

			while (rs.next()) {
				
				QNAboardDTO dto = new QNAboardDTO();

				dto.setNum(rs.getInt(1));
				dto.setId(rs.getString(2));
				dto.setTitle(rs.getString(3));
				dto.setContent(rs.getString(4));
				dto.setPostdate(rs.getDate(5));
				dto.setOfile(rs.getString(6));
				dto.setSfile(rs.getString(7));
				dto.setLikecount(rs.getInt(8));
				dto.setVisitcount(rs.getInt(9));
				
				board.add(dto);
			}
		} catch (Exception e) {
			System.out.println("게시물 조회 중 예외 발생");
			e.printStackTrace();
		}
		
		return board;
	}
	
	// Edit 하기 위해 전에 입력된 사항 불러오기
	public QNAboardDTO selectView(String num) {
		
		QNAboardDTO qto = new QNAboardDTO();
		
		String query = "select * from QNAboard where num = ?";
		
		try {
			
			psmt = con.prepareStatement(query);
			psmt.setString(1, num);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				qto.setNum(rs.getInt(1));
				qto.setId(rs.getString(2));
				qto.setTitle(rs.getString(3));
				qto.setContent(rs.getString(4));
				qto.setPostdate(rs.getDate(5));
				qto.setOfile(rs.getString(6));
				qto.setSfile(rs.getString(7));
				qto.setLikecount(rs.getInt(8));
				qto.setVisitcount(rs.getInt(9));
				
			}
			
		} catch (Exception e) {
			System.out.println("게시물 불러오기 중 에러 발생");
			e.printStackTrace();
		}
		
		
		return qto;
	}
	
	// visitcount
	public void updateVisitCount(QNAboardDTO qto) {
		
		String query = "update QNAboard set visitcount = visitcount + 1 where num = ?";
		
		try {
			
			psmt = con.prepareStatement(query);
			psmt.setInt(1, qto.getNum());
			
			rs = psmt.executeQuery();
			
		} catch (Exception e) {}
	}
	
	// Edit
	public int updateQNA(QNAboardDTO qto) {
		
		int result = 0;
		
		String query = "update QNAboard set title = ?, content = ?, ofile = ?, sfile = ? where num = ?";
		
		try {
			
			psmt = con.prepareStatement(query);
			psmt.setString(1, qto.getTitle());
			psmt.setString(2, qto.getContent());
			psmt.setString(3, qto.getOfile());
			psmt.setString(4, qto.getSfile());
			psmt.setInt(5, qto.getNum());
			
			System.out.println(qto.getNum());
			result = psmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("QNA 수정 중 에러 발생");
			e.printStackTrace();
		}
		
		return result;
	}
	
	// Delete
	public int deleteQNA(String num) {
		
		int result = 0;
		
		String query = "delete from QNAboard where num = ?";
		
		try {
			
			psmt = con.prepareStatement(query);
			psmt.setString(1, num);
			result = psmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("QNA 삭제 중 에러 발생");
		}
		
		return result;
	}
	
	// likecount 1 증가
	public void likeCountPlus(String num) {
		
		String query = "update QNAboard set likecount = likecount + 1 where num = ?";
		
		try {
			
			psmt = con.prepareStatement(query);
			psmt.setString(1, num);
			psmt.executeUpdate();
			System.out.println(num);
			System.out.println("1 증가");
			
			
		} catch (Exception e) {
			System.out.println("좋아요 1 증가 중 에러");
		}
		
	}
	// likecount 1 감소
	public void likeCountMinus(String num) {
		
		String query = "update QNAboard set likecount = likecount - 1 where num = ?";
		
		try {
			
			psmt = con.prepareStatement(query);
			psmt.setString(1, num);
			psmt.executeUpdate();
			System.out.println("1 감소");
			
		} catch (Exception e) {
			System.out.println("좋아요 1 감소 중 에러");
		}
	}
	
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////

	
////////////////////////////////////////////////////////////////////////////////////////
	
	// QNA DB에서 가져오기
	public int adminQNACount() {
	
		int totalCount = 0;
		
		String query = "select count(*) from QNAboard";
		
		try {
			psmt = con.prepareStatement(query);
			rs = psmt.executeQuery();
			rs.next();
			totalCount = rs.getInt(1);
		} catch (Exception e) {
			System.out.println("게시물 수를 구하는 중 예외 발생");
			e.printStackTrace();
		}
		
		return totalCount;
	}			
	
	// QNA 게시판 출력
	public List<QNAboardDTO> adminQNAListPage() {
	
		List<QNAboardDTO> board = new ArrayList<QNAboardDTO>();
		
		String query = " SELECT * FROM QNAboard ORDER BY num DESC";
		
		
		try {
			psmt = con.prepareStatement(query);
			
			rs = psmt.executeQuery();
			
			while (rs.next()) {
			
				QNAboardDTO dto = new QNAboardDTO();
				
				dto.setNum(rs.getInt(1));
				dto.setId(rs.getString(2));
				dto.setTitle(rs.getString(3));
				dto.setContent(rs.getString(4));
				dto.setPostdate(rs.getDate(5));
				dto.setOfile(rs.getString(6));
				dto.setSfile(rs.getString(7));
				dto.setLikecount(rs.getInt(8));
				dto.setVisitcount(rs.getInt(9));
				
				board.add(dto);
			}
		} catch (Exception e) {
			System.out.println("게시물 조회 중 예외 발생");
			e.printStackTrace();
		}
		
		return board;
	}	

	
}
