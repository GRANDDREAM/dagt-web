var myVideo=document.getElementById("video");
var videoWidth = $("#video").width();
function add(){
    $("#video,.player").mouseenter(function(){
      // $(".play").hide();
      // $(".noplay").show();
      $('#video').attr('controls',true);
    })
    $("#video,.player").mouseout(function(){
      // $(".play").show();
      // $(".noplay").hide();
      $('#video').removeAttr('controls')
    });
  
}
console.log(videoWidth)
if(videoWidth==418){
  add()
}
$("#video,.player").click(function(){
    var videoWidth = $("#video").width();
    $('.video,#video').width(840);
    $('.video,#video').height(472);
    if(myVideo.paused){
        myVideo.play();
        $(".play").hide();
        $(".noplay").hide();
        $('#video').removeAttr('controls');
        $(".opacity_bg1").show();
        $('#video').css("border","none")
        
        $('.opacity_bg1').css("z-index","1111111111")
        $('.video,#video').css("z-index","11111111111")
        $('.closebtn').show();
         console.log(videoWidth)
        }else{
            myVideo.pause();
            $('#video').attr('controls',true);
            
    }
})

// myVideo.addEventListener('play',function(){  
//     $('#video').attr('controls',true);
//     $(".opacity_bg1").show();
//     $('.video,#video').css("border","none")
//     $('.video,#video').width(840);
//     $('.video,#video').height(472);
//     $('.opacity_bg1').css("z-index","1111111111")
//     $('.video,#video').css("z-index","11111111111")
//     $('.closebtn').show();
//     $(".play").hide();
//     $(".noplay").hide();
       
// });  
// myVideo.addEventListener('pause',function(){  
//    $('#video').removeAttr('controls')  
// }) 
$('.closebtn').click(function(){
  $(".opacity_bg1").hide();
  $('.video,#video').width(420);
  $('.video,#video').height(236);
  $('.video,#video').css("z-index","11111")
  $('.closebtn').hide();
  $(".play").show();
  $('#video').css("border","1px solid #2086cd")
   myVideo.pause();
}) 
//dagt进度条
 var now_dagt_str = '920,000 DAGT';
 var now_dagt = now_dagt_str.replace(/[^0-9]/ig,"");
 var all_dagt = '20000000';
 var percent = now_dagt / all_dagt;
 var left_now_width = $(".sale-plan .progress .now").width()/2;
 var left_now = percent*820 - left_now_width;
 $("progress").val(percent* 100);
$(".sale-plan .progress .now").css('left',left_now);
// 判断是否有滚动条
$(document).ready(function(){
$(window).scroll(function(){
      if($(window).scrollTop()>10){
       $("#top").show();  
      }else{
        $("#top").hide();
      }

  });


// 判断邮箱跳转
  var email = $.trim($("#reset_email").val());
  if(email.length == 0){
      $("#reset").hide();
      
    }else{
      $(".opacity_bg").show();
      $("#reset").show();
    }
});
  // var screen=$(window).height();
  // console.log(screen)
  // $('.byl-chain').css('height',screen-90);
  // $('.sea2').css('height',screen-90)
  // $('.sea1').css('height',screen-90)
  // $('.byl-chain').css('height',screen-90)
  // $('.byl-chain').css('height',screen-90)
// 鼠标移入变色
$('.present_situation li').hover(function(){

     $(this).children('div').addClass('grad')
     $(this).children('p').css('color','#fff')
    },
    function(){
     $(this).children('div').removeClass('grad')
    }
)
$('.right #link2').hover(function(){

     $(this).children('img').show()
    },
    function(){
     $(this).children('img').hide();
    }
)


