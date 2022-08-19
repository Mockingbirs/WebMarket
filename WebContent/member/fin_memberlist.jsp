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
<table class="table table-hover">
  <thead>
    <tr>
      <th scope="col">#</th>
      <th scope="col">이름</th>
      <th scope="col">전화번호</th>
      <th scope="col">회원등급</th>
      <th scope="col">사진명</th>
      <th scope="col">등록시간</th>
    </tr>
  </thead>
  
<tbody>

<%
	ArrayList<DTOmember> members = DAOmember.memberList();

for (DTOmember member : members) {
%>		

  
    <tr>
      <th scope="row"><%=member.getMno()%></th>
      <td><a href="fin_memberdetail.jsp?no=<%=member.getMno() %>"><%=member.getMname() %></a></td>
      <td><%=member.getMtel()%></td>
      <td><%=member.getMlevel()%></td>			
      <td><%=member.getIname() %><img src = "../images/<%=member.getIname()%> " width="25px" height="25px"></td>
      <td><%=member.getMdate()%></td>

    
    </tr>


	
<% 	
	}
%>

</tbody>
</table>
</div>


<a href="fin_memberinputpage.jsp" class="btn btn-primary" role = "button">등록</a>
 
 
 
 
 <%@ include file="../footer.jsp" %>
</body>
</html>