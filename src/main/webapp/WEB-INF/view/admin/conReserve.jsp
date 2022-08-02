<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <title>예약관리</title>
</head>
<style>
    table {
        border-collapse: separate;
        border-spacing: 0 10px;
    }
    .nav-item{
        list-style-type:none;
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
        font-family: 'IBMPlexSansKR-Regular';
    }
    @font-face {
        font-family: 'IBMPlexSansKR-Regular';
        src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-07@1.0/IBMPlexSansKR-Regular.woff') format('woff');
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
        margin-bottom: 2.5px;
    }
</style>
<body>
<div class="container">
    <header class="blog-header py-3" style = "height : 230px;">
        <div class="row flex-nowrap justify-content-between align-items-center">
            <div class="text-center">
                <a href="/"><img src="/logo.png" id="logo" style="height: 80px"/></a>
            </div>
        </div>
        <br><br><br>
        <div class="nav-scroller mb-7" id = "list">
            <ul class="nav justify-content-center">
                <li class="nav-item mx-5">
                    <a class="nav-link active p-7" aria-current="page" href="#" id = "nav1">About us</a>
                    <div>
                        <ul class="nav justify-content-end" style = "display : none;" id = "none1">
                            <li class="nav-item">
                                <a class="nav-link" aria-current="page" href="/letter" id = "detail">Director's letter</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" aria-current="page" href="/visit" id = "detail">Visit</a>
                            </li>
                        </ul>
                    </div>
                </li>
                <li class="nav-item mx-5">
                    <a class="nav-link" href="/exhibit" id = "nav2">Exhibition</a>
                </li>
                <li class="nav-item mx-5">
                    <a class="nav-link" href="/artist" id = "nav3">Artist</a>
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
                            <a class="nav-link" href="/FAQ" id = "detail" >FAQ</a>
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
                        <c:if test="${user.role == '방문자'}">
                            <li class="nav-item">
                                <a class="nav-link" href="#" id = "detail">My page</a>
                            </li>

                        </c:if>
                        <c:if test="${user.role == '관리자'}">
                            <li class="nav-item">
                                <a class="nav-link" href="listuser" id="detail">회원관리</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="listReserve" id="detail">예약관리</a>
                            </li>
                        </c:if>
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
<!-- main 안에다가 주 내용 작성할것 -->
<main class = "container p-5">
    <div class = "container">
        <div class = "page-title">
            <h1>예약 관리</h1>
        </div>
    </div>
    <form id="serform">
        <div class = "col-12 text-end">
            <input style = "width:17%;" type="text" placeholder="전시회 이름을 입력하세요" aria-label=".form-control-sm example" id="keyword" name="keyword" value="${paging.keyword}"/>
            <button type="button" class="btn btn-outline-secondary" id="btnSearch" onclick="location.href='/listReserve?keyword=${paging.keyword}'">
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
            <table id='rtb' class ="text-center">
                <tr class ="text-center">
                    <th style="width: 20%;">전시회 이름</th>
                    <th style="width: 20%;">예약자</th>
                    <th style="width: 20%;">인원</th>
                    <th style="width: 20%;">날짜</th>
                    <th style="width: 20%;">변경</th>
                </tr>
                <c:choose>
                    <c:when test="${!empty listReserve}">
                        <c:forEach items="${listReserve}" var="list">
                            <tr class = "text-center">
                                <td>${list.exhibitName}</td>
                                <td>${list.userName}</td>
                                <td>${list.person}</td>
                                <td>${list.reserveDate}</td>
                                <td>
                                    <a href="listReserve/resdel?orderId=${list.orderId}"><button type="button" class="btn btn-danger" id="resDel">삭제</button></a>
                                </td>
                            </tr>
                        </c:forEach>
                    </c:when>
                    <c:otherwise>
                        <tr>
                            <td colspan="6">조회된 예약이 없습니다.</td>
                        </tr>
                    </c:otherwise>
                </c:choose>
            </table>
            <p></p>
            <nav aria-label="Page navigation example">
                <ul class="pagination">
                    <li class="page-item">
                        <a class="page-link" href="listReserve?curPage=1&keyword=${paging.keyword}" aria-label="Previous">
                            <span aria-hidden="true">&laquo;</span>
                        </a>
                    </li>
                    <c:forEach begin="${paging.firstPage}" end="${paging.lastPage}" var="i">
                        <li class="page-item"><a class="page-link" href="listReserve?curPage=${i}&keyword=${paging.keyword}">
                            <c:if test="${i == paging.curPage}">
                                <span style="color:red">${i}</span>
                            </c:if>
                            <c:if test="${i != paging.curPage}">
                                ${i}
                            </c:if>
                        </a></li>
                    </c:forEach>
                    <li class="page-item">
                        <a class="page-link" href="listReserve?curPage=${paging.totalPageCount}&keyword=${paging.keyword}" aria-label="Next">
                            <span aria-hidden="true">&raquo;</span>
                        </a>
                    </li>
                </ul>
            </nav>
        </div>
        <div class = "col-12 text-end">
            <button type="button" class="btn btn-outline-primary btn-sm" onclick="location.href='/exhibit/upload'">전시회 추가</button>
            <button type="button" class="btn btn-outline-primary btn-sm" onclick="location.href='/artist/upload'">아티스트 추가</button>
        </div>
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
            <li class="nav-item">
                <a href="/" class="nav-link px-2 text-muted">Home</a>
            </li>
            <li class="nav-item">
                <a href="/visit" class="nav-link px-2 text-muted">About</a>
            </li>
            <li class="nav-item">
                <a href="/notice" class="nav-link px-2 text-muted">Notice</a>
            </li>
            <li class="nav-item">
                <a href="/FAQ" class="nav-link px-2 text-muted">FAQ</a>
            </li>
        </ul>
    </footer>
</div>

</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script>
    $(document)
        .ready(function () {
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
    $('#resDel').click(function () {
        if(!confirm('예약정보를 삭제하시겠습니까?')) {
            return false;
        }
    })
    $('#btnSearch').click(function (e) {
        e.preventDefault();
        var url="/listReserve?keyword="+$('#keyword').val();
        location.href=url;
    })
</script>
</html>