<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script type="text/javascript">
	function signUpEmployee() {
		
	}
</script>
<title>사원 등록</title>
</head>
<body>
	<div class="container" style="width:400px">
        <div class="form-group">
            <label for="employeeName">이름</label>
            <input type="text" id="employeeName" name="employeeName">
        </div>
        <div class="form-group">
            <label for="employeeNickname">닉네임</label>
            <input type="text" id="employeeNickname" name="employeeNickname">
        </div>
        <div class="form-group">
            <label for="employeeResident">생년월일</label>
            <input type="text" id="employeeResident" name="employeeResident">
        </div>
        <div class="form-group">
            <label for="employeeTelNumber">전화번호</label>
            <input type="text" id="employeeTelNumber" name="employeeTelNumber">
        </div>
        <div class="form-group">
            <label for="employeeAddress">주소</label>
            <input type="text" id="employeeAddress" name="employeeAddress">
        </div>
        <div class="form-group">
            <label for="employeePassword">비밀번호</label>
            <input type="password" id="employeePassword" name="employeePassword">
        </div>
        <input type="button" id="signUpEmployee" onclick="signUpEmployee()" value="회원가입"/>
	</div>
</body>
</html>