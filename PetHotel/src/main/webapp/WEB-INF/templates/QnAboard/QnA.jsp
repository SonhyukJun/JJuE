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
   </div>
   <br/>
   <div style="width: 100px; margin: 10px 0;">
      <a href="insert.do">등록</a>
   </div>
   <br/>
   <br/>
   <br/>
   <div id="mainHide">
      <table>
         <thead>
            <tr>
               <th scope="col">글번호</th>
               <th scope="col">제목</th>
               <th scope="col">작성자</th>
               <th scope="col">작성일</th>
            </tr>
         </thead>
         <tbody>
         <c:forEach var="board" items="${boardList}">
         	<tr> 
               <td>${board.boardNo}</td>
               <td><a href="QnAView.do?boardNo=${board.boardNo}">${board.title}</a></td>
               <td>${board.memberId}</td>
               <td>${board.wdate}</td>
            </tr>
            <c:forEach var="replyQnABoard" items="${replyQnABoardList}">
            	<c:if test="${replyQnABoard.boardNo eq board.boardNo}">
            		<tr>
            			<td>답글</td>
            			<td><a href="replyQnABoard.do?replyQnABoardNo=${replyQnABoard.replyQnABoardNo}&boardNo=${board.boardNo}">RE: ${board.title}</a></td>
            			<td>${replyQnABoard.employeeNickname}</td>
            			<td>${replyQnABoard.wdate}</td>
            		</tr>
            	</c:if>
            </c:forEach>
            </c:forEach>
            
         </tbody>
      </table>
   </div>
  </div>
</body>
</html>