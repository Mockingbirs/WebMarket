<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import = "db.*" %>
<html>
<head>
     <%
    
      String mname = (String)session.getAttribute("mname"); 
      String mlevel = "5";
        String status = null;
       if (mname == null) {
          status = "방문을 환영합니다.로그인 해주세요";
          
      } else{
         status = mname + "님 방문을 환영합니다.";      
        mlevel = (String)session.getAttribute("mlevel");
      }
       
   
   %> 
   

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>



<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">






<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <div class="container-fluid">
    <a class="navbar-brand" href="welcome.jsp">Web Market</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    
    
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="welcome.jsp">Home</a>
        </li>
        
   <%   if (mname != null) {   %>
                     <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            게시판
          </a>
          <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="boardinputpage.jsp">게시글 등록</a></li>
            <li><a class="dropdown-item" href="boardlist.jsp">게시판 목록</a></li>
 
          </ul>
        </li>
        
        
               
                      <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            제품
          </a>
          <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="productlist.jsp">제품목록</a></li>
            <li><a class="dropdown-item" href="cart.jsp">장바구니</a></li>
            <li><a class="dropdown-item" href="buyinglist.jsp">구매내역</a></li>
            <li><a class="dropdown-item" href="delivery.jsp">배송확인</a></li>
          </ul>
        </li>
        
   <%} %>     
        
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            회원
          </a>
          <ul class="dropdown-menu">
             <%   if (mname == null) {   %>
            <li><a class="dropdown-item" href="login.jsp">로그인</a></li>
            <%} %>
      <%   if (mname != null) {   %>         
            <li><a class="dropdown-item" href="logout.jsp">로그아웃</a></li>
            <%} %>
            <li><hr class="dropdown-divider"></li>
           <%   if (mname == null) {   %>
            <li><a class="dropdown-item" href="memberinputpage.jsp">회원가입</a></li>
            <%} %>
               <%   if (mname != null) {   %>
            <li><a class="dropdown-item" href="memberout.jsp">회원탈퇴</a></li>
            <li><a class="dropdown-item" href="membereditpage.jsp">회원정보</a></li>
            <%} %>
          </ul>
        </li>
<% 
    if(mlevel.equals("1")){  %> 
               <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            관리자 전용
          </a>
          <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="members.jsp">회원관리</a></li>
            <li><a class="dropdown-item" href="products.jsp">제품관리</a></li>
            <li><a class="dropdown-item" href="selling.jsp">배송관리</a></li>
            <li><a class="dropdown-item" href="boards.jsp">게시판관리</a></li>
            
          </ul>
        </li>
        
      <% }
    else{ }%>  




 
<!--         
                <li class="nav-item">
          <a class="nav-link disabled">Disabled</a>
        </li>
         -->
  
      </ul>
      
<!--       <form class="d-flex" role="search">
        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
        <button class="btn btn-outline-success" type="submit">Search</button>
      </form> -->
      
      
 
<span class='text-white'><%=status%></span>

    </div>
  </div>
</nav>

<% %>

</body>
</html>