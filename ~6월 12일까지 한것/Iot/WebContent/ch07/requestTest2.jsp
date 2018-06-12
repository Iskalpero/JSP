<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import = "java.util.Enumeration" %>

<% 
	String names[] = {"프로토콜 이름", "서버 이름", "Method(get/post)", "콘텍스트 경로", "URI", "접속한 클라이언트의 IP"};
	String values[] = {request.getProtocol(), request.getServerName(), request.getMethod(),
						request.getContextPath(), request.getRequestURI(), request.getRemoteAddr()};
	
	Enumeration <String> en = request.getHeaderNames();
	String headerName = "";
	String headerValue = "";
%>



<html>
	<head>
		<meta charset="UTF-8">
		<title>requestTest2.jsp</title>
	</head>
	<body>
		<h2> Web Browser & Information of Web Server </h2>
		<%
			for(int i = 0; i < names.length; i++){
				out.println(names[i] + " : " + values[i] + "<br>");
			}
		%>
		
		<h2> Information of Header</h2>
		<%
			while(en.hasMoreElements()){ // 
				headerName = en.nextElement();
				headerValue = request.getHeader(headerName);
				out.println(headerName + " : " + headerValue + "<br>");
			}
		
		%>
	</body>
</html>
