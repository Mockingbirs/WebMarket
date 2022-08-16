<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.sql.*" %>
<%@ page import="member.*" %>

    <%
    //JSP로 DB 연결 방법 3/4
 	Connection conn =null;
    conn = member.getConnection();
    
    //4. Statement Object
    PreparedStatement pstmt = null;  //구문객체 초기화
    

   
    String sql = "CREATE DATABASE member";
    pstmt = conn.prepareStatement(sql);
    
  
    
    pstmt.executeUpdate();
    

 	pstmt.close();
    conn.close();
    %>