<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.sql.*"%>


<% request.setCharacterEncoding("UTF-8");%>


<%

	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String name = request.getParameter("name");
	// request.getParameter로 insertTestForm에서의 3개 값을 대입시킨다.
	Timestamp register = new Timestamp(System.currentTimeMillis());
	
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	String str ="";
	
	try{
		String jdbcUrl = "jdbc:mysql://localhost:3306/basicjsp";
		String dbId = "jspid";
		String dbPass = "jsppass";
		
		Class.forName("com.mysql.jdbc.Driver");
		//DB와 연동하기 위해 DriverManager에 등록.
		conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
		// 연결 
		
		
		String sql = "insert into member values(?,?,?,?)";
		
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1,id);
		pstmt.setString(2,pw);
		pstmt.setString(3,name);
		pstmt.setTimestamp(4,register);
		pstmt.executeUpdate();
		
		
		str = "테이블에 레코드 추가";
		
	}
	catch(Exception e){
		e.printStackTrace();
		str = "실패";
	}
	finally{
		if( pstmt != null)
			try{pstmt.close();}catch(SQLException sqle){}
		if( conn != null)
			try{pstmt.close();}catch(SQLException sqle){}
	}
	
%>
<html>
	<head>
		<title> 추가 </title>		
	</head>
	<body>
		<%= str %>
	</body>
</html>