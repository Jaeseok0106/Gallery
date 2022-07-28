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
    <title>NOTICE UPDATE</title>
  </head>
  <style>
    .nav-item {
      list-style-type: none;
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
      border-bottom: 10px solid black;
      margin-bottom: 2rem;
    }
    .page-title h1 {
      padding: 2rem;
      text-align: center;
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
    .ck-editor__editable {
      height: 600px;
    }
  </style>
  <body>
    <div class="container">
      <header class="blog-header py-3" style="height: 230px">
        <div class="row flex-nowrap justify-content-between align-items-center">
          <div class="text-center">
            <img src="/logo.png" id="logo" style="height: 80px" />
          </div>
        </div>
        <br /><br /><br />
        <div class="nav-scroller mb-7" id="list">
          <ul class="nav justify-content-center">
            <li class="nav-item mx-5">
              <a
                class="nav-link active p-7"
                aria-current="page"
                href="#"
                id="nav1"
                >About us</a
              >
              <div>
                <ul
                  class="nav justify-content-end"
                  style="display: none"
                  id="none1"
                >
                  <li class="nav-item">
                    <a
                      class="nav-link"
                      aria-current="page"
                      href="/letter"
                      id="detail"
                      >Director's letter</a
                    >
                  </li>
                  <li class="nav-item">
                    <a
                      class="nav-link"
                      aria-current="page"
                      href="/visit"
                      id="detail"
                      >Visit</a
                    >
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
              <a class="nav-link" href="#" id="nav4">Post</a>
              <ul
                class="nav justify-content-end"
                style="display: none"
                id="none2"
              >
                <li class="nav-item">
                  <a
                    class="nav-link"
                    aria-current="page"
                    href="/review"
                    id="detail"
                    >Review</a
                  >
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
              <a class="nav-link" aria-current="page" href="#" id="nav5"
                >Member</a
              >
              <ul
                class="nav justify-content-end"
                style="display: none"
                id="none3"
              >
                <c:if test="${user.id == null}">
                  <li class="nav-item">
                    <a
                      class="nav-link"
                      aria-current="page"
                      href="/login"
                      id="detail"
                      >Login</a
                    >
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="/signin" id="detail">Sign in</a>
                  </li>
                </c:if>
                <c:if test="${user.id != null }">
                  <li class="nav-item">
                    <a
                      class="nav-link"
                      aria-current="page"
                      href="/logout"
                      id="detail"
                      >Logout</a
                    >
                  </li>
                </c:if>
                <c:if test="${user.role == '방문자'}">
                  <li class="nav-item">
                    <a class="nav-link" href="/mypage" id="detail">My page</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" id="detail" href="/history"
                      >결제 내역</a
                    >
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
              <a class="nav-link" aria-current="page" href="/notice" id="nav6"
                >Notice</a
              >
            </li>
          </ul>
        </div>
      </header>
    </div>
    <input type="hidden" id="role" value="${user.role}" />
    <input type="hidden" id="usernum" value="${user.userNum}" />
    <input type="hidden" id="id" value="${ndto.id}" />
    <!-- main 안에다가 주 내용 작성할것 -->
    <main class="container p-5">
      <div
        style="
          border-top: 0.3rem dotted black;
          border-bottom: 0.3rem dotted black;
        "
      >
        <h5>NOTICE</h5>
      </div>
      <div class="row py-4">
        <form action="/update/${ndto.id}" method="POST">
          <div class="col">
            <input
              class="form-control"
              type="text"
              name="title"
              placeholder="제목"
              aria-label="default input example"
              value="${ndto.title}"
            /><br /><br />
            <textarea
              name="content"
              class="form-control"
              id="editor"
              rows="30"
              cols="50"
            >
${ndto.content}</textarea
            >
            <br /><br />
          </div>
          <div class="col text-end">
            <button type="submit" class="btn btn-outline-primary" id="clear">
              수정 완료
            </button>
            <button type="button" class="btn btn-outline-danger" id="reset">
              취소
            </button>
          </div>
        </form>
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
  <script src="/ckeditor/ckeditor.js"></script>
  <script>
    CKEDITOR.replace("editor");
  </script>
  <script>
    $(document)
        .on('click','#logo',function(){
            document.location.href='/';
        })
    $(document)
        .on('click','#logo',function(){
            document.location.href='../../..';
        })
    $(document)
        .on('click','#clear',function(){
            if(confirm("수정을 완료하시겠습니까?")) {
                        alert("게시물이 수정되었습니다.");
                    }
            else {
                return false;
            }
        })
    $(document)
        .on('click','#reset',function(){
            if(confirm("수정을 취소하시겠습니까?")) {
                alert("게시물 수정이 취소되었습니다.");
                document.location.href='/content?id='+${ndto.id};
            }
            else {
                return false;
            }
        })
  </script>
</html>
