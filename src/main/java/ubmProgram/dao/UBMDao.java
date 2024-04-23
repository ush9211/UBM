package ubmProgram.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import ubmProgram.dto.CDto;
import ubmProgram.dto.PDto;
import ubmProgram.dto.SDto;

public class UBMDao {

	// �븘�뱶
	PreparedStatement pstmt = null;
	Statement stmt = null;
	ResultSet res = null;
	Connection conn;
	
	// 湲곕낯 �깮�꽦�옄
	public UBMDao(Connection conn) {
		this.conn = conn;
	}
	

	 //전체 게시글 수 select
	  public int AllselectDB() {
		  int rs = 0;
        String sql = "select count(*) from professor";
     
        
        try {
      	stmt = conn.createStatement();
      	res = stmt.executeQuery(sql);
      	if(res.next()) {
      		 rs = res.getInt(1); //rs = res.getInt("count(*)");
      	}
        } catch(SQLException e) {
			  e.printStackTrace();
		  }
		  finally {
			  try {
				  if(res != null) res.close();
				  if(pstmt != null) stmt.close();
				
			  }
			  catch(SQLException e) {
				  e.printStackTrace();
			  }
		  }
        return rs;
    }
	
	//회원가입 교수
		public int insertDB(PDto dto) {
			int num = 0;
			String sql = "INSERT INTO professor "
					+ " (p_pass, p_name, p_email, p_tel) "
					+ " values (?, ?, ?, ?)";
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, dto.getP_pass());
				pstmt.setString(2, dto.getP_name());
				pstmt.setString(3, dto.getP_email());
				pstmt.setString(4, dto.getP_tel());

				System.out.println(pstmt);
				num = pstmt.executeUpdate();
				
			}catch(SQLException e) {
				e.printStackTrace();
			}finally {
				  try {
						if(pstmt != null) pstmt.close();
					} catch (SQLException e) {
						e.printStackTrace();
					}
			}
			return num;
		}
	

		//회원가입 학생
		public int insertDB(SDto dto) {
			int num = 0;
			String sql = "INSERT INTO student "
					+ " (s_pass, s_name, s_email, s_tel) "
					+ " values (?, ?, ?, ?)";
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, dto.getS_pass());
				pstmt.setString(2, dto.getS_name());
				pstmt.setString(3, dto.getS_email());
				pstmt.setString(4, dto.getS_tel());

				System.out.println(pstmt);
				num = pstmt.executeUpdate();
				
			}catch(SQLException e) {
				e.printStackTrace();
			}finally {
				  try {
						if(pstmt != null) pstmt.close();
					} catch (SQLException e) {
						e.printStackTrace();
					}
			}
			return num;
		}
		
		
			    
}
