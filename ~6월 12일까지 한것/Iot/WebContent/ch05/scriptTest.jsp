<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<h2> 선언문, 스크립트릿, 표현식의</h2>
		
		<%! //
			String str = "Abc";
		%>
		
		
		<%!
			String getStr(){
				return str;
			}
		%>
		
		
		<%
			String str2 = "지역";	
		%>
		
		
		str2 = <%=str2 %> <br>
		str1 =  <%= str %>
			
	</body>
</html>
