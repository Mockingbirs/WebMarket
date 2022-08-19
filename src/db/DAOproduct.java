package db;

import java.sql.*;
import java.util.ArrayList;

import javax.naming.NamingException;

import util.*;

public class DAOproduct {
	
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
	

	public static int productinsert(String pid, String pname, String pdesc, String pprice, String iname1, String iname2, String iname3) throws NamingException, SQLException  {

		
		  Connection conn = null;
		  
		  PreparedStatement stmt = null; 
		  
		  int result = 0;
		  
		 String sql = "INSERT INTO product (pid, pname, pdesc, pprice, iname1, iname2, iname3) VALUES(?,?,?,?,?,?,?)";
		  //Connection Pool 이용 conn= ConnectionPool.get();
		 conn= ConnectionPool.get();
		 
		  stmt = conn.prepareStatement(sql); 
		  stmt.setString(1, pid);
		  stmt.setString(2, pname);
		  stmt.setString(3, pdesc);
		  stmt.setString(4, pprice); 
		  stmt.setString(5, iname1);
		  stmt.setString(6, iname2);
		  stmt.setString(7, iname3);
		  
		  result = stmt.executeUpdate(); // 결과가 성공1 과 실패 0으로 넘어 온다.
		  
		  return result;
		 
	}
	
	public static ArrayList<DTOproduct> productList() throws NamingException, SQLException{
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		String sql = "SELECT * FROM product";
		
		conn = ConnectionPool.get();
		stmt = conn.prepareStatement(sql);
		rs = stmt.executeQuery();
		
		ArrayList<DTOproduct> products = new ArrayList<DTOproduct>();
		
		while(rs.next()) {
			products.add(new DTOproduct(rs.getString(1),
										rs.getString(2),
										rs.getString(3),
										rs.getString(4),
										rs.getString(5),
										rs.getString(6),
										rs.getString(7)));
		}
		return products;
	}
	
	
	public static DTOproduct productDetail(String pid) throws NamingException, SQLException {
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		String sql = "SELECT * FROM product WHERE pid=? ";
		conn= ConnectionPool.get();
		stmt = conn.prepareStatement(sql);
			stmt.setString(1, pid);	
		rs = stmt.executeQuery();
		
		rs.next();
		
		pid = rs.getString(1);
		String pname = rs.getString(2);
		String pdesc = rs.getString(3);
		String pprice = rs.getString(4);
		String iname1 = rs.getString(5);
		String iname2 = rs.getString(6);
		String iname3 = rs.getString(7);

		
		DTOproduct product = new DTOproduct(pid,pname,pdesc,pprice,iname1,iname2,iname3);
		
		return product;
	}

}
