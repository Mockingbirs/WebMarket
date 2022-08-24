package db;

import java.sql.*;
import java.util.ArrayList;

import util.*;
import javax.naming.NamingException;



public class DAOboard {
	
	// C create R read U update D delete
	
	//회원가입 (테이블에 데이터 넣기)
	public int join(String mname,String mtel) throws NamingException, SQLException {
		
		Connection conn = null;
		PreparedStatement stmt = null;
		
		String sql = "INSERT INTO member(mname, mtel)VALUES(?,?)";
		
		//Connection Pool 이용
		conn= ConnectionPool.get();
		
		stmt = conn.prepareStatement(sql);
			stmt.setString(1, mname);
			stmt.setString(2, mtel);
		
		//결과가 0(실패)과 1(성공)로 넘어온다.
		int result = stmt.executeUpdate();
		
		
		return result;
	}
	
	public static int boardinsert(String title, String content, String author ) throws NamingException, SQLException  {

		
		  Connection conn = null;
		  
		  PreparedStatement stmt = null; 
		  
		  int result = 0;
		  
		 String sql = "INSERT INTO tableboard (title, content, author) VALUES(?,?,?)";
		  //Connection Pool 이용 conn= ConnectionPool.get();
		 conn= ConnectionPool.get();
		 
		  stmt = conn.prepareStatement(sql); 
		  stmt.setString(1, title);
		  stmt.setString(2, content);
		  stmt.setString(3, author); 
		 
		  
		  result = stmt.executeUpdate(); // 결과가 성공1 과 실패 0으로 넘어 온다.
		  
		  return result;
		 
	}
	
	public static ArrayList<DTOboard> fileList() throws NamingException, SQLException{
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		String sql = "SELECT * FROM tableboard";
		
		conn = ConnectionPool.get();
		stmt = conn.prepareStatement(sql);
		rs = stmt.executeQuery();
		
		ArrayList<DTOboard> files = new ArrayList<DTOboard>();
		
		while(rs.next()) {
			files.add(new DTOboard(rs.getString(1),
										rs.getString(2),
										rs.getString(3),
										rs.getString(4),
										rs.getString(5)));
		}
		return files;
	}
	
	
	public static DTOboard fileDetail(String bid) throws NamingException, SQLException {
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		String sql = "SELECT * FROM tableboard WHERE bid=? ";
		conn= ConnectionPool.get();
		stmt = conn.prepareStatement(sql);
			stmt.setString(1, bid);	
		rs = stmt.executeQuery();
		
		rs.next();
		
		bid = rs.getString(1);
		String title = rs.getString(2);
		String content = rs.getString(3);
		String author = rs.getString(4);
		String bdate = rs.getString(5);
		
		
		
		DTOboard file = new DTOboard(bid,title,content,author,bdate);
		
		return file;
	}

	public static int boardupdate(String title,String content, String bid) throws NamingException, SQLException {
		
		Connection conn = null;
		PreparedStatement stmt = null;
		
		String sql = "UPDATE tableboard SET title=?,content=? WHERE bid=?";
		
		//Connection Pool 이용
		conn= ConnectionPool.get();
		
		stmt = conn.prepareStatement(sql);
			stmt.setString(1, title);
			stmt.setString(2, content);
			stmt.setString(3, bid);
		
		//결과가 0(실패)과 1(성공)로 넘어온다.
		int result = stmt.executeUpdate();
		
		
		return result;
	}
	
	
	public static DTOboard fileEdit(String author) throws NamingException, SQLException {
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		String sql = "SELECT * FROM tableboard WHERE author=? ";
		conn= ConnectionPool.get();
		stmt = conn.prepareStatement(sql);
			stmt.setString(1, author);	
		rs = stmt.executeQuery();
		
		rs.next();
		
		String bid = rs.getString(1);
		String title = rs.getString(2);
		String content = rs.getString(3);
		author = rs.getString(4);
		String bdate = rs.getString(5);
		
		
		
		DTOboard file = new DTOboard(bid,title,content,author,bdate);
		
		return file;
	}

	
}