// 跳转楼层
$("#top").click(function() {
    $("html,body").animate({scrollTop:0}, 400);
}); 
$(".about").on("click",function(){
    $('html,body').animate({scrollTop:$(".function").offset().top-400}, 400);
});
$(".team").on("click",function(){
    $('html,body').animate({scrollTop:$(".team-all").offset().top-100}, 400);
});
$(".plain").on("click",function(){
    $('html,body').animate({scrollTop:$(".sale-plan").offset().top}, 400);
});
$(".book").on("click",function(){
    $("html,body").animate({scrollTop:$(".load").offset().top}, 400);
});
$(".already-sign").click(function(){
   $(".opacity_bg").show();
   $("#login").hide();
   $("#register").show();
});
$(".already-login").click(function(){
   $(".opacity_bg").show();
   $("#login").show();
   $("#register").hide();
});
// 点击X消失
$(".delete").click(function(){
   $(".opacity_bg").hide();
   $("#register").hide();
   $("#login").hide();
   $("#forgot").hide();
   $("#reset").hide();
   $("#ckyx").hide();
   $("#czcg").hide();
});

// 忘记密码页面
$(".forgot_link").click(function(){
   $(".opacity_bg").show();
   $("#login").hide();
   $("#forgot").show();
});
// 产品类型切换

$(function(){
    $(".text_introduction li").click(function(){
      $(".text_introduction li").eq($(this).index()).addClass("text_active").siblings().removeClass('text_active');
      $(".phone_introduction li").eq($(this).index()).addClass('on').siblings().removeClass('on');
      $(".iphone1").eq($(this).index()).removeClass("section_d");
    });
    // 自动播
    function move(){
        i++;
        $('.text_introduction li').eq(i).addClass('text_active').siblings().removeClass('text_active');
        $('.phone_introduction li').eq(i).addClass('on').siblings().removeClass('on');
        if(i==3){
            i=-1;
        }
    }
    var timer = null;
    var i = 0;
    timer = setInterval(move,3000);
    $('.text_introduction').mouseover(function(){
        clearInterval(timer);
    });
    $('.text_introduction').mouseout(function(){
        timer = setInterval(move,3000);
    })
});
// 团队类型切换
$(".team-all .type li").click(function(){
    $(".team-all .type li").eq($(this).index()).addClass("active").siblings().removeClass('active');
  $(".team-dtl>div").hide().eq($(this).index()).show();
    
});

var mySwiper1 = new Swiper ('.core-scroll', {
    // autoplay: 5000,//可选选项，自动滑动
    direction: 'horizontal',
    // loop: true,
    speed:300,
    slidesPerView: 2, 
    prevButton:'.swiper-button-prev',
    nextButton:'.swiper-button-next',
    // 如果需要分页器
    pagination: '.swiper-pagination',
    paginationClickable :true, 
    observer:true,//修改swiper自己或子元素时，自动初始化swiper
    observeParents:true//修改swiper的父元素时，自动初始化swiper
 });

var mySwiper2 = new Swiper ('.adviser-scroll', {
      // autoplay: 5000,//可选选项，自动滑动
      direction: 'horizontal',
      // loop: true,
      speed:300,
      slidesPerView: 2,
      prevButton:'.swiper-button-prev',
      nextButton:'.swiper-button-next', 
      // 如果需要分页器
      pagination: '.swiper-pagination', 
      paginationClickable :true,
      observer:true,//修改swiper自己或子元素时，自动初始化swiper
      observeParents:true//修改swiper的父元素时，自动初始化swiper
   });
// 动画
function animation(element,child,animation){
  var element = $('.'+element);
  var windowHeight = window.innerHeight;
  var offsetTop = element.offset().top;
  $(window).scroll(function (e) {
    var scrollTop = $(window).scrollTop();
    if (scrollTop + windowHeight - 100 >= offsetTop) {
      $('.'+child).addClass(animation);
    } else {
      $('.'+child).removeClass(animation);
    }
  });
};
animation("participate_in","section1","section_a");
animation("participate_in","section2","section_b");
animation("participate_in","section3","section_c");
animation("product_introduction","iphone1","section_d");
animation("change","dag_logo","a-bounceinT");
animation("change","line_ten","a-bounceinB");
animation("change","function","a-bounceinL");
animation("all_time","time1"," a-swing");
animation("all_time","time2"," a-swing");
animation("all_time","time3","a-bounceinR");
animation("all_time","time4","a-bounceinR");
animation("all_time","time5","a-bounceinR");