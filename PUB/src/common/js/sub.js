$(function () {
  //탭
  const tabs = document.querySelectorAll("[data-tab-target]");
  const tabContents = document.querySelectorAll("[data-tab-content]");
  for (var i = 0; i < tabs.length; i++) {
    var tab = tabs[i];
    tab.addEventListener("click", function () {
      const target = document.querySelector(tab.dataset.tabTarget);
      tabContents.forEach(function (tabContent) {
        tabContent.classList.remove("tabOn");
      });
      tabs.forEach(function (tab) {
        tab.classList.remove("tabOn");
      });
      tab.classList.add("tabOn");
      target.classList.add("tabOn");
    });
  }

  //input[file]
  var $uploadInputWrap = $(".inputBox.upload"),
    $uploadInput = $uploadInputWrap.find(".input"),
    $uploadText = $uploadInputWrap.find(".fileName"),
    $uploadClear = $uploadInputWrap.find(".clear");

  var uploadFile = new FileReader();

  $uploadInput.on("click", function () {
    $(this).find("option").height("50px");
  });
  $uploadInput.on("change", function (e) {
    fileCheck(e);
  });
  function fileCheck(e) {
    var $this = $(e.target);
    uploadFile = e.target.files;
    $uploadText.text(uploadFile.item(0).name);
    $this.siblings(".clear").addClass("active");
  }
  $uploadClear.on("click", function () {
    var $this = $(this);
    $this.siblings("input").val("");
    $uploadText.text("");
    $this.removeClass("active");
  });

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
