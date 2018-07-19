<link rel="stylesheet" href="/css/dialog.css">
<link rel="stylesheet" href="/css/kyc-save.css">
<div class="head">
	<img src="/img/logo.png" class="logo" alt="">
	<ul>
		<li class="first"><a href="/?lang=en">Home</a></li>
		<li class="lan"><a href="/">Chinese</a></li>
	</ul>
</div>
<div class="content">
	<!-- 内容背景 -->
	<img src="/img/bg-1.png" class="bg1" alt="">
	<img src="/img/bg-2.png" class="bg2" alt="">
	<img src="/img/bg-3.png" class="bg3" alt="">
	{if array_key_exists('application_status', $kyc_info) && $kyc_info.application_status == 2}
		<div class="wait"><img src="/img/wait.png" alt=""><span>succeed</span></div>
	{elseif array_key_exists('application_status', $kyc_info) && $kyc_info.application_status == 3}
		<div class="wait"><img src="/img/wait.png" alt=""><span>Failed</span></div>
	{else}
	<div class="wait"><img src="/img/wait.png" alt=""><span>Waiting</span></div>
	{/if}
	<!-- 内容背景 -->
	<img src="/img/kyc-logo.png" class="kyc-logo" alt="">
	<p class="colae-time">KYC will shut down at 16:00 (UTC) on April 30, 2018.</p>
	<!-- <div class="yulan"><img src="/img/yulan.png" alt="">Preview of the contract</div> -->
	<div class="form">
		<ul>
			<li>
				<div>
					<p>Last Name</p>
					<input type="text" disabled="true" class="first-name" value="{$kyc_info.first_name}" placeholder="Last Name">
					<span class="first-name-error error"></span>
				</div>
				<div>
					<p>First Name</p>
					<input type="text" placeholder="First Name" disabled="true" class="last-name" value="{$kyc_info.last_name}">
					<span class="last-name-error error"></span>
				</div>
			</li>
			<li>
				<div>
					<p>Phone</p>
					<input type="text" disabled="true" class="telphone" placeholder="Phone Number" value="{$kyc_info.telphone}">
					<span class="telphone-error error"></span>
				</div>
				<div>
					<p>Email</p>
					<input type="text" disabled="true" placeholder="Email" class="email" value="{$kyc_info.email}">
					<span class="email-error error"></span>
				</div>
			</li>

			<li>
				<div>
					<p>Nationality</p>
					<select class="" id="county" disabled="true">
						<option value="{$kyc_info.country}" selected="selected">{$kyc_info.country_name}</option>    
		            </select>
		        </div>    
			</li>
			<li class="id-sec">
				<div>
					<p>Passport number</p>
					<input type="text" id="passport-id" disabled="true" placeholder="Or Driver's License ID or National ID" class="post-id" value="{$kyc_info.identification_id}">
				</div>
			</li>
		</ul>
	</div>
	<div class="authentication">
		{if $kyc_info.country == 0}
		<!-- 身份证 -->
		<div class="card idcard">
			<div class="upload">
				<p>Identity Card Front Side</p>
				<p>Please make sure that the photo is complete and clearly visible.</p>
				<div class="photo">
					<div class="positive"></div>
					<div class="real"><img src="{$kyc_info.p1}" alt="" class="example-photo"></div>
					<div class="example"><img src="/img/idcard.png" alt=""></div>
				</div>
			</div>
			<div class="upload">
				<p>Identity Card Back Side</p>
				<p>Please make sure that the photo is complete and clearly visible,  Id card must be in the valid period.</p>
				<div class="photo">
					<div class="opposite"></div>
					<div class="real"><img src="{$kyc_info.p2}" alt="" class="example-photo"></div>
					<div class="example"><img src="/img/b-idcard.png" alt=""></div>
				</div>
			</div>
			<div class="upload">
				<p>Selfie With Photo ID And Note</p>
				<p>Please provide a photo of you holding your Identity Card front side. In the same picture, make a reference to DAGT and today's date displayed. Make sure your face is clearly visible and that all passport details are clearly readable.</p>
				<div class="photo">
					<div class="whole"></div>
					<div class="real"><img src="{$kyc_info.p3}" alt="" class="example-photo"></div>
					<div class="example"><img src="/img/face-id.png" alt=""></div>
				</div>
			</div>
			<div class="upload">
				<p>Proof of Address (Recent 6 months)</p>
				<p>Please upload a photo Utility Bills/Bank Statements /Tax Invoices, or Residential Certificates issued by other Government. Please make sure that the photo is complete and clearly visible.</p>
				<div class="photo">
					<div class="adress"></div>
					<div class="real"><img src="{$kyc_info.p4}"  alt="" class="example-photo"></div>
					<div class="example"><img src="/img/sd_b.png" alt=""></div>
				</div>
			</div>	
		</div>
		{else}
		<!-- 护照 -->
		<div class="card postcard">
			<div class="upload">
				<p>Passport Cover</p>
				<p>Or you may upload the front of your Driver's License or National ID Document.Please make sure that the photo is complete and clearly visible.</p>
				<div class="photo">
					<div class="positive"></div>
					<div class="real"><img src="{$kyc_info.p1}" alt="" class="example-photo"></div>
					<div class="example" id="positive"><img src="/img/postcard.png" alt=""></div>
				</div>
			</div>
			<div class="upload">
				<p>Passport Data Page</p>
				<p>Or you may upload the back of your Driver's License or National ID Document.Please make sure that the photo is complete and clearly visible, your Identity card must be in the valid period.</p>
				<div  class="photo">
					<div class="opposite"></div>
					<div class="real"><img src="{$kyc_info.p2}" alt="" class="example-photo"></div>
					<div class="example"><img src="/img/b-postcard.png" alt=""></div>
				</div>
			</div>
			<div class="upload">
				<p>Photo with your signature of you holding the ID </p>
				<p>Or you may upload the front of your Driver's License or your National ID Document, together with a Your Signature.Please provide a photo of you holding your Identity card. In the same picture, make a reference to "DAG" and the date of the day. Make sure your face is clearly visible and that all Identity card details are clearly readable.</p>
				<div class="photo">
					<div class="whole"></div>
					<div class="real"><img src="{$kyc_info.p3}" alt="" class="example-photo"></div>
					<div class="example"><img src="/img/face-post.png" alt=""></div>
				</div>
			</div>
			<div class="upload">
				<p>Proof of Address (Recent 6 months)</p>
				<p>Please upload a photo Utility Bills/Bank Statements /Tax Invoices, or Residential Certificates issued by other Government. Please make sure that the photo is complete and clearly visible.</p>
				<div class="photo">
					<div class="adress"></div>
					<div class="real"><img src="{$kyc_info.p4}"  alt="" class="example-photo"></div>
					<div class="example"><img src="/img/sd_b.png" alt=""></div>
				</div>
			</div>	
		</div>
		{/if}
	</div>
	<div class="coin-type">
		<p>Token Type</p>
		<ul>
			<li class="checked"><img src="/img/eth-coin.png" alt=""><span>ETH</span></li>
		</ul>
	</div>
	<div class="coin-detail">
		<p>Token Amount</p>
		<input type="text" disabled="true" value="{$kyc_info.coin_number}">
		<p>Wallet address to send token</p>
		<input type="text" disabled="true" value="{$kyc_info.send_coin_address}">
		<p>NEO Wallet address to receive DAGT</p>
		<input type="text" disabled="true" value="{$kyc_info.send_coin_address}">
	</div>

	<!-- 透明背景 -->
	<div class="opacity_bg"></div>
	<!-- 确认信息 -->
	<div class="dialog" id="confirmationInformation">
		<p>Please confirm that the KYC information above is "<span>correct, valid and under your own operation</span>", as all consequences or losses caused by any false information are borne by the participants themselves.</p>
		<div class="yesOrno">
			<button class="yes" type="button">Yes</button>
			<button class="no" type="button">No</button>
		</div>
		<div class="delete">X</div>
	</div>
	<!-- 输入邮箱verify码 -->
	<div class="dialog" id="mailboxCode">
	    <p>Please enter the verification code sent to your mailbox</p>
		<div class="mail">
			<input type="text" placeholder="Verification code" value="">
			<button class="now" type="button">Request</button>
		</div>
		<p class="prompt"><!-- The verification code has been sent to max@51qed.com, please check it. --></p>
		<button class="yz" type="button">Verify</button>
		<div class="delete">X</div>
	</div>
	<!-- verify成功提示 -->
	<div class="dialog" id="gainSuccess">
		<p>The receiving address only supports ETH. </p>
		<div class="copy">
			<input type="text" placeholder="Replicating mailbox address"  id="mailLink" value="">
			<button class="now" type="button" onclick="copyText()">Copy</button>
		</div>
		<div class="delete">X</div>
	</div>

	{if array_key_exists('application_status', $kyc_info) && $kyc_info.application_status == 2}
	<button class="getAddress" type="button">Get the receiving address</button>
	{/if}
	{if array_key_exists('application_status', $kyc_info) && ($kyc_info.application_status == 1 || $kyc_info.application_status == 2)}

	{else}
	<div class="contact">
		<p class="intersting">If you are interested in our project, please contact our team：<span>market@dagt.io</span></p>
		<p class="careful">ATTENTION：</p>
		<ul>
			<li>1.Each participant must conform to the criteria for an "accredited investor" defined by the applicable law in their own jurisdiction.By submitting the form, the participants are committed that all the information and data provided are true and correct. All the consequences or damages caused by any false or misleading information should be borne by the participants themselves;</li>
			<li>2.We will provide the result of the KYC review within 24 hours. Please check your email. You may also check the result of the review on this page;</li>
			<li>3. When the Initial Coin Offering (ICO) begins, we will only release the “recipients’ address” on this page. Please do not trust the contract address released by any other channel.</li>
			<li>4. The recipients’ address is only publicized to the users approved by the KYC process. If you obtain the “receiving address” through other channels, the losses caused by the transfer will be borne by the participants themselves;</li>
		</ul>
		<label class="agreement agreement-en"><input type="checkbox" checked="checked" disabled="true" class="yes" value="" />
		I have read and accepted all the zeepin token terms and conditions of token sale and purchase.</label>
		<div class="commite">
			<button class="continue" type="button">Return to edit</button>
			<button class="save" type="button">Save</button>
		</div>
	</div>
	{/if}
