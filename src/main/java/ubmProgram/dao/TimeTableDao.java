package ubmProgram.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import ubmProgram.dto.CDto;

public class TimeTableDao {
	
	PreparedStatement pstmt = null;
	Statement stmt = null;
	ResultSet res = null;
	Connection conn;
	
	public TimeTableDao(Connection conn) {
		this.conn = conn;
	}
		
	//수강신청 정보를 이용해 교수명, 강의명, 강의실 정보를 뽑아오기 위한 r_seelctDB
    public ArrayList<CDto> r_selectDB(){
    
    	ArrayList<CDto> c_dtos = new ArrayList<>();
   
    	String sql = "select B.p_name, C.c_name, C.where, C.when "
    				+"from s_class as A join professor as B join class as C on A.p_id = B.p_id and A.c_id = C.c_id "
    				+"order by s_id desc";
    	try {
    	  pstmt = conn.prepareStatement(sql);
  
    	  res = pstmt.executeQuery();
    	
    	  while(res.next()) {	
    		 String p_name = res.getString("p_name");
    		 String c_name = res.getString("c_name");
    		 String where = res.getString("where");
    		 String when = res.getString("when");
    		 
    		 CDto cdto = new CDto();  
    		 cdto.setP_name(p_name);
    		 cdto.setC_name(c_name);
   		 cdto.setWhere(where);
   		 cdto.setWhen(when);
    		 c_dtos.add(cdto);
    		       	
    	  }
    	} catch(SQLException e) {
    		e.printStackTrace();
    	} finally {
    		try {
    		   if(res != null) res.close();
    		   if(pstmt != null) pstmt.close();
    		}catch(SQLException e) {e.printStackTrace();}   
    	}
    	
    	System.out.println("수강신청 정보");
    	System.out.println(res);
    	System.out.println(pstmt);
    	return c_dtos;
    }
    
  //수강신청 정보 오버라이드 id(s_id)를 이용해 각 학생별 교수명, 강의명, 강의실 정보를 뽑아오기 위한 r_seelctDB
    public ArrayList<CDto> r_selectDB(String nums){
      int num = Integer.parseInt(nums);
    	ArrayList<CDto> c_dtos = new ArrayList<>();
   
    	String sql = "select A.s_id, B.p_name, C.c_name, C.where, C.when "
    				+"from s_class as A join professor as B join class as C on A.p_id = B.p_id and A.c_id = C.c_id "
    				+ "where A.s_id = ?" +" order by A.s_id desc";
    	try {
    	  pstmt = conn.prepareStatement(sql);
    	  pstmt.setInt(1, num);
    	  
    	  res = pstmt.executeQuery();
    	
    	  while(res.next()) {	
    		 int id = res.getInt("s_id");
    		 String p_name = res.getString("p_name");
    		 String c_name = res.getString("c_name");
    		 String where = res.getString("where");
    		 String when = res.getString("when");
    	      		   		 
    		 CDto cdto = new CDto(); 
    		 cdto.setS_id(id);
    		 cdto.setP_name(p_name);
    		 cdto.setC_name(c_name);
   		 cdto.setWhere(where);
   		 cdto.setWhen(when);
    		 c_dtos.add(cdto);
    		       	
    	  }
    	} catch(SQLException e) {
    		e.printStackTrace();
    	} finally {
    		try {
    		   if(res != null) res.close();
    		   if(pstmt != null) pstmt.close();
    		}catch(SQLException e) {e.printStackTrace();}   
    	}
    	
    	System.out.println("수강신청 정보");
    	System.out.println(res);
    	System.out.println(pstmt);
    	return c_dtos;
    }
}
