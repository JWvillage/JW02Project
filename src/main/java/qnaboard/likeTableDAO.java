package qnaboard;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import common.DBConnPool;

public class likeTableDAO extends DBConnPool {

	public likeTableDAO() {
		super();
	}
	
	public List<likeTableDTO> pickUp(Map<String, Object>map) {
		
		List<likeTableDTO> lb = new ArrayList<likeTableDTO>();
		
		String query = "select * from like_table where num = ?, id = ?";
		
		try {
			
			psmt = con.prepareStatement(query);
			psmt.setString(1, map.get("num").toString());
			psmt.setString(1, map.get("id").toString());
			
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				
				likeTableDTO lto = new likeTableDTO();
				
				lto.setLike_num(rs.getInt(1));
				lto.setId(rs.getString(2));
				lto.setNum(rs.getInt(3));
				lto.setLike_check(rs.getInt(4));
				
				lb.add(lto);
			}
			
		} catch (Exception e) {
			System.out.println("id의 like_count 조회 중 에러 발생");
			e.printStackTrace();
		}
		
		return lb;
	}
	
	public int likeUpdate(Map<String, Object> map) {
		
		int result = 0;
		
		String query = "update like_table set like_check = like_check + 1 where num = ?, id = ?";
		
		try {
			
			psmt = con.prepareStatement(query);
			psmt.setString(1, map.get("num").toString());
			psmt.setString(1, map.get("id").toString());
			
			result = psmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("id의 like_count 증가 중 에러 발생");
			e.printStackTrace();
		}
		
		return result;
	}
	public int likeDelete(Map<String, Object> map) {
		
		int result = 0;
		
		String query = "update like_table set like_check = like_check - 1 where num = ?, id = ?";
		
		try {
			
			psmt = con.prepareStatement(query);
			psmt.setString(1, map.get("num").toString());
			psmt.setString(1, map.get("id").toString());
			
			result = psmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("id의 like_count 감소 중 에러 발생");
			e.printStackTrace();
		}
		
		return result;
	}
	
}
