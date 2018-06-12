<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<% request.setCharacterEncoding("utf-8"); %>

<%
	String name = "고길동";
	String pageName = "includedTest2.jsp";
%>

 포함되는 페이지 includeTest2.jsp.<br>
 포함되는 페이지에 값을 전달<br>
 <hr>
 <jsp:include page="<%=pageName %>" flush="false">
 	<jsp:param value="<%=name %>" name="name"/>
 	<jsp:param name="pageName" value="<%=pageName %>"/>
 </jsp:include>
 
 <!-- param으로 1에서 html태그로 submit하던 것을 동일하게 할 수 있다. -->