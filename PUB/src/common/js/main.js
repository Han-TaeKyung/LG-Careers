$(function () {
  // 기본 변수
  var $document = $(document),
    $window = $(window),
    $html = $("html"),
    $body = $("body");

  //main 변수
  var $container = $("#container"),
    $conSection = $container.find(".page"),
    $mainNav = $(".mainNav");

  //pageInfo 설정 변수
  var pageInfo = []; // {id:number(1부터 시작), offsetTop:number, ofttsetBottm:number, color:white|black}
  var speed = 1000; // scroll 속도
  var breakPoint = $window.width() >= 1500 && $window.height() > 800; //scroll 모션 적용 범위

  //pageInfo 기본설정
  $window.on("load", function () {
    setPageInfo();
  });
  $window.on("resize", debounce(setPageInfo));

  function debounce(func) {
    //resize시 debounce적용 - 리소스 활용 최소화
    var timer;
    return function () {
      if (timer) clearTimeout(timer);
      timer = setTimeout(func, 100);
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
      obj.offsetBottom = $this.offset().top + $this.outerHeight() - 0.0001;
      $this.attr({
        "data-offsetTop": $this.offset().top,
        "data-offsetBottom": $this.offset().top + $this.outerHeight() - 0.0001,
      });
      obj.color = thisColor;
      var windowBottom = $window.scrollTop() + $window.height();
      if (windowBottom >= obj.offsetTop && windowBottom <= obj.offsetBottom) {
        $html.attr({
          "data-page": thisIndex,
          "data-color": $this.attr("data-color"),
        });
      }
      pageInfo.push(obj);
      breakPoint = $window.width() >= 1500 && $window.height() > 800;
      $html.attr("data-scroll", breakPoint ? true : false);
    });

    // html data 처음 설정
    var firstData = pageInfo.filter(function (x) {
      return x.id === 1;
    })[0];
    $html.attr({
      "data-page": firstData.id,
      "data-color": firstData.color,
      "data-offsetTop": firstData.offsetTop,
      "data-offsetBottom": firstData.offsetBottom,
    });

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
    var thisIndex = parseInt($(this).attr("data-index")),
      thisData = pageInfo.filter(function (x) {
        return x.id == thisIndex;
      })[0];
    setNav(thisIndex);
    $("body,html").stop().animate({ scrollTop: thisData.offsetTop }, speed);
  });

  //nav change function
  function setNav(index) {
    var thisData = pageInfo.filter(function (x) {
      return x.id == index;
    })[0];
    var $thisElem = $mainNav.find(".navBtn[data-index=" + index + "]");
    $html.attr({
      "data-page": thisData.id,
      "data-color": thisData.color,
    });
    $mainNav.find(".navBtn").removeClass("active").removeAttr("title");
    $thisElem.addClass("active").attr("title", index + "번째 선택됨");
  }

  //마우스 스크롤 이벤트
  $conSection.on("mousewheel", function (e, delta) {
    var $this = $(this);
    moveContainer(e, delta, $this);
  });

  // 스크롤 이벤트 실행 함수
  var nowScroll = false; // 스크롤 시, 다른 스크롤 이벤트 방지 목적 변수
  function moveContainer(e, delta, $this) {
    var currentIndex = parseInt($this.attr("data-page")),
      nextIndex = currentIndex - delta;
    if (nextIndex > pageInfo.length) return; // 마지막 페이지 이후에 스크롤을 넘길 경우, 아래 내용을 실행하지 않음
    var customIndex = 0,
      thisScrollTop = $this.scrollTop(),
      thisScrollBottom = thisScrollTop + $this.outerHeight(),
      thisHeight = $this.find(".scrollWrap").outerHeight(),
      nextData = pageInfo.filter(function (x) {
        return nextIndex > 0 ? x.id == parseInt(nextIndex) : x.id == 1;
      })[0];
    if (breakPoint) {
      if ($this.hasClass("innerScroll")) {
        //page 안쪽 콘텐츠가 길어질 때
        e.stopPropagation();
        var prevBottom = Math.ceil(
          $('.page[data-page="' + (currentIndex - 1) + '"]').attr(
            "data-offsetBottom"
          )
        );
        if (
          (thisScrollTop <= 0 && delta > 0) ||
          (thisScrollBottom >= thisHeight && delta < 0)
        ) {
          e.preventDefault();
          if (!nowScroll) {
            nowScroll = true;
            $("body,html")
              .stop()
              .animate({ scrollTop: nextData.offsetTop }, speed);
            setNav(parseInt($html.attr("data-page")));
            $html.attr({
              "data-page": nextData.id,
              "data-color": nextData.color,
            });
            setTimeout(function () {
              nowScroll = false;
            }, speed);
          } else {
          }
          return false;
        }
        setTimeout(function () {
          $("body,html").scrollTop(prevBottom);
        }, 100);
      } else {
        e.preventDefault();
        if (!nowScroll) {
          nowScroll = true;
          setCustomIndex(nextIndex, customIndex);
          $("body,html")
            .stop()
            .animate({ scrollTop: nextData.offsetTop }, speed);

          setNav(parseInt($html.attr("data-page")));
          setTimeout(function () {
            nowScroll = false;
          }, speed);
        }
        return false;
      }
    } else {
      e.preventDefault();
      setTimeout(function () {
        //너비 1200 이하거나 높이 800 이하 일 때
        var scrollTop = $window.scrollTop(),
          windowHeight = $container.height(),
          reset = true;

        pageInfo.forEach(function (x, index) {
          if (
            x.offsetBottom >= scrollTop &&
            x.offsetTop <= scrollTop &&
            reset
          ) {
            $html.attr({
              "data-page": x.id,
              "data-color": x.color,
            });
            reset = false;
          }
        });
      }, 200);
      setNav(parseInt($html.attr("data-page")));
    }
  }

  //키보드 방향키 막기(스크롤 모션시에만 적용)
  $document.keydown(function (e) {
    console.log(e.keyCode);
    var index = $html.attr("data-page");
    var $thisElem = $("#container").find('section[data-page="' + index + '"]');
    if (breakPoint) {
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

  //page2 - our story
  var $hashBtn = $(".page2 .hash button"),
    $page2TabCon = $(".page2 .conWrap .storyList");
  $hashBtn
    .on("click", function () {
      var $this = $(this),
        thisIndex = $this.index();
      $hashBtn.removeClass("active").attr("title", "열기");
      $this.addClass("active").attr("title", "닫기");
      $page2TabCon.removeClass("active").removeAttr("title");
      $page2TabCon.eq(thisIndex).addClass("active").attr("title", "열림");
    })
    .triggerHandler("click");

  // page3 - Our Affiliate Channel
  var $page3 = $(".page3"),
    $channelList = $page3.find(".channelList"),
    $channelItem = $channelList.find(".channelItem"),
    $channelDescWrap = $page3.find(".channelDesc"),
    $channelDesc = $channelDescWrap.find(".disc"),
    $partBtn = $channelItem.find(".partBtn"),
    $channelDepth1 = $channelItem.find(".depth1Item"),
    $channelDepth2 = $channelItem.find(".depth2Item");

  $channelDepth2.closest(".depth1Item").addClass("has");
  $partBtn.on("click", function () {
    var $this = $(this),
      $thisParent = $this.closest(".depth1Item"),
      thisIndex = parseInt($this.attr("data-part")),
      thisBg = $this.attr("data-bg");
    $page3.css("background-image", "url(" + thisBg + ")");
    $channelDepth1.removeClass("active").attr("title", "열기");
    $thisParent.addClass("active").attr("title", "닫기");
    $channelDesc.removeClass("active").removeAttr("title");
    $channelDesc.eq(thisIndex).addClass("active").attr("title", "열림");

    $channelDepth1.each(function () {
      var $thisElem = $(this);
      if ($thisElem.hasClass("has active")) {
        $thisElem.find(".depth2Item").stop().slideDown(200);
        $thisElem.closest(".channelItem").addClass("subActive");
      } else if ($thisElem.hasClass("has") && !$thisElem.hasClass("active")) {
        $thisElem.find(".depth2Item").stop().slideUp(200);
        $thisElem.closest(".channelItem").removeClass("subActive");
      }
    });
  });
  $channelList
    .find(".channelItem:first-child .depth1Item:first-child .partBtn")
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

  // 그림자 크기 대응
  $postItem = $postSlide.find(".slick-slide");
  function setIndex(index) {
    return '.slick-slide[data-slick-index="' + index + '"]';
  }
  function setState(state) {
    return { "data-state": state };
  }
  $postItem.each(function () {
    var $this = $(this);

    if ($this.hasClass("slick-current")) {
      var thisIndex = parseInt($this.attr("data-slick-index")),
        prevIndex = thisIndex - (showCount + 1),
        nextIndex = thisIndex + showCount;
      $this.attr("data-state", "now");
      $postSlide.find(setIndex(prevIndex)).attr(setState("prev"));
      $postSlide.find(setIndex(nextIndex)).attr(setState("next"));
    }
  });

  $window.on("load", function () {
    $postItem.attr("data-state", "");
    $postSlide.find(setIndex(0)).attr(setState("now"));
    $postSlide.find(setIndex(showCount)).attr(setState("next"));
  });

  $postSlide.on(
    "beforeChange",
    function (event, slide, currentSlide, nextSlide) {
      $postSlide.find(".slick-slide").attr(setState(""));
      $postSlide.find(setIndex(nextSlide)).attr(setState("now"));
      $postSlide.find(setIndex(nextSlide - 1)).attr(setState("prev"));
      $postSlide.find(setIndex(nextSlide + showCount)).attr(setState("next"));
    }
  );

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
    $postBar.css("width", postContainerWidth - dotsWidth - btnsWidth - 1);
  }
  postCtrlWidth();
  $window.on("resize", debounce(postCtrlWidth));
});
