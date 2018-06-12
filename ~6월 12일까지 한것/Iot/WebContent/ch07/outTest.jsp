<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>outTest.jsp</title>
	</head>
	<body>
		<h2> out.println() </h2>
		
		<%
		
			String name = "Kingdora";
			out.println("출력되는 내용 <b>" + name +"</b>이다.");
		%>
		
		<h2> 같은 내용</h2>
		
		출력되는 내용 <b><%=name%></b>이다.
	</body>
</html>
