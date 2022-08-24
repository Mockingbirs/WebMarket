<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>

  <meta name="viewport" content="width=device-width, initial-scale=1">

</head>
<body>

<%@ include file="header.jsp" %>


<div class="alert alert-secondary" role="alert">
<div class="container">

	<h1 class = "display-3">
		회원탈퇴
	</h1>
</div>	
</div>

<div class="container"  style="max-width: 330px">

<main class="form-signin">
  <form action = "memberoutcheck.jsp" >
 
    <div class="form-floating">
      <input type="password" name="mpass" class="form-control" id="floatingPassword" placeholder="비밀번호를 입력하세요">
      <label for="floatingPassword">비밀번호</label>
    </div>

    
    <button class="w-100 btn btn-lg btn-primary" type="submit">탈퇴</button>  <
  </form>
  

  
</main>


</div>

<br><br>

<%@ include file="footer.jsp" %>

</body>
</html>