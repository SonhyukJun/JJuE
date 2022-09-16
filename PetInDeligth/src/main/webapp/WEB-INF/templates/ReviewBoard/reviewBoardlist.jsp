<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<link href="resource/static/css/bootstrap.min.css" rel="stylesheet">
<link href="resource/static/css/font-awesome.min.css" rel="stylesheet">
<link href="resource/static/css/common.css" rel="stylesheet">
<link href="resource/static/css/custom-theme.min.css" rel="stylesheet">
<link href="resource/static/css/star.css" rel="stylesheet"/>
<link rel="stylesheet"	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<head>
<meta charset="UTF-8">
<style>
.btn{
	background-color: #FFA500;
}
.btn:hover{
	background-color: #FFA500;
}
html {
height: 100%;
}
body {
margin: 0;
height: 100%;
}
.a {
min-height: 100%;
}
.stars {
color: #FFD200;
}
</style>
<title>후기 게시판</title>
</head>
<body>
<jsp:include page="../header.jsp"></jsp:include>
<br><br><br><br><br>
<div class="a">
<div class="container">
		<div class="page-header">
			<h1>후기 게시판</h1>
			        		<!-- 로그인했으면 글쓰기버튼 보이게 설정.
			<c:if test="${memberId!=null}">
				<div class="pull-right" style="width: 100px; margin: 10px 0;">					
					<input type="button" onclick="location.href='write.do'" class="btn btn-orange btn-block" value="등록"/>
				</div>
			</c:if>
			 -->
		</div>
        <br/> 
         <!-- 검색 -->
		<form action="reviewBoardlist.do">
			<table class="table">
				<tr>
					<td align="right">
						<select name="searchCondition" >
							<c:forEach items="${conditionMap}" var="option">
								<option value="${option.value}">${option.key }
							</c:forEach>
						</select>
						<input name="searchKeyword" type="text"/>
						<input type="submit" class="btn" value="검색"/>
				</td>
			</tr>
		</table>
		</form>
        
        <div id="mainHide">
        	<!-- 테이블에 마우스를 올렸을 때 마우스 커서가 있는 행이 다른 색으로 변한다 -->
        	<table class="table table-hover">
        		<thead>
        			<tr>
        			<!-- scope="col" 해당 th가 열(column)을 위한 헤더 셀이다. -->
        				<th scope="col" width="50">글번호</th>
        				<th scope="col" width="100">게시글타입</th>
        				<th scope="col" width="100">제목</th>
        				<th scope="col" width="100">작성자</th>
        				<th scope="col" width="100">작성일</th>
        				<th scope="col" width="100">별점</th>
        			</tr>
        		</thead>
        		<tbody>
        		<!-- http://localhost:9090/board?id=2 -->
        			<c:forEach var="reviewBoard" items="${reviewBoardList}">
        			<tr>
        				<td align="center"><a href="reviewBoard.do?boardNo=${reviewBoard.boardNo}">${reviewBoard.boardNo}</a></td>
        				<td>${reviewBoard.boardType}</td>
        				<td><a href="reviewBoard.do?boardNo=${reviewBoard.boardNo}">${reviewBoard.title}</a></td>
        				<td>${reviewBoard.memberNickname}</td>
        				<td><fmt:formatDate value="${reviewBoard.wdate}" pattern="yyyy-MM-dd HH:mm"/></td>
        				<td>
        				<c:set var="star" value="${reviewBoard.countingStars}"/>
        				<c:forEach var="a" begin="1" end="${star}">
        					<label class="stars">★</label>
        				</c:forEach>        				
        				</td>
        			</tr>
        				</c:forEach>
        			</tbody>
        		</table>

	</div>

    <div>       
      <nav aria-label="Page navigation" style="text-align: center;">	
			<div class="pagination" style="text-align: center">
				<c:if test="${firstPage > pageList }">
					<a class="changePage" href="reviewBoardlist.do?viewPage=${firstPage - pageList}">[이전]</a>
				</c:if>	
				<c:forEach var="i" begin="${firstPage}" end="${lastPage}">																
					<a class="changePage" href="reviewBoardlist.do?viewPage=${i}">[ ${i} ]</a>						 						
				</c:forEach>
				<c:if test="${lastPage < totalPage}">
					<a class="changePage" href="reviewBoardlist.do?viewPage=${firstPage + pageList}">[다음]</a>
				</c:if>
			</div>
			</nav>	
		</div>
		<div class="pull-left">
			<input type="button" class="btn" onclick="location='main.do'" value="메인으로"/>
		</div>
	</div>
	</div>
<div id="footer" align="center">
<jsp:include page="../footer.jsp"></jsp:include>
</div>
</body>
</html>