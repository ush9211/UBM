<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="ubmProgram.dto.*, ubmProgram.dao.*, java.sql.Connection, java.util.ArrayList "  %>
<jsp:useBean id="db" class="ubmProgram.dao.DBConnect" scope="page" />
<jsp:include page="inc/header.jsp" flush="true" />
<%@taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%       
      
        /*
        //db연결 확인
        Connection conn = db.conn;
        UBMDao dao = new  UBMDao(conn);       	                       
        
          //전체 게시글의 수를 가져옴
         int cnt = dao.AllselectDB(); 
          */
          String s_id = request.getParameter("s_id");   
          System.out.println(s_id);
          Connection conn = db.conn;
          TimeTableDao dao = new TimeTableDao(conn);  
          ArrayList<CDto> lists =  null;
          ArrayList<CDto> list =  null;
          lists = dao.r_selectDB();
          list = dao.r_selectDB(s_id);
       
     
%>
   

     <section>
			
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
		
				<tr align="center" >
					<td>1교시<p>(9-10시)</p></td>
					<td id="mon1">${mon1}</td>
					<td id="tue1">${tue1}</td>
					<td id="wed1">${wed1}</td>
					<td id="tur1">${tur1}</td>
					<td id="fri1">${fri1}</td>
				</tr>
		
				<tr align="center">
					<td>2교시<p>(10-11시)</p></td>
					<td id="mon2">${mon2}</td>
					<td id="tue2">${tue2}</td>
					<td id="wed2">${wed2}</td>
					<td id="tur2">${tur2}</td>
					<td id="fri2">${fri2}</td>
				</tr>
		
				<tr align="center">
					<td>3교시<p>(11-12시)</p></td>
					<td id="mon3">${mon3}</td>
					<td id="tue3">${tue3}</td>
					<td id="wed3">${wed3}</td>
					<td id="tur3">${tur3}</td>
					<td id="fri3">${fri3}</td>
				</tr>
		
				<tr align="center">
					<td>4교시<p>(12-13시)</p></td>
					<td id="mon4">${mon4}</td>
					<td id="tue4">${tue4}</td>
					<td id="wed4">${wed4}</td>
					<td id="tur4">${tur4}</td>
					<td id="fri4">${fri4}</td>
				</tr>
		
				<tr align="center">
					<td>5교시<p>(13-14시)</p></td>
					<td id="mon5">${mon5}</td>
					<td id="tue5">${tue5}</td>
					<td id="wed5">${wed5}</td>
					<td id="tur5">${tur5}</td>
					<td id="fri5">${fri5}</td>
				</tr>
		
				<tr align="center">
					<td>6교시<p>(14-15시)</p></td>
					<td id="mon6">${mon6}</td>
					<td id="tue6">${tue6}</td>
					<td id="wed6">${wed6}</td>
					<td id="tur6">${tur6}</td>
					<td id="fri6">${fri6}</td>
				</tr>
		
				<tr align="center">
					<td>7교시<p>(15-16시)</p></td>
					<td id="mon7">${mon7}</td>
					<td id="tue7">${tue7}</td>
					<td id="wed7">${wed7}</td>
					<td id="tur7">${tur7}</td>
					<td id="fri7">${fri7}</td>
				</tr>
		
				<tr align="center">
					<td>8교시<p>(16-17시)</p></td>
					<td id="mon8">${mon8}</td>
					<td id="tue8">${tue8}</td>
					<td id="wed8">${wed8}</td>
					<td id="tur8">${tur8}</td>
					<td id="fri8">${fri8}</td>
				</tr>   
		        	<tr align="center">
					<td>9교시<p>(17-18시)</p></td>
					<td id="mon9">${mon9}</td>
					<td id="tue9">${tue9}</td>
					<td id="wed9">${wed9}</td>
					<td id="tur9">${tur9}</td>
					<td id="fri9">${fri9}</td>
				</tr>
		
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
 </section>
  

<jsp:include page="inc/footer.jsp" flush="true" />