<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>로그인폼</title>
   
    <style>
      .findIdForm {
        display: inline-block;
        position: static;
        text-align: center;
        background-color: white;
        border: 1px solid rgba(223, 220, 220, 0.8);
        border-radius: 10px;
        height: 300px;
        width: 600px;
        padding: 30px;
        margin: 200px 200px 200px 200px;
      }
      .findIdTitle {
        margin: 40px;
        font-size: 30px;
        font-weight: 700;
        color: rgb(4, 160, 222);
      }
      #mem_id {
      	font-size:30px;
      }
     .pass-forgot {
  width: 100%;
  float: left;
  text-align: center;
  color: rgba(0, 0, 0, 0.4);
  font-size: 18px;
  cursor: pointer;
}

body {
    background-image: url(https://lh4.googleusercontent.com/-XplyTa1Za-I/VMSgIyAYkHI/AAAAAAAADxM/oL-rD6VP4ts/w1184-h666/Android-Lollipop-wallpapers-Google-Now-Wallpaper-2.png);
    background-position: center;
    background-size: cover;
    background-repeat: no-repeat;
    min-height: 100vh;
    font-family: 'Roboto', sans-serif;
    overflow: hidden;
}
    </style>
  </head>
  <body> 
    <section>
      <article style="text-align: center">
        <div class="findIdForm">
          <p class="findIdTitle">회원님의 아이디를 확인해 주세요</p>          
            <c:choose>
				<c:when test="${empty findId}">
					<p class="inquiry">조회결과가 없습니다.</p>
				</c:when>
        		<c:otherwise>
            		<p id="mem_id">${findId.mem_id}</p>
        		</c:otherwise>
			</c:choose>
            <br />           
          <p class="pass-forgot"><span id="findPwd">비밀번호 찾기</span> | <span id="login">로그인</span> </p>
        </div>
      </article>
    </section>
    <script>
	 // 로그인 폼으로 가기
		document.getElementById('login').addEventListener('click', function() {
		document.location.href = '<c:url value="/doLogin"/>';
	});
		// 비밀번호찾기 폼으로 가기
		document.getElementById('findPwd').addEventListener('click', function() {
		document.location.href = '<c:url value="/user/goFindPwd"/>';
	});
    </script>
  </body>
</html>
