$(function () {
  //탭
  var $tabBtn = $(".tabMenu .tabBtn");

  $tabBtn.on("click", function () {
    var $this = $(this),
      $thisLi = $this.closest(".tab"),
      thisTarget = $thisLi.attr("data-tab-target"),
      $thisTabWrap = $this.closest(".tabMenu"),
      $tabLi = $thisTabWrap.find(".tab"),
      $thisConWrap = $thisTabWrap.find(".tabCon"),
      $tabCon = $thisConWrap.find("[data-tab-content]"),
      $thisCon = $thisConWrap.find("#" + thisTarget);

    //버튼 처리
    $tabLi.removeClass("tabOn");
    $thisLi.addClass("tabOn");
    $tabBtn.attr("title", "열기");
    $this.attr("title", "닫기");

    // 콘텐츠 처리
    $tabCon.removeClass("tabOn").removeAttr("title");
    $thisCon.addClass("tabOn").attr("title", "열림");
  });

  // ie 오류
  // for (var i = 0; i < tabs.length; i++) {
  //   var tab = $tabs[i];
  //   tab.addEventListener("click", function (e) {
  //     var target = document.querySelector(tab.dataset.tabTarget);
  //     var thisTabMenu = $(e.target).closest(".tabMenu");
  //     var tabs = thisTabMenu.find("[data-tab-target]");
  //     var tabContents = thisTabMenu.find("[data-tab-content]");
  //     tabContents.removeClass("tabOn");
  //     tabs.removeClass("tabOn");
  //     tab.classList.add("tabOn");
  //     target.classList.add("tabOn");
  //   });
  // }

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
});
