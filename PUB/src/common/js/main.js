$(function () {
  // 기본 변수
  var $document = $(document),
    $window = $(window),
    $html = $("html"),
    $body = $('body');

  //main 변수
  var $container = $("#container"),
    $conSection = $container.find(".page"),
    sectionLength = $conSection.length,
    $mainNav = $('.mainNav');

  var speed = 100;

  //pageInfo 설정
  var pageInfo = [];
  var timer = null;
  setPageInfo();
  $window.on('resize', function () {
    clearTimeout(timer);
    timer = setTimeout(setPageInfo, 200)
  });

  function setPageInfo() {
    pageInfo = [];
    $conSection.each(function () {
      var $this = $(this),
        thisIndex = parseInt($this.attr('data-page')),
        thisColor = $this.attr('data-color'),
        obj = {};
      obj.id = thisIndex;
      obj.offsetTop = $this.offset().top;
      obj.offsetBottom = $this.offset().top + $window.height() - 1;
      obj.color = thisColor;
      var windowBottom = $window.scrollTop() + $window.height() - 1;
      if (windowBottom >= obj.offsetTop && windowBottom <= obj.offsetBottom) {
        $html.attr({
          'data-page': thisIndex,
          'data-color': $this.attr('data-color')
        })
      }
      pageInfo.push(obj);
    });

    //nav
    $mainNav.html('');
    pageInfo.forEach(function (elem) {
      var $elem = $('<button type="button" class="navBtn"></button>');
      $elem.attr('data-index', elem.id);
      $elem.text(elem.id + '/' + pageInfo.length);
      $elem.addClass(elem.id == $html.attr('data-page') ? 'active' : '');
      $mainNav.append($elem);
    })
  }

  //nav click event
  $document.on('click', '.mainNav .navBtn', function () {
    var $this = $(this),
      thisIndex = parseInt($this.attr('data-index'));

    setNav(thisIndex)
  });

  //nav change function
  function setNav(index) {
    var thisData = pageInfo.filter(function (x) {
      return x.id === index;
    })[0];
    var $thisElem = $('.mainNav .navBtn[data-index=' + (index) + ']');
    $("body,html")
      .stop()
      .animate({ scrollTop: thisData.offsetTop }, speed);
    $html.attr({
      'data-page': thisData.id,
      'data-color': thisData.color,
    });
    $('.mainNav .navBtn').removeClass('active').removeAttr('title');
    $thisElem.addClass('active').attr('title', index + '번째 선택됨')

  }

  //마우스 스크롤 이벤트
  $conSection.on('mousewheel', function (e, delta) {
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
      thisScrollBottom = thisScrollTop + $this.height(),
      thisHeight = $this.find(".scrollWrap").height();

    if ($window.width() >= 1200) {
      if ($this.hasClass('innerScroll')) { //page 안쪽 콘텐츠가 길어질 때
        if ((thisScrollTop <= 0 && delta > 0) || (thisScrollBottom >= thisHeight && delta < 0)) {
          e.preventDefault();
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
    } else if ($window.width() < 1200) { //1200 이하일 때
      var scrollTop = $html.scrollTop(),
        windowHeight = $container.height();
    }
  }

  //키보드 방향키 막기
  $document.keydown(function (e) {
    console.log(e.keyCode);
    var index = $html.attr('data-page');
    var $thisElem = $('#container').find('section[data-page="' + index + '"]');
    if ($window.width() > 1199) {
      if (
        e.keyCode === 38 ||
        e.keyCode === 40 /*|| e.keyCode == 37 || e.keyCode == 39*/
      ) {
        e.preventDefault();
      }
      if (e.keyCode === 33) { //pageUp 일 때, 위 화면으로 위동
        e.preventDefault();
        moveContainer(e, 1, $thisElem);
      }
      if (e.keyCode === 34) { //pageDown1 일 때, 아래 화면으로 이동
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
    var color = $container.find('section[data-page=' + customIndex + ']').attr('data-color');
    $html.attr({
      'data-page': customIndex,
      'data-color': color,
    });
    setNav(customIndex)
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

  $selectBtn.on('click', function () {
    var $this = $(this),
      thisValue = $this.attr('data-value'),
      $thisPanel = $this.closest('.selectList'),
      $thisParent = $this.closest('.select');
    $thisParentBtn = $thisParent.find('.selectBtn');

    $this.addClass('active').attr('title', '선택됨')
      .siblings().removeClass('active').removeAttr('title');
    $thisPanel.stop().slideUp(200).attr('title', '닫기');
    $thisParent.removeClass('active').attr('title', '열림')
    $thisParentBtn.attr('data-value', thisValue);

  })
  //scrollbar(jquery.scroll.js 플러그인)
  function setScrollBar() {
    $('.page1 .form .select').each(function () {
      var $this = $(this);
      $this.find('.scrollbar').scrollbar({
        "showArrows": true,
        "scrollx": "advanced",
        "scrolly": "advanced"
      });
    });
  }

  //selectbox 마우스 휠 액션
  $('.selectWrap').mousewheel(function (e, delta) {
    e.stopPropagation();
    var $this = $(this),
      $thisParent = $this.closest('.selectList').find('>div'),
      thisHeight = $this.height();
    thisScrollTop = $this.scrollTop(),
      thisScrollBottom = thisScrollTop + thisHeight;
    if (thisScrollTop <= 0 && delta > 0) {
      e.preventDefault()
    } else if (thisScrollBottom > thisHeight && delta < 0) {
      e.preventDefault()
    }
  });

  //page2-our story

  //
  // var $tagContainer = $(".page2 .hash");
  // var $storyList = $(".page2 .storyList");
  // storyData.forEach(function (obj, i) {
  //   setStoryData(obj, $storyList);
  // });
  // tags.forEach(function (elem, i) {
  //   var $hashBtn = $('<button type="button" class="hashBtn"></button>');
  //   $hashBtn.text("#" + elem);
  //   $tagContainer.append($hashBtn);
  // });
  // $document.on("click", ".page2 .hashBtn", function () {
  //   var $this = $(this),
  //     thisText = $this.text().replace("#", "");
  //   var filterData = storyData.filter(function (x) {
  //     return x.tag === thisText;
  //   });
  //   $storyList.html("");
  //   if (filterData.length !== 0) {
  //     filterData.forEach(function (obj, i) {
  //       setStoryData(obj, $storyList);
  //     });
  //   } else {
  //     var $empty = $('<li class="empty">내용이 없습니다.</li>');
  //     $storyList.append($empty);
  //   }
  // });
  // function setStoryData(obj, $parent) {
  //   var $item = $(
  //     '<li class="storyItem">\n' +
  //     '<a href="#n" class="storyAnchor">\n' +
  //     '<div class="imgWrap"><div class="storyImg">\n' +
  //     '<img src="" alt="">\n' +
  //     "</div></div>\n" +
  //     '<div class="storyCon">\n' +
  //     '<h3 class="tag">LG Life</h3>\n' +
  //     "<p>장애 청소년들에게 LG 스탠바이미를 기부하고자 세 사람이 모이게 된 사연은?</p>\n" +
  //     "</div>\n" +
  //     "</a>\n" +
  //     "</li>"
  //   );
  //   $item.find(".storyAnchor").attr("href", obj.href);
  //   $item.find("img").attr({ src: obj.image, alt: obj.title });
  //   $item.find("h3").text(obj.tag);
  //   $item.find("p").text(obj.title);
  //   $parent.append($item);
  // }
  // $storyCon = $(".page2 .conWrap");

  // page3 - Our Affiliate Channel
  var $page3 = $(".page3"),
    $channelList = $page3.find(".channelList"),
    $channelDesc = $page3.find(".channelDesc");

  group.map(function (obj, i) {
    var $channelItem = $(
      '<li class="channelItem">\n' +
      "<h3>\n" +
      '<button type="button" class="accBtn"></button>\n' +
      "</h3>\n" +
      '<div class="items"></div>\n' +
      "</li>"
    );


    $channelItem.find("h3 .accBtn").text(obj);
    var filteredData = departData.filter(function (x) {
      return x.group === obj;
    });
    var length = filteredData.length;
    $channelItem.find("h3 .accBtn").append("<sup>" + length + "</sup>");

    filteredData.map(function (obj, i) {
      var $partBtn = $(
        '<button type="button" class="partBtn" data-index="' +
        obj.id +
        '">' +
        obj.title +
        "</button>"
      );
      $channelItem.find(".items").append($partBtn);

    });
    $channelList.append($channelItem);
  });
  var $partBtn = $('.channelItem .partBtn');
  $partBtn.on("click", function () {
    var $this = $(this),
      thisIndex = parseInt($this.attr('data-index'));
    $partBtn.removeClass('active')
    $this.addClass('active');
    $channelDesc.html("");
    var obj = departData.filter(function (x) {
      return x.id === thisIndex;
    })[0];
    $page3.css("backgroundImage", 'url(' + obj.image + ')');
    var $desc = $(
      '<div class="desc"><h4>로고요~~</h4>\n' +
      "<p></p>\n" +
      '<a href="" class="descAnchor"><span>채널 바로가기</span></a></div>'
    );
    $desc
      .find("h4")
      .html('<img src="' + obj.logo + '" alt="' + obj.title + '">');
    var content = obj.content;
    var conDevide = content.split("\n").join("<br/>");
    $desc.find("p").html(conDevide);
    $desc.find(".descAnchor").attr({
      href: obj.href,
    });
    $channelDesc.append($desc);
  });
  $('.channelItem:first-child .partBtn:first-child').trigger('click')


  // page4 - our job posting
  var $postWrap = $(".page4 .conWrap"),
    $postSlide = $postWrap.find('.postList'),
    itemLength = $postSlide.find('.postItem').length,
    $postCtrl = $postWrap.find('.postCtrl'),
    $postDots = $postCtrl.find('.postDots'),
    $postPrev = $postCtrl.find('.prev'),
    $postNext = $postCtrl.find('.next'),
    $postProgress = $postCtrl.find('.progress'),
    showCount = 4,
    current = 0;
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
      total = (slider.slideCount - showCount + 1);
      return '<button type="button"><span class="current">' + current + '</span><span class="total">/' + total + '</span></button>'
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
          swipeToSlide: true
        }
      }]
  });
  var progressWidth = 100 / total;
  var nextSlide = 0;
  $postProgress.css('width', progressWidth + '%');
  $postSlide.on('beforeChange', function (slide, e, crr, next) {
    nextSlide = next;
    $postProgress.css('width', total === (next + 1) ? '100%' : progressWidth * (next + 1) + '%');
  });
  $postSlide.on('mousewheel', function (e, delta) {
    e.preventDefault();
    e.stopPropagation()
    $postSlide.slick('slickGoTo', nextSlide - delta);
  })




  // page5 - our people
  var $rollingScroll = $(".page5 .leftScroll");
  var $scrollItem = $rollingScroll.find(".scrollItem");
  var rowCount = 0;
  var count = 1;
  var peopleLength = peopleData.length;
  for (var i = 0; i < peopleLength; i++) {
    var $rowItem = $('<div class="peopleRow"></div>');
    for (var j = 0; j < 2; j++) {
      var index = rowCount < peopleLength ? rowCount : rowCount % peopleLength;
      var elem = peopleData.filter(function (x) {
        return x.id === index;
      })[0];
      var $item = $('<div class="peopleItem"></div>'),
        $anchorItem = $('<a class="peopleItem"></a>');
      if (!elem.href) {
        $item.text(elem.title);
        $item.css("backgroundImage", "url(" + elem.img + ")");
        $rowItem.append($item);
      } else {
        $anchorItem.attr("href", elem.href);
        $anchorItem.text(elem.title);
        $anchorItem.css("backgroundImage", "url(" + elem.img + ")");
        $rowItem.append($anchorItem);
      }
      rowCount++;
      count += 1;
      if (count > 2) {
        $scrollItem.append($rowItem);
        count = 1;
      }
    }
  }
  $scrollItem.clone().addClass("cloneItem").appendTo($rollingScroll);
  $scrollItem.css("left", 0);
  $rollingScroll.find(".cloneItem").css("left", $scrollItem.width() + "px");
});
