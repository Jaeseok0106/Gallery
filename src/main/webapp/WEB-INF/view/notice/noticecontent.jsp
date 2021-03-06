<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
                                           prefix="c" %> <%@ page session="false" %>
<html>
<head>
    <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
            crossorigin="anonymous"
    />
    <title>NOTICE CONTENT</title>
</head>
<style>
    .nav-item {
        list-style-type: none;
        float: left;
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
        font-family: "LeeSeoyun";
        src: url("https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2202-2@1.0/LeeSeoyun.woff")
        format("woff");
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
                <img src = "logo.png" id="logo" style = "height:100px;"/>
            </div>
        </div>
        <br><br><br>
        <div class="nav-scroller mb-7" id = "list1">
            <ul class="nav justify-content-center" style = "display:block;">
                <li class="nav-item mx-5">
                    <a class="nav-link active p-7" aria-current="page" href="#" id = "nav1">About us</a>
                    <div>
                        <ul class="nav justify-content-end" style = "display : none;" id = "none1">
                            <li class="nav-item">
                                <a class="nav-link" aria-current="page" href="#" id = "detail1">Active</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#" id = "detail2">Link</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#" id = "detail3">Link</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" id = "detail4">Disabled</a>
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
                            <a class="nav-link" aria-current="page" href="/review" id = "detail5">Review</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="/qna" id = "detail6">Q&A</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="/FAQ" id = "detail7">FAQ</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" id = "detail8">Disabled</a>
                        </li>
                    </ul>
                </li>
                <li class="nav-item mx-5">
                    <a class="nav-link" aria-current="page" href="#" id = "nav5">Member</a>
                    <ul class="nav justify-content-end" style = "display : none;" id = "none3">
                        <c:if test = "${user.id == null}">
                            <li class="nav-item">
                                <a class="nav-link" aria-current="page" href="/login" id = "detail9">Login</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="/signin" id = "detail10">Sign in</a>
                            </li>
                        </c:if>
                        <c:if test = "${user.id != null }">
                            <li class="nav-item">
                                <a class="nav-link" aria-current="page" href="/logout" id = "detail11">Logout</a>
                            </li>
                        </c:if>
                        <li class="nav-item">
                            <a class="nav-link" href="#" id = "detail12">My page</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" id = "detail13">Disabled</a>
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
<input type = "hidden" id = "id" value = "${ndto.id}">
<br><br>
<!-- main ???????????? ??? ?????? ???????????? -->
<main class="container p-5">
    <div class="row">
        <div
                class="col-12"
                style="
            border-top: 0.1rem solid black;
            border-bottom: 0.1rem solid black;
          "
        >
            <p class="text-start">
                ${ndto.title}
                <span style="float: right"> ${ndto.postdate} </span>
            </p>
        </div>
        <div class="col-12" style="border-bottom: 0.1rem solid black">
            <p class="text-start">
                ${ndto.userid}
                <span style="float: right">
              ????????? : ${ndto.views}  ????????? : ${ndto.heart}  ?????? : 222
            </span>
            </p>
        </div>
        <p></p>
        <p></p>
        <div class="col-12 py-2">
            ${ndto.content}
        </div>
        <div class="col-3 text-start">
            <c:if test="${nepr.next!=9999}">
                <button type="button" class="btn btn-outline-primary" onclick="location.href='content?id=${nepr.next}'">??????</button>
            </c:if>
            <c:if test="${nepr.next==9999}"></c:if>
        </div>
        <div class="col-6 text-center">
            <button type="button" class="btn btn-outline-Danger" id="heart">??????</button>
            <button type="button" class="btn btn-outline-primary" id="list">??????</button>
        </div>
        <div class="col-3 text-end">
            <c:if test="${nepr.prev!=0}">
                <button type="button" class="btn btn-outline-primary" onclick="location.href='content?id=${nepr.prev}'">??????</button>
            </c:if>
            <c:if test="${nepr.prev==0}"></c:if>
        </div>
    </div>
    <br>
    <c:if test="${user.role=='?????????'}">
    <div class="text-end">
        <button type="button" class="btn btn-outline-Dark" id="update">??????</button>
        <button type="button" class="btn btn-outline-Dark" id="delete">??????</button>
    </div>
    </c:if>
</main>

<!-- ?????? -->
<div class="container-fluid">
    <footer
            class="d-flex flex-wrap justify-content-between align-items-center py-3 my-4 border-top"
    >
        <p class="col-md-4 mb-0 text-muted">&copy; 2022 Company, Inc</p>

        <a
                href="/"
                class="col-md-4 d-flex align-items-center justify-content-center mb-3 mb-md-0 me-md-auto link-dark text-decoration-none"
        >
            <svg class="bi me-2" width="40" height="32">
                <use xlink:href="#bootstrap" />
            </svg>
        </a>

        <ul class="nav col-md-4 justify-content-end">
            <li class="nav-item">
                <a href="#" class="nav-link px-2 text-muted">Home</a>
            </li>
            <li class="nav-item">
                <a href="#" class="nav-link px-2 text-muted">Features</a>
            </li>
            <li class="nav-item">
                <a href="#" class="nav-link px-2 text-muted">Pricing</a>
            </li>
            <li class="nav-item">
                <a href="#" class="nav-link px-2 text-muted">FAQs</a>
            </li>
            <li class="nav-item">
                <a href="#" class="nav-link px-2 text-muted">About</a>
            </li>
        </ul>
    </footer>
</div>
</body>
<script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"
></script>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script>
    $(document).ready(function () {
        console.log("?????? ??????");
        $("#nav1").hover(
            function () {
                $("#none1").css("display", "block");
                $("#none2").css("display", "none");
                $("#none3").css("display", "none");
            },
            function () {}
        );
        $("#nav2").hover(function () {
            $("#none1").css("display", "none");
            $("#none2").css("display", "none");
            $("#none3").css("display", "none");
        });
        $("#nav3").hover(function () {
            $("#none1").css("display", "none");
            $("#none2").css("display", "none");
            $("#none3").css("display", "none");
        });
        $("#nav4").hover(function () {
            $("#none1").css("display", "none");
            $("#none2").css("display", "block");
            $("#none3").css("display", "none");
        });
        $("#nav5").hover(function () {
            $("#none1").css("display", "none");
            $("#none2").css("display", "none");
            $("#none3").css("display", "block");
        });
        $("#nav6").hover(function () {
            $("#none1").css("display", "none");
            $("#none2").css("display", "none");
            $("#none3").css("display", "none");
        });
    });
    $(document)
        .on('click','#list',function(){
            document.location.href='/notice';
        })
    $(document)
        .on('click','#logo',function(){
            document.location.href='../../..';
        })
    $(document)
        .on('click','#delete',function(){
            if(confirm("?????? ?????? ???????????????????")) {
                $.ajax({
                    type:'get',datatype:'text',url:'content/delete',
                    data : {id : $("#id").val()},
                    success:function(){
                        alert("???????????? ?????? ???????????????.");
                        document.location.href = "/notice";
                    }
                })
            }

            else {
            };
        })
    $(document)
    .on('click','#update',function(){
        document.location.href='/update/${ndto.id}';
    })
</script>
</html>