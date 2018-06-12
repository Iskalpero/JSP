<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String id = "";
	try{
		id = (String)session.getAttribute("id");
		if(id == null || id.equals(""))
			response.sendRedirect("sessionLoginForm.jsp");
		else{
%>
			<!DOCTYPE html>
			<html>
				<head>
					<meta charset="UTF-8">
					<title>세션를 사용한 인증</title>
				</head>
				<body>
					<b><%= id %></b>접속
					<form method="post" action="sessionLogout.jsp">
						<input type = "submit" value = "로그아웃">
					</form>
				</body>
			</html>
<%		}
	}
	catch(Exception e){
		e.printStackTrace();
	}
%>
    

