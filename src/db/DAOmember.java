package db;

import java.sql.*;
import java.util.ArrayList;

import javax.naming.NamingException;

import util.*;

public class DAOmember {
	
	// C create R read U update D delete
	
	//회원가입 (테이블에 데이터 넣기)
	public int join(String mname,String mpass) throws NamingException, SQLException {
		
		Connection conn = null;
		PreparedStatement stmt = null;
		
		String sql = "INSERT INTO member(mname, mpass)VALUES(?,?)";
		
		//Connection Pool 이용
		conn= ConnectionPool.get();
		
		stmt = conn.prepareStatement(sql);
			stmt.setString(1, mname);
			stmt.setString(2, mpass);
		
		//결과가 0(실패)과 1(성공)로 넘어온다.
		int result = stmt.executeUpdate();
		
		
		return result;
	}
	

	public static int login(String mname, String mpass) throws NamingException, SQLException {
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		String sql = "SELECT mname, mpass FROM member WHERE mname = ?";
		conn=ConnectionPool.get();
		stmt=conn.prepareStatement(sql);
			stmt.setString(1, mname);
			
		rs = stmt.executeQuery();
		
		if(!rs.next())return 3;
		
		if(mpass.equals(rs.getString("mpass"))) return 1;
		
		return 2;
	}
	
	
		
	public static int memberinsert(String mname, String mpass, String mtel,String memail,String mgender,String maddr, String miname) throws NamingException, SQLException  {

		
		  Connection conn = null;
		  
		  PreparedStatement stmt = null; 
		  
		  int result = 0;
		  
		 String sql = "INSERT INTO member (mname,mpass, mtel, memail, mgender, maddr, miname) VALUES(?,?,?,?,?,?,?)";
		  //Connection Pool 이용 conn= ConnectionPool.get();
		 conn= ConnectionPool.get();
		 
		  stmt = conn.prepareStatement(sql); 
		  stmt.setString(1, mname);
		  stmt.setString(2, mpass);
		  stmt.setString(3, mtel);
		  stmt.setString(4, memail);
		  stmt.setString(5, mgender);
		  stmt.setString(6, maddr);
		  stmt.setString(7, miname); 

		  
		  result = stmt.executeUpdate(); // 결과가 성공1 과 실패 0으로 넘어 온다.
		  
		  return result;
		 
	}
	
	public static ArrayList<DTOmember> memberList() throws NamingException, SQLException{
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		String sql = "SELECT * FROM member";
		
		conn = ConnectionPool.get();
		stmt = conn.prepareStatement(sql);
		rs = stmt.executeQuery();
		
		ArrayList<DTOmember> members = new ArrayList<DTOmember>();
		
		while(rs.next()) {
			members.add(new DTOmember(rs.getString(1),
										rs.getString(2),
										rs.getString(3),
										rs.getString(4),
										rs.getString(5),
										rs.getString(6),
										rs.getString(7),
										rs.getString(8),
										rs.getString(9),
										rs.getString(10)));
		}
		return members;
	}
	
	
	public static DTOmember memberDetail(String mno) throws NamingException, SQLException {
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		String sql = "SELECT * FROM member WHERE mno=? ";
		conn= ConnectionPool.get();
		stmt = conn.prepareStatement(sql);
			stmt.setString(1, mno);	
		rs = stmt.executeQuery();
		
		rs.next();
		
		mno = rs.getString(1);
		String mname = rs.getString(2);
		String mpass = rs.getString(3);
		String mtel = rs.getString(4);
		String memail = rs.getString(5);
		String mgender = rs.getString(6);
		String maddr = rs.getString(7);
		String mlevel = rs.getString(8);
		String miname = rs.getString(9);
		String mdate = rs.getString(10);
		

		
		DTOmember member = new DTOmember(mno,mname,mpass,mtel,memail, mgender, maddr, mlevel,miname,mdate);
		
		return member;
	}
	
	public static DTOmember memberDetail2(String mname) throws NamingException, SQLException {
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		String sql = "SELECT * FROM member WHERE mname=? ";
		conn= ConnectionPool.get();
		stmt = conn.prepareStatement(sql);
			stmt.setString(1, mname);	
		rs = stmt.executeQuery();
		
		rs.next();
		
		String mno = rs.getString(1);
		 mname = rs.getString(2);
		String mpass = rs.getString(3);
		String mtel = rs.getString(4);
		String memail = rs.getString(5);
		String mgender = rs.getString(6);
		String maddr = rs.getString(7);
		String mlevel = rs.getString(8);
		String miname = rs.getString(9);
		String mdate = rs.getString(10);
		

		
		DTOmember member = new DTOmember(mno,mname,mpass,mtel,memail, mgender, maddr, mlevel,miname,mdate);
		
		return member;
	}
	
	public static DTOmember memberedit(String mname) throws NamingException, SQLException {
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		String sql = "SELECT * FROM member WHERE mname=? ";
		conn= ConnectionPool.get();
		stmt = conn.prepareStatement(sql);
			stmt.setString(1, mname);	
		rs = stmt.executeQuery();
		
		rs.next();
		
		String mno = rs.getString(1);
		mname = rs.getString(2);
		String mpass = rs.getString(3);
		String mtel = rs.getString(4);
		String memail = rs.getString(5);
		String mgender = rs.getString(6);
		String maddr = rs.getString(7);
		String mlevel = rs.getString(8);
		String miname = rs.getString(9);
		String mdate = rs.getString(10);
		

		
		DTOmember member = new DTOmember(mno,mname,mpass,mtel,memail, mgender, maddr, mlevel,miname,mdate);
		
		return member;
	}
	
	
	public static int memberout(String mname, String mpass) throws NamingException, SQLException {
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		String sql = "DELETE FROM member  WHERE (mname=?) and (mpass=?)";  
			
		//Connection Pool 이용
		conn= ConnectionPool.get();
		
		stmt = conn.prepareStatement(sql);
			stmt.setString(1, mname);
			stmt.setString(2, mpass);
		
		//결과가 0(실패)과 1(성공)로 넘어온다.
		int result = stmt.executeUpdate();
		
		
		return result;
	}
	
	
	

	
public static int memberUpdate(String mname, String mpass, String mtel,String memail,String mgender,String maddr, String miname) throws NamingException, SQLException  {

	
	  Connection conn = null;
	  
	  PreparedStatement stmt = null; 
	  
	  int result = 0;
	  
	 String sql = "UPDATE member SET mname=?,mpass=?, mtel=?, memail=?, mgender=?, maddr=?, miname=? WHERE mname=?";
	  //Connection Pool 이용 conn= ConnectionPool.get();
	 conn= ConnectionPool.get();
	 
	  stmt = conn.prepareStatement(sql); 
	  stmt.setString(1, mname);
	  stmt.setString(2, mpass);
	  stmt.setString(3, mtel);
	  stmt.setString(4, memail);
	  stmt.setString(5, mgender);
	  stmt.setString(6, maddr);
	  stmt.setString(7, miname); 
	  stmt.setString(8, mname);
	  
	  result = stmt.executeUpdate(); // 결과가 성공1 과 실패 0으로 넘어 온다.
	  
	  return result;
	 
}

}
