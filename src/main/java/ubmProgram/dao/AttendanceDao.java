package ubmProgram.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;

import ubmProgram.dto.CDto;
import ubmProgram.dto.SDto;
import ubmProgram.dto.WDto;


public class AttendanceDao {
 
	PreparedStatement pstmt = null;
	Statement stmt = null;
	ResultSet res = null;
	Connection conn;
	
    public AttendanceDao(Connection conn) {
    	this.conn = conn;
    }
    
    // 하나의 수업을 듣는 모든 학생 수
    public int CountSelectDB(int c_id) {
    	int rs = 0;
    	String sql = "select count(case when c_id="+c_id+" then c_id end) from s_class";   	
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
    	System.out.println("AllSelectDB 완료");
    	return rs;
    }
    
    // 교수 전용, 담당하는 모든 수업 수
    public int CountSelectDB_p(int p_id) {
    	int rs = 0;
    	String sql = "select count(case when p_id="+p_id+" then c_id end) from class";   	
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
    	System.out.println("AllSelectDB 완료");
    	return rs;
    }
    
 // 교수 전용, 모든 수업 수
    public int CountSelectDB_p() {
    	int rs = 0;
    	String sql = "select count(*) from class";   	
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
    	System.out.println("AllSelectDB 완료");
    	System.out.println(rs);
    	return rs;
    }
    
  //select student 학생 관련 정보
    public ArrayList<SDto> s_selectDB(){
    	
    	ArrayList<SDto> s_dtos = new ArrayList<>();
   
    	String sql = "select * from student order by d_id desc limit ?, ?";
    	try {
    	  pstmt = conn.prepareStatement(sql);
    	  pstmt.setInt(1, 0);
    	  pstmt.setInt(2, 20);
    	  	  
    	  res = pstmt.executeQuery();
    	
    	  while(res.next()) {
    		 int s_id = res.getInt("s_id");
    		 String s_name = res.getString("s_name");
    		 String s_pass = res.getString("s_pass");
    		 String s_tel = res.getString("s_tel");
    		 String s_email = res.getString("s_email");
    		 String s_addr = res.getString("s_addr");
    		 int d_id = res.getInt("d_id");
    		 Timestamp wdate = res.getTimestamp("wdate");
    		 
    		 System.out.println("담기 완료");
    		 
    		 SDto sdto = new SDto();
    		 sdto.setS_id(s_id);
    		 sdto.setS_name(s_name);
    		 sdto.setS_pass(s_pass);
    		 sdto.setS_tel(s_tel);
    		 sdto.setS_email(s_email);
    		 sdto.setS_addr(s_addr);
    		 sdto.setD_id(d_id);
    		 sdto.setWdate(wdate);
    		 s_dtos.add(sdto);
    		 
    		 System.out.println("입력 준비 완료");
    	  }
    	} catch(SQLException e) {
    		e.printStackTrace();
    	} finally {
    		try {
    		   if(res != null) res.close();
    		   if(pstmt != null) pstmt.close();
    		}catch(SQLException e) {e.printStackTrace();}   
    	}
    	
    	System.out.println("정상 작동 중");
    	
    	return s_dtos;
    }
    
