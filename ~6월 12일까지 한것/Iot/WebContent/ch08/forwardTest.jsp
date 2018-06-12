<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% request.setCharacterEncoding("utf-8"); %>

포워딩 페이지 forwardTest.jsp인데 표시되지 않음.<br>

<jsp:forward page="fowardToTest.jsp" />

<!-- forward가 페이지 이동 역할만 수행해주기 때문에 표시되지 않는다.
	 (우선순위가 높아 6번째 줄의 내용이 출력되지 x ) 
	 밑의 내용도 forward로 페이지가 이동되었기 때문에 역시 표시되지 않는다. -->

나머지부분, 실행되지 않는다.
