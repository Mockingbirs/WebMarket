<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ page import="java.time.*" %>
<%@ page import="java.util.*" %>


<!-- CSS only -->
<!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous"> -->

<!-- <nav class="navbar navbar-dark bg-dark">
	<div class="container">	
		<div class="navbar-header">
			<a class="navbar-brand" href="welcome.jsp">Home
			</a>


		</div>
	</div>
</nav> -->

<%@ include file = "header.jsp" %>
<%! //선언문 사용
	String greeting = "Wlecome to Web Shopping Mall";
	String tagline = "Welcome to Web Market!";
%>


<!-- 표현문 사용  -->

<div class="alert alert-secondary" role="alert">
	<div class="container">
		<h1 class="display-3">
		<%=greeting %>
		</h1>
	</div>
</div>


	<div class="container">
		<div class="text-center">
		<%Date day = new java.util.Date();
		  LocalDate now = LocalDate.now();
/* 			int year = now.getYear();  년
			String month = now.getMonth().toString();  월 
			int monthV = now.getMonthValue();  월 
			String day = now.getDayOfMonth(); 일 */
			int hour = day.getHours();
			int minute = day.getMinutes();
			int second = day.getSeconds();
			
		%>
			<h2><%=tagline %></h2>
			<h3> 현재 접속 시간은 <%=now %> <%-- <%=year%>년 <%=month %>월  <%=day %>일 --%> <%=hour %>시 <%=minute %>분  <%=second %>초 입니다.</h3>
		
		</div>
	</div>

<!-- <footer class="container">
	<p> &copy; Young</p>
</footer> -->

<%@ include file="footer.jsp"%>



<!-- JavaScript Bundle with Popper -->
<!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
 -->
 </body>
</html>