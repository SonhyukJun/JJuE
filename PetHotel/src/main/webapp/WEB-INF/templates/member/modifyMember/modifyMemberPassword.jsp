<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="ph.service.MembersVO"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script type="text/javascript">
	$(function(){
		$('#newPassword').keyup(function(){
    	  	$('#memberCheckPassword').html('');
		});
			$('#memberCheckPassword').keyup(function(){
    		if($('#newPassword').val() != $('#memberCheckPassword').val()){
	   		 	$('#password_check').html('비밀번호 일치하지 않음<br>');
        		$('#password_check').attr('color', '#f82a2aa3');		        	
        	} else{
          		$('#password_check').html('비밀번호 일치함<br>');
	      		$('#password_check').attr('color', '#199894b3');
        	}
		});
	});
	function modifyMemberPassword() {
		var id = $('#memberId').val();
		var memberPw = $('#memberPassword').val();
		var nowPw = $('#nowPassword').val();		
		
		var newPw = $('#newPassword').val();
		var checkPw = $('#memberCheckPassword').val();		
		if(memberPw != nowPw) {
			alert("현재 비밀번호가 틀립니다.")
		} else if(newPw != checkPw){
			alert("비밀번호가 일치하지 않습니다.")
		} else {			
			$.ajax({
				url: 'modifyMemberPassword.do',
				type: 'POST',
				data: {
					memberId: id,
					memberPassword: newPw,
					memberCheckPassword: checkPw					
				},
				datatype: 'JSON',
				success: function(data) {
					if(data == "ok"){
						alert("수정성공")
						location="selectMember.do";
					}
				}
				
			})
		}
	}
</script>
<title>비밀번호 변경</title>
</head>
<body>
<% 
	String memberId = (String) session.getAttribute("SessionMemberId");
	System.out.println(memberId);
	
	//MembersVO memberSession = (MembersVO) session.getAttribute("SessionMember");	
%>		
		<h1>비밀번호 변경 페이지</h1>
		<input type="hidden" id="memberId" name="memberId" value="${SessionMember.getMemberId()}"/>
		<input type="hidden" id="memberPassword" name="memberPassword" value="${SessionMember.getMemberPassword()}"/>
 		<div class="form-group">
            <label for="nowPassword">현재 비밀번호</label>
            <input type="password" id="nowPassword" name="nowPassword" placeholder="현재 비밀번호">
        </div>
        
        <div class="form-group">
            <label for="newPassword">변경할 비밀번호</label>
            <input type="password" id="newPassword" name="newPassword" placeholder="비밀번호">
        </div>
        
        <div class="form-group">
            <label for="memberCheckPassword">비밀번호 확인</label>
            <input type="password" id="memberCheckPassword" name="memberCheckPassword" placeholder="비밀번호 확인">
            <br>
            <font id="password_check" size="2"></font>
        </div>
        <input type="button" id="modifyMemberPassword" onclick="modifyMemberPassword()" value="변경하기"/>
</body>
</html>