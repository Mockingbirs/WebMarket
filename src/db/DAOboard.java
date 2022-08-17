package db;

import java.sql.*;

import javax.naming.NamingException;

import util.*;

public class DAOboard {
	
	// C create R read U update D delete
	
	//회원가입 (테이블에 데이터 넣기)
	public int join(String title,String memo) throws NamingException, SQLException {
		
		Connection conn = null;
		PreparedStatement stmt = null;
		
		String sql = "INSERT INTO tableboard(title, memo)VALUES(?,?)";
		
		//Connection Pool 이용
		conn= ConnectionPool.get();
		
		stmt = conn.prepareStatement(sql);
			stmt.setString(1, title);
			stmt.setString(2, memo);
		
		//결과가 0(실패)과 1(성공)로 넘어온다.
		int result = stmt.executeUpdate();
		
		
		return result;
	}
	
}