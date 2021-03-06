<link rel="stylesheet" href="/css/kyc-certificate.css">
<div class="head">
	<img src="/img/logo.png" class="logo" alt="">
	<ul>
		<li class="first"><a href="/">首页</a></li>
		<li class="lan"><a href="/?lang=en">English</a></li>
	</ul>
</div>
<div class="content">
	<!-- 内容背景 -->
	<img src="/img/bg-1.png" class="bg1" alt="">
	<img src="/img/bg-2.png" class="bg2" alt="">
	<img src="/img/bg-3.png" class="bg3" alt="">
	<!-- 内容背景 -->
	<img src="/img/kyc-logo.png" class="kyc-logo" alt="">
	<p class="colae-time">KYC将在 2018年4月30日16:00（UTC）关闭</p>
	<div class="form">
		<ul>
			<li>
				<div class="input1">
					<p>姓</p>
					<input type="text" class="first-name" value="{$kyc_info.first_name}" placeholder="姓">
					<span class="first-name-error error mistake"></span>
				</div>
				<div class="input2">
					<p>名</p>
					<input type="text" class="last-name" value="{$kyc_info.last_name}" placeholder="名">
					<span class="last-name-error error mistake"></span>
				</div>
			</li>
			<li>
				<div class="input1">
					<p>手机号码</p>
					<input type="text" class="telphone" name="phone" maxlength=11 value="{$kyc_info.telphone}" placeholder="手机号码">
					<span class="telphone-error error mistake"></span>
				</div>
				<div class="input2">
					<p>电子邮箱</p>
					<input type="text" class="email" value="{$kyc_info.email}" placeholder="电子邮箱">
					<span class="email-error error mistake"></span>
				</div>
			</li>
			
			<li>
				<div>
					<p>国籍</p>
					<select class="" id="county">
						{foreach from=$country_info key=cik item=civ}
							{if $kyc_info.country == $cik}
								<option value="{$cik}" selected="selected">{$civ}</option>
							{else}
								<option value="{$cik}">{$civ}</option>
							{/if}
						{/foreach}    
		            </select>
	            </div>
			</li>
			<li class="id-sec">
				<div>
					<p>护照ID</p>
					<input type="text" id="passport-id" placeholder="或驾驶证或护照编码" class="post-id" value="{$kyc_info.identification_id}">
					<span class="id-error error"></span>
				</div>
			</li>		
		</ul>
	</div>
	<div class="authentication">
		<!-- 身份证 -->
		<div class="card idcard">
			<div class="upload">
				<p>本人身份证正面照片</p>
				<p>请确保照片的内容完整并清晰可见</p>
				<div class="photo">
					<div class="real">
					<div class="positive" id="card_face_div"></div>
					<input type="hidden" id="card_face" value="{$kyc_info.p1}">
					{if $kyc_info.p1 != ''}
					<img src='/img/del.png' alt='' class='del del1' style="display: block;">
					{else}
					<img src='/img/del.png' alt='' class='del del1' style="display: none;">					
					{/if}
					<img src="{$kyc_info.p1}" id="card_face_img" alt="" class="example-photo"></div>
					<div class="example"><img src="/img/idcard.png" alt=""></div>
					<span class="card_face-error card-error"></span>
				</div>
			</div>
			<div class="upload">
				<p>本人身份证背面照片</p>
				<p>请确保照片的内容完整并清晰可见，身份证必须在有效期内</p>
				<div class="photo">
					<div class="real">
					<div class="opposite" id="card_back_div"></div>
					<input type="hidden" id="card_back" value="{$kyc_info.p2}">
					{if $kyc_info.p2 != ''}
					<img src='/img/del.png' alt='' class='del del2' style="display: block;">
					{else}
					<img src='/img/del.png' alt='' class='del del2' style="display: none;">					
					{/if}
					<img src="{$kyc_info.p2}" id="card_back_img" alt="" class="example-photo"></div>
					<div class="example"><img src="/img/b-idcard.png" alt=""></div>
					<span class="card_back-error card-error"></span>
				</div>
			</div>
			<div class="upload">
				<p>手持本人身份证正面照片和个人签字</p>
				<p>请您上传一张手持身份证正面照和个人签字的照片，个人签字的内容包含“币押链”和当前日期。请确保照片和个人签字的内容清晰可见。</p>
				<div class="photo">
					<div class="real">
					<div class="whole" id="card_face_back_sign_div"></div>
					<input type="hidden" id="card_face_back_sign" value="{$kyc_info.p3}">
					{if $kyc_info.p3 != ''}
					<img src='/img/del.png' alt='' class='del del3' style="display: block;">
					{else}
					<img src='/img/del.png' alt='' class='del del3' style="display: none;">
					{/if}
					<img src="{$kyc_info.p3}" id="card_face_back_sign_img" alt="" class="example-photo"></div>
					<div class="example"><img src="/img/face-id.png" alt=""></div>
					<span class="card_face_back_sign-error card-error"></span>
				</div>
			</div>
			<div class="upload">
				<p>地址证明（最近6个月）</p>
				<p>请您上传一张水电费账单/银行账单/税单/其他政府签发的可以证实真实居住地址的文件，请确保照片的内容清晰可见。</p>
				<div class="photo">
					<div class="real">
					<div class="proof" id="id_of_address_div"></div>
					<input type="hidden" id="id_of_address" value="{$kyc_info.p4}">
					{if $kyc_info.p4 != ''}
					<img src='/img/del.png' alt='' class='del del4' style="display: block;">
					{else}
					<img src='/img/del.png' alt='' class='del del4' style="display: none;">					
					{/if}
					<img src="{$kyc_info.p4}" id="id_of_address_img" alt="" class="example-photo"></div>
					<div class="example"><img src="/img/sd_ba.png" alt=""></div>
					<span class="id_of_address-error card-error"></span>
				</div>
			</div>	
		</div>
		<!-- 护照 -->
		<div class="card postcard">
			<div class="upload">
				<p>护照封面</p>
				<p>或您可上传驾驶证正面或国民身份证正面，请确保照片的内容完整并清晰可见</p>
				<div class="photo">
					
					<div class="real">
					<div class="positive" id="passport_face_div"></div>
					<input type="hidden" id="passport_face" value="{$kyc_info.p1}">
					{if $kyc_info.p1 != ''}
					<img src='/img/del.png' alt='' class='del del5' style="display: block;">
					{else}
					<img src='/img/del.png' alt='' class='del del5' style="display: none;">	
					{/if}
					<img src="{$kyc_info.p1}" id="passport_face_img" alt="" class="example-photo"></div>
					<div class="example" id="positive"><img src="/img/postcard.png" alt=""></div>
					<span class="passport_face-error card-error"></span>
				</div>
			</div>
			<div class="upload">
				<p>护照个人信息页</p>
				<p>或您可上传驾驶证背面或国民身份证背面，证件必须在有效期内</p>
				<div  class="photo">
					<div class="real">
					<div class="opposite" id="passport_back_div"></div>
					<input type="hidden" id="passport_back" value="{$kyc_info.p2}">
					{if $kyc_info.p2 != ''}
					<img src='/img/del.png' alt='' class='del del6' style="display: block;">
					{else}
					<img src='/img/del.png' alt='' class='del del6' style="display: none;">					
					{/if}
					<img src="{$kyc_info.p2}" id="passport_back_img" alt="" class="example-photo"></div>
					<div class="example"><img src="/img/b-postcard.png" alt=""></div>
					<span class="passport_back-error card-error"></span>
				</div>
			</div>
			<div class="upload">
				<p>手持护照个人信息页和个人签字</p>
				<p>或您可上传驾驶证正面或国民身份证正面和个人签字。请您上传一张手持证件个人信息页和个人签字的照片，个人签字的内容包含“DAGT”和今天的日期。请确保照片和个人签字的内容清</p>
				<div class="photo">
					<div class="real">
					<div class="whole" id="passport_face_back_sign_div"></div>
					<input type="hidden" id="passport_face_back_sign" value="{$kyc_info.p3}">
					{if $kyc_info.p3 != ''}
					<img src='/img/del.png' alt='' class='del del7' style="display: block;">
					{else}
					<img src='/img/del.png' alt='' class='del del7' style="display: none;">					
					{/if}
					<img src="{$kyc_info.p3}" id="passport_face_back_sign_img" alt="" class="example-photo"></div>
					<div class="example"><img src="/img/face-post.png" alt=""></div>
					<span class="passport_face_back_sign-error card-error"></span>
				</div>
			</div>
			<div class="upload">
				<p>地址证明（最近6个月）</p>
				<p>请您上传一张水电费账单/银行账单/税单/其他政府签发的可以证实真实居住地址的文件，请确保照片的内容清晰可见。</p>
				<div class="photo">
					<div class="real">
					<div class="proof" id="proof_of_address_div"></div>
					<input type="hidden" id="proof_of_address" value="{$kyc_info.p4}">
					{if $kyc_info.p4 != ''}
					<img src='/img/del.png' alt='' class='del del8' style="display: block;">
					{else}
					<img src='/img/del.png' alt='' class='del del8' style="display: none;">					
					{/if}
					<img src="{$kyc_info.p4}" id="proof_of_address_img" alt="" class="example-photo"></div>
					<div class="example"><img src="/img/sd_ba.png" alt=""></div>
					<span class="proof_of_address-error card-error"></span>
				</div>
			</div>	
		</div>
	</div>
	<div class="coin-type">
		<p>代币类型</p>
		<ul>
			<li class="checked"><img src="/img/eth-coin.png" alt=""><span>ETH</span></li>		
		</ul>
	</div>
	<div class="coin-detail">
		<p>代币数量</p>
		<input type="text" id="coin_number" value="{$kyc_info.coin_number}" placeholder="代币数量">
		<span class="coin_number-error coin-error mistake"></span>
		<p>发送币的ETH钱包地址</p>
		<input type="text" id="send_coin_address" value="{$kyc_info.send_coin_address}" placeholder="发送币的钱包地址">
		<span class="send_coin_address-error coin-error mistake"></span>
		<p>接收DAGT的ETH钱包地址</p>
		<input type="text" id="get_coin_address" value="{$kyc_info.get_coin_address}" placeholder="接收DAGT的ETH钱包地址" disabled="true">
		<span class="get_coin_address-error coin-error mistake"></span>
	</div>
	<div class="contact">
		<p class="intersting">如果您对本次预售项目感兴趣或想投资，请联系我们的运营人员，联系邮箱：<span>market@dagt.io</span></p>
		<p class="careful">注意：</p>
		<ul>
			<li>1.参与者必须符合 “合格投资者” 的法律界定，当您提交以上信息后，即承诺所有提供的信息和资料是真实的和正确的。如因任何虚假信息导致的所有的后果或损失由参与者自行承担；</li>
			<li>2.我们会在24小时之内反馈KYC审查结果，我们将通过电子邮件通知您，您也可以通过本页面查阅评审结果；</li>
			<li>3.当首次代币发行（ICO）开始，我们仅在本页面发布 “收币地址”，请不要相信其他任何渠道发布的信息；</li>
			<li>4.收币地址仅对KYC审核通过的用户公示，如因您通过其他渠道获取“收币地址”，转账造成的损失由参与者自行承担；</li>
		</ul>
		<label class="agreement"><input type="checkbox" class="yes" value="" />
		我已阅读并接受所有条款和白皮书内容</label>
		<span class="yes-error error"></span>
		<button class="edit">提交</button>
		<div class="data_response_text"></div>
	</div>
