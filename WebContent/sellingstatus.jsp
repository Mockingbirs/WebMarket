<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@page import="db.*"%>
<%@page import="java.util.*"%>

<%@ include file="header.jsp" %>

<%
mname = (String)session.getAttribute("mname"); 
String did = request.getParameter("did");

if(mname == null){
	out.println("<script>alert('로그인이 필요합니다.');</script>");
	out.println("<script>location.href='login.jsp'</script>");
}else{
DAOdelivery.statusEdit(did);

out.println("<script>location.href='selling.jsp'</script>");
}
%>