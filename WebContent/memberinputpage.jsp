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


 <%@ include file = "header.jsp" %> 

<!-- 표현문 사용  -->

<div class="alert alert-secondary" role="alert">
	<div class="container">
		<h1 class="display-3">
		회원가입
		</h1>
	</div>
</div>


<div class="container">

<form action="memberinput.jsp" method="post" enctype="multipart/form-data">

	<div class="form-group row">
	<label class="col-sm-2">ID</label>
	<div class="col-sm-3">
	<input name="mname" type ="text" class="form-control" placeholder = "아이디를 입력하세요">
	</div>
	</div>

<br>

	<div class="form-group row">
	<label class="col-sm-2">Password</label>
	<div class="col-sm-3">
	<input name="mpass" type ="password" class="form-control" placeholder = "비밀번호를 입력하세요">
	</div>
	</div>

<br>

	<div class="form-group row">
	<label class="col-sm-2">전화번호</label>
	<div class="col-sm-3">
	<input name="mtel" type ="text" class="form-control" placeholder = "전화번호를 입력하세요">
	</div>
	</div>
	
	<br>
	
		<div class="form-group row">
	<label class="col-sm-2">이메일</label>
	<div class="col-sm-3">
	<input name="memail" type ="text" class="form-control" placeholder = "이메일을 입력하세요">
	</div>
	</div>

<br>

		<label class="col-sm-2">성별</label>
<div class="form-check form-check-inline">
  <input class="form-check-input" type="radio" name="mgender" id="inlineRadio1" value="남성">
  <label class="form-check-label" for="inlineRadio1">남성</label>
</div>
<div class="form-check form-check-inline">
  <input class="form-check-input" type="radio" name="mgender" id="inlineRadio2" value="여성">
  <label class="form-check-label" for="inlineRadio2">여성</label>
</div>

<br>
<br>

		<div class="form-group row">
	<label class="col-sm-2">주소</label>
	<div class="col-sm-3">
	<input name="maddr" type ="text" class="form-control " placeholder = "주소를 입력하세요">
	</div>
	</div>
	
	<br>
	
	<div class="form-group row">
	<label class="col-sm-2">사진등록</label>
	<div class="col-sm-3">
  	<input type="file" name="image1" class="form-control" id="inputGroupFile02">
	</div>
	</div>

<br>
<br>



<div class="form-group row" >

	<div class="col-sm-offset-2 col-sm-10 mx-auto">
	<label class="col-sm-2"></label>
	<div class="col-sm-3">
	<input type="submit" class="btn btn-primary" value="등록">

	<input type="reset" class="btn btn-danger" value="취소" onclick="reset()">
	</div>
	</div>
	</div>


</form>

</div>
<br>

<%@ include file="footer.jsp"%>


 </body>
</html>