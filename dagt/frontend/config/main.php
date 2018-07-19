<?php
$params = array_merge(
    require(__DIR__ . '/../../common/config/params.php'),
    require(__DIR__ . '/../../common/config/params-local.php'),
    require(__DIR__ . '/params.php')
);

return [
    'id' => 'app-frontend',
    'basePath' => dirname(__DIR__),
    'bootstrap' => ['log'],
    'controllerNamespace' => 'frontend\controllers',
    'defaultRoute' => 'index/index',
    'layout' => 'main.tpl',    
    'components' => [
        'view' => [
            'renderers' => [
                'tpl' => [
                    'class' => 'yii\smarty\ViewRenderer',
                    'cachePath' => '@runtime/Smarty/cache',
                ],
            ],
        ],
        'mailer' => [
            'class' => 'yii\swiftmailer\Mailer',
            'viewPath' => '@common/mail',
            'useFileTransport' => false, //如果要真实发送邮件，需要将此设置为false，设置为true，可以在runtime/mail下生成文件。
            'transport' => [
                'class' => 'Swift_SmtpTransport',
                'host' => 'smtp.gmail.com',
                'username' => '',
                'password' => '',               
                'port' => '465',
                'encryption' => 'ssl',
            ],            
        ],
        'name' => 'DAGT',
        'language' => 'zh-CN',
        'db' => [
            'class' => 'yii\db\Connection',
            'dsn' => 'mysql:host=;dbname=',
            'username' => '',
            'password' => '',
            'charset' => 'utf8',
            'tablePrefix' => ''
            ],
        'user' => [
            'identityClass' => 'common\models\User',
            'enableAutoLogin' => true,
        ],
        'log' => [
            'traceLevel' => YII_DEBUG ? 3 : 0,
            'targets' => [
                [
                    'class' => 'yii\log\FileTarget',
                    'levels' => ['error', 'warning', 'info', 'trace'],//'levels' => ['error', 'warning','info','trace'],
                    'logFile' => '@app/runtime/logs/app_'.date('Y_m_d').'.log',                    
                ],
            ],
        ],
        'errorHandler' => [
            'errorAction' => 'site/error',
        ],
        'urlManager' => [
            'enablePrettyUrl' => true,//启用 "pretty" URLs 将转换这个查询字符串格式为基于目录（directory-based）的格式
            'showScriptName' => false,//隐藏index.php
            'suffix' => '.html',//后缀，如果设置了此项，那么浏览器地址栏就必须带上.html后缀，否则会报404错误
            'rules' => [
                'site-trace-log/index' => 'site-trace-log/index',
                //验证码
                'verify-code/create' => 'verify-code/create',
                'index/kyc-view' => 'index/kyc-view',
                '<controller:\w+>/<action:\w+>' =>'<controller>/<action>',
            ],
        ],
    ],
    'params' => $params,
];
