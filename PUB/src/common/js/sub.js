$(function () {
  //탭
  var $tabs = document.querySelectorAll("[data-tab-target]");
  $tabs.forEach(function (tab) {
    tab.addEventListener("click", function (e) {
      var target = document.querySelector(tab.dataset.tabTarget);
      var thisTabMenu = e.target.closest(".tabMenu");
      var tabs = thisTabMenu.querySelectorAll("[data-tab-target]");
      var tabContents = thisTabMenu.querySelectorAll("[data-tab-content]");
      tabContents.forEach((tabContent) => {
        tabContent.classList.remove("tabOn");
      });
      tabs.forEach((tab) => {
        tab.classList.remove("tabOn");
      });
      tab.classList.add("tabOn");
      target.classList.add("tabOn");
    });
  });

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
