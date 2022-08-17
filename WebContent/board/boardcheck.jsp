<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ page import = "db.*" %>

	<%request.setCharacterEncoding("utf-8"); %>

    <%
    
    String title = request.getParameter("title");
 	String memo = request.getParameter("memo"); 
 	
 	DAOboard b = new DAOboard();
 	b.join(title, memo);
 	
    
    %>