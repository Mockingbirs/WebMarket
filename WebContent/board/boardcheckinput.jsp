<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.time.*" %>
<%@ page import="java.util.*" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


<%@ include file = "/header.jsp" %>




<!-- 표현문 사용  -->

<div class="alert alert-secondary" role="alert">
	<div class="container">
		<h1 class="display-3">
		메모장
		</h1>
	</div>
</div>


<div class="container">
<form action="boardcheck.jsp" method="post">



<div class="form-group row">
	<label class="col-sm-2">제목</label>
	<div class="col-sm-3">
	<input name="title" type ="text" class="form-control" placeholder = "제목을 입력하세요">
	</div>
	</div>


	<div class="form-group row">
	<label class="col-sm-2">내용</label>
	<div class="col-sm-3">
		<textarea name="content" rows="5" cols="20" class="form-control" placeholder="내용을 입력하세요"></textarea>
	</div>
	</div>

	

<div class="form-group row">
	<div class="col-sm-offset-2 col-sm-10">
	<input type="submit" class="btn btn-primary" value="등록">
	<input type="reset" class="btn btn-danger" value="취소" onclick="reset()">
	
	</div>
	</div>
	

</form>

</div>

<%@ include file="/footer.jsp"%>




 </body>
</html>