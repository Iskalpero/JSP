package ch13.board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import ch12.member.LogonDBBean;

public class BoardDBBean {
	
private static BoardDBBean instance = new BoardDBBean();
	
	public static BoardDBBean getInstance() {
		return instance;
	}
	
	private BoardDBBean() {}
	
	private Connection getConnection() throws Exception{
		
		Context initCtx = new InitialContext();
		Context envCtx = (Context)initCtx.lookup("java:comp/env");
		DataSource ds = (DataSource)envCtx.lookup("jdbc/basicjsp");
		return ds.getConnection();		
	}
	
	public void insertArticle(BoardDataBean article) throws Exception{
	// 고객 추가
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		
		int num = article.getNum();
		int ref = article.getRef();
		int re_step = article.getRe_step();
		int re_level = article.getRe_level();
		int number = 0;
		String sql = "";
		
		try {
			conn = getConnection();
			
			pstmt = conn.prepareStatement("select max(num) from board");
			rs = pstmt.executeQuery();
			if(rs.next()) 
				number = rs.getInt(1) + 1;
				//여기서 getInt를 num으로 한 목적은
			else
				number = 1;
			
			if(num != 0) {//답글인 경우
				sql = "update board set re_step = re_step + 1 ";
				sql += "where ref = ? and re_step > ? ";
				// 이 sql문의 조건식을 위해 필요하다.
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, ref);
				pstmt.setInt(2, re_step);
				// 
				pstmt.executeUpdate();
				re_step += 1;
				//글작성순서이므로 +1
				re_level += 1;
				//답글이므로 depth인 re_level값을 +1
				
				
				//여기서 변수 ref는 원글의 num을 따온것. re_step는 글이 작성된 순서(값이 클 수록 최근) re_level는 depth
			}else {
				ref = number;
				re_step = 0;
				re_level = 0;
			}
			
			sql = "insert into board(writer,email,subject,passwd,reg_date,";
				sql += "ref,re_step,re_level,content,ip) values(?,?,?,?,?,?,?,?,?,?)";
			
			
				
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, article.getWriter());
			pstmt.setString(2, article.getEmail());
			pstmt.setString(3, article.getSubject());
			pstmt.setString(4, article.getPasswd());
			pstmt.setTimestamp(5, article.getReg_date());
			pstmt.setInt(6, ref);
			pstmt.setInt(7, re_step);
			pstmt.setInt(8, re_level);
			pstmt.setString(9, article.getContent());
			pstmt.setString(10, article.getIp());
			pstmt.executeUpdate();		
			
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			if( rs != null)
				try {rs.close();} catch(SQLException ex) {}
			if( pstmt != null)
				try {pstmt.close();} catch(SQLException ex) {}
			if( conn != null)
				try {conn.close();} catch(SQLException ex) {}	
		}
	}
	
	public int getArticleCount() throws Exception {
	// 고객 정보가져오기.
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int x = 0;
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select count(*) from board");
			rs = pstmt.executeQuery();
			
			if(rs.next())
				x = rs.getInt(1);			
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			if( rs != null)
				try {rs.close();} catch(SQLException ex) {}
			if( pstmt != null)
				try {pstmt.close();} catch(SQLException ex) {}
			if( conn != null)
				try {conn.close();} catch(SQLException ex) {}	
		}
		return x;
	}
	
	//글 목록 가져오기.
	public List<BoardDataBean> getArticles(int start, int end) 
		throws Exception{
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		List<BoardDataBean> articleList = null;
		
		try {
			
			conn = getConnection();
			
			pstmt = conn.prepareStatement(
			 "select * from board order by ref desc, re_step asc limit ?,?");
			
			pstmt.setInt(1, start-1);
			pstmt.setInt(2, end);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				articleList = new ArrayList<BoardDataBean>(end);
				
				do {
					BoardDataBean article = new BoardDataBean();
					article.setNum(rs.getInt("num"));
					article.setWriter(rs.getString("writer"));
					article.setEmail(rs.getString("email"));
					article.setSubject(rs.getString("subject"));
					article.setPasswd(rs.getString("passwd"));
					article.setReg_date(rs.getTimestamp("reg_date"));
					article.setReadcount(rs.getInt("readcount"));
					article.setRef(rs.getInt("ref"));
					article.setRe_step(rs.getInt("re_step"));
					article.setRe_level(rs.getInt("re_level"));
					article.setContent(rs.getString("content"));
					article.setIp(rs.getString("ip"));
					
					articleList.add(article);
					
				}while(rs.next());	
			}
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			if( rs != null)
				try {rs.close();} catch(SQLException ex) {}
			if( pstmt != null)
				try {pstmt.close();} catch(SQLException ex) {}
			if( conn != null)
				try {conn.close();} catch(SQLException ex) {}
		}
		
		return articleList;
	}
	
	
	//글의 내용보기
	
	public BoardDataBean getArticle(int num) throws Exception{
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		BoardDataBean article = null;
		
		try {
			conn = getConnection();
			
			pstmt = conn.prepareStatement(
     	     "update board set readcount = readcount + 1 where num = ?");
			 pstmt.setInt(1, num);
			 pstmt.executeUpdate();
			 
			pstmt = conn.prepareStatement(
			 "select * from board where num = ?");
			
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				article = new BoardDataBean();
				article.setNum(rs.getInt("num"));
				article.setWriter(rs.getString("writer"));
				article.setEmail(rs.getString("email"));
				article.setSubject(rs.getString("subject"));
				article.setPasswd(rs.getString("passwd"));
				article.setReg_date(rs.getTimestamp("reg_date"));
				article.setReadcount(rs.getInt("readcount"));
				article.setRef(rs.getInt("ref"));
				article.setRe_step(rs.getInt("re_step"));
				article.setRe_level(rs.getInt("re_level"));
				article.setContent(rs.getString("content"));
				article.setIp(rs.getString("ip"));
			}
			
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			if( rs != null)
				try {rs.close();} catch(SQLException ex) {}
			if( pstmt != null)
				try {pstmt.close();} catch(SQLException ex) {}
			if( conn != null)
				try {conn.close();} catch(SQLException ex) {}
		}
		
		return article;
	}
	
	//글수정 (update)
	public int updateArticle(BoardDataBean article) throws Exception{
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String dbpasswd = "";
		String sql = "";
		int x = -1;
		
		try {
			
			conn = getConnection();
			
			pstmt = conn.prepareStatement(
			 "select passwd from board where num = ?");
			
			pstmt.setInt(1, article.getNum());
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dbpasswd = rs.getString("passwd");
				if(dbpasswd.equals(article.getPasswd())) {
					sql = "update board set writer = ?, email = ? , subject = ? , passwd = ?";
					sql += ",content = ? where num = ?";
					
					pstmt = conn.prepareStatement(sql);
					
					
					pstmt.setString(1, article.getWriter());
					pstmt.setString(2, article.getEmail());
					pstmt.setString(3, article.getSubject());
					pstmt.setString(4, article.getPasswd());
					pstmt.setString(5, article.getContent());
					pstmt.setInt(6, article.getNum());
					
					pstmt.executeUpdate();
					
					x = 1;
					
				}else
					x = 0;
			}
			
		}  catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			if( rs != null)
				try {rs.close();} catch(SQLException ex) {}
			if( pstmt != null)
				try {pstmt.close();} catch(SQLException ex) {}
			if( conn != null)
				try {conn.close();} catch(SQLException ex) {}
		}
		
		return x;
	}
	
	
	//삭제(delete)
	public int deleteArticle(int num, String passwd) throws Exception {
		

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String dbpasswd = "";
		int x = -1;
		
		
		try {
			
			conn = getConnection();
			
			pstmt = conn.prepareStatement(
			 "select passwd from board where num = ?");
			
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			
			
			if(rs.next()) {
				dbpasswd = rs.getString("passwd");
				if(dbpasswd.equals(passwd)) {
					pstmt = conn.prepareStatement(
					 "delete from board where num = ?");
					
					pstmt.setInt(1, num);
					pstmt.executeUpdate();
					x = 1;
				}else
					x = 0;
				
			}
		} catch(Exception ex) {
				ex.printStackTrace();
		} finally {
			if( rs != null)
				try {rs.close();} catch(SQLException ex) {}
			if( pstmt != null)
				try {pstmt.close();} catch(SQLException ex) {}
			if( conn != null)
				try {conn.close();} catch(SQLException ex) {}
		}
		
		return x;
	}
	
	
}
