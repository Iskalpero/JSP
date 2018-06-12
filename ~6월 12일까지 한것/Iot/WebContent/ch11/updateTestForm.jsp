<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Modify the record</title>
	</head>
	<body>
		<h2> record modify from table of memory</h2>
		
		
		<form method = "post" action = "updateTestPro.jsp">
			ID : <input type = "text" name = "id" maxlength="50"><br>
			PW : <input type = "text" name = "passwd" maxlength="16"><br>
			변경할 이름 : <input type = "text" name = "modify_name" maxlength = "10"><br>
			<input type ="submit" value="입력완료">		
		</form>
	</body>
</html>
