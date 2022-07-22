<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

    <title>인사말</title>
</head>
<style>
    #info {
        font-weight : bold;
        margin-right : 1.5rem;
    }
    .detail {
        display : inline-block;
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
        margin-bottom : 4rem;
    }
    .page-title h1{
        padding : 2rem;
        text-align : center;
    }
    body {
        font-family : LeeSeoyun;
    }
    h2 {
        font-size : 25px;
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
    .left-area {
        float:left;
        width:500px;
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
            <ul class="nav justify-content-center">
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
                            <a class="nav-link" href="/FAQ" id = "detail" >FAQ</a>
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
<!-- main 안에다가 주 내용 작성할것 -->
<%--<main class = "container p-5">--%>
<div class="container">
    <div class = "page-title">
        <h1>director 인사말</h1>
    </div>
    <div class="inner clearfix">
        <section class="left-area" data-mh="matchArea" style = "height:700px;">
            <img src = "director.png" id='director' style = "height:500px;"/>
        </section>
        <section class="right-area" data-mh="matchArea" style = "height:700px;">
            <p>왜 또 아픈상처에 소금을 뿌리십니까 <br>
                제게도 꿈이 있었습니다
            </p>
            <strong class="sign">선장</strong>
        </section>
    </div>
</div>
<%--    <div class = "col-6" style="padding:0px;">--%>
<%--        <div class = "container">
            <img src = "director.png" id='director' style = "height:500px;"/>
            <p align="right">왜 또 아픈상처에 소금을 뿌리십니까 <br>
                제게도 꿈이 있었습니다
            </p>
            <strong class="sign">선장</strong>
        </div>--%>
        <%--<div class="container">

        </div>--%>
<%--    </div>--%>
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
        .on('click','#logo',function(){
            document.location.href='/';
        })
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
</script>
</html>