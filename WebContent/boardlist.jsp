<%@page import="db.*"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>

<%@ include file="header.jsp" %>
<%
mname = (String)session.getAttribute("mname"); 

if(mname == null){
	out.println("<script>alert('로그인이 필요합니다.');</script>");
	out.println("<script>location.href='login.jsp'</script>");
}
    %>
</head>
<body>

<div class="alert alert-secondary" role="alert">
<div class="container">

	<h1 class = "display-3">
		파일목록
	</h1>
</div>	
</div>




<div class="container">
<div class="row" align="center">

<table class="table table-hover">
  <thead>
    <tr>
      <th scope="col">번호</th>
      <th scope="col">제목</th>
      <th scope="col">작성자</th>
      <th scope="col">날짜</th>
    </tr>
  </thead>
	

  <tbody>
       <%
 

ArrayList<DTOboard> files = DAOboard.fileList();

for (DTOboard file : files) {
%>	
    <tr>
 
      <th scope="row"><%=file.getBid()%></th>
      <td><a href="boarddetail.jsp?no=<%=file.getBid() %>"><%=file.getTitle() %></a></td>
      <td><%=file.getAuthor() %></td>
      <td><%=file.getBdate() %></td>

    </tr>
  	
    <% 	
	}
%>  
    
</table>


</div>
</div>
<a href="boardinputpage.jsp" class="btn btn-primary" role = "button">등록</a>
 
 <%@ include file="footer.jsp" %>
</body>
</html>