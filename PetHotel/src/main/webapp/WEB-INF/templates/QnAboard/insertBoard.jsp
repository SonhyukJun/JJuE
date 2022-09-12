<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script type="text/javascript">
	function insert() {
		var title = $('#board_title').val();
		var content = $('#board_content').val();
		alert("qweqwe");
		$.ajax({
			url: 'ins.do',
			type: 'POST',
			data: {title:title,
				   content:content
				   },
					datatype: 'JSON',
			success: function (data){
				alert("게시글을 등록 하였습니다.")
			},
			error: function (data){
				alert("게시글 등록에 실패하였습니다.")
			}
		});
		
		
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
        <div>
            <h1>QnA</h1>
        </div>
        <br/>
        <table>
            <tr>
                <th>제목</th>
                <td><input id="board_title" type="text"/></td>
            </tr>
            <tr>
                <th style="padding:13px 0 0 15px;">내용</th>
                <td><textarea id="board_content" maxlength="140" rows="7" style="height: 200px;"></textarea><span></span>
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
    <input type="button" onclick="insert()" value="저장"/>
   </div>
   
   

</body>
</html>