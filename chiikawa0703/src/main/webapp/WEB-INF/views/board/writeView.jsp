<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<meta charset="UTF-8">
<!-- css -->
<link rel="stylesheet" href="/resources/assets/css/board.css" />

	<head>
	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous"> 	
	 	<title>게시판</title>
	 	<script type="text/javascript">
		$(document).ready(function(){
			var formObj = $("form[name='writeForm']");
			$(".write_btn").on("click", function(){
				if(fn_valiChk()){
					return false;
				}
				formObj.attr("action", "/board/write");
				formObj.attr("method", "post");
				formObj.submit();
			});
		})
		function fn_valiChk(){
			var regForm = $("form[name='writeForm'] .chk").length;
			for(var i = 0; i<regForm; i++){
				if($(".chk").eq(i).val() == "" || $(".chk").eq(i).val() == null){
					alert($(".chk").eq(i).attr("title"));
					return true;
				}
			}
		}
	</script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
	</head>
	<body>
	<div id="wrapper">
		<div id="root">
			<header>
				<h1> 게시판</h1>
			</header>
			<hr />
			 
			<div>
				<%@include file="nav.jsp" %>
			</div>
			<hr />
			
			<div><br><br>
			<h1 class="display-5 fw-bold">게시글 작성</h1>
			</div><br><br>
			
			<section id="container">
					<form role="writeform" method="post" action="/board/write">
					<table id="readview">
						<tbody>
							<tr>
								<td>
									<label for="title">제목</label><input class="form-control" type="text" id="title" name="title" class="chk" placeholder="제목을 입력하세요." />
								</td>
							</tr>	
							<tr>
								<td>
									<label for="content">내용</label><textarea class="form-control" id="content" name="content" class="chk" placeholder="내용을 입력하세요."></textarea>
								</td>
							</tr>
							<tr>
								<!-- 
								<td>
									<label for="writer">작성자</label><input type="text" id="writer" name="writer" class="chk" title="작성자를 입력하세요."/>
									 로그인 처리가 되면 작성자 부분은 필요 없어질 것인데, 아직 어떻게 하는 지 모르겠음 
									<label for="writer">작성자</label><div class="form-control" name="writer" value='<sec:authentication property="principal.username"/>' readonly="readonly"></div> 
								</td>
								-->
							<tr>
								<td>						
									<button class="btn btn-outline-success btn-sm" type="submit">작성</button>
								</td>
							</tr>			
						</tbody>			
					</table>
				</form>
			</section>
			<hr />
		</div>
		</div>
	<%@include file="../includes/footer.jsp"%>		
	</body>
</html>