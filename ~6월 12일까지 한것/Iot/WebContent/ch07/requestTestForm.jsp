<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>requestTestForm.jsp</title>
	</head>
	<body>
		<h2> 예제 requestTestForm.jsp</h2>
		
		<form method="post" action="requestTestPro.jsp">
			학번 : <input type = "text" name = "num"><br>
			이름 : <input type = "text" name = "name"><br>
			학년 : <input type = "checkbox" name = "grade" value="1" checked>
					1학년&nbsp;
				 <input type = "checkbox" name = "grade" value="2" >
					2학년&nbsp;
				 <input type = "checkbox" name = "grade" value="3" >
					3학년&nbsp;
				 <input type = "checkbox" name = "grade" value="4" >
					4학년<br>
			선택과목 : 
				<select name = "subject">
					<option value = "JAVA">JAVA</option>
					<option value = "JSP">JSP</option>
					<option value = "XML">XML</option>
				</select><br>
				<input type = "submit" value="입력완료">		
		</form>
	</body>
</html>
