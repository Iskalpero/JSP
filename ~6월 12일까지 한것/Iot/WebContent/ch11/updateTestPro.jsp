<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@ page import = "java.sql.*" %>

<% request.setCharacterEncoding("utf-8"); %>


<%
	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	String name = request.getParameter("modify_name");
	
	Connection conn = null;
	PreparedStatement pstmt_Select = null;
	PreparedStatement pstmt_Update = null;
	ResultSet rs = null;
	
	try{
		String jdbcUrl = "jdbc:mysql://localhost:3306/basicjsp";
		String dbId = "jspid";
		String dbPass = "jsppass";
		
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(jdbcUrl,dbId,dbPass);
		
		String sql = "select id, passwd from member where id = ? ";
		pstmt_Select = conn.prepareStatement(sql);
		pstmt_Select.setString(1,id);
		rs = pstmt_Select.executeQuery();
		
		if(rs.next()){
			String rId = rs.getString("id");
			String rPasswd = rs.getString("passwd");
			if(id.equals(rId) && passwd.equals(rPasswd)){
				sql = "update member set name = ? where id = ?";
				pstmt_Update = conn.prepareStatement(sql);
				pstmt_Update.setString(1,name);
				pstmt_Update.setString(2,id);
				pstmt_Update.executeUpdate();
			%>
	<html>
		<head>
			<title> modify of record </title>
		</head>
		<body>
			member 테이블을 수정.		
		</body>
	</html>
			
	<%
			}
			else
				out.println("패스워드가 틀림");
		}else
			out.println("아이디 더브류다냥");	
	}
	catch(Exception e){
		e.printStackTrace();
	}
	finally{
		if(rs != null)
			try{rs.close();}catch(SQLException sqle){}
		if(pstmt_Select != null)
			try{pstmt_Select.close();}catch(SQLException sqle){}
		if(conn != null)
			try{conn.close();}catch(SQLException sqle){}
		if(pstmt_Update != null)
			try{pstmt_Update.close();}catch(SQLException sqle){}
	}
		
	%>
	
	