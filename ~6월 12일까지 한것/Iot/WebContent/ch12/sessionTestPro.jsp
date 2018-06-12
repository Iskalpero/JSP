<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<html>
	<head>
		<meta charset="utf-8">
		<title> 세션 세팅 및 사용</title>
	</head>
	<body>
		<%
			String id = request.getParameter("id");
			String passwd = request.getParameter("passwd");
			
			session.setAttribute("id",id);
			session.setAttribute("passwd",passwd);
			
		%>
		id/passwd 세션 속성 설정<br>
		
		id = <%=(String)session.getAttribute("id") %> <br>
		passwd = <%=(String)session.getAttribute("passwd") %> 이다.
	</body>
</html>