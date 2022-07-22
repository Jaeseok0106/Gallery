<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<title>NOTICE</title>
</head>
<style>
table {
  border-collapse: separate;
  border-spacing: 0 10px;
}
.nav-item{
list-style-type:none;
float:left;
font-size: 55px;
}
.nav-link {
    font-weight: 600;
    color: #000000;
    padding: 0 0.3125rem;
    font-size: 20px;
    font-size: 1.25rem;
}
#detail {
	font-size: 0.7rem;
}
#detail {
	font-size: 0.7rem;
}
.page-title {
	border-top: 10px solid black;
	border-bottom : 10px solid black;
	margin-bottom : 2rem;
}
.page-title h1{
	padding : 2rem;
	text-align : center;
}
body {
	font-family : LeeSeoyun;
}
@font-face {
    font-family: 'LeeSeoyun';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2202-2@1.0/LeeSeoyun.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
a {
	text-decoration: none;
	color:black;
}
.pagination{
	justify-content: center;
}
#selSort{
	width: 70px;
	height: 30px;
	text-align: center;
}
#type {
	width: 90px;
	height: 30px;
	text-align: center;
}
#btnSearch {
	margin-bottom: 3.5px;
}
</style>
<body>
<div class="container">
	<header class="blog-header py-3" style = "height : 230px;">
		<div class="row flex-nowrap justify-content-between align-items-center">
			<div class="text-center">
				<img src = "logo.png" id='logo' style = "height:80px;"/>
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
								<a class="nav-link" aria-current="page" href="/letter" id = "detail">director's letter</a>
							</li>
							<li class="nav-item">
								<a class="nav-link" aria-current="page" href="/visit" id = "detail">Visit</a>
							</li>
						</ul>
					</div>
				</li>
				<li class="nav-item mx-5">
					<a class="nav-link" href="/exhibit" id = "nav2">exhibition</a>
				</li>
				<li class="nav-item mx-5">
					<a class="nav-link" href="/artist" id = "nav3">artist</a>
				</li>
				<li class="nav-item mx-5">
					<a class="nav-link" id = "nav4">Post</a>
					<ul class="nav justify-content-end" style = "display : none;" id = "none2">
						<li class="nav-item">
							<a class="nav-link" aria-current="page" href="/review" id = "detail">Review</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="/qna" id = "detail">Q&A</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="/FAQ" id = "detail">FAQ</a>
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
								<a class="nav-link" href="/signin" id = "detail">Sign in</a>
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
<main class = "container p-5">
	<div class = "container">
		<div class = "page-title">
			<h1>NOTICE</h1>
		</div>
	</div>
	<form id="serform">
		<div class = "col-12 text-end">
			<select size="1" id="selSort">
				<option value="date">날짜순</option>
				<option value="view">조회순</option>
				<option value="heart">추천순</option>
			</select>
			<select size="1" id="type" name="type">
				<option value="">검색조건</option>
				<option value="tc">제목+내용</option>
				<option value="t">제목</option>
				<option value="c">내용</option>
			</select>
			<input style = "width:15%;" type="text" placeholder="검색어를 입력하세요" aria-label=".form-control-sm example" id="keyword" name="keyword" value="${paging.keyword}"/>
			<button type="button" class="btn btn-outline-secondary" id="btnSearch">
				<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
					<path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
				</svg>
				<span class="visually-hidden">Button</span>
			</button>
		</div>
	</form>
	<p></p>
	<div class = "container" id = "boardList">
		<div class = "row">
			<table id=tbldata class ="text-center">
				<tr class ="text-center">
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성 날짜</th>
					<th>조회</th>
					<th>추천수</th>
				</tr>
				<c:choose>
					<c:when test="${!empty listnotice}">
						<c:forEach items="${listnotice}" var="list">
							<tr class = "text-center">
								<td>${list.id}</td>
								<td><a href="content?id=${list.id}">${list.title}</a></td>
								<td>${list.userid}</td>
								<td>${list.postdate}</td>
								<td>${list.views}</td>
								<td>${list.heart}</td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="5">조회된 게시글이 없습니다.</td>
						</tr>
					</c:otherwise>
				</c:choose>
			</table>
			<p></p>
			<nav aria-label="Page navigation example">
				<ul class="pagination">
					<li class="page-item">
						<a class="page-link" href="notice?curPage=1&sort=${paging.sort}&type=${paging.type}&keyword=${paging.keyword}" aria-label="Previous">
							<span aria-hidden="true">&laquo;</span>
						</a>
					</li>
					<c:forEach begin="${paging.firstPage}" end="${paging.lastPage}" var="i">
						<li class="page-item"><a class="page-link" href="notice?curPage=${i}&sort=${paging.sort}&type=${paging.type}&keyword=${paging.keyword}">
							<c:if test="${i == paging.curPage}">
								<span style="color:red">${i}</span>
							</c:if>
							<c:if test="${i != paging.curPage}">
								${i}
							</c:if>
						</a></li>
					</c:forEach>
					<li class="page-item">
						<a class="page-link" href="notice?curPage=${paging.totalPageCount}&sort=${paging.sort}&type=${paging.type}&keyword=${paging.keyword}" aria-label="Next">
							<span aria-hidden="true">&raquo;</span>
						</a>
					</li>
				</ul>
			</nav>
		</div>
			<c:if test="${user.role=='관리자'}">
			<div class = "col-12 text-end">
				<button type="button" id=btnwrite class="btn btn-outline-primary btn-sm">글쓰기</button>
			</div>
			</c:if>
		</div>
	</div>
