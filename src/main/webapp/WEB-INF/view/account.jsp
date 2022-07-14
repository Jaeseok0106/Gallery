<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<title>결제내역</title>
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
text-decoration-line:none;
}
.input-group-addon,.input-group-text {
    border-left: 0 none;
    padding: 4px 9px 4px 9px;
}
.input-group-addon .glyphicon-calendar:before, .input-group-text .datePicker-calendar:before{
    content: " ";
    background: url(/assets/images/buttons/btn_calendar.png) center center no-repeat;
    width: 18px;
    height: 18px;
    display: block;
    overflow: hidden;
}
div {white-space: nowrap;}
#btn01{
    height:auto;
    vertical-align: middle;
}
#date1,#date2{
    width:130px;
    height:38px;
    vertical-align: middle;
    border: 1px solid rgb(117, 117, 117);
    border-radius: 4px;
    color: rgb(117, 117, 117);
}
#detail {
    background-color: white;
}
#tb1 {
    font-size: 15pt;
    width: 580px;
    height: 450px;
}
</style>

<body align="center">
<div class="container">
	<header class="blog-header py-3" style = "height : 230px;">
		<div class="row flex-nowrap justify-content-between align-items-center">
			<div class="text-center">
				<img src = "logo.png" style = "height:100px;"/>
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
					<a class="nav-link" href="#" id = "nav2">exhibition</a>
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
<!-- 주내용 -->
<main class = "container p-5">
	<div class = "container">
		<div class = "page-title">
			<h1>결제내역</h1>
		</div>
	</div>
    <div class="col-6 col-sm-3">
        <h3>내역조회</h3>
        조회기간&nbsp;&nbsp;
        <button type="button" class="btn btn-outline-secondary" id="btn01">오늘</button>&nbsp;
        <button type="button" class="btn btn-outline-secondary" id="btn01">이번주</button>&nbsp;
        <button type="button" class="btn btn-outline-secondary" id="btn01">이번달</button>&nbsp;
        <button type="button" class="btn btn-outline-secondary" id="btn01">3개월</button>&nbsp;&nbsp;
        <input type="date" id="date1">~
        <input type="date" id="date2">&nbsp;
        <button type="submit" class="btn btn-outline-secondary" id="btn01" style="font-weight: bold;">조회</button>
    </div>
    <br><br>
	<div class = "container" id = "boardList">
		<div class = "row">
			<table>
				<tr class ="text-center">
					<th>예매번호</th>
					<th>제목</th>
                    <th>예매일자</th>
					<th>상태</th>
					<th>확인/신청</th>
				</tr>
				<tr class = "p-5">
					<td class = "text-center">03453523</td>
					<td class = "text-center">asdf작가의 dfadasdad</td>
                    <td class = "text-center">2022-05-07</td>
					<td class = "text-center">예매취소</td>
					<td class = "text-center"><button type="button" class="btn btn-outline-dark" id="btnDetail">상세보기</button></td>
				</tr>
				<tr>
					<td class = "text-center">14522454</td>
					<td class = "text-center">ㅇㅇㅇ의 ㅁㅁㅁ전시회</td>
                    <td class = "text-center">2022-06-24</td>
					<td class = "text-center">예매완료</td>
					<td class = "text-center"><button type="button" class="btn btn-outline-dark" id="btnDetail">상세보기</button></td>
				</tr>
                <tr>
					<td class = "text-center">23431334</td>
					<td class = "text-center">ㅁㅁ으로 알아보는 gfgofaiaf</td>
                    <td class = "text-center">2022-07-01</td>
					<td class = "text-center">예매완료</td>
					<td class = "text-center"><button type="button" class="btn btn-outline-dark" id="btnDetail">상세보기</button></td>
				</tr>
			</table>
			<p></p>
			<p></p>		
			<p></p>
		</div>
	</div>
    <div id="detail" style="display: none;" align="center">
    <p style="margin-top: 40px;"></p>
    <h2>예매내역</h2><br>
    <table align="center" id="tb1" class="table table-striped">
    <tr>
        <th>예매번호</th>
        <td align="left">03453523</td>
    </tr>
    <tr>
        <th>제목</th>
        <td align="left">asdf작가의 dfadasdad</td>
    </tr>
    <tr>
        <th>날짜</th>
        <td align="left">2022-05-07</td>
    </tr>
    <tr>
        <th>이름</th>
        <td align="left">김김김</td>
    </tr>
    <tr>
        <th>인원</th>
        <td align="left">4</td>
    </tr>
    <tr>
        <th>상태</th>
        <td align="left">예매완료</td>
    </tr>
    <tr style="display: none;">
    </tr>
    <tr>
        <td colspan="2" align="center">
            <p style="margin-top: 100px;"></p>
            <button type="button" class="btn btn-outline-dark" id="btnC">취소하기</button>
            <button type="button" class="btn btn-outline-dark" id="btnCancel">닫기</button>
        </td>
    </tr>
    </table>
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
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>
<script>
$(document)
.ready(function() {
    $('#detail').dialog({
        autoOpen:false,
        width:600,
        height:800,
        open: function() {
        
        },
        close: function() {
        }
    })
})
.on('click','#btnDetail',function() {
    $('#detail').dialog('open');
})
.on('click','#btnCancel',function() {
    $('#detail').dialog('close');
})
.on('click','#btnC',function() {
    if(!confirm('예매를 취소하시겠습니까?')) return false;
})
</script>
</html>