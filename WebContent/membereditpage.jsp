<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.time.*" %>
<%@ page import="java.util.*" %>
<%@ page import="db.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보</title>
 
<%@ include file="header.jsp" %>
<%
mname = (String)session.getAttribute("mname"); 
String mno = (String)session.getAttribute("Mno"); 

if(mname == null){
	out.println("<script>alert('로그인이 필요합니다.');</script>");
	out.println("<script>location.href='login.jsp'</script>");
}

DTOmember member = DAOmember.memberDetail(mno);






%>
 
</head>

<body>


<!-- 표현문 사용  -->

<div class="alert alert-secondary" role="alert">
	<div class="container">
		<h1 class="display-3">
		회원정보
		</h1>
	</div>
</div>


<div class="container">

<form action="membereditcheck.jsp" method="post" enctype="multipart/form-data">

	<div class="form-group row">
	<label class="col-sm-2">ID</label>
	<div class="col-sm-3">
	<input name="mname" type ="text" class="form-control" 
	value="<%=member.getMname()%>" >
	</div>
	</div>

<br>

	<div class="form-group row">
	<label class="col-sm-2">Password</label>
	<div class="col-sm-3">
	<input name="mpass" type ="text" class="form-control" value="<%=member.getMpass()%>">
	</div>
	</div>

<br>

	<div class="form-group row">
	<label class="col-sm-2">전화번호</label>
	<div class="col-sm-3">
	<input name="mtel" type ="text" class="form-control" value="<%=member.getMtel()%>">
	</div>
	</div>
	
	<br>
	
		<div class="form-group row">
	<label class="col-sm-2">이메일</label>
	<div class="col-sm-3">
	<input name="memail" type ="text" class="form-control" value="<%=member.getMemail()%>">
	</div>
	</div>

<br>

		<label class="col-sm-2">성별</label>
			<%
			if ((member.getMgender()).equals("남성")) {
					%>
<div class="form-check form-check-inline">
  <input class="form-check-input" type="radio" name="mgender" id="inlineRadio1" value="남성" checked>
  <label class="form-check-label" for="inlineRadio1">남성</label>
</div>
<div class="form-check form-check-inline">
  <input class="form-check-input" type="radio" name="mgender" id="inlineRadio2" value="여성">
  <label class="form-check-label" for="inlineRadio2">여성</label></div>
  <%	} else {%>	<div class="form-check form-check-inline">
  <input class="form-check-input" type="radio" name="mgender" id="inlineRadio1" value="남성" >
  <label class="form-check-label" for="inlineRadio1">남성</label>
</div>
<div class="form-check form-check-inline">
  <input class="form-check-input" type="radio" name="mgender" id="inlineRadio2" value="여성" checked>
  <label class="form-check-label" for="inlineRadio2">여성</label></div>
  <%	} %>	

<br>
<br>

		<div class="form-group row">
	<label class="col-sm-2">주소</label>
	<div class="col-sm-3">
	<input name="maddr" type ="text" class="form-control " value="<%=member.getMaddr()%>">
	</div>
	</div>
	
	<br>
	
	<div class="form-group row">
	<label class="col-sm-2">사진등록</label>
	<div class="col-sm-3">
  	<input type="file" name="image1" class="form-control" id="inputGroupFile02">
	</div>
	</div>

<script>  //사진 불러오는 방법
    // Get a reference to our file input
    const fileInput = document.querySelector('input[type="file"]');

    // Create a new File object
    const myFile = new File(['Hello World!'], '<%=member.getMiname() %>', {
        type: 'text/plain',
        lastModified: new Date(),
    });

    // Now let's create a DataTransfer to get a FileList
    const dataTransfer = new DataTransfer();
    dataTransfer.items.add(myFile);
    fileInput.files = dataTransfer.files;
</script>


<br>
<br>



<div class="form-group row">

	<div class="col-sm-offset-2 col-sm-10 mx-auto">
	<label class="col-sm-2"></label>
	<div class="col-sm-3">
	<input type="submit" class="btn btn-primary" value="변경">

	<input type="reset" class="btn btn-danger" value="취소" onclick="reset()">
	
<input type="button" class="btn btn-danger" value="탈퇴" onClick="confirm_onClick();">

<script>
	function confirm_onClick() {
		var answer = confirm("정말 탈퇴하시겠습니까?");
		
	if (answer) {
		location.href = "memberout.jsp";
	} else {
		history.back();
	}	
	}
</script>

	</div>
	</div>
	</div>
</form>



 


</div>
<br>

<%@ include file="footer.jsp"%>


 </body>
</html>