</div>

<div class="foot">
	<div class="left">
		<img src="/img/logo.png" class="foot-logo" alt="">
		<p>© 2018&nbsp;DAGT&nbsp;Chain</p>
		<p class="line">|</p>
		<p><a href="/index/index.html">Chinese</a></p>
		<p>English</p>
	</div>
</div>
<script src="/js/kyc.js"></script>
<script type="text/javascript">
$(".continue").click(function(){
	window.location.href = "/index/kyc.html?lang=en";
})
$(".save").click(function(){
	$(this).css('background', '#ccc');
	$(this).val('processing...');
	$(this).attr("disabled", "disabled");
    $.ajax({
        type: "POST",
        url: "/index/save.html",
        data: {
            "_csrf" : "{$token}"
        },
        dataType: 'json',
        cache: false,
        beforeSend: function () {},
        success: function (data) {
        	$(".save").val('Save');
        	$(".save").removeAttr('style');
        	$(".save").removeAttr("disabled");
        	if(data.response_code == 1){
        		window.location.href = "/index/index.html?lang=en";
        	} else {
           		alert(data.response_text);
           	}
        },
        error: function(){
        	$(".save").val('Save');
        	$(".save").removeAttr('style');
        	$(".save").removeAttr("disabled");
        }
    }); 
});
//request邮箱verify码
$(".mail .now").click(function(){
	$(".prompt").html("");
    {literal}
    var email_reset = $.trim($(".mail input").val());
    var reg = new RegExp("^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$");
	{/literal}
	$(this).css('background', '#ccc');
	$(this).val('等待中...');
	$(this).attr("disabled", "disabled");
    $.ajax({
        type: "POST",
        url: "/index/send-verify-code.html?lang=en",
        data: {
        	"_csrf" : "{$token}"
        },
        dataType: 'json',
        cache: false,
        beforeSend: function () {},
        success: function (data) {
        	$(".mail .now").val('request');
        	$(".mail .now").removeAttr('style');
        	$(".mail .now").removeAttr("disabled");
        	if(data.response_code == 1){
           		$(".prompt").html(data.response_text).css("color", "red");
        	} else {
        		$(".prompt").html(data.response_text).css("color", "red");
        	}           	
        },
        error: function(){
        	$(".mail .now").val('request');
        	$(".mail .now").removeAttr('style');
        	$(".mail .now").removeAttr("disabled");
        }
    });  
});

