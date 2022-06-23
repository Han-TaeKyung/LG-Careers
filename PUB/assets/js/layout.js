$(function () {
  if ($(window).width() > 1199) {
    $("#gnb > ul > li").bind("mouseenter focusin", function () {
      $(this).addClass("gnbOn").siblings().removeClass("gnbOn");
    });

    $("#gnb > ul > li").bind("mouseleave focusout", function () {
      $(this).removeClass("gnbOn");
    });
  }
});
