<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>삭 제</title>
	</head>
	<body>
		<h2> member 테이블 삭제 </h2>
		
		<form method = "post" action = "deleteTestPro.jsp">
			ID : <input type = "text" name = "id" maxlength="50"><br>
			PW : <input type = "text" name = "passwd" maxlength="16"><br>
			<input type ="submit" value="입력완료">		
		</form>
		
	</body>
</html>
