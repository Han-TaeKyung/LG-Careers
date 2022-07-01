$(function () {
  var $window = $(window),
    $html = $("html");

  var $container = $("#container"),
    $conSection = $container.find(" > section"),
    sectionLength = $conSection.length,
    sectionRate = 1 / sectionLength,
    $mainNavItem = $(".mainNav .navBtn");
  var speed = 1000;
  //마우스 스크롤
  if ($window.width() > 1199) {
    $(".page:not(.innerScroll)").mousewheel(function (e, delta) {
      //플러그인 호출 후 사용가능
      var h = $window.height();
      var page = parseInt($(this).attr("data-page")) - delta;
      if (page) {
        var dataPage;
        dataPage = page <= 0 ? 1 : page;
        dataPage = page >= sectionLength ? 4 : page;
        $html.attr("data-page", dataPage);
      }
      $("body,html")
        .stop()
        .animate({ scrollTop: (page - 1) * h }, speed);
      handleNav();
      return false; //기본마우스 휠 기능 제거
    });

    $(".page.innerScroll").on("mousewheel", function (e, delta) {
      var h = $window.height();
      var page = parseInt($(this).attr("data-page")) - 1;
      var $this = $(this),
        thisScrollTop = $this.scrollTop(),
        thisScrollBottom = thisScrollTop + $this.height(),
        thisHeight = $this.find(".scrollWrap").height();
      if (thisScrollTop <= 0 && delta > 0) {
        e.preventDefault();
        $("body,html")
          .stop()
          .animate({ scrollTop: (page - 1) * h }, speed);
        return;
      } else if (thisScrollBottom >= thisHeight && delta < 0) {
        e.preventDefault();
        $("body,html")
          .stop()
          .animate({ scrollTop: (page + 1) * h }, speed);
        return;
      }
    });
  }
  function handleNav() {
    var nav = $html.attr("data-page");
  }
  //스크롤이벤트
  $mainNavItem.click(function () {
    //스크롤 애니메이션
    n = $(this).attr("data-n");
    target = $(".page" + n).offset().top;
    $("body,html").stop().animate({ scrollTop: target }, speed);
  });
  $window.scroll(function () {
    //스크롤 이벤트가 발생했을때
    st = $window.scrollTop(); //수직스크롤 값을 가져오기
    h = $window.height();
    offset2 = $(".page2").offset().top;
    offset3 = $(".page3").offset().top;
    offset4 = $(".page4").offset().top;
    $mainNavItem.removeClass("active");
    if (st < offset2 - h * 0.25) {
      //1page조건
      $(".navBtn1").addClass("active");
    } else if (st < offset3 - h * 0.5) {
      //2page조건
      $(".navBtn2").addClass("active");
    } else if (st < offset4 - h * 0.75) {
      //3page조건
      $(".navBtn3").addClass("active");
    } else if (st >= offset4 - h * 0.75) {
      //4page조건
      $(".navBtn4").addClass("active");
    }
  });

  //키보드 방향키 막기
  $(document).keydown(function (event) {
    if (
      event.keyCode == 38 ||
      event.keyCode == 40 /*|| event.keyCode == 37 || event.keyCode == 39*/
    ) {
      console.log(event.keycode);
      event.preventDefault();
    }
    //38(↑), 40(↓), 37(←), 39(→)
  });

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
  $(document).on("click", ".page2 .hashBtn", function () {
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
        '<div class="storyImg">\n' +
        '<img src="" alt="">\n' +
        "</div>\n" +
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
      $partBtn.on("click", function () {
        $channelDesc.html("");
        $page3.css("backgroundImage", obj.image);
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
      $channelItem.find(".items").append($partBtn);
    });
    $channelList.append($channelItem);
  });

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
      var elem = peopleData.find(function (x) {
        return x.id === index;
      });
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
