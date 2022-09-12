<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
			<h1>QnA 답변</h1>
		</div>
		<br />
		<table>
			<tr>
				<th>생성날짜</th>
				<td><span>${selectReplyQnABoard.wdate}</span></td>
			</tr>
			<tr>
				<th>제목</th>
				<td><span>RE: ${board.title}</span></td>
			</tr>
			<tr>
				<th>질문하신 내용</th>
				<td><span>${board.content}</span></td>
			</tr>
			<tr>
				<th>답변</th>
				<td><span>${selectReplyQnABoard.content}</span></td>
			</tr>


			<tr>
				<td></td>
				<td></td>
			</tr>
		</table>
		<div>
			<a href="freeboard.do">목록으로</a>
		</div>

		<%-- <div>
			<input type="button" value="수정 및 삭제"
				onclick="location.href='updateQnABoard.do?boardNo=${board.boardNo}'" />
		</div> --%>
	</div>
</body>
</html>