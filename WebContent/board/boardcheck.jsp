<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ page import = "db.*" %>

	<%request.setCharacterEncoding("utf-8"); %>

    <%
    
    String title = request.getParameter("title");
 	String content = request.getParameter("content"); 
 	
 	DAOboard b = new DAOboard();
 	b.boardinsert(title, content, image);
 	
    
    %>