<%@page import="db.*"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원관리</title>

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




<h3>파일 목록</h3>

<div class="container">
<div class="row" align="center">

<table class="table table-hover">
  <thead>
    <tr>
      <th scope="col">회원번호</th>
      <th scope="col">이름</th>
      <th scope="col">전화번호</th>
      <th scope="col">이메일</th>
      <th scope="col">성별</th>
      <th scope="col">주소</th>
      <th scope="col">회원등급</th>
      <th scope="col">가입날짜</th>
    </tr>
  </thead>
	

  <tbody>
       <%
 

ArrayList<DTOmember> members = DAOmember.memberList();

for (DTOmember member : members) {
%>	
    <tr>
 
      <th scope="row"><%=member.getMno()%></th>
      <td><a href="membersdetail.jsp?no=<%=member.getMno() %>"><%=member.getMname() %></a></td>
      <td><%=member.getMtel() %></td>
      <td><%=member.getMemail() %></td>
	  <td><%=member.getMgender() %></td>
	  <td><%=member.getMaddr() %></td>
	  <td><%=member.getMlevel() %></td>
	  <td><%=member.getMdate() %></td>
    </tr>
  	
    <% 	
	}
%>  
    
</table>


</div>
</div>

 <%@ include file="footer.jsp" %>
</body>
</html>