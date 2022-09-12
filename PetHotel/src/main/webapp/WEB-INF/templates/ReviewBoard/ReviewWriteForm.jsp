<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script type="text/javascript">
	function update(){
		alert("수정")
		var boardNoB=$('#boardNo').val();
		var titleB = $('#title').val()
		var contentB = $('#content').val();
		alert(boardNoB)
		$.ajax({
			url: 'reviewUpdate.do',
			type: 'GET',
			data: {
				boardNo:boardNoB,
				title:titleB,
				content:contentB,
				},
			datatype: 'JSON',
			success: function (data) {
					alert("게시글 수정 성공")
					location.href='reviewBoardlist.do'
			}
		})
	}

	function insert() {
		alert("하이")
		var titleB = $('#title').val()
		var contentB = $('#content').val();
		var boardTypeB = $('#boardType').val();
		$.ajax({
			url: 'insertReviewboard.do',
			type: 'GET',
			data: {
				title:titleB,
				content:contentB,
				boardType:boardTypeB,
				},
			datatype: 'JSON',
			success: function (data) {
				if(data == "no") {
					alert("로그인이 필요합니다.")
					location.href='login.do'
				} else {
					alert("게시글 등록 성공")
					location.href='reviewBoardlist.do'
				}
			}
		})			
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


 <div >
        <div >
            <h1>게시글 등록</h1>
            로그인 한 사람 : ${memberId}
        </div>
        <br/>
        <input id="boardNo" value="${reviewBoard.boardNo}" type="hidden" />
        <input id="wdate" name="wdate" value="${reviewBoard.wdate}" type="hidden" />
        <table class="table">
            <tr>
                <th style="padding:13px 0 0 15px">게시판 선택</th>
                <td>
                    <div >
                        <select  id="boardType">
                            <option value="후기게시판">후기게시판</option>
                            <option value="자유게시판">자유게시판</option>
                        </select>
                    </div>
                </td>
            </tr>
            
            <tr>
                <th style="padding:13px 0 0 15px;">제목</th>
                <td><input id="title" type="text" value="${reviewBoard.title}"/></td>
            </tr>
            <tr>
                <th style="padding:13px 0 0 15px;">내용</th>
                <td><textarea id="content" maxlength="140" rows="7" style="height: 200px;"
                >${reviewBoard.content}</textarea>
                </td>
            </tr>
			
        </table>
        <div >
            <a href="reviewBoardlist.do" >목록으로</a>
        </div>
        
        <!-- 수정에서 넘어오면 저장버튼 안보이게. -->
        <c:if test="${reviewBoard.boardNo==null}">
        <div>
            <button type="button" onclick="insert()" id="insert">저장</button>
            <button type="button" onclick="javscript:history.back()">취소</button>
         </div>
         </c:if>
        
        <c:if test="${reviewBoard.memberId==memberId}">
	        <div>
	            <button  type="button" onclick="update()" id="update">수정</button>
	            <button type="button" onclick="javscript:history.back()">취소</button>
	        </div>
         </c:if>
      
   
    </div>
</body>
</html>