</div>

<img id="progress" src="/lib/fine-uploader/loading.gif" style="display: none;" />
<div id="message"></div>

<div class="foot">
	<div class="left">
		<img src="/img/logo.png" class="foot-logo" alt="">
		<p>© 2018&nbsp;DAGT&nbsp;Chain</p>
		<p class="line">|</p>
		<p>中文</p>
		<p class="en"><a href="/?lang=en">English</a></p>
	</div>
</div>
<script src="/js/kyc.js"></script>

<link rel="stylesheet" type="text/css" href="/lib/fine-uploader/fine-uploader.min.css">
<script src="/lib/fine-uploader/fine-uploader.min.js"></script> <!-- Fine Uploader -->
<script type="text/template" id="qq-template-manual-noedit">
    <div class="qq-uploader-selector qq-uploader">
        <div class="qq-upload-drop-area-selector qq-upload-drop-area" qq-hide-dropzone>
            <span>Drop files here to upload</span>
        </div>
        <div class="qq-upload-button-selector qq-upload-button">
            <div>选择文件</div>
        </div>
        <span class="qq-drop-processing-selector qq-drop-processing">
            <span>Processing dropped files...</span>
            <span class="qq-drop-processing-spinner-selector qq-drop-processing-spinner"></span>
        </span>
        <ul class="qq-upload-list-selector qq-upload-list">
            <li>
                @*<div class="qq-progress-bar-container-selector">
                    <div class="qq-progress-bar-selector qq-progress-bar"></div>
                </div>*@
                <span class="qq-upload-spinner-selector qq-upload-spinner"></span>
                <span class="qq-upload-file-selector qq-upload-file"></span>
                <span class="qq-upload-size-selector qq-upload-size"></span>
                <a class="qq-upload-cancel-selector qq-upload-cancel" href="#">取消</a>
                <span class="qq-upload-status-text-selector qq-upload-status-text"></span>
            </li>
        </ul>
    </div>
