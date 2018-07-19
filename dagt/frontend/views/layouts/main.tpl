{$this->beginPage()}
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="{$app->charset}"/>
    <meta http-equiv="X-UA-Compatible" content="IE=8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <!-- <meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" /> -->
    <title>{$this->title|escape}</title>
    {use class="yii\helpers\Html"}
	{Html::csrfMetaTags()}
    {$this->head()}
	<link rel="stylesheet" href="/css/reset.css">
    <link rel="stylesheet" href="/css/animation.css">
    <link rel="stylesheet" href="/css/swiper-3.4.2.min.css">
    <link rel="stylesheet" href="/css/font-awesome.min.css">
	<script src="/js/jquery-1.12.4.min.js"></script>
    <script src="/js/swiper-3.4.2.min.js"></script>
    <script src="/js/swiper-3.4.2.jquery.min.js"></script>
</head>
<body>
{$this->beginBody()}
	{$content}
{$this->endBody()}
	<script type="text/javascript">
	var _maq = _maq || [];
	_maq.push(['_setAccount', 'dagt_0011080A']);
	  
	(function() {
	    var ma = document.createElement('script'); ma.type = 'text/javascript'; ma.async = true;
	    ma.src = ('https:' == document.location.protocol ? 'https://'+window.location.host : 'http://'+window.location.host) + '/js/analytics.js';
	    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ma, s);
	})();
	</script>
	<script>
	var _hmt = _hmt || [];
	(function() {
	  var hm = document.createElement("script");
	  hm.src = "https://hm.baidu.com/hm.js?b8c0dcd604ab5b9bb5951e3ee947cd92";
	  var s = document.getElementsByTagName("script")[0]; 
	  s.parentNode.insertBefore(hm, s);
	})();
	</script>

</body>
{$this->endPage()}