// 邮箱verify码verify
$("#mailboxCode .yz").click(function(){
	$(".prompt").html("");
    {literal}
    var mail_code = $.trim($(".mail input").val());
    var reg = new RegExp("^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$");
	{/literal}
    if(mail_code.length == 0){
      $(".prompt").html("Email verify can not be empty");
      return false;
    }
　　  else {
      $(".prompt").html("");

    }
	$(this).css('background', '#ccc');
	$(this).val('等待中...');
	$(this).attr("disabled", "disabled");
    $.ajax({
        type: "POST",
        url: "/index/check-verify-code.html?lang=en",
        data: {
        	"verify-code": mail_code,
        	"_csrf" : "{$token}"
        },
        dataType: 'json',
        cache: false,
        beforeSend: function () {},
        success: function (data) {
        	$("#mailboxCode .yz").val('verify');
        	$("#mailboxCode .yz").removeAttr('style');
        	$("#mailboxCode .yz").removeAttr("disabled");
        	if(data.response_code == 1){
           		$("#mailboxCode").hide();
    			$("#gainSuccess").show();
    			console.log(data.address)
    			$("#gainSuccess .copy input").val(data.address)
        	} else {
        		$(".prompt").html(data.response_text).css("color", "red");
        	}           	
        },
        error: function(){
        	$("#mailboxCode .yz").val('verify');
        	$("#mailboxCode .yz").removeAttr('style');
        	$("#mailboxCode .yz").removeAttr("disabled");
        }
    });  
});
 function copyText() {
  var mailLink = document.getElementById("mailLink").value;
  var input = document.getElementById("mailLink");
  input.select(); // 选中文本
  document.execCommand("copy"); // 执行浏览器复制命令

}
</script>
