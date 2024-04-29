<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="ubmProgram.dto.PDto, ubmProgram.dao.*, java.sql.Connection "  %>
<jsp:useBean id="db" class="ubmProgram.dao.DBConnect" scope="page" />
<jsp:include page="inc/header.jsp" flush="true" />


        <!-- 로그인 양식 -->

        <div class="login text-center">
                
           <form action="" method="get" class="login-f">      
           <h3 class="login-p mb-3 text-primary">로그인하세요.</h3>
           <input type="submit" value="학생" class="b-student px-4 btn btn-primary"/>
           <input type="submit" value="교수" class="b-professor px-4 btn btn-primary"/>
           </form>
           <p class="mt-4 text-black-50">본인 아이디 또는 비밀번호 찾기가 가능합니다.</p>
           <a href="#">아이디찾기</a> /
           <a href="#">비밀번호찾기</a>
           </div>
    



<jsp:include page="inc/footer.jsp" flush="true" />