  //select overload 1) s_class 안에 특정 수업을 듣는 학생을 선별하기 위해 id값을 받아 2) s_class테이블과 join한 student에서 검색하여 정보를 출력 
    //+ 학과명을 출력하기 위해 department도 join
      public ArrayList<SDto> s_selectDB(int c_id, int limitPage, int listCount){
      	
      	ArrayList<SDto> s_dtos = new ArrayList<>();
     
      	String sql = "select A.s_id, A.s_name, A.s_email, A.s_tel, A.s_addr, A.d_id, B.c_id, C.d_name "
      				+"from student as A join s_class as B join department as C on A.s_id = B.s_id and A.d_id = C.d_id "
      				+"where c_id="+c_id+" order by s_id limit ?, ?";
      	try {
      	  pstmt = conn.prepareStatement(sql);
      	  pstmt.setInt(1, limitPage);
      	  pstmt.setInt(2, listCount);
      	  	  
      	  res = pstmt.executeQuery();
      	
      	  while(res.next()) {
      		 int s_id = res.getInt("s_id");
      		 String s_name = res.getString("s_name");
      		 String s_tel = res.getString("s_tel");
      		 String s_email = res.getString("s_email");
      		 String s_addr = res.getString("s_addr");
      		 int d_id = res.getInt("d_id");
      		 String d_name = res.getString("d_name");
      		 
      		 System.out.println("담기 완료");
      		 
      		 SDto sdto = new SDto();
      		 sdto.setS_id(s_id);
      		 sdto.setS_name(s_name);
      		 sdto.setS_tel(s_tel);
      		 sdto.setS_email(s_email);
      		 sdto.setS_addr(s_addr);
      		 sdto.setD_id(d_id);
      		 sdto.setD_name(d_name);
      		 s_dtos.add(sdto);
      		 
      		 System.out.println("입력 준비 완료");
      		 System.out.println(d_name);
      	  }
      	} catch(SQLException e) {
      		e.printStackTrace();
      	} finally {
      		try {
      		   if(res != null) res.close();
      		   if(pstmt != null) pstmt.close();
      		}catch(SQLException e) {e.printStackTrace();}   
      	}
      	
      	System.out.println("정상 작동 중");
      	
      	return s_dtos;
      }
      
    //select overload 검색 
        public ArrayList<SDto> s_selectDB(int c_id, int limitPage, int listCount, String sname, String svalue){
        	
        	ArrayList<SDto> s_dtos = new ArrayList<>();
       
        	String sql = "SELECT A.s_id, A.s_name, A.s_email, A.s_tel, A.s_addr, A.d_id, B.c_id, C.d_name "
        				+"FROM student AS A JOIN s_class AS B JOIN department AS C ON A.s_id = B.s_id AND A.d_id = C.d_id "
        				+"WHERE c_id="+c_id+" AND "+sname+" LIKE ? ORDER BY s_id limit ?, ?";
        	try {
        	  pstmt = conn.prepareStatement(sql);
        	  pstmt.setString(1, "%"+svalue+"%");	
        	  pstmt.setInt(2, limitPage);
        	  pstmt.setInt(3, listCount);
        	  	  
        	  res = pstmt.executeQuery();
        	
        	  while(res.next()) {
        		 int s_id = res.getInt("s_id");
        		 String s_name = res.getString("s_name");
        		 String s_tel = res.getString("s_tel");
        		 String s_email = res.getString("s_email");
        		 String s_addr = res.getString("s_addr");
        		 int d_id = res.getInt("d_id");
        		 String d_name = res.getString("d_name");
        		 
        		 System.out.println("담기 완료");
        		 
        		 SDto sdto = new SDto();
        		 sdto.setS_id(s_id);
        		 sdto.setS_name(s_name);
        		 sdto.setS_tel(s_tel);
        		 sdto.setS_email(s_email);
        		 sdto.setS_addr(s_addr);
        		 sdto.setD_id(d_id);
        		 sdto.setD_name(d_name);
        		 s_dtos.add(sdto);
        		 
        		 System.out.println("입력 준비 완료");
        		 System.out.println(d_name);
        	  }
        	} catch(SQLException e) {
        		e.printStackTrace();
        	} finally {
        		try {
        		   if(res != null) res.close();
        		   if(pstmt != null) pstmt.close();
        		}catch(SQLException e) {e.printStackTrace();}   
        	}
        	
        	System.out.println("정상 작동 중");
        	
        	return s_dtos;
        }
    
