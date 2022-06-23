$(function () {
  if ($(window).width() > 1199) {
    $(document).on("mouseenter focusin", "#gnb > ul > li", function () {
      $(this).addClass("gnbOn").siblings().removeClass("gnbOn");
    });

    $(document).on("mouseleave focusout", "#gnb > ul > li", function () {
      $(this).removeClass("gnbOn");
    });
  }
});
