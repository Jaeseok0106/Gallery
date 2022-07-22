<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <title>FAQ</title>
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
    a {
        text-decoration-line:none;
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
                            <a class="nav-link" aria-current="page" href="/visit" id = "detail">FAQ</a>
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
<input type = "hidden" id = "faqid" value = "${faq_table.id}">
<br><br>
<!-- main 안에다가 주 내용 작성할것 -->
<main class = "container p-5">
    <div class = "container">
        <div class = "page-title">
            <h1>FAQ</h1>
        </div>
    </div>
    <ul class="nav justify-content-center" id="gry">
        <li class="nav-item col-1">
            <span class="nav-link" aria-current="page" id="pre" style="cursor:hand;" value="1">관람</span>
        </li>
        <li class="nav-item col-1">
            <span class="nav-link" aria-current="page" id="ord" style="cursor:hand;"value="2">예약</span>
        </li>
        <li class="nav-item col-1">
            <span class="nav-link" aria-current="page" id="web" style="cursor:hand;"value="3">홈페이지</span>
        </li>
        <li class="nav-item col-1">
            <span class="nav-link" aria-current="page" id="etc" style="cursor:hand;" value="4">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp기타</span>
        </li>
    </ul>
    <div class="accordion" id="accordionExample">

    </div>
            <c:if test="${user.role=='관리자'}">
                <div class = "text-center">
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
            list();
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
        .on('click','#logo',function(){
            document.location.href='/';
        })
    $(document)
        .on('click','#btnwrite',function(){
            document.location.href='/faqwrite';
        })
        .on("click","#pre,#ord,#web,#etc",function(){
            listcat($(this).attr('value'));
        })
    $(document)
        .on('click','#btnupdate',function(){
            let id = $(this).attr('name')
            document.location.href='/faqupdate/'+id;
        })
</script>
<script>
    function list(){
        $.ajax({
            url:"/FAQ",
            type:"POST",
            datatype:"JSON",
            data: {category : '1'},
            beforeSend : function() {
                $("#accordionExample").empty();
            },
            success:function(data){
                for(let i=0; i < data.length; i++){
                    let list = data[i];
                    if ($("#role").val() == '관리자') {
                        let str = `
                        <div class="accordion-item">
                            <h2 class="accordion-header" id="headingFour">
                                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapse\${list['id']}" aria-expanded="false" aria-controls="collapseFour">
                                    \${list['question']}
                                </button>
                            </h2>
                            <div id="collapse\${list['id']}" class="accordion-collapse collapse" aria-labelledby="headingFour" data-bs-parent="#accordionExample">
                                <div class="accordion-body">
                                    \${list['answer']}
                                <br>
                                <button type="button" name = \${list['id']} id=btnupdate class="btn btn-outline-danger btn-sm">수정</button>
                                <button type="button" name = \${list['id']} id=btndelete class="btn btn-outline-dark btn-sm">삭제</button>
                                </div>
                            </div>
                        </div>`;
                        $("#accordionExample").append(str);
                    } else {
                        let str = `
                        <div class="accordion-item">
                            <h2 class="accordion-header" id="headingFour">
                                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapse\${list['id']}" aria-expanded="false" aria-controls="collapseFour">
                                    \${list['question']}
                                </button>
                            </h2>
                            <div id="collapse\${list['id']}" class="accordion-collapse collapse" aria-labelledby="headingFour" data-bs-parent="#accordionExample">
                                <div class="accordion-body">
                                    \${list['answer']}
                                </div>
                            </div>
                        </div>`;
                        $("#accordionExample").append(str);
                    }
                }
            }
        })
    }
    function listcat(categoryid){
        $.ajax({
            url:"/FAQ",
            type:"POST",
            datatype:"JSON",
            data: {category : categoryid},

            beforeSend : function() {
                $("#accordionExample").empty();
            },
            success:function(data){
                for(let i=0; i < data.length; i++){
                    let list = data[i];
                    if ($("#role").val() == '관리자') {
                    let str=`
                        <div class="accordion-item">
                            <h2 class="accordion-header" id="headingFour">
                                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapse\${list['id']}" aria-expanded="false" aria-controls="collapseFour">
                                    \${list['question']}
                                </button>
                            </h2>
                            <div id="collapse\${list['id']}" class="accordion-collapse collapse" aria-labelledby="headingFour" data-bs-parent="#accordionExample">
                                <div class="accordion-body">
                                    \${list['answer']}
                                <br>
                                <button type="button" name = \${list['id']} id=btnupdate class="btn btn-outline-danger btn-sm">수정</button>
                                <button type="button" name = \${list['id']} id=btndelete class="btn btn-outline-dark btn-sm">삭제</button>
                                </div>
                            </div>
                        </div>`;
                    $("#accordionExample").append(str);
                } else {
                        let str = `
                        <div class="accordion-item">
                            <h2 class="accordion-header" id="headingFour">
                                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapse\${list['id']}" aria-expanded="false" aria-controls="collapseFour">
                                    \${list['question']}
                                </button>
                            </h2>
                            <div id="collapse\${list['id']}" class="accordion-collapse collapse" aria-labelledby="headingFour" data-bs-parent="#accordionExample">
                                <div class="accordion-body">
                                    \${list['answer']}
                                </div>
                            </div>
                        </div>`;
                    }
                }
            }
        })
    }
    $(document)
        .on('click','#btndelete',function(){
            if(confirm("정말 삭제 하시겠습니까?")) {
                id = $(this).attr('name')
                $.ajax({
                    type:'get',datatype:'text',url:'faq/delete',
                    data : {id : id},
                    success:function(){
                        alert("게시물이 삭제 되었습니다.");
                        list();
                    }
                })
            }

            else {
            };
        })
</script>
</html>
