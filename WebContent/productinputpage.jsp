<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.time.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  
  <!-- 서머노트를 위해 추가해야할 부분 -->
  <script src="${pageContext.request.contextPath}/resource/summernote/summernote-lite.js"></script>
  <script src="${pageContext.request.contextPath}/resource/summernote/lang/summernote-ko-KR.js"></script>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resource/summernote/summernote-lite.css">
  <!--  -->

</head>
<body>


<%@ include file = "header.jsp" %>


<!-- 표현문 사용  -->

<div class="alert alert-secondary" role="alert">
	<div class="container">
		<h1 class="display-3">
		제품등록
		</h1>
	</div>
</div>


<div class="container">
<form action="productinput.jsp" method="post" enctype="multipart/form-data">

	<div class="form-group row">
	<label class="col-sm-2">제품ID</label>
	<div class="col-sm-3">
	<input name="pid" type ="text" class="form-control" placeholder = "제품 아이디를 입력하세요">
	</div>
	</div>


	<div class="form-group row">
	<label class="col-sm-2">제품명</label>
	<div class="col-sm-3">
	<input name="pname" type ="text" class="form-control" placeholder = "제품명를 입력하세요">
	</div>
	</div>



	<div class="form-group row">
	<label class="col-sm-2">제품설명</label>
	
	<div class="container">
  <textarea class="summernote" name="pdesc"rows="5" cols="20" class="form-control" placeholder="제품설명을 입력하세요"></textarea>    
</div>
<script>
$('.summernote').summernote({
	  height: 150,
	  lang: "ko-KR"
	});
</script>
	
	
	</div>


	<div class="form-group row">
	<label class="col-sm-2">제품가격</label>
	<div class="col-sm-3">
	<input name="pprice" type ="text" class="form-control" placeholder = "제품 가격를 입력하세요">
	</div>
	</div>

<div class="form-group row">
<label class="col-sm-2">파일등록</label>
<div class="col-sm-3">
  <input type="file" name="image1" class="form-control" id="inputGroupFile02">
</div>
</div>

<div class="form-group row">
<label class="col-sm-2"></label>
<div class="col-sm-3">
  <input type="file" name="image2" class="form-control" id="inputGroupFile02">
</div>
</div>

<div class="form-group row">
<label class="col-sm-2"></label>
<div class="col-sm-3">
  <input type="file" name="image3" class="form-control" id="inputGroupFile02">
</div>
</div>
<br>
<br>



<div class="form-group row">


	<div class="col-sm-offset-2 col-sm-10">
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