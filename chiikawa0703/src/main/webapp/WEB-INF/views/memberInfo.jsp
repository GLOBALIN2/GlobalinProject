<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원정보변경</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>

<body> <!--북마켓 챕터 17 updateMember 참고-->

    <div class="container py-4">
        <div class="p-5 mb-4 bg-body-tertiary rounded-3">
            <div class="container-fluid py-1">
                <h1 class="display-5 fw-bold">회원 정보 수정</h1>
                <p class="col-md-8 fs-4">Membership Updating</p>
            </div>
        </div>
        <!--회원수정 박스-->
        <div class="container">
            <form name="mem_Update" action= "/user/updateUser" method="post">
                <div class="mb-3 row">
                    <label class="col-sm-2">이름</label>
                    <div class="col-sm-3">
                        <input name="mem_name" type="text" class="form-control" value="${user.mem_name }">
                    </div>
                </div>
                <!--이름-->
                <div class="mb-3 row">
                    <label class="col-sm-2">first name</label>
                    <div class="col-sm-3">
                        <input name="mem_enfirst" type="text" class="form-control" value="${user.mem_enfirst }">
                    </div>
                </div>
                <!--영문 성-->
                <div class="mb-3 row">
                    <label class="col-sm-2">last name</label>
                    <div class="col-sm-3">
                        <input name="mem_enlast" type="text" class="form-control" value="${user.mem_enlast }">
                    </div>
                </div>
                <!--영문 이름-->
                <div class="mb-3 row">
                    <label class="col-sm-2">비밀번호</label>
                    <div class="col-sm-3">
                        <input name="mem_pwd" type="password" class="form-control" value="${user.mem_pwd }">
                    </div>
                </div>
                <!--비밀번호-->              
                <div class="mb-3 row">
                    <label class="col-sm-2">이메일</label>
                    <div class="col-sm-3">
                        <input name="mem_email" type="email" class="form-control" value="${user.mem_email }">
                    </div>
                </div>
                <!--이메일-->
                <div class="mb-3 row">
                    <label class="col-sm-2">전화번호</label>
                    <div class="col-sm-3">
                        <input name="mem_phone" type="text" class="form-control" value="${user.mem_phone }">
                    </div>
                </div>
                <!--전화번호-->
                <div class="mb-3 row">
                    <label class="col-sm-2 ">주소</label>
                    <div class="col-sm-3">
                        <input name="mem_post" type="text" class="form-control" value="${user.mem_post }">
                    </div>
                    <div class="col-sm-3">
                        <input name="mem_addr" type="text" class="form-control" value="${user.mem_addr }">
                    </div>
                    <div class="col-sm-3">
                        <input name="mem_detail_addr" type="text" class="form-control" value="${user.mem_detail_addr }">
                    </div>
                </div>
                <!--주소-->
            <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                <div class="mb-3 row  me-md-2">
                    <div class="col-sm-offset-2 col-6">
                        <input type="submit" class="btn btn-primary" value="회원정보 저장하기 ">
                    </div>
                </div>
                <!--회원 수정 버튼-->
                <div class="mb-3 row  me-md-2">
                    <div class="col-sm-offset-2 col-sm-10">
                   			<input type="button" class="btn btn-outline-dark" onclick="mem_out()" value="탈퇴하기">
                    </div>
                </div>
            </div>   
            </form>
        </div>
    </div>
    
    <script>
    	function mem_out() {
    		 document.location.href = "/user/mem_out";
    	}
    </script>
</body>

</html>