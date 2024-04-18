<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page errorPage="error.jsp" %>
<%@ page import="java.sql.*, ubmProgram.dao.UBMDao" %> 
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="db" class="ubmProgram.dao.DBConnect" scope="page"/>
<jsp:useBean id="pDto" class="ubmProgram.dto.PDto" scope="page" />
<jsp:useBean id="sDto" class="ubmProgram.dto.SDto" scope="page" />
<jsp:setProperty name="pDto" property="*" /> 
<jsp:setProperty name="sDto" property="*" /> 

<%
   Connection conn = db.conn; 
   UBMDao dao = new UBMDao(conn);
   int rs = dao.insertDB(pDto);



   //response.sendRedirect("index.jsp");
%>
  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script>
  alert("회원가입이 완료되었습니다.");
  location.href="./index.jsp";
</script>

</head>
<body>
<h1>데이터가 성공적으로 등록 되었습니다.</h1>
</body>
</html>