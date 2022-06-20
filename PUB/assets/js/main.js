$(function () {
    //마우스 스크롤
    if ($(window).width() > 1199) {
        $('.page').mousewheel(function (e, delta) {//플러그인 호출 후 사용가능
            h = $(window).height();
            page = parseInt($(this).attr('data-page')) - delta;
            $('body,html').stop().animate({'scrollTop': (page - 1) * h}, 1000);
            return false;//기본마우스 휠 기능 제거
        });
    }

    //스크롤이벤트
    $('.mainNav li').click(function(){
        //스크롤 애니메이션
        n=$(this).attr('data-n');
        target=$('.mainPage0'+n).offset().top;
        $('body,html').stop().animate({'scrollTop':target},700)
    });
    $(window).scroll(function(){//스크롤 이벤트가 발생했을때
        st=$(window).scrollTop();//수직스크롤 값을 가져오기
        h=$(window).height();
        offset2=$('.mainPage02').offset().top;
        offset3=$('.mainPage03').offset().top;
        offset4=$('.mainPage04').offset().top;

        $('.mainNav li').removeClass('mainOn');
        if(st<offset2-h*0.25){//1page조건
            $('.mainNav01').addClass('mainOn')
        }
        if(st>=offset2-h*0.25 && st<offset3-h*0.5){//2page조건
            $('.mainNav02').addClass('mainOn')
        }
        if(st>=offset3-h*0.5 && st<offset4-h*0.75){//3page조건
            $('.mainNav03').addClass('mainOn')
        }
        if(st>=offset4-h*0.75){//4page조건
            $('.mainNav04').addClass('mainOn')
        }
    });
});