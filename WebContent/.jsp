<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">

<nav class="navbar navbar-dark bg-dark">
	<div class="container">	
		<div class="navbar-header">
			<a class="navbar-brand" href="Welcome.jsp">Home
			</a>


		</div>
	</div>
</nav>
<%! //선언문 사용
	String greeting = "Wlecome to Web Shopping Mall";
	String tagline = "Welcome to Web Market!";
%>

<!-- 표현문 사용  -->
<h1><%=greeting %></h1>
<h2><%=tagline %></h2>




<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
</body>
</html>