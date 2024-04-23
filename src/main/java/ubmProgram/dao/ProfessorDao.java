package ubmProgram.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import ubmProgram.dto.CDto;
import ubmProgram.dto.PDto;

public class ProfessorDao {

	// 필드
	PreparedStatement pstmt = null;
	Statement stmt = null;
	ResultSet res = null;
	Connection conn;
	
	// 기본 생성자
	public ProfessorDao(Connection conn) {
		this.conn = conn;
	}
	
	//select 교수테이블
    public ArrayList<PDto> selectPDB(int id){
       
       ArrayList<PDto> pDtos = new ArrayList<>();
   
       String sql = "select * from professor where p_id = ?";
       try {
         pstmt = conn.prepareStatement(sql);
         pstmt.setInt(1, id);
              
         res = pstmt.executeQuery();
       
         while(res.next()) {
           int p_id = res.getInt("p_id");
           String p_pass = res.getString("p_pass");
           String p_name = res.getString("p_name");
           String p_email = res.getString("p_email");
           String p_tel = res.getString("p_tel");
           
           PDto pDto = new PDto();
           pDto.setP_id(p_id);
           pDto.setP_pass(p_pass);
           pDto.setP_name(p_name);
           pDto.setP_email(p_email);
           pDto.setP_tel(p_tel);
           pDtos.add(pDto);
         }
       } catch(SQLException e) {
          e.printStackTrace();
       } finally {
          try {
             if(res != null) res.close();
             if(pstmt != null) pstmt.close();
          }catch(SQLException e) {e.printStackTrace();}   
       }
       
       return pDtos;
    }
    
  //select class테이블
    public ArrayList<CDto> selectCDB(int id){
       
       ArrayList<CDto> cDtos = new ArrayList<>();
   
       String sql = "select * from class where p_id = ?";
       try {
         pstmt = conn.prepareStatement(sql);
         pstmt.setInt(1, id);
              
         res = pstmt.executeQuery();
       
         while(res.next()) {
           int c_id = res.getInt("c_id");
           String c_name = res.getString("c_name");
           int grade = res.getInt("grade");
           String when = res.getString("when");
           String where = res.getString("where");
           int p_id = res.getInt("p_id");
           int d_id = res.getInt("d_id");	 
           
           CDto cDto = new CDto();
           cDto.setC_id(c_id);
           cDto.setC_name(c_name);
           cDto.setGrade(grade);
           cDto.setWhen(when);
           cDto.setWhere(where);
           cDto.setP_id(p_id);
           cDto.setD_id(d_id);
           cDtos.add(cDto);
         }
       } catch(SQLException e) {
          e.printStackTrace();
       } finally {
          try {
             if(res != null) res.close();
             if(pstmt != null) pstmt.close();
          }catch(SQLException e) {e.printStackTrace();}   
       }
       
       return cDtos;
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