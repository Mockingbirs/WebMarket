<%@page import="db.*"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="../header.jsp" %>



<h3>파일 목록</h3>

<div class= "container w-80 l-15">
<%
 

ArrayList<DTOboard> files = DAOboard.fileList();

for (DTOboard file : files) {
%>		
	<%=file.getBid()%>
	<a href="fin_boarddetail.jsp?no=<%=file.getBid() %>"><%=file.getTitle() %></a>
	<br>
	
<% 	
	}
%>

</div>
<a href="fin_boardinputpage.jsp" class="btn btn-primary" role = "button">등록</a>
 
 <%@ include file="../footer.jsp" %>
</body>
</html>