package ubmProgram.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.NamingException;

import ubmProgram.dao.ClassDao;
import ubmProgram.dao.DBConnect;
import ubmProgram.dto.CDto;

public class DbWorks {

	// 필드
	private int limitPage;
	private int listCount;
	private String sname;
	private String svalue;
	private Connection conn;
	private DBConnect db = new DBConnect();
	private String id;
	private String mid;



	public DbWorks() {
		
	}
	
	
	
	public DbWorks(int limitPage, int listCount, String sname, String svalue) {
		this.limitPage = limitPage;
		this.listCount = listCount;
		this.sname = sname;
		this.svalue = svalue;
	}
	
	
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}

	
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	


	// 전체 글 갯수
	public int getAllSelect() {
		int allCount = 0;
		
		try {
			conn = db.getConnection();
			ClassDao dao = new ClassDao(conn);
			
			if(sname == null) {
				allCount = dao.AllSelectDB();
			}else {
				allCount = dao.AllSelectDB(sname, svalue);
			}
			
		} catch (SQLException | NamingException e) {
			e.printStackTrace();
		} finally {
			db.closeConnection();
		}
		
		return allCount;
	}
	
	
	// 일반 페이징 있는 목록
	public ArrayList<CDto> getList(){
		ArrayList<CDto> lists = null;
		
		try {
			conn = db.getConnection();
			ClassDao dao = new ClassDao(conn);
			lists = dao.selectDB(limitPage, listCount);
			
		} catch (SQLException | NamingException e) {
			e.printStackTrace();
		} finally {
			db.closeConnection();
		}
		
		return lists;
	}
	
	
	// 검색 목록
	public ArrayList<CDto> getSearchList(){
		ArrayList<CDto> lists = null;
		
		try {
			conn = db.getConnection();
			ClassDao dao = new ClassDao(conn);
			lists = dao.selectDB(limitPage, listCount, sname, svalue);
			
		} catch (SQLException | NamingException e) {
			e.printStackTrace();
		} finally {
			db.closeConnection();
		}
		
		return lists;
	}
	
	
	// contents 보기
	public CDto getSelectOne() {
		CDto list = null;
		
		try {
			conn = db.getConnection();
			
			ClassDao dao = new ClassDao(conn);
			
			list = dao.viewDB(getId()); 
			
		} catch (SQLException | NamingException e) {
			e.printStackTrace();
		} finally {
			db.closeConnection();
		}
		
		return list;
	}
	
}
