$(function () {
  if ($(window).width() > 1199) {
    $("#gnb > ul > li").on("mouseenter focusin", function () {
      $(this).parent().addClass("gnbOn").parent().removeClass("gnbOn");
      $('#header').addClass("mainHeaderHover");
    });

    $("#gnb > ul").on("mouseleave focusout", function () {
      $(this).removeClass("gnbOn");
      $('#header').removeClass("mainHeaderHover");
    });
  }
});
