<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script type="text/javascript">
	function updateQnA() {
		var title = $('#board_title').val();
		var content = $('#board_content').val();
		$.ajax({
			url: 'up.do?boardNo=${board.boardNo}',
			type: 'POST',
			data: {title:title,
				   content:content
				   },
			datatype: 'JSON',
			success: function (data){
				alert('게시글을 수정 하였습니다.')
				location='freeboard.do'
			},
			error: function (data){
				alert('updateQnABoard.jsp updateQnA 함수 오류!')
			}
		});
	}
	
	function deleteQnA() {
		var boardNo = $('#board_No').val();
		$.ajax({
			url: 'del.do?boardNo=${board.boardNo}',
			type: 'POST',
			data: {boardNo:boardNo},
			datatype: 'JSON',
			success: function (data){
				location="success.do"
			}, 
			error: function (data){
			}
		})
	}

</script>
<title>Insert title here</title>
</head>
<body>
<% 
	String memberId = (String) session.getAttribute("SessionMemberId");
	System.out.print(memberId);	
%>
    <div>
    <input id="board_No" type="hidden" value="${board.boardNo}"/>
        <div>
            <h1>QnA</h1>
        </div>
        <br/>
        <table>
            <tr>
                <th>제목</th>
                <td><input id="board_title" type="text" value="${board.title}"/></td>
            </tr>
            <tr>
                <th>내용</th>
                <td><textarea id="board_content" maxlength="140" rows="7" style="height: 200px;">
                ${board.content}
                </textarea><span></span>
                </td>
            </tr>
            <tr>
                <td></td>
                <td></td>
            </tr>
            
        </table>
        
        <div>
            <a href="freeboard.do">목록으로</a>
        </div>
        <div>
            
    </div>
    <input type="button" onclick="updateQnA()" value="수정"/>
    <input type="button" onclick="deleteQnA()" value="삭제"/>
   </div>
</body>
</html>