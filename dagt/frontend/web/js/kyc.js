// 点击添加图片
 // $ ('.positive').click (function (){
 //   	var picture="";
 //   	var picSrc="";
 //   	picSrc+="img/example.png"
 //   	picture+="<img src='"+picSrc+"'alt='' class='example-photo'><img src='img/del.png' alt='' class='del'>"
 //   	$('.positive').append(picture);
 //   	return false;
 //  });
 $ ('.del').click (function (){
   	$(this).next('img').attr("src","");
    $(this).attr("src","");
    $(this).prev('input').val("")
  });
// 选择国籍
$("#county").change(function(){
     var checkValue=$(this).val();
     console.log("dd:"+checkValue);
     if(checkValue==0){
		$(".idcard").show();
		$(".postcard").hide()
	}else{
		$(".idcard").hide();
		$(".postcard").show()
	}
});

var checkValue=$("#county").val();
if(checkValue==0){
	$(".idcard").show();
	$(".postcard").hide()
}else{
	$(".idcard").hide();
	$(".postcard").show()
}
;

// 点击X消失
$(".delete").click(function(){
   $(".opacity_bg").hide();
   $("#confirmationInformation").hide();
   $("#mailboxCode").hide();
   $("#gainSuccess").hide();
});
$("#confirmationInformation .no").click(function(){
   $(".opacity_bg").hide();
   $("#confirmationInformation").hide();
});
$(".getAddress").click(function(){
   $(".opacity_bg").show();
   $("#confirmationInformation").show();
   // $(".getAddress").hide();
});
$("#confirmationInformation .yes").click(function(){
   $(".opacity_bg").show();
   $("#confirmationInformation").hide();
   $("#mailboxCode").show();
});
// $("#mailboxCode .yz").click(function(){
//    $(".opacity_bg").show();
//    $("#mailboxCode").hide();
//    $("#gainSuccess").show();
// });