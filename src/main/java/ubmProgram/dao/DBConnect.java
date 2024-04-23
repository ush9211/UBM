package ubmProgram.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class DBConnect {

	public Connection conn = null;
	
	private String url = "jdbc:mysql://192.168.0.174/team_sql";
	private String option = "?useUnicode=true&characterEncoding=utf-8"; 
	private String user = "asdf1234!";
	private String pass = "asdf1234!";
  
	public DBConnect() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			this.conn = DriverManager.getConnection(url+option, user, pass);
			System.out.println("db접속");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	
	// 커넥션 하는 메소드
	public Connection getConnection() throws SQLException, NamingException {
		
		if(conn == null || conn.isClosed()) {
			System.out.println("DB 접속 성공");
		}
		return conn;
	}
	
	
	
	// 커넥션 닫는 메소드
	public void closeConnection() {
		try {
			if(conn != null && !conn.isClosed()) {
				conn.close();
				System.out.println("DB를 닫았습니다.");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			conn = null;
		}
	}
}
