package ubmProgram.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import ubmProgram.dto.CDto;

public class ClassDao {

	PreparedStatement pstmt = null;
	Statement stmt = null;
	ResultSet res = null;
	Connection conn;
	
	public ClassDao(Connection conn) {
		this.conn = conn;
	}
	
	
	
	// Class 전체 
	public int AllSelectDB() {
	      int rs = 0;
	      String sql = "select count(*) from class";
	      try {
	         stmt = conn.createStatement();
	         res = stmt.executeQuery(sql);
	         if(res.next()) {
	            rs = res.getInt(1);
	         }
	      }catch (SQLException e) {
	         e.printStackTrace();
	      }finally {
	         try {
	            if(res != null) res.close();
	            if(stmt != null) stmt.close();

	         }catch(SQLException e) {e.printStackTrace();}
	      }
	      return rs;
	   }
	
	
	
	
	// 검색 목록 페이징
	public int searchSelectDB(String sname, String svalue) {
	      int rs = 0;
	      String sql = "select count(*) from class where "  + sname + " LIKE ?";
	      try {
	         pstmt = conn.prepareStatement(sql);
			 pstmt.setString(1, "%"+svalue+"%");
	         res = pstmt.executeQuery();
	         if(res.next()) {
	            rs = res.getInt(1);
	         }
	      }catch (SQLException e) {
	         e.printStackTrace();
	      }finally {
	         try {
	            if(res != null) res.close();
	            if(pstmt != null) pstmt.close();

	         }catch(SQLException e) {e.printStackTrace();}
	      }
	      return rs;
	      
	   }
	
	
	
	// 수강신청 개설과목 리스트
	public ArrayList<CDto> regSelectDB(int limitPage, int listCount){
		
		ArrayList<CDto> dtos = new ArrayList<>();
		
		String sql = "select A.c_id, B.d_name, A.grade, A.c_name, C.p_name, A.when, A.where, C.p_id, B.d_id from class as A join department as B join professor as C on A.d_id=B.d_id and A.p_id=C.p_id limit ?, ?";
		//String sql = "select * from jboard where writer like '%�̸�%' order by refid desc, renum asc limit ?, ?";
		//String sql = "select * from jboard where title like '%�ϴ�%' order by refid desc, renum asc limit ?, ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, limitPage);
			pstmt.setInt(2, listCount);
			res = pstmt.executeQuery();
			
			while(res.next()) {
				int c_id = res.getInt("c_id");
				String d_name = res.getString("d_name");
				int grade = res.getInt("grade");
				String c_name = res.getString("c_name");
				String p_name = res.getString("p_name");
				String when = res.getString("when");
				String where = res.getString("where");
				int p_id = res.getInt("p_id");
				int d_id = res.getInt("d_id");
				
				CDto bDto = new CDto();
				bDto.setC_id(c_id);
				bDto.setD_name(d_name);
				bDto.setGrade(grade);
				bDto.setC_name(c_name);
				bDto.setP_name(p_name);
				bDto.setWhen(when);
				bDto.setWhere(where);
				bDto.setP_id(p_id);
				bDto.setD_id(d_id);
				dtos.add(bDto);
			}
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(res != null) res.close();
				if(pstmt != null) pstmt.close();

			}catch(SQLException e) {e.printStackTrace();}
		}
		
		return dtos;
	}
	
	
	
	// 수강신청 개설과목 검색 리스트
		public ArrayList<CDto> regSearchSelectDB(int limitPage, int listCount, String name, String value){
			
			ArrayList<CDto> dtos = new ArrayList<>();
			
			String sql = "select A.c_id, B.d_name, A.grade, A.c_name, C.p_name, A.when, A.where, C.p_id, B.d_id from class as A join department as B join professor as C on A.d_id=B.d_id and A.p_id=C.p_id where" + name + " LIKE ? limit ?, ?";
			//String sql = "select * from jboard where writer like '%�̸�%' order by refid desc, renum asc limit ?, ?";
			//String sql = "select * from jboard where title like '%�ϴ�%' order by refid desc, renum asc limit ?, ?";
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, "%"+value+"%");
				pstmt.setInt(1, limitPage);
				pstmt.setInt(2, listCount);
				res = pstmt.executeQuery();
				
				while(res.next()) {
					int c_id = res.getInt("c_id");
					String d_name = res.getString("d_name");
					int grade = res.getInt("grade");
					String c_name = res.getString("c_name");
					String p_name = res.getString("p_name");
					String when = res.getString("when");
					String where = res.getString("where");
					int p_id = res.getInt("p_id");
					int d_id = res.getInt("d_id");
					
					CDto bDto = new CDto();
					bDto.setC_id(c_id);
					bDto.setD_name(d_name);
					bDto.setGrade(grade);
					bDto.setC_name(c_name);
					bDto.setP_name(p_name);
					bDto.setWhen(when);
					bDto.setWhere(where);
					bDto.setP_id(p_id);
					bDto.setD_id(d_id);
					dtos.add(bDto);
				}
			}catch (SQLException e) {
				e.printStackTrace();
			}finally {
				try {
					if(res != null) res.close();
					if(pstmt != null) pstmt.close();

				}catch(SQLException e) {e.printStackTrace();}
			}
			
			return dtos;
		}
	
				
				
		
		
		// contents 페이지
		public CDto viewDB(String nums) {
			
			int num = Integer.parseInt(nums);
			
			String sql = "select * from class where c_id=?";
			
			CDto bDto = new CDto();
			
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, num);
				res = pstmt.executeQuery();
				
				while(res.next()) {
					int c_id = res.getInt("c_id");
					String c_name = res.getString("c_name");
					int grade = res.getInt("grade");
					String when = res.getString("when");
					String where = res.getString("where");
					int p_id = res.getInt("p_id");
					int d_id = res.getInt("d_id");
					
					bDto.setC_id(c_id);
					bDto.setC_name(c_name);
					bDto.setGrade(grade);
					bDto.setWhen(when);
					bDto.setWhere(where);
					bDto.setP_id(p_id);
					bDto.setD_id(d_id);
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				try {
					if(res != null) res.close();
					if(pstmt != null) pstmt.close();

				}catch(SQLException e) {e.printStackTrace();}
			}
			return bDto;
			
		}
}
