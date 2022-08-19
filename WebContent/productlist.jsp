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
      <th scope="col">제품번호</th>
      <th scope="col">제품명</th>
      <th scope="col">상세설명</th>
      <th scope="col">가격</th>
      <th scope="col">사진명</th>
    </tr>
  </thead>
  
<tbody>

<%
	ArrayList<DTOproduct> products = DAOproduct.productList();

for (DTOproduct product : products) {
%>		

  
    <tr>
      <th scope="row"><%=product.getPid()%></th>
      <td><a href="productdetail.jsp?no=<%=product.getPid() %>"><%=product.getPname() %></a></td>
      <td><%=product.getPdesc()%></td>
      <td><%=product.getPprice()%></td>			
      <td><%=product.getIname1() %><img src = "images/<%=product.getIname1()%> " width="25px" height="25px"></td>
     

    
    </tr>


	
<% 	
	}
%>

</tbody>
</table>
</div>


<a href="productinputpage.jsp" class="btn btn-primary" role = "button">등록</a>
 
 
 
 
 <%@ include file="../footer.jsp" %>
</body>
</html>