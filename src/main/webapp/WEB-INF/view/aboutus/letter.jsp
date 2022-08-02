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

    <title>인사말</title>
  </head>
  <style>
    #info {
      font-weight: bold;
      margin-right: 1.5rem;
    }
    .detail {
      display: inline-block;
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
    h2 {
      font-size: 25px;
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
      text-decoration-line: none;
    }
    .left-area {
      float: left;
      width: 500px;
    }
  </style>
  <body>
  <div class="container">
    <header class="blog-header py-3" style="height: 230px">
      <div class="row flex-nowrap justify-content-between align-items-center">
        <div class="text-center">
          <a href="/"><img src="/logo.png" id="logo" style="height: 80px"/></a>
        </div>
      </div>
      <br /><br /><br />
      <div class="nav-scroller mb-7" id="list">
        <ul class="nav justify-content-center">
          <li class="nav-item mx-5">
            <a class="nav-link active p-7" aria-current="page" href="/letter" id="nav1">About us</a>
            <div>
              <ul class="nav justify-content-end" style="display: none" id="none1">
                <li class="nav-item">
                  <a class="nav-link" aria-current="page" href="/letter" id="detail">Director's letter</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" aria-current="page" href="/visit" id="detail">Visit</a>
                </li>
              </ul>
            </div>
          </li>
          <li class="nav-item mx-5">
            <a class="nav-link" href="/exhibit" id="nav2">Exhibition</a>
          </li>
          <li class="nav-item mx-5">
            <a class="nav-link" href="/artist" id="nav3">Artist</a>
          </li>
          <li class="nav-item mx-5">
            <a class="nav-link" href="/review" id="nav4">Post</a>
            <ul class="nav justify-content-end" style="display: none" id="none2">
              <li class="nav-item">
                <a class="nav-link" aria-current="page" href="/review" id="detail">Review</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="/qna" id="detail">Q&A</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="/FAQ" id="detail">FAQ</a>
              </li>
            </ul>
          </li>
          <li class="nav-item mx-5">
            <c:if test="${user.id == null}">
              <a class="nav-link" aria-current="page" href="/login" id="nav5">Member</a>
            </c:if>
            <c:if test="${user.id != null && user.role == '방문자'}">
              <a class="nav-link" aria-current="page" href="/mypage" id="nav5">Member</a>
            </c:if>
            <c:if test="${user.id != null && user.role == '관리자'}">
              <a class="nav-link" aria-current="page" href="/listuser" id="nav5">Member</a>
            </c:if>
            <ul class="nav justify-content-end" style="display: none" id="none3">
              <c:if test="${user.id == null}">
                <li class="nav-item">
                  <a class="nav-link" aria-current="page" href="/login" id="detail">Login</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="/signin" id="detail">Sign in</a>
                </li>
              </c:if>
              <c:if test="${user.id != null }">
                <li class="nav-item">
                  <a class="nav-link" aria-current="page" href="/logout" id="detail">Logout</a>
                </li>
              </c:if>
              <c:if test="${user.role == '방문자'}">
                <li class="nav-item">
                  <a class="nav-link" href="/mypage" id="detail">My page</a>
                </li>
              </c:if>
              <c:if test="${user.role == '관리자'}">
                <li class="nav-item">
                  <a class="nav-link" href="/listuser" id="detail">회원관리</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="/listReserve" id="detail">예약관리</a>
                </li>
              </c:if>
            </ul>
          </li>
          <li class="nav-item mx-5">
            <a class="nav-link" aria-current="page" href="/notice" id="nav6">Notice</a>
          </li>
        </ul>
      </div>
    </header>
  </div>
    <input type="hidden" id="role" value="${user.role}" />
    <input type="hidden" id="usernum" value="${user.userNum}" />

    <!-- main 안에다가 주 내용 작성할것 -->
    <main class="container p-5">
      <div class="container">
        <div class="page-title">
          <h1>Director 인사말</h1>
        </div>
        <div class="inner clearfix">
          <section class="left-area" data-mh="matchArea" style="height: 700px">
            <img src="inGallery2.png" id="director" style="height: 300px" />
          </section>
          <section class="right-area" data-mh="matchArea" style="height: 700px">
            <p>
              갤러리누르는 2022년 3주년을 맞이했습니다. 오늘이 있기까지 저희 갤러리를 음으로 양으로 도와주신 모든 분들께 무한한 감사를 표합니다. 작가, 예술애호가, 평론가, 기획자, 교육자, 미술사가, 문화 관료, 언론인, 후원가, 화상, 재료상, 감식가, 수복가 등 수많은 이들의 사랑과 헌신이 있었기에, 한국현대
              미술은 여러 위기를 딛고 오늘에 이르렀습니다. 그러나, 언제나 마지막 큰 박수는 창작에 매진해온 작가 여러분과 그들의 땀방울이 밴 작업 세계에 돌아가야 마땅할 것입니다. 참으로 고맙습니다. <br><br>

              작업들과 주요 신작을 선뵈는 크고 작은 전시들과 국내외에서의 미술품 거래를 통해, 문화의 상승과 사회
              의 발전을 경험했습니다. 파란만장한 격동의 세월 속에서, 저희 갤러리도 일개 상업화랑 이상의 큰 임무과 책
              임을 실감하며 나름 기여해왔노라 자부합니다. 물론 때로 힘에 부치기도 했고, 또 기대에 못 미치는 점도 있
              었을 것입니다. 하오나, 갤러리누르가 한국미술계와 맺어온 특수한 관계는, 국외에서도 전례를 찾아보기 어려울
              정도로 자별(自別)하고 또 자별합니다. 앞으로 전심과 전력을 다해, 미비한 점을 보완하겠습니다. 더 나아가,
              새로운 내일로의 돌파구를 찾는 과정에 힘을 보태보겠습니다. 문화사적 존재 의의를 되새기며, 미래에 걸맞은
              모습으로 거듭나겠습니다.
            </p>
            <strong class="sign">갤러리누르 관장 <br>mr.back 올림 <br><br> 2022년 8월 1일</strong>
          </section>
        </div>
      </div>
    </main>

    <!-- 하단 -->
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
            <a href="/" class="nav-link px-2 text-muted">Home</a>
          </li>
          <li class="nav-item">
            <a href="/visit" class="nav-link px-2 text-muted">About</a>
          </li>
          <li class="nav-item">
            <a href="/notice" class="nav-link px-2 text-muted">Notice</a>
          </li>
          <li class="nav-item">
            <a href="/FAQ" class="nav-link px-2 text-muted">FAQs</a>
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
      console.log("시작 화면");
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
  </script>
</html>
