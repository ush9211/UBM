<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="ubmProgram.dto.*, ubmProgram.dao.*, java.sql.Connection, java.util.ArrayList, java.text.SimpleDateFormat "  %>
<jsp:useBean id="db" class="ubmProgram.dao.DBConnect" scope="page" />
<jsp:include page="inc/header.jsp" flush="true" />
<%@taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%       
      
        
          String s_id = request.getParameter("s_id");   
          System.out.println(s_id);
          Connection conn = db.conn;
          TimeTableDao dao = new TimeTableDao(conn);  
          ArrayList<CDto> lists =  null;
          ArrayList<CDto> list =  null;
          lists = dao.r_selectDB();
          list = dao.r_selectDB(s_id);
          SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
          
          // 시간표 초기화
          String[][] timetable = new String[9][5]; // 9교시(행) x 월~금(열)
          for (int i = 0; i < 9; i++) {
              for (int j = 0; j < 5; j++) {
                  timetable[i][j] = "";
              }
          }
          
          // 시간표에 교수가 담당하는 강의 정보 입력
          for (CDto cdto : list) {
              // 요일과 교시 정보 추출
              String when = cdto.getWhen();
              String[] whenParts = when.split(" ");
              String dayOfWeek = whenParts[0];
              int timeSlot = Integer.parseInt(whenParts[1].replace("시", "")); // "10시"에서 "시" 제거 후 정수로 변환
              String where = cdto.getWhere();
       	      String cname = cdto.getC_name();
       	      String pname = cdto.getP_name();        
       	      
       	      // 강의명, 학점, 강의실 입력
              int dayIndex = dao.getDayOfWeekIndex(dayOfWeek); // ProfessorDao 클래스의 메서드 사용
              if (dayIndex != -1 && timeSlot >= 9 && timeSlot <= 17) { // 시간표 범위 내에 있는 경우에만 입력
                  timetable[timeSlot - 9][dayIndex] = cdto.getC_name() + " (" + cdto.getP_name() + ", " + cdto.getWhere() + ")";
              }
          }
     
%>
   

     <section>
	<div class="col text-center">
                   <div class="d-flex justify-content-center py-4">
                   <h3>학생 시간표</h3>
                   </div>
          <table class="timetable" cellspacing="5" align="center" border="1" bordercolor="#12406b" width="600" height="600">
				<p></p>

				<tr align="center">
					<td width="100"></td>
					<td width="100" bgcolor="#12406b">월</td>
					<td width="100" bgcolor="#12406b">화</td>
					<td width="100" bgcolor="#12406b">수</td>
					<td width="100" bgcolor="#12406b">목</td>
					<td width="100" bgcolor="#12406b">금</td>
				</tr>
		
				       <% for(int i = 1; i <= 9; i++) { %>
                                        <tr align="center">
                                            <td><%= i %>교시<p>(<%= (i + 8) %>-<%= (i + 9) %>시)</p></td>
                                            <% for(int j = 0; j < 5; j++) { %>
                                                <td><%= timetable[i - 1][j] %></td>
                                            <% } %>
                                        </tr>
                                    <% } %>                    
				<tr align="center">
					<td></td>
					<td colspan="5" bgcolor="#12406b">이젠대학교 경영학과			
					</td>
				</tr>
			</table>    
			
			
			  <p class="text-center mt-5">전체 학생이 수강신청한 내역에 대한 강의실 강의명 교수명 강의시간 출력</p>
			  <table class="table table-hover table-bordered table-dark">
                        <colgroup> <!-- 테이블 크기를 정해줄 때 해주는 방법!! colgroup + col(범위지정)-->
                            <col width="25%">
                            <col width="25%">
                            <col width="25%">
                            <col width="25%">
                             <col width="25%">
                        </colgroup>
                        <thead>
                            <tr>
                                <th class="text-center">강의실</th>
                                <th class="text-center">강의명</th>
                                <th class="text-center">교수명</th>
                                <th class="text-center">강의시간</th>
                            </tr>
                        </thead>
                        <tbody>
                            <!-- loop -->
                            <% 
                               int num = lists.size();
                            
                               for(int i = 0; i < lists.size(); i++){ //List는 size가 크기임으로 이거로 for문을 돌리면서 값을 추출할 수 있다.
                            	   CDto cdto = lists.get(i);                          
                            	   String where = cdto.getWhere();
                            	   String cname = cdto.getC_name();
                            	   String pname = cdto.getP_name();        
                            	   String when = cdto.getWhen(); 
                            %>
                            <tr>      
                                <td class="text-center"><%=where %></td>
                                <td class="text-center"><%=cname %></td>
                                <td class="text-center"><%=pname %></td>
                                 <td class="text-center"><%=when %></td>
                            </tr>                
                            <%
                                num--;
                               }
                               
                            %>
                            <!--/loop-->
                        </tbody>
                        </table> 
                           
                                          
                         <p class="text-center mt-5"> 학생별 s_id를 받아 학생이 수강신청한 내역에 대한 강의실 강의명 교수명 강의시간 출력</p>
                         <table class="table table-hover table-bordered">
                        <colgroup> <!-- 테이블 크기를 정해줄 때 해주는 방법!! colgroup + col(범위지정)-->
                            <col width="20%">
                            <col width="20%">
                            <col width="20%">
                            <col width="20%">
                             <col width="20%">
                        </colgroup>
                        <thead>
                            <tr>
                                <th class="text-center">번호</th>
                                <th class="text-center">강의실</th>
                                <th class="text-center">강의명</th>
                                <th class="text-center">교수명</th>
                                <th class="text-center">강의시간</th>
                            </tr>
                        </thead>
                        <tbody>
                            <!-- loop -->
                            <% 
                               int num2 = list.size();
                               for(int i = 0; i < list.size(); i++){ //List는 size가 크기임으로 이거로 for문을 돌리면서 값을 추출할 수 있다.
                            	   CDto dto = list.get(i);                          
                            	   String where = dto.getWhere();
                            	   String cname = dto.getC_name();
                            	   String pname = dto.getP_name();    
                            	   String when = dto.getWhen(); 
                            	   int sid = dto.getS_id();
                            %>
                            <tr>
                                <td class="text-center"><%=sid %></td>      
                                <td class="text-center"><%=where %></td>
                                <td class="text-center"><%=cname %></td>
                                <td class="text-center"><%=pname %></td>
                                <td class="text-center"><%=when %></td>
                                
                            </tr>                
                            <%
                                num2--;
                               }
                               
                            %>
                            <!--/loop-->
                        </tbody>
			</table>    
		</div>
 </section>
  

<jsp:include page="inc/footer.jsp" flush="true" />