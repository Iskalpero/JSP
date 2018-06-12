<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
<% request.setCharacterEncoding("utf-8");%>

<%
	String num = request.getParameter("num");
	String name = request.getParameter("name");
	String[] grades = request.getParameterValues("grade");
	String subject = request.getParameter("subject");
	//get이든 post이든 값을 받아오는 request.getParameter(명칭)
%>


<h2> 학생정보</h2>
<table border = "1">
	<tr>
		<td width="150">학번</td>
		<td width="150"><%=num %></td>
	</tr>
	<tr>
		<td width="150">이름</td>
		<td width="150"><%=name %></td>
	</tr>
	<tr>
		<td width="150">학년</td>
		<td width="150">
			<%
				for(int i =0; i<grades.length; i++){
					out.println(grades[i]);
				}
			
			%></td>
	</tr>
	<tr>
		<td width="150">선택과목</td>
		<td width="150"><%=subject %></td>
	</tr>



</table>