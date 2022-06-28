package member;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import common.DBConnPool;

public class MemberDAO extends DBConnPool {

	public MemberDAO() {
		super();
	}
	// 회원 가입
	public int memberInsert(MemberDTO dto) {
		
		int result = 0;
		
		try {
			
			String query = "insert into member values (?, ?, ?, ?, sysdate)";
			
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getId());
			psmt.setString(2, dto.getPass());
			psmt.setString(3, dto.getName());
			psmt.setString(4, dto.getEmail());
			
			result = psmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("회원 가입 중 에러 발생");
			e.printStackTrace();
		}
		
		return result;
	}
	
	// 회원 가입 시 id 검증
	public MemberDTO idValidate(String u_id) {
		
		MemberDTO dto = new MemberDTO();
		
		String query = "select id from member where id = ?";
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, u_id);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				dto.setId(rs.getString("id"));
			}
//			System.out.println(dto.getId());
			
		} catch (Exception e) {
			System.out.println("아이디 중복 확인 중 오류 발생");
			e.printStackTrace();
		}
		
		return dto;
	}
	
	// Login
	public MemberDTO memberLogin(String u_id, String u_pass) {
		
		MemberDTO dto = new MemberDTO();
		
		String query = "select id, pass, name, email from member where id = ? and pass = ?";
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, u_id);
			psmt.setString(2, u_pass);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				dto.setId(rs.getString(1));
				dto.setPass(rs.getString(2));
				dto.setName(rs.getString(3));
				dto.setEmail(rs.getString(4));
			}
			
		} catch (Exception e) {
			System.out.println("로그인 중 오류 발생");
			e.printStackTrace();
		}
		
		return dto;
	}
	
	// member 몇 명?
	public int memberCount() {
		
		int totalCount = 0;
		
		String query = "select count(*) from member";
		
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
	
	// member Information
	public List<MemberDTO> memberInfo(Map<String, Object> map) {
		
		List<MemberDTO> board = new ArrayList<MemberDTO>();
		
		
		String query = "select * from member order by regidate desc";
		
		try {
			
			psmt = con.prepareStatement(query);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				
				MemberDTO dto = new MemberDTO();
				
				dto.setId(rs.getString(1));
				dto.setName(rs.getString(2));
				dto.setPass(rs.getString(3));
				dto.setEmail(rs.getString(4));
				dto.setRegidate(rs.getDate(5));
				
				board.add(dto);
			}
			
		} catch (Exception e) {
			System.out.println("member 조회 중 에러 발생");
		}
		
		return board;
	}
	
}
