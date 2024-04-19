<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page errorPage="error.jsp" %>
<%@ page import="java.sql.*, ubmProgram.dao.AttendanceDao" %> 
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="db" class="ubmProgram.dao.DBConnect" scope="page"/>
<jsp:useBean id="WDto" class="ubmProgram.dto.WDto" scope="page" />
<jsp:setProperty name="WDto" property="*" />

<%
	Connection conn = db.conn;
	AttendanceDao dao = new AttendanceDao(conn);
	int rs = dao.insert(WDto);
%>
  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Attendance</title>

<script>
  alert("출석부를 저장했습니다.");
  location.href="./Attendance.jsp";
</script>

</head>
<body>
<h1>데이터가 성공적으로 등록 되었습니다.</h1>
</body>
</html>