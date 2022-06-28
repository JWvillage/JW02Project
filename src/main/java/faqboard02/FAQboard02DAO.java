package faqboard02;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import common.DBConnPool;

public class FAQboard02DAO extends DBConnPool {

	public FAQboard02DAO() {
		super();
	}
	
	// FAQ write
	public int boardInsert(FAQboard02DTO qto) {
		
		int result = 0;
		
		try {
			
			String query = "insert into FAQboard02 values (seq_fb02_num.nextval, ?, ?, ?, sysdate, ?, ?)";
			
			psmt = con.prepareStatement(query);
			psmt.setString(1, qto.getId());
			psmt.setString(2, qto.getTitle());
			psmt.setString(3, qto.getContent());
			psmt.setString(4, qto.getOfile());
			psmt.setString(5, qto.getSfile());
			
			result = psmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("FAQ 입력 중 에러 발생");
			e.printStackTrace();
		}
		
		return result;
	}
	
	// FAQ DB에서 가져오기
	public int selectFAQ01Count(Map<String, Object> map) {
		
		int totalCount = 0;
		
		String query = "select count(*) from FAQboard02";
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
	
	// FAQ 게시판 출력
	public List<FAQboard02DTO> selectFAQ01ListPage(Map<String, Object> map) {
		
		List<FAQboard02DTO> board = new ArrayList<FAQboard02DTO>();

		String query = " SELECT * FROM ( select tb.*, rownum rNum from ( select * from FAQboard02 ";
		if (map.get("searchWord") != null) {
			query += " WHERE " + map.get("searchField") + " " + " LIKE '%" + map.get("searchWord") + "%' ";
		}
		query += " ORDER BY num DESC) tb) where rNum between ? and ? ";

		
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, map.get("start02").toString());
			psmt.setString(2, map.get("end02").toString());
			
			rs = psmt.executeQuery();

			while (rs.next()) {
				
				FAQboard02DTO dto = new FAQboard02DTO();

				dto.setNum(rs.getInt(1));
				dto.setId(rs.getString(2));
				dto.setTitle(rs.getString(3));
				dto.setContent(rs.getString(4));
				dto.setPostdate(rs.getDate(5));
				dto.setOfile(rs.getString(6));
				dto.setSfile(rs.getString(7));
				
				board.add(dto);
			}
		} catch (Exception e) {
			System.out.println("게시물 조회 중 예외 발생");
			e.printStackTrace();
		}
		
		return board;
	}
	
	// Edit 하기 위해 전에 입력된 사항 불러오기
	public FAQboard02DTO selectView(String num) {
		
		FAQboard02DTO qto = new FAQboard02DTO();
		
		String query = "select * from FAQboard02 where num = ?";
		
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
				
			}
			
		} catch (Exception e) {
			System.out.println("게시물 불러오기 중 에러 발생");
			e.printStackTrace();
		}
		
		
		return qto;
	}
	
	// Edit
	public int updateFAQ(FAQboard02DTO qto) {
		
		int result = 0;
		
		String query = "update FAQboard02 set title = ?, content = ?, ofile = ?, sfile = ? where num = ?";
		
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
			System.out.println("FAQ 수정 중 에러 발생");
			e.printStackTrace();
		}
		
		return result;
	}
	
	// Delete
	public int deleteFAQ(String num) {
		
		int result = 0;
		
		String query = "delete from FAQboard02 where num = ?";
		
		try {
			
			psmt = con.prepareStatement(query);
			psmt.setString(1, num);
			result = psmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("FAQ 삭제 중 에러 발생");
		}
		
		return result;
	}
	
////////////////////////////////////////////////////////////////////////////////////////
	
	// FAQ DB에서 가져오기
	public int petsittersFAQCount() {
	
		int totalCount = 0;
		
		String query = "select count(*) from FAQboard02";
		
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
	
	// FAQ 게시판 출력
	public List<FAQboard02DTO> petsittersFAQListPage() {
	
		List<FAQboard02DTO> board = new ArrayList<FAQboard02DTO>();
		
		String query = " SELECT * FROM FAQboard02 ORDER BY num DESC";
		
		
		try {
			psmt = con.prepareStatement(query);
			
			rs = psmt.executeQuery();
			
			while (rs.next()) {
			
				FAQboard02DTO dto = new FAQboard02DTO();
				
				dto.setNum(rs.getInt(1));
				dto.setId(rs.getString(2));
				dto.setTitle(rs.getString(3));
				dto.setContent(rs.getString(4));
				dto.setPostdate(rs.getDate(5));
				dto.setOfile(rs.getString(6));
				dto.setSfile(rs.getString(7));
				
				board.add(dto);
			}
		} catch (Exception e) {
			System.out.println("게시물 조회 중 예외 발생");
			e.printStackTrace();
		}
		
		return board;
	}	
	
}
