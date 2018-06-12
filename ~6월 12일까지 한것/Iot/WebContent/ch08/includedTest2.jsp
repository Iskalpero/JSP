<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
<%
	String name = request.getParameter("name");
	String pageName = request.getParameter("pageName");
%>

 파라미터 값을 전달받고 실행 <br>
 포함되는 페이지 <%=pageName%> 이다 <br>
 <b> <%=name %></b>님
 <hr>