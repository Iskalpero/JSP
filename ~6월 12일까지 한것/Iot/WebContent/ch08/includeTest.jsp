<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% request.setCharacterEncoding("utf-8"); %>


<%
	String pageName = request.getParameter("pageName");
	pageName += ".jsp";	
	
%>
<!-- includeTestForm.jsp에서 값을 받아(pageName).jsp로 완성  -->
포함하는 페이지 includeTest.jsp이다.<br>


<hr>

<jsp:include page = "<%=pageName %>" flush="true"/>
<!-- include로  페이지 이동 -->
includeTest.jsp의 나머지 내용입니다.