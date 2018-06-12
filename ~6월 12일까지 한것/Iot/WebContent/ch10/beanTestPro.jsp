<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% request.setCharacterEncoding("utf-8"); %>


<jsp:useBean id="testBean" class="ch10.bean.TestBean">
	<jsp:setProperty name="testBean" property="name"/>
</jsp:useBean>

<jsp:useBean id="testBee" class="ch10.bean.TestBean">
	<jsp:setProperty name="testBee" property="name" value="배고프다"/>
</jsp:useBean>

<h2> JSP page use JavaBean</h2>

입력된 이름 <jsp:getProperty name="testBean" property="name"/>
입력된 이름2 <jsp:getProperty name="testBee" property="name"/>