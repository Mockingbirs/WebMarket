<%@page import="db.*"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    String mname = (String)session.getAttribute("mname");
    
    if(mname == null){
    	out.println("<script>alert('로그인이 필요합니다.');</script>");
    	out.println("<script>location.href='login.jsp'</script>");
    }
    
    boolean login = true;
    
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


<%@ include file="header.jsp" %>

      <%
      	if(login){
      		out.print(mname +"님 로그인 상태입니다.");     		
      	}else {
      		out.print("방문을 환영합니다.로그인 하세요.");
      	}
      	
      %>

<%-- 
<h3>파일 목록</h3>

<div class= "container w-80 h-15">
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
</div> --%>

<div class="alert alert-secondary" role="alert">
<div class="container">
	<h1 class = "display-3">제품 목록</h1>
</div>	
</div>


<%


ArrayList<DTOproduct> products = DAOproduct.productList();
%>
<div class="container">
<div class="row" align="center">
<% 
for (DTOproduct product : products) {
%>		
<div class="col-md-4">
	<h3><a href="productdetail.jsp?pid=<%=product.getPid()%>"><%=product.getPname() %></a></h3>
	<p><%=product.getPdesc() %></p>
	<p><%=product.getPprice() %></p>
</div>

<% 	
	}
%>
</div>
</div>





<a href="productinputpage.jsp" class="btn btn-primary" role = "button">등록</a>
 
 
 
 
 <%@ include file="footer.jsp" %>
</body>
</html>