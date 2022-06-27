$(function () {
  var $window = $(window),
    $html = $("html");

  var $container = $("#container"),
    $conSection = $container.find(" > section"),
    sectionLength = $conSection.length,
    sectionRate = 1 / sectionLength,
    $mainNavItem = $(".mainNav li");

  //마우스 스크롤
  if ($window.width() > 1199) {
    $(".page").mousewheel(function (e, delta) {
      //플러그인 호출 후 사용가능
      h = $window.height();
      page = parseInt($(this).attr("data-page")) - delta;
      if (page) {
        var dataPage;
        dataPage = page <= 0 ? 1 : page;
        dataPage = page >= sectionLength ? 4 : page;
        $html.attr("data-page", dataPage);
      }
      $("body,html")
        .stop()
        .animate({ scrollTop: (page - 1) * h }, 100);
      handleNav();
      return false; //기본마우스 휠 기능 제거
    });
  }
  function handleNav() {
    var nav = $html.attr("data-page");
  }
  //스크롤이벤트
  $(".mainNav li").click(function () {
    //스크롤 애니메이션
    n = $(this).attr("data-n");
    target = $(".page" + n).offset().top;
    $("body,html").stop().animate({ scrollTop: target }, 100);
  });
  $window.scroll(function () {
    //스크롤 이벤트가 발생했을때
    st = $window.scrollTop(); //수직스크롤 값을 가져오기
    h = $window.height();
    offset2 = $(".page2").offset().top;
    offset3 = $(".page3").offset().top;
    offset4 = $(".page4").offset().top;

    $mainNavItem.removeClass("mainOn");
    if (st < offset2 - h * 0.25) {
      //1page조건
      $(".mainNav01").addClass("mainOn");
    } else if (st < offset3 - h * 0.5) {
      //2page조건
      $(".mainNav02").addClass("mainOn");
    } else if (st < offset4 - h * 0.75) {
      //3page조건
      $(".mainNav03").addClass("mainOn");
    } else if (st >= offset4 - h * 0.75) {
      //4page조건
      $(".mainNav04").addClass("mainOn");
    }
  });
});
//키보드 방향키 막기
$(document).keydown(function (event) {
  if (
    event.keyCode == 38 ||
    event.keyCode == 40 /*|| event.keyCode == 37 || event.keyCode == 39*/
  ) {
    console.log(event);
    event.preventDefault();
  }
  //38(↑), 40(↓), 37(←), 39(→)
});
