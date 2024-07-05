<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<meta charset="UTF-8">
<!-- css -->
<link rel="stylesheet" href="/resources/assets/css/board.css" />

 <%--
   <%@include file="../includes/header.jsp"%> 
--%>

	<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
	 	<!--  <title>게시판</title>  -->
	 	<style type="text/css">
			li {list-style: none; float: left; padding: 6px;}
		</style>
		<!-- jquery를 불러옵니다. jquery.com download 페이지를 참조해주세요 -->
		<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
		<script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
		<script>
			window.onload = function(){
			//전체주소
			console.log("url : "+$(location).attr('href'));

			//http:, localhost:port번호, index.html ?test=tttt 순으로 나누어져 있습니다.
			console.log("url : "+$(location).attr('protocol')+"//"+$(location).attr('host')+""+$(location).attr('pathname')+""+$(location).attr('search'));
			}
		</script>
	</head>
	<body>
	<div id="wrapper">
		<div id="root">
			
				<h2> 게시판</h2>
			
	<!--  		<hr />  -->
	 
		<!-- 	<div>  -->
	 			<%@include file="nav.jsp" %>  
		<!--  	</div> -->
	
			<br><br><br><br>
			<hr />
			
			<section id="container">
				<form role="form" method="get" >
				<!-- action="/board/write" -->
				<div id="tablesize">
				
					<table id = "boardlist" >
						<tr><th>번호</th><th>제목</th><th>작성자</th><th>등록일</th></tr>
						
						<c:forEach items="${list}" var = "list">
							<tr>
								<td><c:out value="${list.bno}" /></td>
								<td>
									<a href="/board/readView?bno=${list.bno}&
															page=${scri.page}&
															perPageNum=${scri.perPageNum}&
															searchType=${scri.searchType}&
															keyword=${scri.keyword}"><c:out value="${list.title}" /></a>
								</td>
								<td><c:out value="${list.writer}" /></td>
								<td><fmt:formatDate value="${list.regdate}" pattern="yyyy-MM-dd"/></td>
							</tr>
						</c:forEach>
						
					</table>
					
					<div class="search">
   						<select name="searchType">
      					<option value="n"<c:out value="${scri.searchType == null ? 'selected' : ''}"/>>-----</option>
      					<option value="t"<c:out value="${scri.searchType eq 't' ? 'selected' : ''}"/>>제목</option>
      					<option value="c"<c:out value="${scri.searchType eq 'c' ? 'selected' : ''}"/>>내용</option>
      					<option value="w"<c:out value="${scri.searchType eq 'w' ? 'selected' : ''}"/>>작성자</option>
      					<option value="tc"<c:out value="${scri.searchType eq 'tc' ? 'selected' : ''}"/>>제목+내용</option>
    					</select>

    					<input type="text" name="keyword" id="keywordInput" value="${scri.keyword}"/>

    					<button id="searchBtn" style="background-color: #B2AADA;" class="btn btn-outline-light btn-sm" type="button">검색</button>
					</div>	
    					<script>
      						$(function(){
        						$('#searchBtn').click(function() {
          						self.location = "list" + '${pageMaker.makeQuery(1)}' + "&searchType=" + $("select option:selected").val() + "&keyword=" + encodeURIComponent($('#keywordInput').val());
        						});
      						});   
    					</script>
  					</div>
					
					<div>
  						<ul class="pagination justify-content-center">
    						<c:if test="${pageMaker.prev}">
    							<li class="page-item"><a class="page-link" href="list${pageMaker.makeSearch(pageMaker.startPage - 1)}">이전</a></li>
    						</c:if> 

    						<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
    							<li class="page-item"><a class="page-link" href="list${pageMaker.makeSearch(idx)}">${idx}</a></li>
    						</c:forEach>

    						<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
    							<li class="page-item"><a class="page-link" href="list${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a></li>
    						</c:if> 
  						</ul>
					</div>
					
				</form>
			</section>
			<hr />
		</div>
		</div>
<%@include file="../includes/footer.jsp"%>		
	</body>
</html>