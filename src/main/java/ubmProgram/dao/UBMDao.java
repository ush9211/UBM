package ubmProgram.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class UBMDao {

	// 필드
	PreparedStatement pstmt = null;
	Statement stmt = null;
	ResultSet res = null;
	Connection conn;
	
	// 기본 생성자
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
	
}
