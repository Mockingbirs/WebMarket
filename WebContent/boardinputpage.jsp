<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="db.*" %>
<!DOCTYPE html>
<html>
<head>
<%@ include file="header.jsp" %>
<%
mname = (String)session.getAttribute("mname"); 

if(mname == null){
	out.println("<script>alert('로그인이 필요합니다.');</script>");
	out.println("<script>location.href='login.jsp'</script>");
}
    
   
    
    %>
<meta charset="UTF-8">
<title>게시판 작성</title>

  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css">
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



<div class="alert alert-secondary" role="alert">
<div class = "container">
   <h1 class = "display-3">
   Board
   </h1>
</div>
</div>

<div class="container">
<form action="boardinput.jsp" method="post" enctype="multipart/form-data">
   <div class = "form-group row">
   <label class = "col-sm-1">제목</label>
   <div class ="col-sm-10">
      <input name = "title" type="text" class="form-control" placeholder ="제목을 입력하세요">
   </div>
   </div>
   
   
      <div class="form-group row">
      <label class="col-sm-1">내용</label>
      </div>
      <div class="container col-10">
  <textarea class="summernote" name="content" ></textarea>    

<script>
$('.summernote').summernote({
	  height: 150,
	  lang: "ko-KR"
	});
</script>
      </div>
      
       
   <br>
   <br>
   
   <div class="form-group row">
   <div class="col-sm-offset-2 col-sm-10">
      <input type="submit" class="btn btn-primary" value="등록">
         <input type="reset" class="btn btn-primary" value="취소" onclick="reset()">      
   </div>
   </div>
</form>
</div>



<%@ include file="footer.jsp" %>

</body>
</html>