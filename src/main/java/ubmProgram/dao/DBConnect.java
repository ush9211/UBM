package ubmProgram.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnect {

	public Connection conn = null; //필드 필드 초기화
	
	private String url = "jdbc:mysql://192.168.0.174/team_sql";
	private String option = "?useUnicode=true&characterEncoding=utf-8"; //getter url주소 후에 ?키=값 해주는것
	private String user = "asdf1234!";
	private String pass = "asdf1234!";
  
	public DBConnect() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			this.conn = DriverManager.getConnection(url+option, user, pass);
			System.out.println("db접속 성공");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
