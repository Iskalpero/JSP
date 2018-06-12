<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>가입</title>
	</head>
	<body>
		<h2> 회원가입 </h2>
		<form method = "post" action = "insertMemberPro.jsp">
			ID : <input type = "text" name = "id" maxlength = "50"><br>
			PW : <input type = "password" name = "passwd" maxlength="16"><br>
			NM : <input type = "text" name = "name" maxlength="10"><br>
			<input type = "submit" value = "등록">
			<input type = "reset" value = "재입력">
		</form>
	</body>
</html>
