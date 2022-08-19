<%@page import="util.*"%>
<%@page import="db.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="org.apache.commons.fileupload.*"%>
<%@ page import="org.apache.commons.fileupload.disk.*"%>
<%@ page import="org.apache.commons.fileupload.servlet.*"%>

<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>

<%@ include file="../header.jsp" %>

<% 
   String mname = null;
   String mtel = null;
   String iname = null; // 이미지 명은 데이터에 들어감
   byte[] ifile = null; //이미지는 byte로 뽑기 데이터에는 들어가지 않음
   
   ServletFileUpload sfu = new ServletFileUpload(new DiskFileItemFactory());

   List items = sfu.parseRequest(request);
   
   Iterator iter = items.iterator(); // Iterator = item에 순서 부여
   
   while(iter.hasNext()){
      FileItem item = (FileItem) iter.next(); //형변환
      String name = item.getFieldName();//키값 즉 이름을 추출
      
      
      if(item.isFormField()){
         //제목, 내용 등 이미지를 제외한 나머지 항목들을 차례대로 추출
         String value = item.getString("UTF-8");
         if(name.equals("mname")) mname = value;
         else if (name.equals("mtel")) mtel = value;
      }else{
         //이미지이름과 이미지파일 추출 
         if(name.equals("image")){
            iname = item.getName();
            ifile = item.get();
            
            String root = application.getRealPath(java.io.File.separator);
            FileUtil.saveImage(root,iname,ifile);
         }
      }
   }
   
   DAOmember.memberinsert(mname,mtel,iname);
   
   response.sendRedirect("fin_memberlist.jsp");
%>

<%@ include file="../footer.jsp" %>