<link rel="stylesheet" href="/css/dialog.css">
<link rel="stylesheet" href="/css/kyc-save.css">
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
	{if array_key_exists('application_status', $kyc_info) && $kyc_info.application_status == 2}
		<div class="wait"><img src="/img/wait.png" alt=""><span>审核通过</span></div>
	{elseif array_key_exists('application_status', $kyc_info) && $kyc_info.application_status == 3}
		<div class="wait"><img src="/img/wait.png" alt=""><span>未通过</span></div>
	{else}
	<div class="wait"><img src="/img/wait.png" alt=""><span>待审核</span></div>
	{/if}
	<!-- 内容背景 -->
	<img src="/img/kyc-logo.png" class="kyc-logo" alt="">
	<p class="colae-time">KYC将在 2018年4月30日16:00（UTC）关闭</p>
<!-- 	<div class="yulan"><img src="/img/yulan.png" alt="">合同预览</div> -->
	<div class="form">
		<ul>
			<li>
				<div>
					<p>姓</p>
					<input type="text" disabled="true" class="first-name" value="{$kyc_info.first_name}">
					<span class="first-name-error error"></span>
				</div>
				<div>
					<p>名</p>
					<input type="text" disabled="true" class="last-name" value="{$kyc_info.last_name}">
					<span class="last-name-error error"></span>
				</div>
			</li>
			<li>
				<div>
					<p>手机号码</p>
					<input type="text" disabled="true" class="telphone" value="{$kyc_info.telphone}">
					<span class="telphone-error error"></span>
				</div>
				<div>
					<p>电子邮箱</p>
					<input type="text" disabled="true" class="email" value="{$kyc_info.email}">
					<span class="email-error error"></span>
				</div>
			</li>

			<li>
				<div>
					<p>国籍</p>
					<select class="" id="county" disabled="true">
		               <option value="{$kyc_info.country}" selected="selected">{$kyc_info.country_name}</option>  
		            </select>
		        </div>    
			</li>
			<li class="id-sec">
				<div>
					<p>护照ID</p>
					<input type="text" id="passport-id" disabled="true"" placeholder="或驾驶证或护照编号" class="post-id" value="{$kyc_info.identification_id}">
				</div>
			</li>
		</ul>
	</div>
	<div class="authentication">
		{if $kyc_info.country == 0}
		<!-- 身份证 -->
		<div class="card idcard">
			<div class="upload">
				<p>本人身份证正面照片</p>
				<p>请确保照片的内容完整并清晰可见</p>
				<div class="photo">
					<div class="positive"></div>
					<div class="real"><img src="{$kyc_info.p1}" alt="" class="example-photo"></div>
					<div class="example"><img src="/img/idcard.png" alt=""></div>
				</div>
			</div>
			<div class="upload">
				<p>本人身份证背面照片</p>
				<p>请确保照片的内容完整并清晰可见，身份证必须在有效期内</p>
				<div class="photo">
					<div class="opposite"></div>
					<div class="real"><img src="{$kyc_info.p2}" alt="" class="example-photo"></div>
					<div class="example"><img src="/img/b-idcard.png" alt=""></div>
				</div>
			</div>
			<div class="upload">
				<p>手持本人身份证正面照片和个人签字</p>
				<p>请您上传一张手持身份证正面照和个人签字的照片，个人签字的内容包含“币押链”和当前日期。请确保照片和个人签字的内容清晰可见。</p>
				<div class="photo">
					<div class="whole"></div>
					<div class="real"><img src="{$kyc_info.p3}" alt="" class="example-photo"></div>
					<div class="example"><img src="/img/face-id.png" alt=""></div>
				</div>
			</div>	
			<div class="upload">
				<p>地址证明（最近6个月）</p>
				<p>请您上传一张水电费账单/银行账单/税单/其他政府签发的可以证实真实居住地址的文件，请确保照片的内容清晰可见。</p>
				<div class="photo">
					<div class="adress"></div>
					<div class="real"><img src="{$kyc_info.p4}"  alt="" class="example-photo"></div>
					<div class="example"><img src="/img/face-post.png" alt=""></div>
				</div>
			</div>
		</div>
		{else}
		<!-- 护照 -->
		<div class="card postcard">
			<div class="upload">
				<p>护照封面</p>
				<p>或您可上传驾驶证正面或国民身份证正面，请确保照片的内容完整并清晰可见</p>
				<div class="photo">
					<div class="positive"></div>
					<div class="real"><img src="{$kyc_info.p1}" alt="" class="example-photo"></div>
					<div class="example" id="positive"><img src="/img/postcard.png" alt=""></div>
				</div>
			</div>
			<div class="upload">
				<p>护照个人信息页</p>
				<p>或您可上传驾驶证背面或国民身份证背面，证件必须在有效期内</p>
				<div  class="photo">
					<div class="opposite"></div>
					<div class="real"><img src="{$kyc_info.p2}" alt="" class="example-photo"></div>
					<div class="example"><img src="/img/b-postcard.png" alt=""></div>
				</div>
			</div>
			<div class="upload">
				<p>手持护照个人信息页和个人签字</p>
				<p>或您可上传驾驶证正面或国民身份证正面和个人签字。请您上传一张手持证件个人信息页和个人签字的照片，个人签字的内容包含“DAGT”和今天的日期。请确保照片和个人签字的内容清</p>
				<div class="photo">
					<div class="whole"></div>
					<div class="real"><img src="{$kyc_info.p3}" alt="" class="example-photo"></div>
					<div class="example"><img src="/img/face-post.png" alt=""></div>
				</div>
			</div>
			<div class="upload">
				<p>地址证明（最近6个月）</p>
				<p>请您上传一张水电费账单/银行账单/税单/其他政府签发的可以证实真实居住地址的文件，请确保照片的内容清晰可见。</p>
				<div class="photo">
					<div class="adress"></div>
					<div class="real"><img src="{$kyc_info.p4}"  alt="" class="example-photo"></div>
					<div class="example"><img src="/img/face-post.png" alt=""></div>
				</div>
			</div>		
		</div>
		{/if}
	</div>
	<div class="coin-type">
		<p>代币类型</p>
		<ul>
			<li class="checked"><img src="/img/eth-coin.png" alt=""><span>ETH</span></li>
		</ul>
	</div>
	<div class="coin-detail">
		<p>代币数量</p>
		<input type="text" disabled="true" value="{$kyc_info.coin_number}">
		<p>发送币的ETH钱包地址</p>
		<input type="text" disabled="true" value="{$kyc_info.send_coin_address}">
		<p>接收DAGT的ETH钱包地址</p>
		<input type="text" disabled="true" value="{$kyc_info.send_coin_address}">
	</div>
	
	<!-- 透明背景 -->
	<div class="opacity_bg"></div>
	<!-- 确认信息 -->
	<div class="dialog" id="confirmationInformation">
		<p>请确认以上KYC信息"<span>正确有效且是您本人操作</span>"，如因任何虚假信息导致的所有后果或损失由参与者自行承担</p>
		<div class="yesOrno">
			<button class="yes" type="button">是</button>
			<button class="no" type="button">否</button>
		</div>
		<div class="delete">X</div>
	</div>
	<!-- 输入邮箱验证码 -->
	<div class="dialog" id="mailboxCode">
	    <p>请输入您的邮箱验证码</p>
		<div class="mail">
			<input type="text" placeholder="邮箱验证码" value="">
			<button class="now" type="button">获取</button>
		</div>
		<p class="prompt"><!-- 邮箱验证码已发送至您的邮箱，请查阅 --></p>
		<button class="yz" type="button">验证</button>
		<div class="delete">X</div>
	</div>
	<!-- 验证成功提示 -->
	<div class="dialog" id="gainSuccess">
		<p>DAGT基金会收币地址，仅支持ETH</p>
		<div class="copy">
			<input type="text" placeholder="复制邮箱链接"  id="mailLink" value="">
			<button class="now" type="button" onclick="copyText()">复制</button>
		</div>
		<div class="delete">X</div>
	</div>
	{if array_key_exists('application_status', $kyc_info) && $kyc_info.application_status == 2}
	<button class="getAddress" type="button">获取收币地址</button>
	{/if}
	{if array_key_exists('application_status', $kyc_info) && ($kyc_info.application_status == 1 || $kyc_info.application_status == 2)}

	{else}
	<div class="contact">
		<p class="intersting">如果您对本次预售项目感兴趣或想投资，请联系我们的运营人员，联系邮箱：<span>market@dagt.io</span></p>
		<p class="careful">注意：</p>
		<ul>
			<li>1.参与者必须符合“合格投资者”的法律界定，当您提交以上信息后，即承诺所有提供的信息和资料是真实的和正确的。如因任何虚假信息导致的所有的后果或损失由参与者自行承担；</li>
			<li>2.我们会在24小时之内反馈KYC审查结果，您也可以通过本页面查阅评审结果；</li>
			<li>3.当首次代币发行（ICO）开始，我们仅在本页面发布 “收币地址”，请不要相信其他任何渠道发布的信息；</li>
			<li>4.收币地址仅对KYC审核通过的用户公示，如因您通过其他渠道获取“收币地址”，转账造成的损失由参与者自行承担；</li>

		</ul>
		<label class="agreement"><input type="checkbox" checked="checked" disabled="true"  class="yes" value="" />
		我已阅读并接受所有条款和白皮书内容</label>
		<div class="commite">
			<button class="continue" type="button">返回编辑</button>
			<button class="save" type="button">保存</button>
		</div>
	</div>
	{/if}
