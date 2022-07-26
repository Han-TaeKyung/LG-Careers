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
  }else{
    $("#gnb > ul > li").on("click", function () {
      $(this).toggleClass("gnbOn").siblings().removeClass("gnbOn");
    });
    $(".mGnbBtn").on("click", function(){
      $(this).parent().parent().toggleClass("mGnbBtnOn");
    });
  }

  //채용공고 왼쪽네비
  var lnbMenu = $(".recruitLnb .guideAcc .menu2Dep a")
  lnbMenu.click(function(){
    $(this).parent().toggleClass("active");
  });
});
