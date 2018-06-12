<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>쿠키 사용 로그인 폼</title>
	</head>
	<body>
		<h2> 로그인 폼(쿠키사용)</h2>
		<form method="post" action= "cookieLoginPro.jsp">
			ID : <input type = "text" name = "id" maxlength = "50"><br>
			PW : <input type = "password" name = "passwd" maxlength="16"><br>
			<input type = "submit" value = "로그인">
			<input type = "button" value = "회원가입"
				onclick = "location.href='insertMemberForm.jsp'">
		</form>
	</body>
</html>
