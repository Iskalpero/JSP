<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% request.setCharacterEncoding("utf-8"); %>

포워딩 페이지 forwardTest.jsp인데 표시되지 않음.<br>

<%
	String id = "고길동";
	String hobby = "소드마스터";
%>

<jsp:forward page="fowardToTest2.jsp">
	<jsp:param value="<%=id %>" name="id"/>
	<jsp:param value="<%=hobby %>" name="hobby"/>

</jsp:forward>
<!-- 포워드 를 페이지만 넘기고 닫는 역할만이 아니라 param으로 form의 역할을
     수행한 후에 닫을 수 있다. -->

나머지부분, 실행되지 않는다.
