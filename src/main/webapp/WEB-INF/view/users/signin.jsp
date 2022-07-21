<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page session="false"%>
<html>
<head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<title>회원 가입</title>
</head>
<style>
.nav-item {
	list-style-type: none;
	float: left;
	font-size: 55px;
}
.FieldError {
	color:red;
}
.nav-link {
	font-weight: 600;
	color: #000000;
	padding: 0 0.3125rem;
	font-size: 20px;
	font-size: 1.25rem;
}

.page-title {
	border-top: 10px solid black;
	border-bottom: 10px solid black;
	margin-bottom: 4rem;
}

.page-title h1 {
	padding: 2rem;
	text-align: center;
}

body {
	font-family: LeeSeoyun;
}

@font-face {
	font-family: 'LeeSeoyun';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2202-2@1.0/LeeSeoyun.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

a {
	text-decoration-line: none;
}
</style>
<body>
<div class="container">
	<header class="blog-header py-3" style = "height : 230px;">
		<div class="row flex-nowrap justify-content-between align-items-center">
			<div class="text-center">
				<img src = "logo.png" id='logo' style = "height:100px;"/>
			</div>
		</div>
		<br><br><br>
		<div class="nav-scroller mb-7" id = "list">
			<ul class="nav justify-content-center" style = "display:block;">
				<li class="nav-item mx-5">
					<a class="nav-link active p-7" aria-current="page" href="#" id = "nav1">About us</a>
					<div>
						<ul class="nav justify-content-end" style = "display : none;" id = "none1">
							<li class="nav-item">
								<a class="nav-link" aria-current="page" href="#" id = "detail">Active</a>
							</li>
							<li class="nav-item">
								<a class="nav-link" href="#" id = "detail">Link</a>
							</li>
							<li class="nav-item">
								<a class="nav-link" href="#" id = "detail">Link</a>
							</li>
							<li class="nav-item">
								<a class="nav-link" id = "detail">Disabled</a>
							</li>
						</ul>
					</div>
				</li>
				<li class="nav-item mx-5">
					<a class="nav-link" href="/exhibit" id = "nav2">exhibition</a>
				</li>
				<li class="nav-item mx-5">
					<a class="nav-link" href="./artist" id = "nav3">artist</a>
				</li>
				<li class="nav-item mx-5">
					<a class="nav-link" id = "nav4">Post</a>
					<ul class="nav justify-content-end" style = "display : none;" id = "none2">
						<li class="nav-item">
							<a class="nav-link" aria-current="page" href="./review" id = "detail">Review</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="./qna" id = "detail">Q&A</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="./FAQ" id = "detail">FAQ</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" id = "detail">Disabled</a>
						</li>
					</ul>
				</li>
				<li class="nav-item mx-5">
					<a class="nav-link" aria-current="page" href="#" id = "nav5">Member</a>
					<ul class="nav justify-content-end" style = "display : none;" id = "none3">
						<c:if test = "${user.id == null}">
							<li class="nav-item">
								<a class="nav-link" aria-current="page" href="/login" id = "detail">Login</a>
							</li>
							<li class="nav-item">
								<a class="nav-link" href="./signin" id = "detail">Sign in</a>
							</li>
						</c:if>
						<c:if test = "${user.id != null }">
							<li class="nav-item">
								<a class="nav-link" aria-current="page" href="/logout" id = "detail">Logout</a>
							</li>
						</c:if>
						<li class="nav-item">
							<a class="nav-link" href="#" id = "detail">My page</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" id = "detail">Disabled</a>
						</li>
					</ul>
				</li>
				<li class="nav-item mx-5">
					<a class="nav-link" aria-current="page" href="/notice" id = "nav6">Notice</a>
				</li>
			</ul>
		</div>
	</header>
</div>
<input type = "hidden" id = "role" value = "${user.role}">
<input type = "hidden" id = "usernum" value = "${user.userNum}">
<br><br>
	<!-- main 안에다가 주 내용 작성할것 -->
	<main class="p-5">
		<div class="container">
			<div class="page-title">
				<h1>회원가입</h1>
			</div>
		</div>
		<main class="container text-center">
			<form:form id = "frmAdd" action = "./signin" method = "POST" modelAttribute = "userSign">
				<div>
					<p>
						<label>ID</label> 
						<form:input path ="id" class = "form-control" />
						<form:errors path = "id" class = "FieldError" />
						<label class = "FieldError">${overlap} </label>
					</p>
					<p>
						<label>비밀번호</label> 
					    <form:password path = "password" class="form-control" id="floatingPassword" placeholder="Password" />
					    <form:errors path = "password" class = "FieldError"/>
					</p>
					<p>
						<label>비밀번호 확인</label> 
						<form:password path = "passwordCheck" class = "form-control" />
						<form:errors path = "passwordCheck" class = "FieldError"/>
						<label class = "FieldError">${passwordError}</label>
					</p>
					<p>
						<label>이름</label> 
						<form:input path ="name" class = "form-control" />
						<form:errors path = "name" class = "FieldError" />
					</p>
					<p>
						<label>E-mail</label> 
					      <form:input path = "email" class="form-control" id="floatingemail" placeholder="example@example.com" />
					      <form:errors path = "email" class = "FieldError"/>
					</p>
					<p>
						<label>우편번호</label> 
						<form:input path = "postcode" class="form-control" id="sample6_postcode" readonly ="true" placeholder="우편번호"/> 
						<form:errors path = "postcode" class = "FieldError"/>
							<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
					</p>
					<p>
						<label>주소</label> 
						<form:input path = "address" id="sample6_address" class="form-control"
							placeholder="주소" readonly ="true"/>
						<form:errors path = "address" class = "FieldError"/>
							<br>
					</p>
					<p>
						<label>상세주소</label> <br>
						<form:input path = "dtaddress" id="sample6_detailAddress"
							placeholder="상세주소"/>
						<form:errors path = "dtaddress" class = "FieldError"/> 
						<form:input path = "refAddress"	id="sample6_extraAddress" placeholder="참고항목" readonly = "true"/>
						<form:errors path = "refAddress" class ="FieldError" />
					</p>
					<p>
						<label>전화번호</label>
						<form:input path = "mobile" class = "form-control"/> <br>
						<form:errors path = "mobile" class = "FieldError"/>
					</p>
					<p class="w3-center">
						<button type="submit" id="updateBtn">회원 가입</button>
					</p>
				</div>
			</form:form>
		</main>
	</main>

	<!-- 하단 -->
	<div class="container-fluid">
		<footer
			class="d-flex flex-wrap justify-content-between align-items-center py-3 my-4 border-top">
			<p class="col-md-4 mb-0 text-muted">&copy; 2022 Company, Inc</p>

			<a href="/"
				class="col-md-4 d-flex align-items-center justify-content-center mb-3 mb-md-0 me-md-auto link-dark text-decoration-none">
				<svg class="bi me-2" width="40" height="32">
					<use xlink:href="#bootstrap" /></svg>
			</a>

			<ul class="nav col-md-4 justify-content-end">
				<li class="nav-item"><a href="#"
					class="nav-link px-2 text-muted">Home</a></li>
				<li class="nav-item"><a href="#"
					class="nav-link px-2 text-muted">Features</a></li>
				<li class="nav-item"><a href="#"
					class="nav-link px-2 text-muted">Pricing</a></li>
				<li class="nav-item"><a href="#"
					class="nav-link px-2 text-muted">FAQs</a></li>
				<li class="nav-item"><a href="#"
					class="nav-link px-2 text-muted">About</a></li>
			</ul>
		</footer>
	</div>

</body>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	$(document)
			.on('click','#logo',function(){
				document.location.href='/';
			})
	$(document).ready(function() {
		console.log("시작 화면");
		$("#nav1").hover(function() {
			$("#none1").css("display", "block");
			$("#none2").css("display", "none");
			$("#none3").css("display", "none");
		}, function() {
		})
		$("#nav2").hover(function() {
			$("#none1").css("display", "none");
			$("#none2").css("display", "none");
			$("#none3").css("display", "none");
		})
		$("#nav3").hover(function() {
			$("#none1").css("display", "none");
			$("#none2").css("display", "none");
			$("#none3").css("display", "none");
		})
		$("#nav4").hover(function() {
			$("#none1").css("display", "none");
			$("#none2").css("display", "block");
			$("#none3").css("display", "none");
		})
		$("#nav5").hover(function() {
			$("#none1").css("display", "none")
			$("#none2").css("display", "none");
			$("#none3").css("display", "block");
		})
		$("#nav6").hover(function() {
			$("#none1").css("display", "none")
			$("#none2").css("display", "none");
			$("#none3").css("display", "none");
		})
	})
	function sample6_execDaumPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

						// 각 주소의 노출 규칙에 따라 주소를 조합한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var addr = ''; // 주소 변수
						var extraAddr = ''; // 참고항목 변수

						//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
						if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
							addr = data.roadAddress;
						} else { // 사용자가 지번 주소를 선택했을 경우(J)
							addr = data.jibunAddress;
						}

						// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
						if (data.userSelectedType === 'R') {
							// 법정동명이 있을 경우 추가한다. (법정리는 제외)
							// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
							if (data.bname !== ''
									&& /[동|로|가]$/g.test(data.bname)) {
								extraAddr += data.bname;
							}
							// 건물명이 있고, 공동주택일 경우 추가한다.
							if (data.buildingName !== ''
									&& data.apartment === 'Y') {
								extraAddr += (extraAddr !== '' ? ', '
										+ data.buildingName : data.buildingName);
							}
							// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
							if (extraAddr !== '') {
								extraAddr = ' (' + extraAddr + ')';
							}
							// 조합된 참고항목을 해당 필드에 넣는다.
							document.getElementById("sample6_extraAddress").value = extraAddr;

						} else {
							document.getElementById("sample6_extraAddress").value = '';
						}

						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('sample6_postcode').value = data.zonecode;
						document.getElementById("sample6_address").value = addr;
						// 커서를 상세주소 필드로 이동한다.
						document.getElementById("sample6_detailAddress")
								.focus();
					}
				}).open();
	}
</script>
</html>
