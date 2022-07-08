$(function () {
  //탭
  const tabs = document.querySelectorAll("[data-tab-target]");
  const tabContents = document.querySelectorAll("[data-tab-content]");

  tabs.forEach((tab) => {
    tab.addEventListener("click", () => {
      const target = document.querySelector(tab.dataset.tabTarget);
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

  $( '.joinSlider' ).slick( {
    autoplay: false,
    autoplaySpeed: 3000,
    slidesToShow: 2,
    slidesToScroll: 1,
  } );
});
