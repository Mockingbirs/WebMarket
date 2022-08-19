
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "db.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="../header.jsp" %>

<%
	String no = request.getParameter("no");

	DTOproduct product = DAOproduct.productDetail(no);
	
	String img1 = product.getIname1();
	String imgstr1 = "";
	
	
	if(img1 !=null) {
		imgstr1 = "images/" + img1;
	}
	
	String img2 = product.getIname2();
	String imgstr2 = "";
	if(img2 !=null) {
		imgstr2 = "images/" + img2;
	}
	
	String img3 = product.getIname3();
	String imgstr3 = "";
	if(img3 !=null) {
		imgstr3 = "images/" + img3;
	}
	
	
%>

<%=product.getPdesc()%>

<div id="carouselExampleIndicators" class="carousel slide w-25 h-25" data-bs-ride="true" >
  <div class="carousel-indicators">
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
  </div>
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="<%=imgstr1 %>" class="d-block w-100 h-100" alt="...">
    </div>
    <div class="carousel-item">
      <img src="<%=imgstr2 %>" class="d-block w-100 h-100" alt="...">
    </div>
    <div class="carousel-item">
      <img src="<%=imgstr3 %>" class="d-block w-100 h-100" alt="...">
    </div>
  </div>
  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
  </button>
</div>


<a href="productlist.jsp"><input type="button"  value="목록으로"></a>
	
	<%@ include file="../footer.jsp" %>
</body>
</html>
