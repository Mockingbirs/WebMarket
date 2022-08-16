<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.sql.*" %>

<%@ page import="member.*" %>

    <%
    
    	request.setCharacterEncoding("utf-8");
    
    //JSP로 DB 연결 방법 3/4
 	Connection conn =null;
    conn = member.getConnection();
    
    //4. Statement Object
    PreparedStatement pstmt = null;  //구문객체 초기화
   

    String mname = request.getParameter("mname");
 	String mtel = request.getParameter("mtel");
 
  
    
    
    
    String sql = "INSERT INTO member(mname,mtel) VALUES(?,?)";
    
    	pstmt = conn.prepareStatement(sql);
    	
    
    	pstmt.setString(1, mname);
    	pstmt.setString(2, mtel);
    	

    	
    	        pstmt.executeUpdate();
        
 
     	pstmt.close();
        conn.close();
        
        %>