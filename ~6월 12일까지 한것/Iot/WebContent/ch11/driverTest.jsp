<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>


<h2> 되는가? </h2>

<%
	Connection conn = null;
	
	try{
		String jdbcUrl = "jdbc:mysql://localhost:3306/basicjsp";
		String dbId = "jspid";
		String dbPass = "jsppass";
		
		
		Class.forName("com.mysql.jdbc.Driver");
		//DB와 연동하기 위해 DriverManager에 등록.
		conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
		// 연결 
		out.println("연결 완료");

	}
	catch(Exception e){
		e.printStackTrace();
		out.println("없음");
	}
	
	
%>