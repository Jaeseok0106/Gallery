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
            <h1>FAQ</h1>
        </div>
    </div>
    <ul class="nav justify-content-center">
        <li class="nav-item col-1">
            <a class="nav-link active" aria-current="page" href="#">관람</a>
        </li>
        <li class="nav-item col-1">
            <a class="nav-link" href="#">예약</a>
        </li>
        <li class="nav-item col-1">
            <a class="nav-link" href="#">홈페이지</a>
        </li>
        <li class="nav-item col-1">
            <a class="nav-link" href="#">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp기타</a>
        </li>
    </ul>
    <div class="accordion" id="accordionExample">
        <div class="accordion-item">
            <h2 class="accordion-header" id="headingOne">
                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                    갤러리 '누르'의 위치를 안내해주세요.
                </button>
            </h2>
            <div id="collapseOne" class="accordion-collapse collapse" aria-labelledby="headingOne" data-bs-parent="#accordionExample">
                <div class="accordion-body">
                    <p>주소:<strong>충남 천안시 동남구 대흥로 215 7층</strong></p>
                    <p>오시는 길: 1호선 천안역 하차 → 3번 출구 → 나와서 우측 방향으로 도보 5분</p>
                    <p>좀 더 자세한 위치는</p>
                    <p><strong>TEL:041-561-1122</strong></p>
                    <p>문의 주시면 친절하고 자세 하게 안내 도와 드리 겠습니다.</p>
                </div>
            </div>
        </div>
        <div class="accordion-item">
            <h2 class="accordion-header" id="headingTwo">
                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                    미술관 관람 시간 및 휴관일은 어떻게 됩니까?
                </button>
            </h2>
            <div id="collapseTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
                <div class="accordion-body">
                    <p>휴관일 안내</p>
                    <p>1.주말(토요일,일요일)</p>
                    <p>2.공휴일</p>
                    <p>3.갤러리 '누르' 에서 지정한 날 </p>
                    <p>전시 기간에는 휴관일과 관람 시간이 변경될 수 있으니 해당 페이지에서 별도로 확인하시기 바랍니다.</p>
                </div>
            </div>
        </div>
        <div class="accordion-item">
            <h2 class="accordion-header" id="headingThree">
                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                    전시실의 작품 촬영이 가능 한가요?
                </button>
            </h2>
            <div id="collapseThree" class="accordion-collapse collapse" aria-labelledby="headingThree" data-bs-parent="#accordionExample">
                <div class="accordion-body">
                    <p>작품이 전시되어 있는 전시장 내부에서는 삼각대 및 플래시를 사용한 사진촬영은 불가능합니다.</p>
                    <p>다만, 언론사의 보도 및 공공기관의 공익사업, 교육기관의 학술적 연구를 목적으로 한 촬영은 가능합니다.</p>
                    <p>사진 촬영을 원하실 경우 촬영 5일 전까지 일시, 촬영장소, 촬영내용, 촬영인원 등을 기재한 촬영신청서와 촬영각서를 작성 후 관련부서로 방문 및 우편, 전자메일로 신청한 후,</p>
                    <p>구체적인 촬영계획을 협의(행정지원과 041-561-1122)하시기 바랍니다.</p>
                    <br>
                    <p><strong>* 촬영신청서 및 허가규정은 <code>알림참〮여 > 시설대관/복제신청</code>을 참고하시기 바랍니다.</strong></p>
                </div>
            </div>
        </div>
        <div class="accordion-item">
            <h2 class="accordion-header" id="headingFour">
                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseFour" aria-expanded="false" aria-controls="collapseFour">
                    단체 관람을 가고 싶습니다. 신청을 어떻게 해야 하나요?
                </button>
            </h2>
            <div id="collapseFour" class="accordion-collapse collapse" aria-labelledby="headingFour" data-bs-parent="#accordionExample">
                <div class="accordion-body">
                    <strong><code>현재 코로나로 단체 예약은 없습니다.</code></strong>
                </div>
            </div>
        </div>
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
            console.log("시작 화면");
            listfaq();
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
    function listfaq(){
        $.get('listfaq','',function(data){
            for(let i=0; i<data.length; i++){
                listfaq=data[i];
                let str='<tr><td>'+listfaq['id']
                    +'</td><td><a href="content?id='+listfaq['id']+'">' +listfaq['title']+
                    '</a></td><td>'+listfaq['user_id']+'</td><td>'+listfaq['postdate']+
                    '</td><td>'+listfaq['views']+'</td><td>'+listfaq['heart']+'</td></tr>';
                $('#tbldata').append(str);
            }
        },'json');
    }
    $(document)
        .on('click','#btnwrite',function(){
            document.location.href='/faqwrite';
        })
</script>
</html>
