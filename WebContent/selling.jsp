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
		배송관리
	</h1>
</div>	
</div>




<div class="container">
<div class="row" align="center">

<table class="table table-hover">
  <thead>
    <tr>
      <th scope="col">번호</th>
      <th scope="col">구매자</th>
      <th scope="col">구매물품</th>
      <th scope="col">주소</th>
      <th scope="col">전화번호</th>
      <th scope="col">가격</th>
      <th scope="col">구매날짜</th>
      <th scope="col">배송상태</th>
    </tr>
  </thead>
	

  <tbody>
       <%
 

ArrayList<DTOdelivery> deliverys = DAOdelivery.deliveryList();

for (DTOdelivery delivery : deliverys) {
%>	
    <tr>
 
      <th scope="row"><%=delivery.getDid()%></th>
      <td><a href="boarddetail.jsp?no=<%=delivery.getDid() %>"><%=delivery.getDmid()%></a></td>
      <td><%=delivery.getDpname() %></td>
      <td><%=delivery.getDmaddr() %></td>
      <td><%=delivery.getDmtel() %></td>
      <td><%=delivery.getDpprice() %></td>
      <td><%=delivery.getDdate() %></td>
	  <td><%=delivery.getDdone() %></td>
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