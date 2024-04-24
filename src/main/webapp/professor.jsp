<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ page  import="java.sql.Connection, java.util.ArrayList, ubmProgram.dao.ProfessorDao, ubmProgram.dto.PDto,  ubmProgram.dto.CDto, java.sql.Timestamp, java.text.SimpleDateFormat" %>    
<%@ include file="inc/header.jsp" %> 
<jsp:useBean id="db" class="ubmProgram.dao.DBConnect" scope="page"/>
<%
    Connection conn = db.conn;
    ProfessorDao dao = new ProfessorDao(conn);
    ArrayList<PDto> Plist = dao.selectPDB(1);
    ArrayList<CDto> Clist = dao.selectCDB(1);
    
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");

    // 시간표 초기화
    String[][] timetable = new String[9][5]; // 9교시(행) x 월~금(열)
    for (int i = 0; i < 9; i++) {
        for (int j = 0; j < 5; j++) {
            timetable[i][j] = "";
        }
    }

    // 시간표에 교수가 담당하는 강의 정보 입력
    for (CDto cdto : Clist) {
        // 요일과 교시 정보 추출
        String when = cdto.getWhen();
        String[] whenParts = when.split(" ");
        String dayOfWeek = whenParts[0];
        int timeSlot = Integer.parseInt(whenParts[1].replace("시", "")); // "10시"에서 "시" 제거 후 정수로 변환
        
        // 강의명, 학점, 강의실 입력
        int dayIndex = dao.getDayOfWeekIndex(dayOfWeek); // ProfessorDao 클래스의 메서드 사용
        if (dayIndex != -1 && timeSlot >= 9 && timeSlot <= 17) { // 시간표 범위 내에 있는 경우에만 입력
            timetable[timeSlot - 9][dayIndex] = cdto.getC_name() + " (" + cdto.getGrade() + "학점, " + cdto.getWhere() + ")";
        }
    }
%>
<section>
    <!-- listbox -->
    <div class="listbox">
        <div class="tabsbox">
            <div class="tabbox">
                <div class="tab" id="open"></div>
                <div class="tab active" id="wish">
                    <div class="list-inbox">
                        <div class="d-flex justify-content-center py-4">
                            <h3>교수 정보</h3>
                        </div>
                        <table class="table table-hover mx-auto">
                            <colgroup>
                                <col width="10%">
                                <col width="30%">
                                <col width="30%">
                                <col width="30%">
                            </colgroup>
                            <thead>
                                <tr>
                                    <th>교수번호</th>
                                    <th>이름</th>
                                    <th>이메일</th>
                                    <th>전화번호</th>
                                </tr>  
                            </thead>
                            <tbody>
                                <!-- loop -->
                                <% 
                                for(int i=0; i<Plist.size(); i++){
                                    PDto pdto = Plist.get(i);
                                    int p_id = pdto.getP_id();
                                    String p_name = pdto.getP_name();
                                    String p_email = pdto.getP_email();
                                    String p_tel = pdto.getP_tel();
                                %>    
                                    <tr>
                                        <td><%=p_id %></td>
                                        <td><%=p_name %></td>
                                        <td><%=p_email %></td>
                                        <td><%=p_tel %></td>
                                    </tr> 
                                <% 
                                } 
                                %>     		
                                <!-- /loop -->
                            </tbody>
                        </table>
                        <div class="d-flex justify-content-center py-4">
                            <div></div>
                            <div>
                                <div></div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col text-center">
                                <div class="d-flex justify-content-center py-4">
                            	<h3>교수 시간표</h3>
                        		</div>
                                <table class="timetable mx-auto" cellspacing="5" border="1" bordercolor="#5CD1E5" width="500" height="500">
                                    <tr align="center">
                                        <td width="50"></td>
                                        <td width="50" bgcolor="#5CD1E5">월</td>
                                        <td width="50" bgcolor="#5CD1E5">화</td>
                                        <td width="50" bgcolor="#5CD1E5">수</td>
                                        <td width="50" bgcolor="#5CD1E5">목</td>
                                        <td width="50" bgcolor="#5CD1E5">금</td>
                                    </tr>
                                    <% for(int i = 1; i <= 9; i++) { %>
                                        <tr align="center">
                                            <td><%= i %>교시<p>(<%= (i + 8) %>-<%= (i + 9) %>시)</p></td>
                                            <% for(int j = 0; j < 5; j++) { %>
                                                <td><%= timetable[i - 1][j] %></td>
                                            <% } %>
                                        </tr>
                                    <% } %>
                                </table>
                            </div>
                        </div>
                    </div> <!-- /.list-inbox -->
                </div> <!-- /#wish -->
            </div>
        </div> <!-- /.tabbox -->   
    </div><!-- /.tabsbox -->
</div><!-- /.listbox-->
</section>
<%@ include file="inc/footer.jsp" %>