  //select class 수업 관련 모든 정보 출력
    public ArrayList<CDto> c_selectDB(){
    	
    	ArrayList<CDto> c_dtos = new ArrayList<>();
   
    	String sql = "select * from class order by d_id desc limit ?, ?";
    	try {
    	  pstmt = conn.prepareStatement(sql);
    	  pstmt.setInt(1, 0);
    	  pstmt.setInt(2, 20);
    	  	  
    	  res = pstmt.executeQuery();
    	
    	  while(res.next()) {
    		 int c_id = res.getInt("c_id");
    		 String c_name = res.getString("c_name");
    		 int grade = res.getInt("grade");
    		 String when = res.getString("when");
    		 String where = res.getString("where");
    		 int p_id = res.getInt("p_id");
    		 int d_id = res.getInt("d_id");
    		 
    		 System.out.println("담기 완료");
    		 
    		 CDto cdto = new CDto();
    		 cdto.setC_id(c_id);
    		 cdto.setC_name(c_name);
    		 cdto.setGrade(grade);
    		 cdto.setWhen(when);
    		 cdto.setWhere(where);
    		 cdto.setP_id(p_id);
    		 cdto.setD_id(d_id);
    		 c_dtos.add(cdto);
    		 
    		 System.out.println("입력 준비 완료");
    	  }
    	} catch(SQLException e) {
    		e.printStackTrace();
    	} finally {
    		try {
    		   if(res != null) res.close();
    		   if(pstmt != null) pstmt.close();
    		}catch(SQLException e) {e.printStackTrace();}   
    	}
    	
    	System.out.println("정상 작동 중");
    	
    	return c_dtos;
    }
    
  //select class 입력받은 수업 id로 한 가지 수업 정보 출력 overload
    public CDto c_selectDB(int c_id){
       	
    	CDto cdto = new CDto();
       	String sql = "select * from class where c_id="+c_id;

       	try {
       	  pstmt = conn.prepareStatement(sql); 
       	  res = pstmt.executeQuery();
       	
       	 while(res.next()) {
    		 c_id = res.getInt("c_id");
    		 String c_name = res.getString("c_name");
    		 int grade = res.getInt("grade");
    		 String when = res.getString("when");
    		 String where = res.getString("where");
    		 int p_id = res.getInt("p_id");
    		 int d_id = res.getInt("d_id");
    		 
    		 System.out.println("담기 완료");
    		 
    		 cdto.setC_id(c_id);
    		 cdto.setC_name(c_name);
    		 cdto.setGrade(grade);
    		 cdto.setWhen(when);
    		 cdto.setWhere(where);
    		 cdto.setP_id(p_id);
    		 cdto.setD_id(d_id);
    		 
       	  }
       	} catch(SQLException e) {
       		e.printStackTrace();
       	} finally {
       		try {
       		   if(res != null) res.close();
       		   if(pstmt != null) pstmt.close();
       		}catch(SQLException e) {e.printStackTrace();}   
       	}
       	
       	return cdto;
       }
    
    
    // 결석한 학생과 이유를 DB에 작성
    public int insert(WDto dto) {
    	int num = 0;
    	String sql = "insert into not_attendance (s_id, why, c_id) values (?, ?, ?)";
    	try {
    		System.out.println("insert() 실행");
    		pstmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
    		pstmt.setInt(1, dto.getS_id());  	
    		pstmt.setString(2, dto.getWhy());
    		pstmt.setInt(3, dto.getC_id());
            pstmt.executeUpdate();
            res = pstmt.getGeneratedKeys(); //입력 후 auto increment 값을 반환 받음 	
              if(res.next()) {
            	num = res.getInt(1);            
             }
          
    	}catch(SQLException e) {
    		e.printStackTrace();
    	}finally {
    		try {
      		   if(res != null) res.close();
      		   if(pstmt != null) pstmt.close();
      		}catch(SQLException e) {e.printStackTrace();}   
      	}
    	System.out.println("insert() 완료");
    	return num;
    }
}