/**
 * 
 */
(function () {
 	
    var params = {};
    //Document对象数据
    if(document) {
        params.domain = document.domain || ''; 
        params.url = document.URL || ''; 
        params.title = document.title || ''; 
        params.referrer = document.referrer || ''; 
    }   
    //Window对象数据
    if(window && window.screen) {
        params.sh = window.screen.height || 0;
        params.sw = window.screen.width || 0;
        params.cd = window.screen.colorDepth || 0;
    }   
    //navigator对象数据
    if(navigator) {
        params.lang = navigator.language || ''; 
        params.appName = navigator.appName; //浏览器的正式名称
        params.appVersion = navigator.appVersion; //浏览器的版本号
        params.userAgent = navigator.userAgent;
    }
    
    
    var cookie = {
    	    set:function(key,val,time){//设置cookie方法
    	        var date=new Date(); //获取当前时间
    	        var expiresDays=time;  //将date设置为n天以后的时间
    	        date.setTime(date.getTime()+expiresDays*24*3600*1000); //格式化为cookie识别的时间
    	        document.cookie=key + "=" + val +";expires="+date.toGMTString();  //设置cookie
    	    },
    	    get:function(key){//获取cookie方法
    	        /*获取cookie参数*/
    	        var getCookie = document.cookie.replace(/[ ]/g,"");  //获取cookie，并且将获得的cookie格式化，去掉空格字符
    	        var arrCookie = getCookie.split(";")  //将获得的cookie以"分号"为标识 将cookie保存到arrCookie的数组中
    	        var tips;  //声明变量tips
    	        for(var i=0;i<arrCookie.length;i++){   //使用for循环查找cookie中的tips变量
    	            var arr=arrCookie[i].split("=");   //将单条cookie用"等号"为标识，将单条cookie保存为arr数组
    	            if(key==arr[0]){  //匹配变量名称，其中arr[0]是指的cookie名称，如果该条变量为tips则执行判断语句中的赋值操作
    	                tips=arr[1];   //将cookie的值赋给变量tips
    	                break;   //终止for循环遍历
    	            }
    	        }
        	    return tips;
    	    },
    	    delete:function(key){ //删除cookie方法
	         var date = new Date(); //获取当前时间
	         date.setTime(date.getTime()-10000); //将date设置为过去的时间
	         document.cookie = key + "=v; expires =" +date.toGMTString();//设置cookie
	        }
    	};
    
	var date=new Date();
	var cookie_key = 'uu_ltt_trace_cookie';
    var cookie_value = cookie.get(cookie_key);
    if(typeof(cookie_value) == "undefined" || cookie_value.length == 0){
    	cookie_value = date.getTime()+'_'+Math.random();
    	cookie.set(cookie_key, cookie_value, 3650);
    }
    params.utrace = cookie_value;
    
    //解析_maq配置
    if(_maq) {
        for(var i in _maq) {
            switch(_maq[i][0]) {
                case '_setAccount':
                    params.account = _maq[i][1];
                    break;
                default:
                    break;
            }   
        }   
    }   
    //拼接参数串
    var args = ''; 
    for(var i in params) {
        if(args != '') {
            args += '&';
        }   
        args += i + '=' + encodeURIComponent(params[i]);
    }   
  
    var http_protocol = ('https:' == document.location.protocol ? 'https://' : 'http://');
    //通过Image对象请求后端脚本
    var img = new Image(1, 1); 
    img.src = http_protocol+window.location.host+'/1.gf?' + args;
})();
