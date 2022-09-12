 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% 
	String memberId = (String) session.getAttribute("SessionMemberId");
	System.out.print(memberId);	
%>

<div>
		<div>
			<h1>QnA</h1>
			<h2>${board.boardNo}</h2>
		</div>
		<br/>
		<table>
			<tr>
				<th>생성날짜</th>
				<td><span>${board.wdate}</span></td>
			</tr>
			<tr>
				<th>제목</th>
				<td><span>${board.title}</span></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><span>${board.content}</span></td>
			</tr>
			

			<tr>
				<td></td>
				<td></td>
			</tr>
		</table>
		 <div >
			<a href="freeboard.do">목록으로</a>
		</div>
		
		<div>
			<input type="button" value="수정 및 삭제" onclick="location.href='updateQnABoard.do?boardNo=${board.boardNo}'"/>
		</div>
		
		<div>
			<c:if test="${board.boardNo ne min}">
			<a href="backPage.do?boardNo=${board.boardNo}">이전 페이지</a>
			</c:if>
		</div>
		
		<div >
			<c:if test="${board.boardNo ne max}">
			<a href="nextPage.do?boardNo=${board.boardNo}">다음 페이지</a>
			</c:if>
		</div>
		
		
		
		<div >
			<a href="replyQnABoard.do=boardNo=${board.boardNo}">답글 하기</a>
		</div>
		
	</div>
</body>
</html>