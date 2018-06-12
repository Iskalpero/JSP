<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import = "java.sql.*" %>


<html>
	<head>
		<title> 레코드 보기</title>
	</head>
	<body>
		<h2> mem 테이블 공개 </h2>
		<table border = "1">
			<tr>
				<td width="100">num</td>
				<td width="100">ID</td>
				<td width="100">name</td>
				<td width="100">성</td>
				<td width="150">우편번호</td>
				<td width="450">주소</td>
				<td width="100">전화번호</td>
				<td width="100">나이</td>
			</tr>
			<%
				Connection conn = null;
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				
				try{
					String jdbcUrl = "jdbc:mysql://localhost:3306/r_db";
					String dbId = "root";
					String dbPass = "12345";
					
					Class.forName("com.mysql.jdbc.Driver");
					//DB와 연동하기 위해 DriverManager에 등록.
					conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
					// 연결 
					
					
					String sql = "select * from mem";
					
					pstmt = conn.prepareStatement(sql);
					rs = pstmt.executeQuery();
					
					while(rs.next()){
						Integer num = rs.getInt("num");
						String name = rs.getString("name");
						String id = rs.getString("id");
						String sex = rs.getString("sex");
						String post_num = rs.getString("post_num");
						String address = rs.getString("address");
						String tel = rs.getString("tel");
						Integer age = rs.getInt("age");
						
					// html문을 사용해야하기 때문에 jsp를 닫음	
					%>
						<tr>
							<td width="100"><%= num%></td>
							<td width="100"><%= name%></td>
							<td width="100"><%= id%></td>
							<td width="100"><%= sex%></td>
							<td width="150"><%= post_num%></td>
							<td width="450"><%= address%></td>
							<td width="100"><%= tel%></td>
							<td width="100"><%= age%></td>
						</tr>
					<% // 사용후 다시 염.
					}					
				}
				catch(Exception e){
					e.printStackTrace();
					
				}
				finally{
					
					if( rs != null)
						try{rs.close();}catch(SQLException sqle){}
					if( pstmt != null)
						try{pstmt.close();}catch(SQLException sqle){}
					if( conn != null)
						try{conn.close();}catch(SQLException sqle){}
					// 예외처리문에서 finally에 위에서 sql문을 사용하기 위해 열었던
					// 것을 모두 수동으로 닫는다. 닫지 않을 시 메모리 누수가 발생.
				}
				
			
			%>
		</table>
	</body>
</html>