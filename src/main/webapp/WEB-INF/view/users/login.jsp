<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>        
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
<link
      href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&family=Water+Brush&display=swap"
      rel="stylesheet"
/>
<title>로그인 창</title>
</head>
<style>
html,
body {
  height: 100%;
}
h1, label, p, form {
	  font-family: "Noto Sans KR", sans-serif;
}
.FieldError {
	color:red;
}
body {
  display: flex;
  align-items: center;
  padding-top: 40px;
  padding-bottom: 40px;
  background-color: #f5f5f5;
}

.form-signin {
  width: 100%;
  max-width: 330px;
  padding: 15px;
  margin: auto;
}

.form-signin .checkbox {
  font-weight: 400;
}

.form-signin .form-floating:focus-within {
  z-index: 2;
}

.form-signin input[type="email"] {
  margin-bottom: -1px;
  border-bottom-right-radius: 0;
  border-bottom-left-radius: 0;
}

.form-signin input[type="password"] {
  margin-bottom: 10px;
  border-top-left-radius: 0;
  border-top-right-radius: 0;
}
</style>
<body class="text-center">
<main class= "form-signin">
<form action="./kakaologin.do" method="post" name="lfrm" hidden>
    <input type="text" name="kakaoemail" id="kakaoemail" value="" />
</form>
<form:form id = "frmAdd" action = "/login" method = "POST" modelAttribute = "user">
	<h1 class="h3 mb-3 fw-normal">로그인</h1>

    <div class="form-floating">
      <form:input path = "id" class="form-control" id="floatingInput" placeholder="name@example.com" />
      <form:errors path = "id" class = "FieldError"/>
      <label for="floatingInput">아이디를 입력하세요</label>
    </div>
    <div class="form-floating">
      <form:password path = "password" class="form-control" id="floatingPassword" placeholder="Password" />
      <form:errors path = "password" class = "FieldError"/>
      <label for="floatingPassword">비밀번호를 입력하세요</label>
    </div>
    <label class = "FieldError">${loginFail}</label>
    <button class="w-100 btn btn-lg btn-primary" type="submit" >로그인</button>
    <div class="form-floating">
        <div><b>or</b></div>
    </div>
    <div class="form-floating" id="kakaologin">
        <div class="kakaobtn">
            <a href="https://kauth.kakao.com/oauth/authorize?client_id=11afdf6f295b3f272c88971d1ea73cdd&redirect_uri=http://localhost:8080/auth/kakao/callback&response_type=code">
                <img src="/loginButton.png" width="300px" height="47px"/>
            </a>
        </div>
        <div class="form-floating" id="googleLogin">
            <div class="googlebtn">
                <a href="/google/login">
                    <img src="/googleLogin.png" width="300px" height="47px" style="margin-top: 8px; border-radius: 5px;"/>
                </a>
            </div>
    <p class="mt-5 mb-3 text-muted">&copy; 2017–2022</p>
</div>
</form:form>
</main>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</html>