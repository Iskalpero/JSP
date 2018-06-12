<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>responceRedirect.jsp</title>
	</head>
	<body>
		<h2> Response 예제</h2>
		현재 페이지는 <b> responseRedirect.jsp </b> 페이지.
		
		<%
			response.sendRedirect("responseRedirected.jsp");
		%>
	</body>
</html>
