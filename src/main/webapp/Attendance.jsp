<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.ArrayList, ubmProgram.dao.AttendanceDao, ubmProgram.dto.*, java.text.SimpleDateFormat, java.sql.Timestamp, java.text.NumberFormat" %>
<jsp:useBean id="db" class="ubmProgram.dao.DBConnect" scope="page"/>
<%
	Connection conn = db.conn;
	AttendanceDao dao = new AttendanceDao(conn);

	int cid = 1; // c_id 받아서 출력 / 임시로 1 입력

	//페이징 시작
	
	int pg; //받아올 현재 페이지 번호
	int allCount = dao.CountSelectDB(cid); //1. 전체 개시글 수 
    int listCount = 15; //2. 한 페이지에 보일 목록 수
    int pageCount = 10; //3. 한 페이지에 보일 페이지 수  
    int limitPage; //4. 쿼리문으로 보낼 시작번호
    
    String cpg;
    if(request.getParameter("cpg") == null){
    	cpg = "1";	
    }else{
    	cpg = request.getParameter("cpg");
    }
    pg = (cpg == null)?1:Integer.parseInt(cpg);  //3항 연산   
    limitPage = (pg-1)*listCount;  //(현재페이지-1)x목록수 
    
	ArrayList<SDto> s_list = null;
	ArrayList<CDto> c_list = null;
	s_list = dao.s_selectDB(cid, limitPage, listCount);
	c_list = dao.c_selectDB();
	
	//페이징 끝
	
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
    NumberFormat formatter = NumberFormat.getInstance();  
%>
<jsp:include page="inc/header.jsp" flush="true" />
            <!-- listbox -->

            <div class="AttendanceBox mt-3 p-5">
                <h1 class="text-center mb-5">출석부</h1>
                <div class="pb-2">
                <%
                	CDto c_dto = dao.c_selectDB(cid);  
                	String c_name = c_dto.getC_name();
                	String where = c_dto.getWhere();
                	String when = c_dto.getWhen();
                %>
                	<label class="font-weight-bold">수업명</label> : <%=c_name %> / <label class="font-weight-bold">총 인원</label> : <%=formatter.format(allCount) %>명 <br> 
                	<label class="font-weight-bold">수업장소</label> : <%=where %> / <label class="font-weight-bold">수업 시간</label> : <%=when %>
                </div>
                <table class="table p-5">
                    <colgroup>
                       <col width="8%">
                       <col width="10%">
                       <col width="15%">
                       <col width="10%">
                       <col width="15%">
                       <col width="auto">
                       <col width="20%">
                    </colgroup>
                    <thead>
                        <tr>
                        	<th>번호</th>
                            <th>이름</th>
                            <th>학번</th>
                            <th>학과</th>
                            <th>연락처</th>
                            <th>이메일</th>
                            <th>비고</th>
                        </tr>
                    </thead>
                    <tbody>
                       <!-- loop --> 
                   
                   <%

                   for(int i=0; i<s_list.size(); i++){
                        int num = i+1;
                		SDto dto = s_list.get(i);
						String s_name = dto.getS_name();
						int s_id = dto.getS_id();
						int d_id = dto.getD_id();
						String d_name = dto.getD_name();
						String s_tel = dto.getS_tel();
						String s_email = dto.getS_email();
                   
                   %>    
                   
                   <tr>
                        <td><%=num %></td>
                        <td class="font-weight-bold"><%=s_name %></td>
                        <td><%=s_id %></td>
                        <td><%=d_name %></td>
                        <td><%=s_tel %></td>
                        <td><%=s_email %></td>
                        <td></td>
                    </tr>

					<% } %>

                       <!-- /loop -->
                    </tbody>
                </table>
                <!-- paging -->
              	<ul class="paging text-center">
                    <li>
                       <a href="?cpg=1"><i class="ri-arrow-left-s-line"></i></a>
                       <a href="?cpg=2"><i class="ri-arrow-right-s-line"></i></a>
                    </li>
            	</ul>
            </div>
       

<jsp:include page="inc/footer.jsp" flush="true" />