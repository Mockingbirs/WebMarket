<%@page import="db.*"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ include file="header.jsp" %>   
 
    <%
     mname = (String)session.getAttribute("mname");
    
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
	
 	String img =  product.getIname1();  
	String imgstr = "";
	if (img != null) {
		imgstr = "images/" + img;
	} 
	

%>		
<div class="col-md-4">




<div class="card" style="width: 18rem;">
  <img src="<%=imgstr %>" class="card-img-top" alt="사진이 없습니다" style="width: 18rem; height: 9rem;">
  <div class="card-body">
    <h5 class="card-title">제품명 : <%=product.getPname() %></h5>
    <p class="card-text">가격 : <%=product.getPprice() %></p>
    <p class="card-text">설명 : <%=product.getPdesc()%></p>
    <a href="productdetail.jsp?pid=<%=product.getPid()%>" class="btn btn-primary">제품 상세보기</a>
  </div>
</div>

</div>




<% 	
	}
%>

</div>
</div>



<% 
    if(mlevel.equals("1")){  %> 

<a href="productinputpage.jsp" class="btn btn-primary" role = "button">등록</a>
 
     <% }%>
 
 
 <%@ include file="footer.jsp" %>
</body>
</html>