<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
<%
	String id = request.getParameter("id");
	String hobby = request.getParameter("hobby");
	
%>

포워딩 되는 페이지 forwardToTest2.jsp<br>
<b><%=id %></b><br>
<b><%=hobby %></b>