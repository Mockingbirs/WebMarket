<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.sql.*" %>

    <% 

    
    String driverClass = "com.mysql.jdbc.Driver";
    Class.forName(driverClass);
    
 
    Connection conn = null;
    
    String url = "jdbc:mysql://localhost:3306/webmarket";
    String id = "root";
    String pw = "0000";
    
    conn = DriverManager.getConnection(url, id, pw);
    
   
   
    PreparedStatement pstmt = null;  //구문객체 초기화
    
    String sql = "CREATE TABLE tableboard("
    +" title  varchar(50),"
    +" memo  varchar(500))";
    /* +" primary key(title))"; */
    pstmt = conn.prepareStatement(sql);
    
  
    
    pstmt.executeUpdate();
    

 	pstmt.close();
    conn.close();
    %>