</script>

<script type="text/javascript">
    
    uploadFile("card_face_div", "card_face_img", "card_face", "1");
    uploadFile("card_back_div", "card_back_img", "card_back", "2");
    uploadFile("card_face_back_sign_div", "card_face_back_sign_img", "card_face_back_sign", "3");
    uploadFile("id_of_address_div", "id_of_address_img", "id_of_address", "4");
	uploadFile("passport_face_div", "passport_face_img", "passport_face", "5");
	uploadFile("passport_back_div", "passport_back_img", "passport_back", "6");
	uploadFile("passport_face_back_sign_div", "passport_face_back_sign_img", "passport_face_back_sign", "7");
	uploadFile("proof_of_address_div", "proof_of_address_img", "proof_of_address", "8");

    function uploadFile(dist_div, dist_img, dist, xnum){
  		var autouploader = new qq.FineUploader({
            element: $('#'+dist_div)[0],
	        request: {
	            endpoint: '/image/upload.html'
	        },
	        validation: {
	            //itemLimit: 3,
	            allowedExtensions: ['jpg', 'png', 'gif'],
	            sizeLimit: 10240000 // 10M
	        },
	        template: "qq-template-manual-noedit",
	        autoUpload: true,
	        callbacks:
	        {
	            //文件开始提交(在浏览窗口中选择的每个文件都会触发该事件）
	            //id:文件在队列中的索引
	            //fileName:文件名称
	            onSubmit: function (id, fileName) {
	                //alert('this is  onSubmit Function，your selected is：' + fileName);
	                //只能上传规定的文件
	                //var name = fileName.split('.')[0];//不带后缀名
	                //switch (name) {
	                //    case 'Member':
	                //        break;
	                //    case 'Guestbook':
	                //        break;
	                //    default:
	                //        alert('请选择正确的文件上传!');
	                //        return false;
	                //        break;                              
	                //}
	            },
	            //文件开始上传
	            onUpload: function (id, fileName) {
	                $('#file-' + id).addClass('alert-info')
	                                .html('<img src="/lib/fine-uploader/loading.gif" alt="" /> alt="Initializing. Please hold."> ' +
	                                'Initializing ' +
	                                '“' + fileName + '”');
	                $('#progress').show();//显示进度动画
	            },
	            //文件上传失败
	            onError: function (event, id, name, errorReason, xhrOrXdr) {
	                //alert(qq.format("Error on file number {} - {}.  Reason: {}", id, name, errorReason));
	                $('#message').append('上传文件失败:' + id, '<br/>' + name,+'<br/>'+ errorReason.response + '<br/>');
	            },
	            //文件上传结束
	            onComplete: function (id, fileName, responseJSON) {
	                //alert('This is onComplete function.');
	                //alert("complete name:"+responseJSON.status);//responseJSON就是controller传来的return Json
	                //$('#message').append(responseJSON.msg);
	                $('#progress').hide();//隐藏进度动画   
	                //清除已上传队列
	                $('.qq-upload-list').hide();
	                //$('#manual-fine-uploader').fineUploader('reset');              
	                
	                $("#"+dist_img).attr('src',responseJSON.path);
		            $("#"+dist).val(responseJSON.path);
		            $(".del"+xnum).attr("src","/img/del.png");
		            //$("#card_face_div-button .uploadify-button-text").hide();        
	            }
	        }
	    });
	    $('#'+dist_img).click(function () {
	    	if($(this).val() != ''){

	        	autouploader.uploadStoredFiles();
	    	}
	    });
    }


    $(".coin-type ul li").click(function(){
    $(".coin-type ul li").eq($(this).index()).addClass("checked").siblings().removeClass('checked');
	// $(".coin-detail ul").hide().eq($(this).index()).show();
	});



	$("#send_coin_address").blur(function(){
	  	$("#get_coin_address").val($("#send_coin_address").val())
	});
    
	$(".edit").click(function(){
		{literal}
		var first_name = $.trim($(".first-name").val());
		if(first_name.length == 0){
			$(".first-name-error").html("姓不能为空");
			$('html,body').animate({scrollTop:$('.first-name-error').parent().offset().top}, 10)	
			return false;
		} else {
			$(".first-name-error").html("");
		}
		var last_name = $.trim($(".last-name").val());				
		if(last_name.length == 0){
			$(".last-name-error").html("名不能为空");
			$('html,body').animate({scrollTop:$('.last-name-error').parent().offset().top}, 10)	
			return false;
		} else {
			$(".last-name-error").html("");
		}	

		var telephone = $.trim($(".telphone").val());
	
		var reg1 = /^[0-9]+.?[0-9]*$/;
	
		if(telephone.length == 0){
			$(".telphone-error").html("手机号码不能为空");
			$('html,body').animate({scrollTop:$('.telphone-error').parent().offset().top}, 10)	
			return false;
		} else if(!reg1.test($(".telphone").val())){
	  　　　　$(".telphone-error").html("手机号码格式不正确");
	  			$('html,body').animate({scrollTop:$('.telphone-error').parent().offset().top}, 10)	
	  　　		return false;
	  	}else {
			$(".telphone-error").html("");
		}
	
		var email = $.trim($(".email").val());
	
	    var reg = new RegExp("^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$");
	   
	    if(email.length == 0){
	      $(".email-error").html("邮箱不能为空");
	      $('html,body').animate({scrollTop:$('.email-error').parent().offset().top}, 10)	
	      return false;
	    } else if(!reg.test(email)){
	  　　　　$(".email-error").html("邮箱格式不正确");
	  			$('html,body').animate({scrollTop:$('.email-error').parent().offset().top}, 10)	
	  　　		return false;
	　　   } else {
	      $(".email-error").html("");
	    }
	
	    $(".yes").click(function(){
			if(!$(this).is(':checked')){
				$('.edit').attr('disabled','disabled')
				return false;
			}else{
				$('.edit').removeAttr('disabled')
				// $(".error").html("");
			}
		});
		var post_id = $.trim($(".post-id").val());				
		if(post_id.length == 0){
			$(".id-error").html("证件号不能为空");
			$('html,body').animate({scrollTop:$('.id-error').parent().offset().top}, 10);
			return false;
		} else {
			$(".id-error").html("");
		}			
		var country = $.trim($("#county").val());
		if(country == 0){
			
			var card_face = $.trim($("#card_face").val());
				
			if(card_face.length == 0){
				$(".card_face-error").html("本人身份证正面照片不能为空");
				$('html,body').animate({scrollTop:$('.card_face-error').parent().offset().top}, 10)	
				return false;
			} else {
				$(".card_face-error").html("");
			}
			var card_back = $.trim($("#card_back").val());				
			if(card_back.length == 0){
				$(".card_back-error").html("本人身份证背面照片不能为空");
				$('html,body').animate({scrollTop:$('.card_back-error').parent().offset().top}, 10)	
				return false;
			} else {
				$(".card_back-error").html("");
			}	
			
			var card_face_back_sign = $.trim($("#card_face_back_sign").val());				
			if(card_face_back_sign.length == 0){
				$(".card_face_back_sign-error").html("本人身份证正面，背面，个人签名照片不能为空");
				$('html,body').animate({scrollTop:$('.card_face_back_sign-error').parent().offset().top}, 10)	
				return false;
			} else {
				$(".card_face_back_sign-error").html("");
			}
			var id_of_address = $.trim($("#id_of_address").val());				
			if(id_of_address.length == 0){
				$(".id_of_address-error").html("地址不能为空");
				$('html,body').animate({scrollTop:$('.id_of_address-error').parent().offset().top}, 10);
				return false;
			} else {
				$(".id_of_address-error").html("");
			}	
		} else {
			var passport_face = $.trim($("#passport_face").val());				
			if(passport_face.length == 0){
				$(".passport_face-error").html("护照封面照片不能为空");
				$('html,body').animate({scrollTop:$('.passport_face-error').parent().offset().top}, 10)	
				return false;
			} else {
				$(".passport_face-error").html("");
			}
			var proof_of_address = $.trim($("#proof_of_address").val());				
			if(proof_of_address.length == 0){
				$(".proof_of_address-error").html("地址不能为空");
				$('html,body').animate({scrollTop:$('.proof_of_address-error').parent().offset().top}, 10);
				return false;
			} else {
				$(".proof_of_address-error").html("");
			}
			var passport_back = $.trim($("#passport_back").val());				
			if(passport_back.length == 0){
				$(".passport_back-error").html("护照个人信息页照片不能为空");
				$('html,body').animate({scrollTop:$('.passport_back-error').parent().offset().top}, 10)	
				return false;
			} else {
				$(".passport_back-error").html("");
			}	
			
			var passport_face_back_sign = $.trim($("#passport_face_back_sign").val());				
			if(passport_face_back_sign.length == 0){
				$(".passport_face_back_sign-error").html("手持护照个人信息页和个人签字照片不能为空");
				$('html,body').animate({scrollTop:$('.passport_face_back_sign-error').parent().offset().top}, 10)	
				return false;
			} else {
				$(".passport_face_back_sign-error").html("");
			}	
		}
		
		var coin_type = $(".coin-type ul .checked").children("span").text();
		
		var coin_number = $.trim($("#coin_number").val());				
		if(coin_number.length == 0){
			$(".coin_number-error").html("代币数量不能为空");
			$('html,body').animate({scrollTop:$('.coin_number-error').parent().offset().top}, 10)	
			return false;
		} else {
			$(".coin_number-error").html("");
		}
		
		var send_coin_address = $.trim($("#send_coin_address").val());				
		if(send_coin_address.length == 0){
			$(".send_coin_address-error").html("发送币的钱包地址不能为空");
			$('html,body').animate({scrollTop:$('.send_coin_address-error').parent().offset().top}, 10)	
			return false;
		} else {
			$(".send_coin_address-error").html("");
		}	
		
		var get_coin_address = $.trim($("#get_coin_address").val());				
		if(get_coin_address.length == 0){
			$(".get_coin_address-error").html("接收BYT的钱包地址不能为空");
			$('html,body').animate({scrollTop:$('.get_coin_address-error').parent().offset().top}, 10)	
			return false;
		} else {
			$(".get_coin_address-error").html("");
		}
		if(!$('.yes').is(':checked')){
			$(".yes-error").html("请勾选协议");
			$('html,body').animate({scrollTop:$('.yes-error').parent().offset().top}, 10)	
			return false;
		} else {
			$(".yes-error").html("");
		}
		if(country == 0){
	        var p1 = card_face;
	        var p2 = card_back;
	        var p3 = card_face_back_sign;
	        var p4 = id_of_address; 	
		} else {
	        var p1 = passport_face;
	        var p2 = passport_back;
	        var p3 = passport_face_back_sign;	
	        var p4 = proof_of_address;
		}
		{/literal}
		$(this).css('background', '#ccc');
		$(this).val('提交中...');
		$(this).attr("disabled", "disabled");
	    $.ajax({
	        type: "POST",
	        url: "/index/submit.html",
	        data: {
	        	"first_name" : first_name,
	        	"last_name" : last_name,
	        	"telphone" : telephone,
	        	"email" : email,
	        	"country" : country,
	        	"p1" : p1,
	        	"p2" : p2,
	        	"p3" : p3,
	        	"p4" : p4,
	        	"coin_type" : coin_type,
	        	"coin_number" : coin_number,
	        	"send_coin_address" : send_coin_address,
	        	"get_coin_address" : get_coin_address,
	        	"identification_id" : post_id,
	            "_csrf" : "{$token}"
	        },
	        dataType: 'json',
	        cache: false,
	        beforeSend: function () {},
	        success: function (data) {
	        	$(".edit").val('提交');
	        	$(".edit").removeAttr('style');
	        	$(".edit").removeAttr("disabled");
	        	if(data.response_code == 1){
	           		window.location.href = "/index/kyc-view.html";        	
	        	} else {
	        
	        		$(".data_response_text").html(data.response_text)
	        	}
	        },
	        error: function(){
	        	$(".edit").val('提交');
	        	$(".edit").removeAttr('style');
	        	$(".edit").removeAttr("disabled");
	        }
	    }); 
	});
</script>
