<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>정보입력</title>
	</head>
	<body>
		<h2>세 션 </h2>
		<form method="post" action= "sessionTestPro.jsp">
			ID : <input type = "text" name = "id" maxlength = "50"><br>
			PW : <input type = "password" name = "passwd" maxlength="16"><br>
			<input type = "submit" value = "입력">
		</form>
	</body>
</html>