</div>

<div class="foot">
	<div class="left">
		<img src="/img/logo.png" class="foot-logo" alt="">
		<p>© 2018&nbsp;DAGT&nbsp;Chain</p>
		<p class="line">|</p>
		<p>中文</p>
		<p><a href="/?lang=en">English</a></p>
	</div>
</div>
<script src="/js/kyc.js"></script>
<script type="text/javascript">
$(".continue").click(function(){
	window.location.href = "/index/kyc.html";
})
$(".save").click(function(){
	$(this).css('background', '#ccc');
	$(this).val('提交中...');
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
        	$(".save").val('保存');
        	$(".save").removeAttr('style');
        	$(".save").removeAttr("disabled");
        	if(data.response_code == 1){
        		window.location.href = "/index/index.html";
        	} else {
           		alert(data.response_text);
           	}
        },
        error: function(){
        	$(".save").val('保存');
        	$(".save").removeAttr('style');
        	$(".save").removeAttr("disabled");
        }
    }); 
});
//获取邮箱验证码
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
        url: "/index/send-verify-code.html",
        data: {
        	"_csrf" : "{$token}"
        },
        dataType: 'json',
        cache: false,
        beforeSend: function () {},
        success: function (data) {
        	$(".mail .now").val('获取');
        	$(".mail .now").removeAttr('style');
        	$(".mail .now").removeAttr("disabled");
        	if(data.response_code == 1){
           		$(".prompt").html(data.response_text).css("color", "red");
        	} else {
        		$(".prompt").html(data.response_text).css("color", "red");
        	}           	
        },
        error: function(){
        	$(".mail .now").val('获取');
        	$(".mail .now").removeAttr('style');
        	$(".mail .now").removeAttr("disabled");
        }
    });  
});

// 邮箱验证码验证
$("#mailboxCode .yz").click(function(){
	$(".prompt").html("");
    {literal}
    var mail_code = $.trim($(".mail input").val());
    var reg = new RegExp("^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$");
	{/literal}
    if(mail_code.length == 0){
      $(".prompt").html("邮箱验证码不能为空");
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
        url: "/index/check-verify-code.html",
        data: {
        	"verify-code": mail_code,
        	"_csrf" : "{$token}"
        },
        dataType: 'json',
        cache: false,
        beforeSend: function () {},
        success: function (data) {
        	$("#mailboxCode .yz").val('验证');
        	$("#mailboxCode .yz").removeAttr('style');
        	$("#mailboxCode .yz").removeAttr("disabled");
        	if(data.response_code == 1){
           		$("#mailboxCode").hide();
    			$("#gainSuccess").show();

    			$("#gainSuccess .copy input").val(data.address)
        	} else {
        		$(".prompt").html(data.response_text).css("color", "red");
        	}           	
        },
        error: function(){
        	$("#mailboxCode .yz").val('验证');
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