</main>

<!-- 하단 -->
<div class="container-fluid">
  <footer class="d-flex flex-wrap justify-content-between align-items-center py-3 my-4 border-top">
    <p class="col-md-4 mb-0 text-muted">&copy; 2022 Company, Inc</p>

    <a href="/" class="col-md-4 d-flex align-items-center justify-content-center mb-3 mb-md-0 me-md-auto link-dark text-decoration-none">
      <svg class="bi me-2" width="40" height="32"><use xlink:href="#bootstrap"/></svg>
    </a>

    <ul class="nav col-md-4 justify-content-end">
      <li class="nav-item"><a href="#" class="nav-link px-2 text-muted">Home</a></li>
      <li class="nav-item"><a href="#" class="nav-link px-2 text-muted">Features</a></li>
      <li class="nav-item"><a href="#" class="nav-link px-2 text-muted">Pricing</a></li>
      <li class="nav-item"><a href="#" class="nav-link px-2 text-muted">FAQs</a></li>
      <li class="nav-item"><a href="#" class="nav-link px-2 text-muted">About</a></li>
    </ul>
  </footer>
</div>

</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script>
$(document)
.ready(function () {
	$(document)
			.on('click','#logo',function(){
				document.location.href='/';
			})
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
$(document)
		.on('click','#btnwrite',function(){
			document.location.href='/write';
		})
$('#btnSearch').click(function (e) {
	e.preventDefault();
	var url="/notice";
	if($('#selSort option:selected').val()=='date') {
		url=url+'?sort=date&type='+$('#type').val()+'&keyword='+$('#keyword').val();
	} else if($('#selSort option:selected').val()=='view') {
		url=url+'?sort=view&type='+$('#type').val()+'&keyword='+$('#keyword').val();
	} else if($('#selSort option:selected').val()=='heart') {
		url=url+'?sort=heart&type='+$('#type').val()+'&keyword='+$('#keyword').val();
	}
	location.href=url;
})
$('#serform').keypress(function (e) {
	e.preventDefault();
	var url="/notice";
	if($('#selSort option:selected').val()=='date') {
		url=url+'?sort=date&type='+$('#type').val()+'&keyword='+$('#keyword').val();
	} else if($('#selSort option:selected').val()=='view') {
		url=url+'?sort=view&type='+$('#type').val()+'&keyword='+$('#keyword').val();
	} else if($('#selSort option:selected').val()=='heart') {
		url=url+'?sort=heart&type='+$('#type').val()+'&keyword='+$('#keyword').val();
	}
	location.href=url;
})
</script>
</html>
