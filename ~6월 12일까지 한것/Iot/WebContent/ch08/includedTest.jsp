<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

 <% request.setCharacterEncoding("utf-8"); %>
 
 <%
 	String name = request.getParameter("name"); 	
 %>
 <!-- include로 한 파일이라고 생각하면 includeTestForm에서 submit한
      name값을 request로 받을 수가 있다. -->
 포함되는 페이지 includedTest.jsp<p>
 <b> <%=name %>님</b>
 <hr>