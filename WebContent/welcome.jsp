<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ page import = "java.util.*" %> 
    <%@ page import = "java.time.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


<%@ include file="header.jsp" %>

<%! //선언문 사용

   String greeting =  "Welcome to Web Shopping Mall";
   String tagline = "Welcome to Web Market!";

%>

<!-- 표현문 사용 -->

<div class="alert alert-secondary" role="alert">
<div class="container">

   <h1 class = "display-3">
      <%= greeting %>
   </h1>
</div>   
</div>

<div class = "container">
<div class = "text-center">
   <h3><%= tagline %></h3>
   <%
   Date day =new java.util.Date();
   LocalDate now = LocalDate.now();
   /*
   int year = mow.getYear();
   String month = now.getMonth().toString();
   int monthV = now.getMonthValue();
   int day = now.getDayOfMonth();
   */
   
   
   int hour = day.getHours();
   int minute = day.getMinutes();
   int second = day.getSeconds();
   %>
   
   <p class="text-danger font-weight-bold"><small>현재 접속 시간은 <%=now%><%=hour%>:<%=minute%>:<%=second%>:  입니다.</small> </p>
</div>
</div>

<%@ include file="footer.jsp" %>


</body>
</html>