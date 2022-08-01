<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c" %> <%@ taglib prefix="form"
uri="http://www.springframework.org/tags/form"%> <%@ page session="false" %>
<html>
  <head>
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
      crossorigin="anonymous"
    />
    <title>전시회 수정</title>
  </head>
  <style>
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
      text-decoration-line: none;
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
      <form
        id="frmAdd"
        action="/exhibit/modify/${exhibit.id}"
        method="POST"
        enctype="multipart/form-data"
      >
        <table class="col-12">
          <tr>
            <td class="col-3 text-center">전시회 이름 :</td>
            <td class="col-8 text-left">
              <input
                type="text"
                name="name"
                class="form-control"
                value="${exhibit.name}"
              />
            </td>
          </tr>
          <tr class="py-5">
            <td class="col-3 text-center">전시회 사진 :</td>
            <td class="col-8 text-left">
              <input
                class="form-control"
                type="file"
                id="formFile"
                name="file"
              />
            </td>
          </tr>
          <tr class="py-5">
            <td class="col-3 text-center">아티스트 :</td>
            <td class="col-8 text-left">
              <select
                class="form-select form-select-sm"
                aria-label=".form-select-sm example"
                id="artistList"
                name="artist"
              ></select>
            </td>
          </tr>
          <tr class="py-5">
            <td class="col-3 text-center">시작 날짜 :</td>
            <td class="col-8 text-left">
              <input
                class="form-control"
                type="date"
                name="startDate"
                value="${exhibit.startDate}"
              />
            </td>
          </tr>
          <tr class="py-5">
            <td class="col-3 text-center">끝 날짜 :</td>
            <td class="col-8 text-left">
              <input
                class="form-control"
                type="date"
                name="endDate"
                value="${exhibit.endDate}"
              />
            </td>
          </tr>
          <tr class="py-5">
            <td class="col-3 text-center">전시회 설명 :</td>
            <td class="col-8 text-left">
              <textarea
                name="info"
                class="form-control"
                id="editor"
                rows="15"
                cols="30"
                placeholder="전시회의 설명을 적어주세요."
              >
${exhibit.info}</textarea
              >
              <br /><br />
            </td>
          </tr>
          <tr class="py-5">
            <td class="col-3 text-center">가격 :</td>
            <td class="col-8 text-left">
              <input
                class="form-control"
                type="text"
                name="price"
                value="${exhibit.price}"
              />
            </td>
          </tr>
          <tr class="py-5">
            <td class="col-3 text-center">총 인원 수 :</td>
            <td class="col-8 text-left">
              <input
                class="form-control"
                type="text"
                name="total"
                value="${exhibit.total}"
              />
            </td>
          </tr>
        </table>
        <div class="col-12 text-end">
          <button type="submit" id="artistSend" class="btn btn-outline-primary">
            작성 완료
          </button>
          <button
            type="button"
            class="btn btn-outline-danger"
            onclick="location.href='/exhibit'"
          >
            취소
          </button>
        </div>
      </form>
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
    $(document).ready(function () {
      console.log("ㅇㅇㅇㅇ");
      $.ajax({
        type: "post",
        url: "/artist/getArtist",
        data: {},
        dataType: "JSON",
        beforeSend: function () {
          $("#artistList").empty();
        },
        success: function (data) {
          console.log(data);
          for (let i = 0; i < data.length; i++) {
            let list = data[i];
            let str =
              "<option name = artist id = " +
              list["id"] +
              ">" +
              list["name"] +
              "</option>";
            console.log(str);
            $("#artistList").append(str);
          }
        },
      });
    });
  </script>
</html>
