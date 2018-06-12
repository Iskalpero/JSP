<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import = "java.sql.*" %>

<% request.setCharacterEncoding("utf-8"); %>

<%
	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	PreparedStatement pstmt_Delete = null;
	ResultSet rs = null;
	
	try{
		String jdbcUrl = "jdbc:mysql://localhost:3306/basicjsp";
		String dbId = "jspid";
		String dbPass = "jsppass";
		
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(jdbcUrl,dbId,dbPass);
		
		String sql = "select id, passwd from member where id = ? ";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1,id);
		rs = pstmt.executeQuery();
		
		if(rs.next()){
			String rId = rs.getString("id");
			String rPasswd = rs.getString("passwd");
			if(id.equals(rId) && passwd.equals(rPasswd)){
				sql = "delete from member where id = ? ";
				pstmt_Delete = conn.prepareStatement(sql);
				pstmt_Delete.setString(1,id);
				pstmt_Delete.executeUpdate();
		%>
		<html>
			<head>
				<title> 삭 제 </title>
			</head>
			<body>
				member 테이블의 대상 레코드를 삭제			
			</body>
		</html>
		<%
				
			}
			else
				out.println("패스워드");
		}
		else
			out.println("IDW다냥");
	}
	catch(Exception e){
		e.printStackTrace();
	}
	finally{
		if(rs != null)
			try{rs.close();}catch(SQLException sqle){}
		if(pstmt != null)
			try{pstmt.close();}catch(SQLException sqle){}
		if(conn != null)
			try{conn.close();}catch(SQLException sqle){}
		if(pstmt_Delete != null)
			try{pstmt_Delete.close();}catch(SQLException sqle){}
	}
	
	%>