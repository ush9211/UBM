package ubmProgram.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnect {

	public Connection conn = null; //�븘�뱶 �븘�뱶 珥덇린�솕
	
	private String url = "jdbc:mysql://192.168.0.174/team_sql";
	private String option = "?useUnicode=true&characterEncoding=utf-8"; //getter url二쇱냼 �썑�뿉 ?�궎=媛� �빐二쇰뒗寃�
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

}
