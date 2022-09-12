<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String userId = (String) session.getAttribute("SessionMemberId");
	String userRole = (String) session.getAttribute("SessionRole");
	String memberNickname = (String) session.getAttribute("SessionMemberNickname");
	if(userRole == null) {
		userRole = "Visitor";
	}
	System.out.println(userRole);
%>

	<!-- 로그인하면, id보이게 노출. -->
	<c:if test="${memberId!=null}">
		<p>${memberId}님 안녕하세요</p>
	</c:if>




  <div>
        <div >
            <h2>후기 게시글 목록</h2>
        </div>
        <br/>
        <br/>
        <br/>

        
        <div >
        
         <!-- 검색 -->
		<form action="reviewBoardlist.do">
		<table border="1" cellpadding="0" cellspacing="0" width="800">
		<tr>
			<td align="right">
				<select name="searchCondition">
					<c:forEach items="${conditionMap}" var="option">
						<option value="${option.value}">${option.key }
					</c:forEach>
				</select>
				<input name="searchKeyword" type="text"/>
				<input type="submit" value="검색"/>
			</td>
		</tr>
		</table>
		</form>
        
        		<!-- 테이블에 마우스를 올렸을 때 마우스 커서가 있는 행이 다른 색으로 변한다 -->
        		<table border="1" cellpadding="0" cellspacing="0" width="800">
        			<thead>
        				<tr>
        				<!-- scope="col" 해당 th가 열(column)을 위한 헤더 셀이다. -->
        					<th scope="col">글번호</th>
        					<th scope="col">게시글타입</th>
        					<th scope="col">제목</th>
        					<th scope="col">아이디</th>
        					<th scope="col">닉네임</th>
        					<th scope="col">작성일</th>
        				</tr>
        			</thead>
        			<tbody>
        			<!-- http://localhost:9090/board?id=2 -->
        				<c:forEach var="reviewBoard" items="${reviewBoardList}">
        				<tr>
        					<td align="center"><a href="reviewBoard.do?boardNo=${reviewBoard.boardNo}">${reviewBoard.boardNo}</td>
        					<td align="center">${reviewBoard.boardType}</td>
        					<td align="center"><a href="reviewBoard.do?boardNo=${reviewBoard.boardNo}">${reviewBoard.title}</td>
        					<td align="center">${reviewBoard.memberId}</td>
        					<td align="center">${reviewBoard.memberNickname}</td>
        					<td align="center">${reviewBoard.wdate}</td>
        				</tr>
        				</c:forEach>
        			</tbody>
        		</table>
        </div>
        
        <!-- 로그인 하면 : 로그아웃페이지, 로그인 안하면 로그인페이지 노출 -->
        <c:if test="${memberId!=null}">
        	<div align="right"><a href="logout.do">LOGOUT</a></div>
        </c:if>
        <c:if test="${memberId==null}">
        	<div align="right"><a href="login.do">LOGIN</a></div>
        </c:if>
        
        
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
		
		<!-- 로그인했으면 글쓰기버튼 보이게 설정. -->
		<c:if test="${memberId!=null}">
			<input type="button" onclick="location.href='/PetInDeligth/write.do'" value="글쓰기">
		</c:if>
		
		
		<div><a href="main.do" >첫화면</a></div>
</div>
</body>
</html>