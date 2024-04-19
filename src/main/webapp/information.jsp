<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="inc/header.jsp" flush="true" />

    <div class="container">
    
        <!-- HEADER -->
        <header class="mb-4">
            <h1 class="text-center mb-5">회원정보 수정</h1>
            <p class="text-danger">* 표시가 되어 있는 부분은 필수 항목입니다.</p>
        </header>
        <!-- /HEADER -->

        <!-- 회원정보 수정 폼 -->
        <form name="updateForm" action="update" id="updateform" class="needs-validation" method="post" novalidate>
            <div class="row">
                <div class="col-md-6 mb-4">
                    <label for="username">이름<span class="text-danger">*</span></label>
                    <input type="text" name="username" id="username" class="form-control" placeholder="이름" required>
                    <div class="invalid-feedback">이름을 입력하세요.</div>
                </div>
                <div class="col-md-6 mb-4">
                    <label for="userpass">비밀번호<span class="text-danger">*</span></label>
                    <input type="password" name="userpass" id="userpass" class="form-control" placeholder="비밀번호" required>
                    <div class="invalid-feedback">비밀번호를 입력하세요.</div>
                </div>
                <div class="col-md-6 mb-4">
                    <label for="reuserpass">새로운 비밀번호 확인</label>
                    <input type="password" name="reuserpass" id="reuserpass" class="form-control" placeholder="새로운 비밀번호 확인">
                </div>
                <div class="col-md-6 mb-4">
                    <label for="useremail">이메일<span class="text-danger">*</span></label>
                    <input type="email" name="useremail" id="useremail" class="form-control" placeholder="이메일" required>
                    <div class="invalid-feedback">올바른 이메일 주소를 입력하세요.</div>
                </div>
                <div class="col-md-6 mb-4">
                    <label for="usertel">전화번호<span class="text-danger">*</span></label>
                    <input type="tel" name="usertel" id="usertel" class="form-control" placeholder="전화번호" required>
                    <div class="invalid-feedback">전화번호를 입력하세요.</div>
                </div>
                <div class="col-12 mb-4 text-center">
                    <button class="btn btn-danger px-5 mx-2" type="reset">취소</button>
                    <button class="btn btn-primary px-5 mx-2" type="submit">저장</button>
                </div>
            </div>
            <input type="hidden" name="mode" value="update" />
        </form>
        <!-- /회원정보 수정 폼 -->

    </div>

    <script>
        // 폼 유효성 검사 비활성화
        (function() {
            'use strict';
            window.addEventListener('load', function() {
                var forms = document.getElementsByClassName('needs-validation');
                var validation = Array.prototype.filter.call(forms, function(form) {
                    form.addEventListener('submit', function(event) {
                        if (form.checkValidity() === false) {
                            event.preventDefault();
                            event.stopPropagation();
                        }
                        form.classList.add('was-validated');
                    }, false);
                });
            }, false);
        })();
    </script>




<jsp:include page="inc/footer.jsp" flush="true" />