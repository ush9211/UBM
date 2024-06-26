<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="ubmProgram.dto.*, ubmProgram.dao.*, java.sql.Connection, java.util.ArrayList, java.sql.Timestamp, java.text.SimpleDateFormat "  %>
<jsp:useBean id="db" class="ubmProgram.dao.DBConnect" scope="page" />
<jsp:include page="inc/header.jsp" flush="true" />
<%@taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%       

        Connection conn = db.conn;
        TimeTableDao dao = new TimeTableDao(conn);        
        int s_id;
        String stid = request.getParameter("s_id");
        if(stid != null && !stid.isEmpty()) {
           s_id = Integer.parseInt(stid);
         } else {
            s_id = 0; // s_id를 받지 않으면 반환
         }   
          ArrayList<CDto> lists =  null;
          ArrayList<CDto> list =  null;
          ArrayList<SDto> slist =  null;
          lists = dao.r_selectDB();
          list = dao.r_selectDB(stid);
          slist = dao.selectSDB(s_id);
          SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
          // 시간표 초기화
          String[][] timetable = new String[9][5]; // 9교시(행) x 월~금(열)
          for (int i = 0; i < 9; i++) {
              for (int j = 0; j < 5; j++) {
                  timetable[i][j] = "";
              }
          }
          
          // 시간표에 학생이 신청한 강의 정보 입력
          for (CDto cdto : list) {
              // 요일과 교시 정보 추출
              String when = cdto.getWhen(); //요일
              String[] whenParts = when.split(" "); //공백별로 문자열 나누기 (월, 1교시) ,(월, 2교시) 이렇게 나눔
              String dayOfWeek = whenParts[0];
              int timeSlot = Integer.parseInt(whenParts[1].replace("시", "")); // "10시"에서 "시" 제거 후 정수로 변환
              String where = cdto.getWhere();
       	      String cname = cdto.getC_name();
       	      String pname = cdto.getP_name();        
       	      
       	      // 강의명, 교수명, 강의실 입력
              int dayIndex = dao.getDayOfWeekIndex(dayOfWeek); // TimeTableDao 클래스의 메서드 사용 (요일별로 번호를 추출)
              if (dayIndex != -1 && timeSlot >= 9 && timeSlot <= 17) { // 시간표 범위 내에 있는 경우에만 입력
                  timetable[timeSlot - 9][dayIndex] = cdto.getC_name() + " (" + cdto.getP_name() + ", " + cdto.getWhere() + ")";
                  
              }
          }
        
          
          int s_count = dao.sidCountDB();
          System.out.println(s_count);
          
%>
    

     <section>
     
     
                         <div class="d-flex justify-content-center py-4">
                            <h3>학생 정보</h3>
                        </div>
                        <table class="table table-hover mx-auto">
                            <colgroup>
                                <col width="20%">
                                <col width="20%">
                                <col width="20%">
                                <col width="20%">
                                <col width="20%">
                            </colgroup>
                            <thead>
                                <tr class="text-center">
                                    <th>이름</th>
                                    <th>이메일</th>
                                    <th>전화번호</th>
                                    <th>주소</th>
                                    <th>가입일</th>
                                </tr>  
                            </thead>
                            <tbody>
                                <!-- loop -->
                                <% 
                                for(int i=0; i<slist.size(); i++){
                                    SDto sdto = slist.get(i);
                                    String s_name = sdto.getS_name();
                                    String s_email = sdto.getS_email();
                                    String s_tel = sdto.getS_tel();
                                    String s_addr = sdto.getS_addr();
                                    Timestamp dates = sdto.getWdate();
                             	    String wdate = sdf.format(dates); //위에서 정한 방식으로 sdf.format(값); 해준다.
                                %>    
                                    <tr>
                                        <td><%=s_name %></td>
                                        <td><%=s_email %></td>
                                        <td><%=s_tel %></td>
                                        <td><%=s_addr %></td>
                                        <td><%=wdate %></td>
                                    </tr> 
                                <% 
                                } 
                                %>     		
                           </tbody>
                           </table>
                                          
                     
     
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
			
			
			    <h3 class="text-center mt-5 mb-5"> 학생 수강신청 내역</h3>
                         <table class="table table-hover table-bordered table-dark">
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
			 <!-- 
			  <p class="text-center mt-5">전체 학생이 수강신청한 내역에 대한 강의실 강의명 교수명 강의시간 출력</p>
			  <table class="table table-hover table-bordered">
                        <colgroup> <!-- 테이블 크기를 정해줄 때 해주는 방법!! colgroup + col(범위지정)-->
                        <!-- 
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
                           
                            <%-- 
                               int num = lists.size();
                            
                               for(int i = 0; i < lists.size(); i++){ //List는 size가 크기임으로 이거로 for문을 돌리면서 값을 추출할 수 있다.
                            	   CDto cdto = lists.get(i);                          
                            	   String where = cdto.getWhere();
                            	   String cname = cdto.getC_name();
                            	   String pname = cdto.getP_name();        
                            	   String when = cdto.getWhen(); 
                            --%>
                            <!--  
                            <tr>      
                                <td class="text-center"><%--=where --%></td>
                                <td class="text-center"><%--=cname --%></td>
                                <td class="text-center"><%--=pname --%></td>
                                 <td class="text-center"><%--=when --%></td>
                            </tr>                
                            <%--
                                num--;
                               }
                               
                            --%>
                            <!--/loop-->
                            <!--
                        </tbody>
             </table>
              -->
		</div>
 </section>
 
<script>
$(function(){
	if(<%=s_id%> == 0){
		var insert_s = prompt("열람을 원하는 학생의 id를 입력해주세요.");
		if (insert_s !== null) {
			window.location.href = "timetable.jsp?s_id="+insert_s;
			if(insert_s == 0 || insert_s > <%=s_count%> ){
				alert("해당 id값이 없습니다. 다시 확인해주세요.");	
			}
		} else{
		    alert("오류가 발생했습니다. 다시 입력해주세요.");
		}
	}
})
</script>

<jsp:include page="inc/footer.jsp" flush="true" />