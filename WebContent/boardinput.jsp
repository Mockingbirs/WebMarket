<%@page import="util.*"%>
<%@page import="db.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="org.apache.commons.fileupload.*"%>
<%@ page import="org.apache.commons.fileupload.disk.*"%>
<%@ page import="org.apache.commons.fileupload.servlet.*"%>

<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>

<%@ include file="header.jsp" %>
<% String author = (String)session.getAttribute("mname"); 
   /* String title = request.getParameter("title");
   String content = request.getParameter("content"); */
%>
<% 
   String title = null;
   String content = null;
 
  
   
   ServletFileUpload sfu = new ServletFileUpload(new DiskFileItemFactory());

   List items = sfu.parseRequest(request);
   
   Iterator iter = items.iterator(); // Iterator = item에 순서 부여
   
   while(iter.hasNext()){
      FileItem item = (FileItem) iter.next(); //형변환
      String name = item.getFieldName();//키값 즉 이름을 추출
      
      
      if(item.isFormField()){
         //제목, 내용 등 이미지를 제외한 나머지 항목들을 차례대로 추출
         String value = item.getString("UTF-8");
         if(name.equals("title")) title = value;
         else if (name.equals("content")) content = value;
   
      }
      
   } 
   
   DAOboard.boardinsert(title,content, author);
   
   response.sendRedirect("boardlist.jsp");
%>

<%@ include file="footer.jsp" %>