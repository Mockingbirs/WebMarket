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
    <img class="mb-4" src="https://src.hidoc.co.kr/image/lib/2022/5/12/1652337370806_0.jpg" alt="" width="72" height="57">
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
    <a id="custom-login-btn" href="javascript:kakaoLogin()">
    <img src = "http://papaspick.com/web/upload/2019_web/icon/kakao_login.jpg" width="305px" height="50px">
 	</a>
  </form>
  
  
<!--   <a id="custom-login-btn" href="javascript:loginWithKakao()">
  <img
    src="//k.kakaocdn.net/14/dn/btroDszwNrM/I6efHub1SN5KCJqLm1Ovx1/o.jpg"
    width="222"
    alt="카카오 로그인 버튼"
  />
  
</a> -->

  
  
  <form action = "memberinputpage.jsp" >
    <button class="w-100 btn btn-lg btn-primary" type="submit">회원가입</button>  
  </form>
  
</main>


</div>

<br><br>

<%@ include file="footer.jsp" %>






for(){


sum =+ sum;

}out.print(sum)



<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>

<script>
// script
// 발급 받은 키
      Kakao.init("ac10446de9c5b1018c16a8217bca773c");

      function kakaoLogin() {
        window.Kakao.Auth.login({
          // 카카오 개발자 사이트의 동의항목에서 설정한 ID와 반드시 일치해야함
          scope: 'profile_nickname, account_email,gender',
          success: function (authObj) {
                console.log(authObj);
                window.Kakao.API.request({
                url:'/v2/user/me',
                success: res => {
                    const kakaoAccount = res.kakao_account;
					location.href='kakaocheck.jsp?mname=' + kakaoAccount.profile.nickname

							+ '&memail=' + kakaoAccount.email
							+ '&mgender=' + kakaoAccount.gender
;
					
                }
                });


          }
        });
      }
      </script>
<!-- <script type="text/javascript">
  function loginWithKakao() {
    Kakao.Auth.login({
      success: function(authObj) {
        alert(JSON.stringify(authObj))
      },
      fail: function(err) {
        alert(JSON.stringify(err))
      },
    })
  }
</script> -->
</body>
</html>