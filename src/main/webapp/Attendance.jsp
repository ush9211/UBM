<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.ArrayList, ubmProgram.dao.AttendanceDao, ubmProgram.dto.*, java.text.SimpleDateFormat, java.sql.Timestamp, java.text.NumberFormat" %>
<jsp:useBean id="db" class="ubmProgram.dao.DBConnect" scope="page"/>
<%
	Connection conn = db.conn;
	AttendanceDao dao = new AttendanceDao(conn);
	
	int c_id;
	String c_id_param = request.getParameter("c_id");
	if(c_id_param != null && !c_id_param.isEmpty()) {
	    c_id = Integer.parseInt(c_id_param);
	} else {
	    c_id = 0; // c_id를 받지 않으면 반환
	}
	
    String sname = request.getParameter("searchname");  //검색 이름
    String svalue = request.getParameter("searchvalue"); //검색 값

	//페이징 시작
	
	int pg; //받아올 현재 페이지 번호
	int allCount = dao.CountSelectDB(c_id); //1. 전체 개시글 수 
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
	s_list = dao.s_selectDB(c_id, limitPage, listCount);
	c_list = dao.c_selectDB();
	
	//페이징 끝
	
	if(sname == null || sname.trim().isEmpty()){    
        s_list = dao.s_selectDB(c_id, limitPage, listCount);
     }else{
        s_list = dao.s_selectDB(c_id, limitPage, listCount, sname, svalue);
     }
	
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
    NumberFormat formatter = NumberFormat.getInstance();  
%>
<jsp:include page="inc/header.jsp" flush="true" />
            <!-- listbox -->

            <div class="AttendanceBox p-5">
                <h1 class="text-center mb-5">출석부</h1> 
                <form name="searchform" id="searchform" class="searchform mb-3" method="get">
                   <div class="input-group my-3 searchbox">
                        <div class="input-group-prepend searchNameBtn">
                             <button type="button" class="btn btn-outline-secondary dropdown-toggle" 
                             		 data-toggle="dropdown" value="s_name"> 이름검색
                              </button>
                              <input type="hidden" name="searchname" id="searchname" value="s_name">
                              <input type="hidden" name="c_id" id="c_id" value="<%=c_id%>">
                              <div class="dropdown-menu">
                                <a class="dropdown-item" href="s_name">이름검색</a>
                                <a class="dropdown-item" href="d_name">학과검색</a>
                              </div>
                        </div>
                       <input type="search" name="searchvalue" class="form-control" placeholder="검색">
                       <div class="input-group-append">
                          <button type="submit" class="btn btn-primary"><i class="ri-search-line"></i></button>
                          <a href="Attendance.jsp?c_id=<%=c_id%>" class="ml-2"><i class="ri-arrow-go-back-fill i_return"></i></a>
                       </div>
                   </div>
               </form>
               
                <div class="mb-3 pt-3 pb-3" style="font-size:18px;">
                <%
                	int c_count = dao.CountSelectDB_p();
	                CDto c_dto = dao.c_selectDB(c_id);  
	            	String c_name = c_dto.getC_name();
	            	String where = c_dto.getWhere();
	            	String when = c_dto.getWhen();
	            	
                	if(c_id == 0 || c_id > c_count){
                		c_name = "없음";
                		where = "없음";
                		when = "없음";
                    	}

                %>
                	<label class="font-weight-bold">수업명</label> : <%=c_name %> / <label class="font-weight-bold">총 인원</label> : <%=formatter.format(allCount) %>명 <br> 
                	<label class="font-weight-bold">수업장소</label> : <%=where %> / <label class="font-weight-bold">수업 시간</label> : <%=when %>
                </div>
                <form action="Attendanceok.jsp?c_id=<%=c_id %>" name="attendance_form" id="attendance_form" class="attendance_form" method="post">
	                <table class="table p-5">
	                    <colgroup>
	                       <col width="8%">
	                       <col width="10%">
	                       <col width="10%">
	                       <col width="10%">
	                       <col width="15%">
	                       <col width="auto">
	                       <col width="30%">
	                    </colgroup>
	                    <thead>
	                        <tr class="table-top">
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
	                   
	                   <tr class="table-main">
	                        <td><%=num %></td>
	                        <td class="font-weight-bold"><%=s_name %></td>
	                        <td><%=s_id %></td>
	                        <td><%=d_name %></td>
	                        <td><%=s_tel %></td>
	                        <td><%=s_email %></td>
	                        <td>미출석<input type="checkbox" id="s_id" name="s_id" class="ml-2 mr-2" value="<%=s_id %>">
	                        	사유<input type="text" id="why" name="why" class="ml-2 mr-2"></td>
	                    </tr>
	
						<% } %>
	
	                       <!-- /loop -->
	                    </tbody>
	                </table>
	                <div class="text-right m-3">
	                	<button class="btn btn-primary px-5 mx-2" type="submit">저장</button>           
	                </div>
	            </form>
	                <!-- paging -->
	              	<ul class="paging text-center">
	                    <li>
	                       <a href="?cpg=1"><i class="ri-arrow-left-s-line"></i></a>
	                       <a href="?cpg=2"><i class="ri-arrow-right-s-line"></i></a>
	                    </li>
	                    
	            	</ul>
	        	</div>
       		
<script>
$(function(){
	if(<%=c_id%> == 0){
		var insert_c = prompt("열람을 원하는 수업의 id를 입력해주세요.");
		if (insert_c !== null) {
			window.location.href = "Attendance.jsp?c_id="+insert_c;
			if(insert_c == 0 || insert_c > <%=c_count%> ){
				alert("해당 id값이 없습니다. 다시 확인해주세요.");	
			}
		} else{
		    alert("오류가 발생했습니다. 다시 입력해주세요.");
		}
	}
})
</script>

<jsp:include page="inc/footer.jsp" flush="true" />