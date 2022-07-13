$(function () {
  // 기본 변수
  var $document = $(document),
    $window = $(window),
    $html = $("html"),
    $body = $("body");

  //main 변수
  var $container = $("#container"),
    $conSection = $container.find(".page"),
    sectionLength = $conSection.length,
    $mainNav = $(".mainNav");

  var speed = 100;
  var breakPoint = $window.width() >= 1200 && $window.height() > 800;

  //pageInfo 설정
  var pageInfo = [];
  var timer = null;

  setPageInfo();
  $window.on("resize", debounce(setPageInfo));

  function debounce(func) {
    var timer;
    return function (event) {
      if (timer) clearTimeout(timer);
      timer = setTimeout(func, 100, event);
    };
  }
  function setPageInfo() {
    $conSection.css("height", breakPoint ? $window.height() : "auto");
    pageInfo = [];
    $conSection.each(function () {
      var $this = $(this),
        thisIndex = parseInt($this.attr("data-page")),
        thisColor = $this.attr("data-color"),
        obj = {};
      obj.id = thisIndex;
      obj.offsetTop = $this.offset().top;
      obj.offsetBottom = $this.offset().top + $window.height() - 1;
      obj.color = thisColor;
      var windowBottom = $window.scrollTop() + $window.height() - 1;
      if (windowBottom >= obj.offsetTop && windowBottom <= obj.offsetBottom) {
        $html.attr({
          "data-page": thisIndex,
          "data-color": $this.attr("data-color"),
        });
      }
      pageInfo.push(obj);
    });

    console.table(pageInfo);

    //nav
    $mainNav.html("");
    pageInfo.forEach(function (elem) {
      var $elem = $('<button type="button" class="navBtn"></button>');
      $elem.attr("data-index", elem.id);
      $elem.text(elem.id + "/" + pageInfo.length);
      $elem.addClass(elem.id == $html.attr("data-page") ? "active" : "");
      $mainNav.append($elem);
    });
  }

  //nav click event
  $document.on("click", ".mainNav .navBtn", function () {
    var $this = $(this),
      thisIndex = parseInt($this.attr("data-index"));

    setNav(thisIndex);
  });

  //nav change function
  function setNav(index) {
    var thisData = pageInfo.filter(function (x) {
      return x.id === index;
    })[0];
    var $thisElem = $(".mainNav .navBtn[data-index=" + index + "]");
    $("body,html").stop().animate({ scrollTop: thisData.offsetTop }, speed);
    $html.attr({
      "data-page": thisData.id,
      "data-color": thisData.color,
    });
    $(".mainNav .navBtn").removeClass("active").removeAttr("title");
    $thisElem.addClass("active").attr("title", index + "번째 선택됨");
  }

  //마우스 스크롤 이벤트
  $conSection.on("mousewheel", function (e, delta) {
    var $this = $(this);
    moveContainer(e, delta, $this);
  });

  // 스크롤 이벤트 실행 함수
  function moveContainer(e, delta, $this) {
    var h = $window.height(),
      currentIndex = parseInt($this.attr("data-page")),
      nextIndex = currentIndex - delta;
    if (nextIndex > pageInfo.length) return; // 마지막 페이지 이후에 스크롤을 넘길 경우, 아래 내용을 실행하지 않음
    var customIndex = 0,
      thisScrollTop = $this.scrollTop(),
      thisScrollBottom = thisScrollTop + $this.outerHeight(),
      thisHeight = $this.find(".scrollWrap").outerHeight();

    if (breakPoint) {
      if ($this.hasClass("innerScroll")) {
        //page 안쪽 콘텐츠가 길어질 때
        if (
          (thisScrollTop <= 0 && delta > 0) ||
          (thisScrollBottom >= thisHeight && delta < 0)
        ) {
          $("body,html")
            .stop()
            .animate({ scrollTop: (nextIndex - 1) * h }, speed);
          setCustomIndex(nextIndex, customIndex);
          return false;
        }
      } else {
        $("body,html")
          .stop()
          .animate({ scrollTop: (nextIndex - 1) * h }, speed);
        setCustomIndex(nextIndex, customIndex);
        return false;
      }
    } else {
      //너비 1200 이하, 높이 800 이상 일 때

      var scrollTop = $html.scrollTop(),
        windowHeight = $container.height();
    }
  }

  //키보드 방향키 막기
  $document.keydown(function (e) {
    console.log(e.keyCode);
    var index = $html.attr("data-page");
    var $thisElem = $("#container").find('section[data-page="' + index + '"]');
    if ($window.width() > 1199) {
      if (
        e.keyCode === 38 ||
        e.keyCode === 40 /*|| e.keyCode == 37 || e.keyCode == 39*/
      ) {
        e.preventDefault();
      }
      if (e.keyCode === 33) {
        //pageUp 일 때, 위 화면으로 위동
        e.preventDefault();
        moveContainer(e, 1, $thisElem);
      }
      if (e.keyCode === 34) {
        //pageDown1 일 때, 아래 화면으로 이동
        e.preventDefault();
        moveContainer(e, -1, $thisElem);
      }
    }
    //38(↑), 40(↓), 37(←), 39(→)
  });

  //index custom 함수
  function setCustomIndex(nextIndex, customIndex) {
    if (nextIndex <= 0) {
      customIndex = 1;
    } else {
      customIndex = nextIndex;
    }
    var color = $container
      .find("section[data-page=" + customIndex + "]")
      .attr("data-color");
    $html.attr({
      "data-page": customIndex,
      "data-color": color,
    });
    setNav(customIndex);
  }

  //page1-visual
  //select
  var $formList = $(".formList"),
    $formSelect = $formList.find(".select"),
    $formBtn = $formSelect.find(".selectBtn"),
    $selectBtn = $formSelect.find(".selectWrap button");
  $formBtn.on("click", function () {
    var $this = $(this),
      $thisParent = $this.closest(".select"),
      $thisPanel = $this.siblings(".selectList");
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
    setScrollBar();
  });

  $selectBtn.on("click", function () {
    var $this = $(this),
      thisValue = $this.attr("data-value"),
      $thisPanel = $this.closest(".selectList"),
      $thisParent = $this.closest(".select");
    $thisParentBtn = $thisParent.find(".selectBtn");

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
  //scrollbar(jquery.scroll.js 플러그인)
  function setScrollBar() {
    $(".page1 .form .select").each(function () {
      var $this = $(this);
      $this.find(".scrollbar").scrollbar({
        showArrows: true,
        scrollx: "advanced",
        scrolly: "advanced",
      });
    });
  }

  //selectbox 마우스 휠 액션
  $(".selectWrap").mousewheel(function (e, delta) {
    e.stopPropagation();
    var $this = $(this),
      $thisParent = $this.closest(".selectList").find(">div"),
      thisHeight = $this.height();
    (thisScrollTop = $this.scrollTop()),
      (thisScrollBottom = thisScrollTop + thisHeight);
    if (thisScrollTop <= 0 && delta > 0) {
      e.preventDefault();
    } else if (thisScrollBottom > thisHeight && delta < 0) {
      e.preventDefault();
    }
  });

  // page3 - Our Affiliate Channel
  var $page3 = $(".page3"),
    $channelList = $page3.find(".channelList"),
    $channelDescWrap = $page3.find(".channelDesc"),
    $channelDesc = $channelDescWrap.find(".disc"),
    $partBtn = $(".channelItem .partBtn");
  $partBtn.on("click", function () {
    var $this = $(this),
      thisIndex = parseInt($this.attr("data-part"));
    $partBtn.removeClass("active");
    $this.addClass("active");
    $channelDesc.removeClass("active");
    $channelDesc.eq(thisIndex).addClass("active");
  });
  $channelList
    .find(".channelItem:first-child .partBtn:first-child")
    .trigger("click");

  // page4 - our people
  var $rollingScroll = $(".page4 .leftScroll");
  var $scrollItem = $rollingScroll.find(".scrollItem");
  var $scrollItemInner = $scrollItem.html();
  $scrollItem.append($scrollItemInner);
  $scrollItem.clone().addClass("cloneItem").appendTo($rollingScroll);
  $scrollItem.css("left", 0);
  $rollingScroll.find(".cloneItem").css("left", $scrollItem.width() + "px");

  // page5 - our job posting
  var $postWrap = $(".page5 .conWrap"),
    $postSlide = $postWrap.find(".postList"),
    itemLength = $postSlide.find(".postItem").length,
    $postCtrl = $postWrap.find(".postCtrl"),
    $postDots = $postCtrl.find(".postDots"),
    $postPrev = $postCtrl.find(".prev"),
    $postNext = $postCtrl.find(".next"),
    $postBar = $postCtrl.find(".postBar"),
    $postProgress = $postCtrl.find(".progress"),
    $postBtns = $postCtrl.find(".btns"),
    showCount = 4,
    current = 0,
    total = 0;

  $postSlide.slick({
    //기본
    autoplay: false,
    swipe: true,
    infinite: false,
    draggable: true,
    slidesToShow: showCount,
    slidesToScroll: 1,
    variableWidth: false,
    pauseOnHover: false,
    arrows: true,
    prevArrow: $postPrev,
    nextArrow: $postNext,
    dots: true,
    appendDots: $postDots,
    customPaging: function (slider, i) {
      current = i + 1;
      total = slider.slideCount - showCount + 1;
      return (
        '<button type="button"><span class="current">' +
        current +
        '</span><span class="total">/' +
        total +
        "</span></button>"
      );
    },
    isRunOnLowIE: false,
    pauseOnArrowClick: true,
    pauseOnDirectionKeyPush: true,
    pauseOnSwipe: true,
    pauseOnDotsClick: true,
    rows: 2,
    swipeToSlide: true,
    responsive: [
      {
        breakpoint: 1001,
        settings: {
          swipe: true,
          draggable: true,
          swipeToSlide: true,
        },
      },
    ],
  });

  //슬라이드 바
  var progressWidth = 100 / total;
  var nextSlide = 0;
  $postProgress.css("width", progressWidth + "%");
  $postSlide.on("beforeChange", function (slide, e, crr, next) {
    nextSlide = next;
    $postProgress.css(
      "width",
      total === next + 1 ? "100%" : progressWidth * (next + 1) + "%"
    );
  });
  //마우스 휠 액션
  $postSlide.on("mousewheel", function (e, delta) {
    e.preventDefault();
    e.stopPropagation();
    $postSlide.slick("slickGoTo", nextSlide - delta);
  });

  // 하단 슬라이드 박스 너비 맞춤

  // ie대응 bar 넓이값
  function postCtrlWidth() {
    var postContainerWidth = $postCtrl.width(),
      dotsWidth = Math.ceil($postDots.outerWidth()),
      btnsWidth = Math.ceil($postBtns.outerWidth());
    $postBar.css("width", postContainerWidth - dotsWidth - btnsWidth - 41);
  }
  postCtrlWidth();
  var timer = null;
  $window.on("resize", function () {
    clearTimeout(timer);
    timer = setTimeout(postCtrlWidth, 200);
  });
});
