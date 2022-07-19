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

  // popup

  var $popBtn = $(".popBtn[data-pop]"),
    $popPanel = $(".popPanel[data-pop]"),
    $popBgClose = $popPanel.find(".bgClose"),
    $popClose = $popPanel.find(".close");
  $popBtn.on("click", function () {
    var $this = $(this),
      thisName = $this.attr("data-pop"),
      $thisPanel = $('.popPanel[data-pop="' + thisName + '"]');
    $thisPanel.addClass("active").focus();
  });
  $popBgClose.on("click", function () {
    setPopup($(this));
  });
  $popClose.on("click", function () {
    setPopup($(this));
  });
  function setPopup($this) {
    var $thisParent = $this.closest(".popPanel"),
      thisName = $thisParent.attr("data-pop"),
      $thisBtn = $(".popBtn[data-pop='" + thisName + "']");
    $thisParent.removeClass("active").removeAttr("title");
    $thisBtn.focus();
  }

  //리스트목록 정렬
  var $formList = $(".listLineUp"),
    $formSelect = $formList.find(".luSelect"),
    $formBtn = $formSelect.find(".luSelectBtn"),
    $selectBtn = $formSelect.find(".luSelectList a");
  $formBtn.on("click", function () {
    var $this = $(this),
      $thisParent = $this.closest(".luSelect"),
      $thisPanel = $this.siblings(".luSelectList");
    $thisParent.toggleClass("active");
    if ($thisParent.hasClass("active")) {
      $this.attr("title", "닫기");
      $thisPanel.stop().slideDown(200);
      $thisPanel.attr("title", "열림");
    } else {
      $this.attr("title", "열기");
      $thisPanel.stop().slideUp(200);
      $thisPanel.attr("title", "닫힘");
    }
  });

  $selectBtn.on("click", function () {
    var $this = $(this),
      thisValue = $this.attr("data-value"),
      $thisPanel = $this.closest(".luSelectList"),
      $thisParent = $this.closest(".luSelect");
    $thisParentBtn = $thisParent.find(".luSelectBtn");

    $this
      .addClass("active")
      .attr("title", "선택됨")
      .siblings()
      .removeClass("active")
      .removeAttr("title");
    $thisPanel.stop().slideUp(200).attr("title", "닫기");
    $thisParent.removeClass("active").attr("title", "열림");
    $thisParentBtn.attr("data-value", thisValue).text($this.text());
  });
});
