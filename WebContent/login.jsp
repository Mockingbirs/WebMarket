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
		로그인
	</h1>
</div>	
</div>

<div class="container"  style="max-width: 330px">

<main class="form-signin">
  <form action = "logincheck.jsp" >
  <div class="d-flex justify-content-center">
    <img class="mb-4" src="http://austiny.snu.ac.kr/image/mine.jpg" alt="" width="72" height="57">
        </div>
    <div class="form-floating">
      <input type="text" name="mname" class="form-control" id="floatingInput" placeholder="아이디를 입력하세요">
      <label for="floatingInput">아이디/별명</label>
    </div>
    <div class="form-floating">
      <input type="password" name="mpass" class="form-control" id="floatingPassword" placeholder="비밀번호를 입력하세요">
      <label for="floatingPassword">비밀번호</label>
    </div>
<div class="d-flex justify-content-end">
    <div class="checkbox mb-3">
      <label>
        <input type="checkbox" value="remember-me"> 자동 로그인
      </label>
    </div>
        </div>
    <button class="w-100 btn btn-lg btn-primary" type="submit">로그인</button>
    <img src = "http://papaspick.com/web/upload/2019_web/icon/kakao_login.jpg" width="305px" height="50px">
  </form>
  
  
  <form action = "memberinputpage.jsp" >
    <button class="w-100 btn btn-lg btn-primary" type="submit">회원가입</button>  
  </form>
  
</main>


</div>

<br><br>

<%@ include file="footer.jsp" %>

</body>
</html>