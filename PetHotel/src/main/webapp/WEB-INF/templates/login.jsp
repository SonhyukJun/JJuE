<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script type="text/javascript">
	function loginMember() {
		var id = $('#memberId').val();
		var pw = $('#memberPassword').val();
		if(id == "") {
			alert("아이디를 입력해주세요.")
		} else if(pw == ""){
			alert("비밀번호를 입력해주세요.")
		} else {
			$.ajax({
				url: 'loginMember.do',
				type: 'POST',
				data: {
					memberId:id,
					memberPassword:pw
					},
				datatype: 'JSON',
				success: function (data) {
					if(data == 1){
						alert(id + "님 로그인성공!");
						location="main.do";
					} else {
						alert("아이디나 비밀번호를 확인해 주세요.");
					}
				}
			})			
		}		
	}
</script>
<title>로그인</title>
</head>
<body>
<h1>로그인</h1> 
    <form>
        <div>
            <label for="memberId">아이디</label>
            <input type="text" id="memberId" name="memberId" placeholder="아이디 입력해주세요" >
        </div>
        <div class="form-group">
            <label for="memberPassword">비밀번호</label>
            <input type="password" id="memberPassword" name="memberPassword" placeholder="비밀번호 입력해주세요" >
        </div>
        <input type="button" onclick="loginMember()" value="로그인"/>
        <button type="button" onclick="location.href='signUp.do'">회원 가입</button><br><br>
        
        <a href="">아이디 찾기</a> / <a href="">비밀번호 찾기</a>
        
    </form>
</body>
</html>