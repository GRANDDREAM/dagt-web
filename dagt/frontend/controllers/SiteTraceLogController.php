<?php
namespace frontend\controllers;


use Yii;
use yii\web\Controller;
/**
 * @author Administrator     
 */
class SiteTraceLogController extends Controller
{
    public function actionIndex(){
        
            if(!empty($_SERVER["HTTP_CLIENT_IP"]))
            {
                $cip = $_SERVER["HTTP_CLIENT_IP"];
            }
            elseif(!empty($_SERVER["HTTP_X_FORWARDED_FOR"]))
            {
                $cip = $_SERVER["HTTP_X_FORWARDED_FOR"];
            }
            elseif(!empty($_SERVER["REMOTE_ADDR"]))
            {
                $cip = $_SERVER["REMOTE_ADDR"];
            }
            else
            {
                $cip = "0.0.0.0";
            }

            $traceArr = [];
            $traceArr['domain'] = \Yii::$app->request->get('domain');
            $traceArr['ip'] = $cip;
            $traceArr['time'] = time();
            $traceArr['url'] = \Yii::$app->request->get('url');
//             $traceArr['title'] = \Yii::$app->request->get('title');
            $traceArr['referrer'] = \Yii::$app->request->get('referrer');
//             $traceArr['height'] = \Yii::$app->request->get('sh');
//             $traceArr['width'] = \Yii::$app->request->get('sw');
//             $traceArr['colorDepth'] = \Yii::$app->request->get('cd');
            $traceArr['lang'] = \Yii::$app->request->get('lang');
            $traceArr['appName'] = \Yii::$app->request->get('appName');
            $traceArr['appVersion'] = \Yii::$app->request->get('appVersion');
            $traceArr['userAgent'] = \Yii::$app->request->get('userAgent');
            $traceArr['utrace'] = \Yii::$app->request->get('utrace');
            $traceArr['account'] = \Yii::$app->request->get('account');
            
            $siteTraceModel = new \frontend\models\SiteTraceLogModelInfo();
            $data['domain'] = \Yii::$app->request->get('domain');
            $data['ip'] = $cip;
            $data['time'] = time();
            $data['url'] = \Yii::$app->request->get('url');
            $data['referrer'] = \Yii::$app->request->get('referrer');
            $data['lang'] = \Yii::$app->request->get('lang');
            $data['app_name'] = \Yii::$app->request->get('appName');
            $data['app_version'] = \Yii::$app->request->get('appVersion');
            $data['user_agent'] = \Yii::$app->request->get('userAgent');
            $data['utrace'] = \Yii::$app->request->get('utrace');
            $data['account'] = \Yii::$app->request->get('account');
            $data['create_time'] = date('Y-m-d H:i:s');
            $rs = $siteTraceModel->addLogInfo($data);
            \Yii::info("rs:".$rs);
    }
}

?>