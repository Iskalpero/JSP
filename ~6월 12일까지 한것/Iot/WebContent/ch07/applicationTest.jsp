<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>applicationTest.jsp</title>
	</head>
	<body>
		<%
			String info = application.getServerInfo();
			String path = application.getRealPath("/");
			application.log("기록");
		%>
		
		웹 컨테이너의 이름과 버전 : <%=info %><p></p>
		웹 애플리케이션 폴더의 로컬 시스템 경로 : <%=path %>
	</body>
</html>
