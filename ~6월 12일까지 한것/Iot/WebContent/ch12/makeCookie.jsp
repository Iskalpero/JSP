<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String cookieName = "id";
	Cookie cookie = new Cookie(cookieName, "hongkd");
	// 쿠키 생성(쿠키명, 값)순서이다.
	
	cookie.setMaxAge(60*2);
	// 2분동안 유지 설정.
	
	response.addCookie(cookie);
	//쿠키를 브라우저에 저장한다.

%>

<html>
	<head>
		<meta charset="UTF-8">
		<title>쿠키확인</title>
	</head>
	<body>
		<h2>쿠키를 생성하는 페이지</h2>
		"<%=cookieName %>"쿠키가 생성<br>
		<form method="post" action="useCookie.jsp">
			<input type = "submit" value = "생성된 쿠키 확인">
		</form>
	</body>
</html>
