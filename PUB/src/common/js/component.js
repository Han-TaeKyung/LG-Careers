$(function () {
  //accordion
  var $guideAcc = $(".guideAcc"),
    $qBtn = $guideAcc.find(".qBtn");
  $qBtn.on("click", function () {
    var $this = $(this),
      $thisParent = $this.closest(".accItem"),
      $thisQuery = $thisParent.find(".q"),
      $thisAnswer = $thisParent.find(".a"),
      thisIndex = $thisParent.attr("data-num");
    $thisParent.toggleClass("active");
    $thisAnswer.slideToggle(100);
    if ($thisParent.hasClass("active")) {
      $this.attr("title", "닫기");
      $thisAnswer.attr("title", "열림");
    } else {
      $this.attr("title", "열기");
      $thisAnswer.attr("title", "닫힘");
    }
  });

  //slick
  var $lists = $(".slide-list");
  $lists.slick({
    //기본
    autoplay: true,
    dots: false,
    swipe: true,
    draggable: true,
    slidesToShow: 1,
    slidesToScroll: 1,
    variableWidth: false,
    infinite: true,
    //prevArrow: $infoBanner1.find(".prev"),
    //nextArrow: $infoBanner1.find(".next"),
    //추가 기능
    autoArrow: $(".banner1 .auto"),
    isRunOnLowIE: false,
    pauseOnArrowClick: true,
    pauseOnDirectionKeyPush: true,
    pauseOnSwipe: true,
    pauseOnDotsClick: true,
    pauseText: "정지",
    playText: "재생",
    responsive: [
      {
        breakpoint: 1001,
        settings: {
          swipe: true,
          draggable: true,
          verticalSwiping: true,
          swipeToSlide: true,
        },
      },
    ],
  });
});
