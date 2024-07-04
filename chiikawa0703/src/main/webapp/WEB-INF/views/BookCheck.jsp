<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원예약확인</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<style>
#box {
	text-align: center;
}

/*table,*/ tr, td {
	border: 1px solid black;
	border-collapse: collapse;
	border-color: rgb(176, 179, 180);
	width: 300px; /*테이블 넓이 table에는 적용 안됨*/
}

td:nth-child(odd) {
	background-color: rgb(235, 231, 231);
}

td:nth-child(even) {
	background-color: white;
}

table, #btn {
	display: inline-block;
}

</style>
</head>

<body>

	<div class="container py-4">
		<div class="p-5 mb-4 bg-body-tertiary rounded-3">
			<div class="container-fluid py-1">
				<h1 class="display-5 fw-bold">회원 예약 확인</h1>
				<p class="col-md-8 fs-4">Membership Booking Check</p>
			</div>
		</div>
		<!--회원 예약 확인 박스-->
<!-- 		<c:choose>
			<c:when test="${empty book }">
  				예약 정보가 없습니다.
  			</c:when>
			<c:otherwise>
				<div id="box">
					<table>
						<tr>
							<td>예약번호</td>
							<td>${book.book_no }</td>
						</tr>
						<tr>
							<td>회원ID</td>
							<td>${mem_id }</td>
						</tr>
						<tr>
							<td>회원명</td>
							<td>${user.mem_name } <br> 
							${user.mem_enfirst } ${user.mem_enlast }</td>
						</tr>
						<tr>
							<td>회원연락처</td>
							<td>${user.mem_phone }</td>
						</tr>
						<tr>
							<td>회원이메일</td>
							<td>${user.mem_email }</td>
						</tr>
						<tr>
							<td>예약지점</td>
							<td>${book.branch }</td>
						</tr>
						<tr>
							<td>객실타입</td>
							<td>${book.roomtype }</td>
						</tr>
						<tr>
							<td>숙박기간</td>
							<td>체크인 : ${book.checkin } <br> 
							체크아웃 : ${book.checkout }
							</td>
						</tr>
						<tr>
							<td>숙박인원</td>
							<td>${book.person }</td>
						</tr>
						<tr>
							<td>조식여부</td>
							<td>${book.breakfast }</td>
						</tr>
						<tr>
							<td>결제방법</td>
							<td>${book.payment_op }</td>
						</tr>
						<tr>
							<td>결제여부</td>
							<td>${book.payment }</td>
						</tr>
						<tr>
							<td>취소여부</td>
							<td>${book.book_cancel }</td>
						</tr>
						<tr>
							<td>총 결제금액</td>
							<td><fmt:formatNumber value="${book.charge }" type="currency" />원</td>
							
						</tr>
					</table>
			<div class="mb-3 row d-md-flex justify-content-md-end">
				<div class="col-sm-offset-2 col-sm-10">
					<form action="<c:url value = '/cancelBook'/>" method="post">  
						<input type="submit" class="btn btn-outline-dark"
							value="취소하기">
					</form>
				</div>
			</div>
			-->
			<!-- 예약 취소 버튼 -->
			
		<!-- 	
		</div>
	
    </c:otherwise>
 </c:choose>
		
		
	</div>
	
-->
	<section id="container">
				<form role="form" method="post" action="/board/write">
					<table>
						<tr><th>번호</th><th>이름</th></tr>
						
						<c:forEach items="${bookList}" var = "bookList">
							<tr>
								<td><c:out value="${bookList.book_no}" /></td>
								<td><c:out value="${bookList.book_date}" /></td>
							
							
							</tr>
						</c:forEach>
						
					</table>
				</form>
			</section>
	
</body>

</html>