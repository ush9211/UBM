<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="ubmProgram.dto.PDto, ubmProgram.dao.*, java.sql.Connection "  %>
<jsp:useBean id="db" class="ubmProgram.dao.DBConnect" scope="page" />
<jsp:include page="inc/header.jsp" flush="true" />


        <!-- 로그인 양식 -->
        <form name="loginForm" action="login" class="login-form" id="loginform" method="post">
            <div class="form-group">
                <input type="text" class="form-control mb-4" id="uid" placeholder="아이디" name="uid">
            </div>
            <div class="form-group">
                <input type="password" class="form-control mb-3" id="upass" placeholder="비밀번호" name="upass">
            </div>
            <div class="form-group form-check text-right mb-3">
                <input type="checkbox" class="form-check-input" id="rid" name="rid" value="rid">
                <label class="form-check-label" for="rid">아이디 기억</label>
            </div>
            <button type="submit" class="btn btn-primary btn-block">로그인</button>  
            <a href="join.jsp" class="btn btn-link btn-block">회원가입</a>
        </form>
        <!-- /로그인 양식 -->




<jsp:include page="inc/footer.jsp" flush="true" />