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
});
