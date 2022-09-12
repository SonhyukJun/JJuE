<%@page import="java.awt.print.Printable"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="pid.members.service.MembersVO"%>
<%@ page import="pid.employees.service.EmployeesVO"%>
<!DOCTYPE html>
<html>
<body>
<%
	String memberId = (String) session.getAttribute("SessionMemberId");
	String memberNickname = (String) session.getAttribute("SessionMemberNickname");
	String memberTelNumber = (String) session.getAttribute("SessionMemberTelNumber");
	MembersVO sessionMember = (MembersVO) session.getAttribute("SessionMember");
	
	String employeeNo = (String) session.getAttribute("SessionEmployeeNo");
	String employeeNickname = (String) session.getAttribute("SessionEmployeeNickname");
	String employeeRole = (String) session.getAttribute("SessionEmployeeRole");	
	EmployeesVO sessionEmployee = (EmployeesVO) session.getAttribute("SessionEmployee");
	
	
	if(employeeNickname == null) {
		employeeNickname = "visitor";
	} 
	
	if(employeeRole == null) {
		employeeRole = "user";
	}
	
	if(memberId == null) {
		memberId = "visitor";
	}
%>

<div class="header">
    <nav class="navbar navbar-default navbar-fixed-top">
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a href="/PetInDeligth/login.do" class="navbar-brand" style="text-decoration:none;">          
                    <span style="vertical-align:middle;">header </span>
                </a>
            </div>
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">
              		<%
              			if(memberId=="visitor" && employeeNickname == "visitor") {
              		%>
						<li>                       
                       		<a href="login.do">LOGIN</a>
                   		</li>
					<%
              			} else if (memberId != null && employeeNickname == "visitor") {
					%>
						<li>
                			<a>${SessionMemberNickname}님 반갑습니다.</a>
                		<li>
                		<li>
                			<a href="selectMember.do">개인정보조회</a>
                			
               		 	</li> 
                		<li>         
                   			<a href="logout.do">LOGOUT</a>
                   		</li>           
					<%
              			} else if(memberId == "visitor" && employeeNickname != null){
					%>
						<li>
                			<a>${SessionEmployee.getEmployeeNickname()}님 반갑습니다.</a>
                		<li>
                		<li>
                			<a href="membersList.do">전체 회원 정보 조회</a>
               		 	</li> 
                		<li>         
                   			<a href="logout.do">LOGOUT</a>
                   		</li>
					<%
              			}
					%>
                </ul>
            </div>
        </div>
    </nav>
</div>
</body>
</html>