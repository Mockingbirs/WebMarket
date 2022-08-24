package db;

import java.sql.*;
import java.util.ArrayList;

import javax.naming.NamingException;

import util.*;

public class DAOdelivery {
	
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
	

	public static int deliveryinsert( String dpid, String dmid, String dmaddr, String dmtel, String dpname, String dpprice) throws NamingException, SQLException  {

		
		  Connection conn = null;
		  
		  PreparedStatement stmt = null; 
		  
		  int result = 0;
		  
		 String sql = "INSERT INTO delivery (dpid, dmid, dmaddr, dmtel, dpname, dpprice) VALUES(?,?,?,?,?,?)";
		  //Connection Pool 이용 conn= ConnectionPool.get();
		 conn= ConnectionPool.get();
		 
		  stmt = conn.prepareStatement(sql); 
		  stmt.setString(1, dpid);
		  stmt.setString(2, dmid);
		  stmt.setString(3, dmaddr);
		  stmt.setString(4, dmtel); 
		  stmt.setString(5, dpname);
		  stmt.setString(6, dpprice);
		  
		  
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
