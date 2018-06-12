<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>레코드 추가</title>
	</head>
	<body>
		<h2> 레코드 추가 </h2>
		<form method="post" action = "insertTestPro.jsp">
			ID : <input type = "text" name = "id" maxlength = "50"><br>
			PW : <input type = "text" name = "pw" maxlength = "16"><br>
			이름 : <input type = "text" name = "name" maxlength = "10"><br>
			<input type = "submit" value = "입력완료">
		</form>		
	</body>
</html>
