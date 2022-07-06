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
  $window.on('resize', function () {
    clearTimeout(timer);
    timer = setTimeout(setPageInfo, 200)
  });
  $window.on('load', setPageInfo);

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

  //마우스 스크롤
  $conSection.on('mousewheel', function (e, delta) {
    var $this = $(this);
    moveContainer(e, delta, $this);
  });

  function moveContainer(e, delta, $this) {
    //플러그인 호출 후 사용가능
    var h = $window.height(),
      currentIndex = parseInt($this.attr("data-page")),
      nextIndex = currentIndex - delta,
      customIndex = 0,
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
    } else if ($window.width() < 2000) { //1200 이하일 때
      var scrollTop = $html.scrollTop(),
        windowHeight = $container.height();
    }
  }

  $window.on('scroll', function () {
  })

  //키보드 방향키 막기
  $document.keydown(function (e) {
    console.log(e.keyCode);
    var a = $html.attr('data-page');
    if ($window.width() > 1199) {
      if (
        e.keyCode == 38 ||
        e.keyCode == 40 /*|| e.keyCode == 37 || e.keyCode == 39*/
      ) {
        e.preventDefault();
      } else if (e.keycode == 43) {
        //moveContainer(e, 1);
      } else if (e.keycode == 44) {
        //moveContainer(e, -1);
      }
    }
    //38(↑), 40(↓), 37(←), 39(→)
  });

  function setCustomIndex(nextIndex, customIndex) {
    if (nextIndex <= 0) {
      customIndex = 1;
    } else if (nextIndex >= sectionLength) {
      customIndex = sectionLength;
    } else {
      customIndex = nextIndex;
    }
    $html.attr({
      'data-page': customIndex,
      'data-color': $container.find('section[data-page=' + customIndex + ']').attr('data-color')
    });
    setNav(customIndex)
  }


  //page1-visual
  var $formList = $(".formList"),
    $formSelect = $formList.find(".select"),
    $formBtn = $formSelect.find(".selectBtn");
  $formBtn.on("click", function () {
    var $this = $(this),
      $thisParent = $this.closest(".select"),
      $thisPanel = $this.siblings(".selectList");
    $thisParent.toggleClass("active");
    if ($thisParent.hasClass("active")) {
      $this.attr("title", "닫기");
      $thisPanel.slideDown(200);
      $thisPanel.attr("title", "열림");
    } else {
      $this.attr("title", "열기");
      $thisPanel.slideUp(200);
      $thisPanel.attr("title", "닫힘");
    }
    setScrollBar();

    //family site scrollbar
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
  });

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
  var $tagContainer = $(".page2 .hash");
  var $storyList = $(".page2 .storyList");
  storyData.forEach(function (obj, i) {
    setStoryData(obj, $storyList);
  });
  tags.forEach(function (elem, i) {
    var $hashBtn = $('<button type="button" class="hashBtn"></button>');
    $hashBtn.text("#" + elem);
    $tagContainer.append($hashBtn);
  });
  $document.on("click", ".page2 .hashBtn", function () {
    var $this = $(this),
      thisText = $this.text().replace("#", "");
    var filterData = storyData.filter(function (x) {
      return x.tag === thisText;
    });
    $storyList.html("");
    if (filterData.length !== 0) {
      filterData.forEach(function (obj, i) {
        setStoryData(obj, $storyList);
      });
    } else {
      var $empty = $('<li class="empty">내용이 없습니다.</li>');
      $storyList.append($empty);
    }
  });
  function setStoryData(obj, $parent) {
    var $item = $(
      '<li class="storyItem">\n' +
      '<a href="#n" class="storyAnchor">\n' +
      '<div class="imgWrap"><div class="storyImg">\n' +
      '<img src="" alt="">\n' +
      "</div></div>\n" +
      '<div class="storyCon">\n' +
      '<h3 class="tag">LG Life</h3>\n' +
      "<p>장애 청소년들에게 LG 스탠바이미를 기부하고자 세 사람이 모이게 된 사연은?</p>\n" +
      "</div>\n" +
      "</a>\n" +
      "</li>"
    );
    $item.find(".storyAnchor").attr("href", obj.href);
    $item.find("img").attr({ src: obj.image, alt: obj.title });
    $item.find("h3").text(obj.tag);
    $item.find("p").text(obj.title);
    $parent.append($item);
  }
  $storyCon = $(".page2 .conWrap");

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


  // page4 - our people
  var $rollingScroll = $(".page4 .leftScroll");
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
