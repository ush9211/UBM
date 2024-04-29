package ubmProgram.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;

import ubmProgram.dto.CDto;
import ubmProgram.dto.PDto;
import ubmProgram.dto.SDto;

public class TimeTableDao {
	
	PreparedStatement pstmt = null;
	Statement stmt = null;
	ResultSet res = null;
	Connection conn;
	
	public TimeTableDao(Connection conn) {
		this.conn = conn;
	}
	
	//select 학생테이블
    public ArrayList<SDto> selectSDB(int s_id){
       
       ArrayList<SDto> sDtos = new ArrayList<>();
   
       String sql = "select * from student where s_id = ?";
       try {
         pstmt = conn.prepareStatement(sql);
         pstmt.setInt(1, s_id);
              
         res = pstmt.executeQuery();
       
         while(res.next()) {
           String s_pass = res.getString("s_pass");
           String s_name = res.getString("s_name");
           String s_email = res.getString("s_email");
           String s_tel = res.getString("s_tel");
           String s_addr = res.getString("s_addr");
           Timestamp wdate = res.getTimestamp("wdate");
           
           SDto sDto = new SDto();
           sDto.setS_id(s_id);
           sDto.setS_pass(s_pass);
           sDto.setS_name(s_name);
           sDto.setS_email(s_email);
           sDto.setS_tel(s_tel);
           sDto.setS_addr(s_addr);
           sDto.setWdate(wdate);
           sDtos.add(sDto);
         }
       } catch(SQLException e) {
          e.printStackTrace();
       } finally {
          try {
             if(res != null) res.close();
             if(pstmt != null) pstmt.close();
          }catch(SQLException e) {e.printStackTrace();}   
       }
       
       return sDtos;
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
    
    // 중복제거를 한 후 s_id의 개수를 뽑아냄
    public int sidCountDB() {
    	int rs = 0;
    	String sql = "SELECT COUNT(DISTINCT s_id) FROM s_class";	
    	try {
    		pstmt = conn.prepareStatement(sql);
      	  	res = pstmt.executeQuery();
    		    if(res.next()) {
    		    	rs = res.getInt(1);
    		 }
    	}catch(SQLException e) {
    		e.printStackTrace();
    	} finally {
    		try {
    		   if(res != null) res.close();
    		   if(stmt != null) stmt.close();
    		}catch(SQLException e) {e.printStackTrace();}   
    	}
    	System.out.println("sidCountDB 완료");
    	return rs;
    }
    
        
    // 요일을 숫자로 변환하는 메서드
    public int getDayOfWeekIndex(String dayOfWeek) {
        switch (dayOfWeek) {
            case "월":
                return 0;
            case "화":
                return 1;
            case "수":
                return 2;
            case "목":
                return 3;
            case "금":
                return 4;
            default:
                return -1;
        }
    }
    
    
}
