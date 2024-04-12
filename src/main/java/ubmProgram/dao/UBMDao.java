package ubmProgram.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
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
	
	
}
