<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>forwardTestForm.jsp</title>
	</head>
	<body>
		<h2> forward 액션 태그</h2>
		
		<form method="post" action="forwardTest.jsp">
			아이디 : <input type = "text" name ="id"><br>
			취미 : 
				<select name = "hobby">
					<option value="WOW">WOW</option>
					<option value="W3">워크3</option>
					<option value="S2">스타2</option>
				</select><br>
				<input type ="submit" value="입력완료">
		</form>
	</body>
</html>
