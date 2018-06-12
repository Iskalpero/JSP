<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import = "ch13.board.BoardDBBean" %>   
<%@ page import = "ch13.board.BoardDataBean" %>
<%@ page import = "java.util.List" %>
<%@ page import = "java.text.SimpleDateFormat" %>
<%@ include file = "color.jspf" %>


<%! //선언문  
	int pageSize = 10;
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
%>
 
<% //스크립트릿
	String pageNum = request.getParameter("pageNum");
	if(pageNum == null){
		pageNum = "1";
	} //페이지값을 받은게 없을 경우 첫 페이지를 보여준다.
	
	int currentPage = Integer.parseInt(pageNum);
	int startRow = (currentPage - 1) * pageSize +1;
	int endRow = currentPage * pageSize;
	int count = 0;
	int number = 0;
	List<BoardDataBean> articleList = null;
	// 여기의 List는 BoardDataBean 의 set,get 변수를 모두 포함시킨 객체
	
	BoardDBBean dbPro = BoardDBBean.getInstance();
	count = dbPro.getArticleCount();
	
	if(count>0){
		articleList = dbPro.getArticles(startRow, pageSize);
	}
	
	number = count - (currentPage-1)*pageSize;
	
%>
    
<!DOCTYPE html>
<html>
	<head>
		<title>게시판</title>
		<link href ="style.css" rel="stylesheet" type = "text/css">
	</head>
	<body bgcolor="<%=bodyback_c %>">
		<p>글목록(전체 글:<%=count %>)</p>
		<table>
			<tr>
				<td align="right" bgcolor="<%=value_c %>">
					<a href = "writeForm.jsp">글쓰기</a>
				</td>
			</tr>		
		</table>
		
<%if(count==0){ %>
		<table>
			<tr>
				<td align="center">
					게시판에 저장된 글이 없습니다.
			</tr>
		</table>
<%}else{ //if끝  %>
		<table>
			<tr height="30" bgcolor="<%=value_c%>">
				<td align="center" width="50">번 호</td>
				<td align="center" width="250">제 목</td>
				<td align="center" width="100">작성자</td>
				<td align="center" width="150">작성일</td>
				<td align="center" width="50">조 회</td>
				<td align="center" width="100">I P</td>
			</tr>
<%
		for(int i = 0; i < articleList.size(); i++){
			BoardDataBean article = articleList.get(i);
	
%>
			<tr height="30">
				<td width="50"><%= number-- %></td>
				<td width="250" align="left">
<%
			int wid = 0;
			// if문으로 답글여부를 체크하고 이를 표시.
			if(article.getRe_level() > 0){
				wid = 10*(article.getRe_level());
%>
					<img src="images/level.png" width="<%=wid %>" height="16">
					<img src = "images/re.png">
					
<%  		}else{ //if끝 %>
				
					<img src ="images/level.png" width="<%=wid %>" height="16">
					
<% 			} //else 끝%>
					<a href = "content.jsp?num=<%=article.getNum() %>&pageNum=<%=currentPage %>">
					<%=article.getSubject() %></a>
<%
			if(article.getReadcount() >= 20){
				// 조회수 일정 수 이상 시 다수열람이라는 문구 표시
%>
					<img src = "images/hot.png" border = "0" height="16">
<%			}//if끝 %>		</td>
				<td width="100" align="left">
					<a href = "mailto:<%=article.getEmail() %>">
						<%=article.getWriter()%></a></td>
				<td width="150"><%= sdf.format(article.getReg_date()) %></td>
				<td width="50"><%= article.getReadcount() %></td>
				<td width="100"><%= article.getIp() %></td>
			</tr>
<%	}//for문끝 %>
		</table>
<%}//else끝 %>
<%
	if(count >0){
		int pageCount = count / pageSize + (count % pageSize == 0? 0:1);
		int startPage = 1;
		
		if(currentPage % 10 != 0)
			startPage = (int)(currentPage/10)*10+1;
		else
			startPage = ((int)(currentPage/10)-1)*10+1;
		
		int pageBlock = 10;
		int endPage = startPage + pageBlock -1;
		
		if(endPage > pageCount) endPage = pageCount;
		
		if(startPage > 10 ){ %>
			<a href ="list.jsp?pageNum=<%= startPage-10 %>">[이전]</a>
<%		}
		for(int i = startPage ; i <= endPage; i++){ 
%>
			<a href = "list.jsp?pageNum=<%=i %>">[<%=i %>]</a>
<%		}
		if(endPage < pageCount){ %>
			<a href = "list.jsp?pageNum=<%= startPage +10 %>">[다음]</a>
<%
		}
	}
%>
	</body>
</html>
