<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script type="text/javascript">
	function updateReview(){
		alert("수정시작")
		var boardNo = $('#boardNo').val()
		location.href='reviewUp.do?boardNo='+boardNo
			/*  $.ajax({
				url: 'reviewUp.do',
				type: 'GET',
				data: {
					boardNo:boardNoB,
					},
				datatype: 'JSON',
				success: function (data){
					alert("이동이동")
				}
			})*/
	}


	function deleteReview(){
		alert("삭제시작")
		var boardNoB = $('#boardNo').val()
		alert(boardNoB)
			$.ajax({
				url: 'deleteReview.do',
				type: 'GET',
				data: {
					boardNo:boardNoB,
					},
				datatype: 'JSON',
				success: function (data) {
					/*  if(data == "no") {
						alert("삭제 실패.")
						location.href='login.do'
					} else { */
						alert("삭제성공")
						location.href='reviewBoardlist.do'
				}
			})	

	}

	function beforeReview(){
		var boardNo = $('#boardNo').val()
		location.href='beforeReview.do?boardNo='+boardNo
		
	}
	
	function afterReview(){
		var boardNo = $('#boardNo').val()
		location.href='afterReview.do?boardNo='+boardNo
	}
			
			
</script>
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

글쓴사람 ${reviewBoard.memberId} <br>

로그인한사람 ${memberId} <br>

글번호 ${reviewBoard.boardNo}

            <h2>후기게시판</h2>
        </div>
        <br/>
        <input id="boardNo" name="boardNo" value="${reviewBoard.boardNo}" type="hidden" />
        <input id="wdate" name="wdate" type="hidden" />
        <table border="1" cellpadding="0" cellspacing="0" width="800">
            <tr>
                <th style="width: 300px">게시글 타입</th>
                 <td style="padding:13px 0 0 15px;"> ${reviewBoard.boardType}</td>
            </tr>
            <tr>
                <th style="width: 300px">작성날짜</th>
                <td style="padding:13px 0 0 15px;"> ${reviewBoard.wdate}</td>
            </tr>
            <tr>
                <th style="width: 300px">아이디</th>
                <td style="padding:13px 0 0 15px;"> ${reviewBoard.memberId}<br/></td>
            </tr>
            <tr>
                <th style="width: 300px">닉네임</th>
                <td style="padding:13px 0 0 15px;">${reviewBoard.memberNickname}<br/></td>
            </tr>
            <tr>
                <th style="width: 300px">제목</th>
                <td style="padding:13px 0 0 15px;">${reviewBoard.title}<br/></td>
            </tr>
            <tr>
                <th style="width: 300px">내용</th>
                <td style="padding:13px 0 0 15px;">${reviewBoard.content}</td>

            </tr>
        </table>
        
        <div><a href="reviewBoardlist.do" >목록으로</a></div>
        <div><a href="main.do" >첫화면</a></div>
        
        <c:if test="${reviewBoard.boardNo!=minReview}">
        	<input type="button" onclick="beforeReview()" value="이전글"/>
        </c:if>
        <c:if test="${reviewBoard.boardNo!=maxReview}">	
        	<input type="button" onclick="afterReview()" value="다음글"/>
        </c:if>
        
		<c:if test="${reviewBoard.memberId==memberId}">
		<div>
            <input type="button" onclick="updateReview()" value="수정"/>
            <input type="button" onclick="deleteReview()" value="삭제"/>
            
        </div>
		</c:if>

        

</body>
</html>