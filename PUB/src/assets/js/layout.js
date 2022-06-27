$(function () {
  if ($(window).width() > 1199) {
    $("#gnb > ul > li").on("mouseenter focusin", function () {
      $(this).addClass("gnbOn").siblings().removeClass("gnbOn");
    });

    $("#gnb > ul > li").on("mouseleave focusout", function () {
      $(this).removeClass("gnbOn");
    });
  }
});
