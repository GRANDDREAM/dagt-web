<?php
namespace frontend\controllers;

use Yii;
use yii\web\Controller;

/**
 * Index controller
 */
class IndexController extends Controller
{
    /**
     * 默认语言
     * @var string
     */
    static public $defaultLanguage = 'zh';

    /**
     * Displays homepage.
     *
     * @return mixed
     */
    public function actionIndex()
    {
        $session = \Yii::$app->session;
        $sessionInfo = $session[\Yii::$app->request->hostInfo];
        if(empty($sessionInfo)){
            $sessionInfo = [];
        }
        $bcode = \Yii::$app->request->get('bcode');
        $email = '';
        if($bcode){
            $paramDecode = base64_decode($bcode);
            parse_str($paramDecode, $output);
            $email = $output['email'];            
        }
        $lang = \Yii::$app->request->get('lang');
        if($lang == 'en'){
            $this->getView()->title = "DAGT-Make your digital assets fly";
            $this->getView()->registerMetaTag(['name' => 'keywords', 'content' => "DAGT official,DAGT,digital assets,backed loans,credit,ICO,initial coin offering,ethereum,ETH,cryptocurrency,bitcoin,BTC,cryptocurrency exchange"]);
            $this->getView()->registerMetaTag(['name' => 'description', 'content' => "DAGT is a leading decentralized platform which allows holders of blockchain assets to leverage their holdings as  collateral for assets, credit, and loans. Lenders can lock their digital assets (BTC, ETH, etc.) into smart contracts through the DAGT  platform. DAGT will issue appropriate credit qualifications and provide lenders with quality services."]);            
            return $this->render('en_index.tpl', ['token' => \Yii::$app->request->csrfToken, 'session_info' => $sessionInfo, 'email' => $email]);
        } else {
            $this->getView()->title = "DAGT-让数字资产飞速流转！";
            $this->getView()->registerMetaTag(['name' => 'keywords', 'content' => "DAGT,数字资产,数字货币,抵押贷款,授信,ICO,比特币,BTC,以太坊,ETH"]);
            $this->getView()->registerMetaTag(['name' => 'description', 'content' => "DAGT全称是Digital Assets Guarantee Token（www.dagt.io），是由新加坡非盈利基金会（GRANDDREAM）创立的一个基于以太坊公有区块链技术和智能合约技术实现去中心化的数字资产质押授信平台，目的是建立一个信息透明、高效协同、数字资产价值高速流转的可信任分布式授信系统，在整个授信生态中，用户通过使用“DAGT”通证（Token）或其他通证支付授信服务费，从而获取DAGT项目合作的金融机构提供的资金服务。"]);            
            return $this->render('index.tpl', ['token' => \Yii::$app->request->csrfToken, 'session_info' => $sessionInfo, 'email' => $email]);
        }
    }

    /**
     * Logs in a user.
     *
     * @return mixed
     */
    public function actionLogin()
    {
        $lang = \Yii::$app->request->get('lang');
        $langInfo = isset(\Yii::$app->params['lang'][$lang]) ? \Yii::$app->params['lang'][$lang] : \Yii::$app->params['lang'][self::$defaultLanguage];
        if(\Yii::$app->request->isPost && \Yii::$app->request->isAjax){
//             $showCode = 0;
            $email = \Yii::$app->request->post('email');
            $password = \Yii::$app->request->post('password');
//             $verifyCode = \Yii::$app->request->post('verify_code');
            
            $session = \Yii::$app->session;
            $sessionInfo = $session[\Yii::$app->request->hostInfo];
//             $sessionVerifyCode = isset($sessionInfo['verifycode']) ? $sessionInfo['verifycode'] : ''; 
//             if(!empty($sessionInfo['show_verify_code']) && strlen($verifyCode) == 0){
//                 echo json_encode(['status' => 'n', 'info' => '验证码不能为空', 'show_code' => $showCode]);
//                 return;
//             }
            
//             if(!empty($sessionInfo['show_verify_code']) && empty($sessionVerifyCode)){
//                 echo json_encode(['status' => 'n', 'info' => '请先获取图形验证码', 'show_code' => $showCode]);
//                 return;
//             }
            
//             if(!empty($sessionInfo['show_verify_code']) && $verifyCode != $sessionVerifyCode){
//                 echo json_encode(['status' => 'n', 'info' => '验证码不正确', 'show_code' => $showCode]);
//                 return;
//             }            
            
            $userModel = new \frontend\models\UserInfoModel();
            $userInfo = $userModel->getUserInfoByEmailPassword($email, $password);
            if(!empty($userInfo)){
                $sessionInfo['user_info'] = $userInfo;
                if($userInfo['first_name'] && $userInfo['application_email'] && $userInfo['application_status']){
                    $kycInfo['first_name'] = $userInfo['first_name'];
                    $kycInfo['last_name'] =  $userInfo['last_name'];
                    $kycInfo['telphone'] =  $userInfo['telphone'];
                    $kycInfo['email'] =  $userInfo['application_email'];
                    $kycInfo['country'] =  $userInfo['country'];
                    $kycInfo['identification_id'] =  $userInfo['identification_id'];
                    $tmp = explode("|", $userInfo['user_credentials_img']);
                    $kycInfo['p1'] =  isset($tmp[0]) ? $tmp[0] : '';
                    $kycInfo['p2'] =  isset($tmp[1]) ? $tmp[1] : '';
                    $kycInfo['p3'] =  isset($tmp[2]) ? $tmp[2] : '';
                    $kycInfo['p4'] =  isset($tmp[3]) ? $tmp[3] : '';
                    $kycInfo['coin_type'] =  $userInfo['coin_type'];
                    $kycInfo['coin_number'] =  $userInfo['coin_number'];
                    $kycInfo['send_coin_address'] =  $userInfo['send_coin_address'];
                    $kycInfo['get_coin_address'] =  $userInfo['get_coin_address'];
                    $kycInfo['application_status'] =  $userInfo['application_status'];
                    $sessionInfo['kyc_info'] = $kycInfo;
                    echo json_encode(["response_code" => '1', 'response_text' => $langInfo['LOGIN_SUCCESS_MSG'], 'application' => '1']);
                } else {
                    echo json_encode(["response_code" => '1', 'response_text' => $langInfo['LOGIN_SUCCESS_MSG'], 'application' => '0']);                  
                }
                $session[\Yii::$app->request->hostInfo] = $sessionInfo;
                return;
            }
            echo json_encode(["response_code" => '0', 'response_text' => $langInfo['LOGIN_ERROR_USER_NOT_EXSITS_MSG']]);
            return;            
        } else {
            throw new \Exception("错误");
        }
    }
    

    /**
     * register a user.
     *
     * @return mixed
     */
    public function actionRegister()
    {
        $lang = \Yii::$app->request->get('lang');
        $langInfo = isset(\Yii::$app->params['lang'][$lang]) ? \Yii::$app->params['lang'][$lang] : \Yii::$app->params['lang'][self::$defaultLanguage];        
        if(\Yii::$app->request->isPost && \Yii::$app->request->isAjax){
            $email = \Yii::$app->request->post('email');
            $password = \Yii::$app->request->post('password');
            $confirmPassword = \Yii::$app->request->post('confirm_password');

            if(empty($email)){
                echo json_encode(array('response_code' => 0, 'response_text' => $langInfo['EMAIL_NOT_EMPTY_MSG']));
                return;
            }
            
            if(empty($email)){
                echo json_encode(array('response_code' => 0, 'response_text' => $langInfo['EMAIL_FORMAT_ERROR_MSG']));
                return;
            }
            
            if(empty($password)){
                echo json_encode(array('response_code' => 0, 'response_text' => $langInfo['PASSWORD_NOT_EMPTY']));
                return;
            }
            
            if(strlen($password) < 6){
                echo json_encode(array('response_code' => 0, 'response_text' => $langInfo['PASSWORD_LENGTH_LESS_THAN_SIX_CHAR']));
                return;
            }
            
            if($password != $confirmPassword){
                echo json_encode(array('response_code' => 0, 'msg' => $langInfo['PASSWORD_NOT_SAME']));
                return;
            }            
            
            $data['email'] = $email;
            $data['password'] = md5($password);
            $data['verify_code'] = sha1($email.$data['password']);
            $data['create_time'] = date('Y-m-d H:i:s');
            $userModel = new \frontend\models\UserInfoModel();
            $checkUser = $userModel->checkUserExisitsByEmail($email);
            if($checkUser){
                echo json_encode(["response_code" => '0', 'response_text' => $langInfo['EMAIL_EXSITS_MSG']]);
                return;
            }
            
            $userAddRs = $userModel->addUser($data);
            if($userAddRs){
                $mail = Yii::$app->mailer->compose();
                $mail->setFrom(\Yii::$app->params['register_from_email']);
                $mail->setTo($email);
                $mail->setSubject($langInfo['SEND_ACTIVATE_EMAIL_SUBJECT_MSG']);
                $emailMsg = $langInfo['SEND_ACTIVATE_VERIFY_EMAIL_CONTENT_MSG'];
                $verifyUrl = "http://".$_SERVER['HTTP_HOST']."/index/verify.html";
                $paramCode = "?bcode=".base64_encode("email=".$email."&code=".$data['verify_code']).'&lang='.$lang;
                $emailMsg = str_replace('__REPLACE_VERIFY_CODE_URL__', $verifyUrl.$paramCode, $emailMsg);
                $mail->setHtmlBody($emailMsg);
                if ($mail->send())
                    \Yii::info("success send email:".$email);
                else
                    \Yii::error("error send email:".$email);
                
                echo json_encode(["response_code" => '1', 'response_text' => $langInfo['REGISTER_SUCCESS_MSG'].$langInfo['EMAIL_ACTIVATE_MSG']]);
                return;
            }
            echo json_encode(["response_code" => '0', 'response_text' => $langInfo['REGISTER_ERROR_MSG']]);
            return;
        } else {
            throw new \Exception("错误");
        }
    }
    
    /**
     * check exsits a user.
     *
     * @return mixed
     */
    public function actionCheck()
    {
        $lang = \Yii::$app->request->get('lang');
        $langInfo = isset(\Yii::$app->params['lang'][$lang]) ? \Yii::$app->params['lang'][$lang] : \Yii::$app->params['lang'][self::$defaultLanguage];        
        if(\Yii::$app->request->isPost && \Yii::$app->request->isAjax){
            $email = \Yii::$app->request->post('email');    
            if(empty($email)){
                echo json_encode(array('response_code' => 0, 'response_text' => $langInfo['EMAIL_NOT_EMPTY_MSG']));
                return;
            }
    
            if(empty($email)){
                echo json_encode(array('response_code' => 0, 'response_text' => $langInfo['EMAIL_FORMAT_ERROR_MSG']));
                return;
            }
            
            $userModel = new \frontend\models\UserInfoModel();
            $checkUser = $userModel->checkUserExisitsByEmail($email);
            if($checkUser){
                echo json_encode(["response_code" => '0', 'response_text' => $langInfo['EMAIL_EXSITS_MSG']]);
                return;
            }
            echo json_encode(["response_code" => '1', 'response_text' => $langInfo['EMAIL_VERIFY_SUCCESS_MSG']]);
            return;
        } else {
            throw new \Exception("错误");
        }
    }

    /**
     * check exsits a user.
     *
     * @return mixed
     */
    public function actionVerify()
    {
        $lang = \Yii::$app->request->get('lang');
        $langInfo = isset(\Yii::$app->params['lang'][$lang]) ? \Yii::$app->params['lang'][$lang] : \Yii::$app->params['lang'][self::$defaultLanguage];
        $bcode = \Yii::$app->request->get('bcode');
        if(empty($bcode)){
            echo json_encode(array('response_code' => 0, 'response_text' => $langInfo['EMAIL_NOT_EMPTY_MSG']));
            return;
        }   
        $paramDecode = base64_decode($bcode);
        parse_str($paramDecode, $output);
        $email = $output['email'];
        $code = $output['code'];
        if(empty($email)){
            echo json_encode(array('response_code' => 0, 'response_text' => $langInfo['EMAIL_NOT_EMPTY_MSG']));
            return;
        }

        if(empty($code)){
            echo json_encode(array('response_code' => 0, 'response_text' => $langInfo['CODE_NOT_EMPTY_MSG']));
            return;
        }

        $userModel = new \frontend\models\UserInfoModel();
        $userInfo = $userModel->getUserInfoByEmail($email);
        if(empty($userInfo)){
            throw new \Exception($langInfo['LOGIN_ERROR_USER_NOT_EXSITS_MSG']);
        }
        if(sha1($email.$userInfo['password']) == $code){
            $session = \Yii::$app->session;
            $sessionInfo = $session[\Yii::$app->request->hostInfo];
            $sessionInfo['user_info'] = $userInfo;
            $session[\Yii::$app->request->hostInfo] = $sessionInfo;
            $userModel = new \frontend\models\UserInfoModel();
            $res = $userModel->editUserStatus($email);
            $redirectUrl = "/index/index.html";
            $redirectUrl.= empty($lang) ? '' : '?lang='.$lang;
            return $this->redirect($redirectUrl);
        } else {
            throw new \Exception($langInfo['CODE_VERIFY_ERROR_MSG']);
        }
    }

    public function actionKyc(){
        $session = \Yii::$app->session;
        $sessionInfo = $session[\Yii::$app->request->hostInfo];
        $userInfo = isset($sessionInfo['user_info']) ? $sessionInfo['user_info'] : [];
        $lang = \Yii::$app->request->get('lang');
        $langInfo = isset(\Yii::$app->params['lang'][$lang]) ? \Yii::$app->params['lang'][$lang] : \Yii::$app->params['lang'][self::$defaultLanguage];
        if(empty($userInfo)){
            if($lang == 'en'){
                return $this->redirect('/index/index.html?lang=en');
            } else {           
                return $this->redirect('/index/index.html');
            } 
        }

        if(!empty($userInfo['get_coin_address']) && empty($sessionInfo['kyc_info'])){
            if($lang == 'en'){
                return $this->redirect('/index/kyc-view.html?lang=en');
            } else {           
                return $this->redirect('/index/kyc-view.html');
            } 
        }        

        $kycInfo = isset($sessionInfo['kyc_info']) ? $sessionInfo['kyc_info'] : [];
        if(empty($kycInfo)){
            $kycInfo['first_name'] = '';
            $kycInfo['last_name'] = '';
            $kycInfo['telphone'] = '';
            $kycInfo['email'] = '';
            $kycInfo['country'] = '';
            $kycInfo['identification_id'] = '';
            $kycInfo['p1'] = '';
            $kycInfo['p2'] = '';
            $kycInfo['p3'] = '';
            $kycInfo['p4'] = '';
            $kycInfo['coin_type'] = '';
            $kycInfo['coin_number'] = '';
            $kycInfo['send_coin_address'] = '';
            $kycInfo['get_coin_address'] = '';     
            // $kycInfo['application_status'] =  1;       
        }

        $countryInfo = isset(\Yii::$app->params['country'][$lang]) ? \Yii::$app->params['country'][$lang] : \Yii::$app->params['country'][self::$defaultLanguage];
        $data['token'] = \Yii::$app->request->csrfToken;
        $data['kyc_info'] = $kycInfo;
        $data['country_info'] = $countryInfo;
        if($lang == 'en'){
            return $this->render('en_kyc.tpl', $data); 
        } else {
            return $this->render('kyc.tpl', $data); 
        }
    }

    public function actionSubmit(){
        $lang = \Yii::$app->request->get('lang');
        $langInfo = isset(\Yii::$app->params['lang'][$lang]) ? \Yii::$app->params['lang'][$lang] : \Yii::$app->params['lang'][self::$defaultLanguage];        
        if(\Yii::$app->request->isPost && \Yii::$app->request->isAjax){
            $firstName = \Yii::$app->request->post('first_name');
            if(empty($firstName)){
                echo json_encode(array('response_code' => 0, 'response_text' => $langInfo['FIRST_NAME_NOT_EMPTY_MSG']));
                return;
            }
            
            $lastName = \Yii::$app->request->post('last_name');
            if(empty($lastName)){
                echo json_encode(array('response_code' => 0, 'response_text' => $langInfo['LAST_NAME_NOT_EMPTY_MSG']));
                return;
            }

            $telphone = \Yii::$app->request->post('telphone');
            if(empty($telphone)){
                echo json_encode(array('response_code' => 0, 'response_text' => $langInfo['TELEPHONE_NOT_EMPTY_MSG']));
                return;
            }

            $email = \Yii::$app->request->post('email');
            if(empty($email)){
                echo json_encode(array('response_code' => 0, 'response_text' => $langInfo['EMAIL_NOT_EMPTY_MSG']));
                return;
            }

            $country = \Yii::$app->request->post('country');
            if(!isset($country)){
                echo json_encode(array('response_code' => 0, 'response_text' => $langInfo['SELECT_COUNTRY_MSG']));
                return;
            }

            $identificationId = \Yii::$app->request->post('identification_id', '');
            if(empty($identificationId)){
                echo json_encode(array('response_code' => 0, 'response_text' => $langInfo['IDENTIFICATION_ID_NOT_EMPTY_MSG']));
                return;
            }

            $p1 = \Yii::$app->request->post('p1');
            if(empty($p1)){
                echo json_encode(array('response_code' => 0, 'response_text' => $langInfo['CREDENTIALS_FRONTEND_IMG_MSG']));
                return;
            }

            $p2 = \Yii::$app->request->post('p2');
            if(empty($p2)){
                echo json_encode(array('response_code' => 0, 'response_text' => $langInfo['CREDENTIALS_BACKEND_IMG_MSG']));
                return;
            }

            $p3 = \Yii::$app->request->post('p3');
            if(empty($p3)){
                echo json_encode(array('response_code' => 0, 'response_text' =>  $langInfo['CREDENTIALS_FRONTEND_BACKEND_SIGN_IMG_MSG']));
                return;
            }

            $p4 = \Yii::$app->request->post('p4');
            if(empty($p4)){
                echo json_encode(array('response_code' => 0, 'response_text' => $langInfo['CREDENTIALS_ADDRESS_IMG_MSG']));
                return;
            }            

            $coinType = \Yii::$app->request->post('coin_type');
            if(empty($coinType)){
                echo json_encode(array('response_code' => 0, 'response_text' => $langInfo['ICON_TYPE_NOT_EMPTY_MSG']));
                return;
            }            

            $coinNumber = \Yii::$app->request->post('coin_number');
            if(empty($coinNumber)){
                echo json_encode(array('response_code' => 0, 'response_text' => $langInfo['ICON_NUMBER_NOT_EMPTY_MSG']));
                return;
            }
            
            $sendCoinAddress = \Yii::$app->request->post('send_coin_address');
            if(empty($sendCoinAddress)){
                echo json_encode(array('response_code' => 0, 'response_text' => $langInfo['SEND_COIN_ADDRESS_NOT_EMPTY_MSG']));
                return;
            }
            
            $getCoinAddress = \Yii::$app->request->post('get_coin_address');
            if(empty($getCoinAddress)){
                echo json_encode(array('response_code' => 0, 'response_text' => $langInfo['GET_COIN_ADDRESS_NOT_EMPTY_MSG']));
                return;
            }
        
            $saveInfo = array();
            $saveInfo['first_name'] = $firstName;
            $saveInfo['last_name'] = $lastName;
            $saveInfo['telphone'] = $telphone;
            $saveInfo['email'] = $email;
            $saveInfo['country'] = $country;
            $saveInfo['identification_id'] = $identificationId;
            $saveInfo['p1'] = $p1;
            $saveInfo['p2'] = $p2;
            $saveInfo['p3'] = $p3;
            $saveInfo['p4'] = $p4;
            $saveInfo['coin_type'] = $coinType;
            $saveInfo['coin_number'] = $coinNumber;
            $saveInfo['send_coin_address'] = $sendCoinAddress;
            $saveInfo['get_coin_address'] = $getCoinAddress;

            $session = \Yii::$app->session;
            $sessionInfo = $session[\Yii::$app->request->hostInfo];
            $sessionInfo['kyc_info'] = $saveInfo;
            $session[\Yii::$app->request->hostInfo] = $sessionInfo;            
            echo json_encode(["response_code" => '1', 'response_text' => $langInfo['SUBMIT_SUCCESS_MSG']]);
            return;
        } else {
            throw new \Exception("错误");
        }
    }
    
    public function actionKycView(){
        $session = \Yii::$app->session;
        $sessionInfo = $session[\Yii::$app->request->hostInfo];
        $lang = \Yii::$app->request->get('lang');
        if(empty($sessionInfo['user_info'])){
            if($lang == 'en'){
                return $this->redirect('/index/index.html?lang=en');
            } else {           
                return $this->redirect('/index/index.html');
            } 
        }        

        $userEmail = isset($sessionInfo['user_info']['email']) ? $sessionInfo['user_info']['email'] : '';
        $userModel = new \frontend\models\UserInfoModel();
        $kycInfo = $userModel->getUserInfoByEmail($userEmail);
        if(empty($kycInfo['telphone']) || $kycInfo['application_status'] == 3){
            $kycInfo = !empty($sessionInfo['kyc_info']) ? $sessionInfo['kyc_info'] : $kycInfo;
            if(!empty($kycInfo['user_credentials_img'])){
                $tmp = explode("|", $kycInfo['user_credentials_img']);
                $kycInfo['p1'] =  isset($tmp[0]) ? $tmp[0] : '';
                $kycInfo['p2'] =  isset($tmp[1]) ? $tmp[1] : '';
                $kycInfo['p3'] =  isset($tmp[2]) ? $tmp[2] : '';
                $kycInfo['p4'] =  isset($tmp[3]) ? $tmp[3] : '';                  
            }
        } else {
            $tmp = explode("|", $kycInfo['user_credentials_img']);
            $kycInfo['p1'] =  isset($tmp[0]) ? $tmp[0] : '';
            $kycInfo['p2'] =  isset($tmp[1]) ? $tmp[1] : '';
            $kycInfo['p3'] =  isset($tmp[2]) ? $tmp[2] : '';
            $kycInfo['p4'] =  isset($tmp[3]) ? $tmp[3] : '';        
        }
        $sessionInfo['kyc_info'] = $kycInfo;   
        $session[\Yii::$app->request->hostInfo] = $sessionInfo; 

        if(empty($sessionInfo['kyc_info'])){
            if($lang == 'en'){
                return $this->redirect('/index/kyc.html?lang=en');
            } else {           
                return $this->redirect('/index/kyc.html');
            }             
        }

        $countryInfo = isset(\Yii::$app->params['country'][$lang]) ? \Yii::$app->params['country'][$lang] : \Yii::$app->params['country'][self::$defaultLanguage];
        $kycInfo['country_name'] = isset($countryInfo[$kycInfo['country']]) ? $countryInfo[$kycInfo['country']] : '';
        if($lang == 'en'){
            return $this->render('en_kyc_view.tpl', ['token' => \Yii::$app->request->csrfToken, "kyc_info" => $kycInfo]); 
        } else {
            return $this->render('kyc-view.tpl', ['token' => \Yii::$app->request->csrfToken, "kyc_info" => $kycInfo]);
        }
    }
    
    public function actionSave(){
        $lang = \Yii::$app->request->get('lang');
        $langInfo = isset(\Yii::$app->params['lang'][$lang]) ? \Yii::$app->params['lang'][$lang] : \Yii::$app->params['lang'][self::$defaultLanguage];        
        if(\Yii::$app->request->isPost && \Yii::$app->request->isAjax){
            $session = \Yii::$app->session;
            $sessionInfo = $session[\Yii::$app->request->hostInfo];
            if(empty($sessionInfo['user_info'])){
                echo json_encode(["response_code" => '0', 'response_text' => $langInfo['LOGIN_AGAIN_MSG']]);
                return;
            }
            $userInfo = $sessionInfo['user_info'];
            
            if(empty($sessionInfo['kyc_info'])){
                echo json_encode(["response_code" => '0', 'response_text' => $langInfo['INVALID_INFO_MSG']]);
                return;
            }
            $kycInfo = $sessionInfo['kyc_info'];
            $kycInfo['application_status'] =  1;
            $userModel = new \frontend\models\UserInfoModel();
            $userRs = $userModel->addUserIcoApplication($userInfo['id'], $kycInfo);
            if($userRs){
                unset($sessionInfo['kyc_info']);
                $userInfo = $userModel->getUserInfoByEmail($userInfo['email']);
                $sessionInfo['user_info'] = $userInfo;
                $session[\Yii::$app->request->hostInfo] = $sessionInfo;
                echo json_encode(["response_code" => '1', 'response_text' => $langInfo['APPROVE_INFO_MSG']]);
                return;                
            }
            echo json_encode(["response_code" => '0', 'response_text' => $langInfo['SUBMIT_SUCCESS_MSG']]);
            return;
        } else {
            throw new \Exception("错误");
        }
    }



    /**
     * register a user.
     *
     * @return mixed
     */
    public function actionResetmail()
    {
        $lang = \Yii::$app->request->get('lang');
        $langInfo = isset(\Yii::$app->params['lang'][$lang]) ? \Yii::$app->params['lang'][$lang] : \Yii::$app->params['lang'][self::$defaultLanguage];   

        if(\Yii::$app->request->isPost && \Yii::$app->request->isAjax){
            $email = \Yii::$app->request->post('email');


            if(empty($email)){
                echo json_encode(array('response_code' => 0, 'response_text' => $langInfo['EMAIL_NOT_EMPTY_MSG']));
                return;
            }
            
            if(empty($email)){
                echo json_encode(array('response_code' => 0, 'response_text' => $langInfo['EMAIL_FORMAT_ERROR_MSG']));
                return;
            }
            $userModel = new \frontend\models\UserInfoModel();
            $checkUser = $userModel->checkUserExisitsByEmail($email);
            if($checkUser){            
           
                $mail = Yii::$app->mailer->compose();
                $mail->setFrom(\Yii::$app->params['register_from_email']);
                $mail->setTo($email);
                $mail->setSubject($langInfo['SEND_EMAIL_REPASS_MSG']);
                $emailMsg = $langInfo['SEND_REPASS_EMAIL_CONTENT_MSG'];
                $verifyUrl = "http://".$_SERVER['HTTP_HOST']."/index/index.html";
                $paramCode = "?bcode=".base64_encode("email=".$email.'&lang='.$lang);
                $emailMsg = str_replace('__REPLACE_VERIFY_CODE_URL__', $verifyUrl.$paramCode, $emailMsg);
                //var_dump($emailMsg);exit;   
                $mail->setHtmlBody($emailMsg);
                if ($mail->send())
                    \Yii::info("success send email:".$email);
                else
                    \Yii::error("error send email:".$email);
                
                echo json_encode(["response_code" => '1', 'response_text' => $langInfo['REGISTER_SUCCESS_MSG']]);
                return;
            }
            echo json_encode(["response_code" => '0', 'response_text' => $langInfo['LOGIN_ERROR_USER_NOT_EXSITS_MSG']]);
            return;
        } else {
            throw new \Exception("错误");
        }
    }


    /**
     * check exsits a user.
     *
     * @return mixed
     */
    public function actionResetpass()
    {
        $lang = \Yii::$app->request->get('lang');
        $langInfo = isset(\Yii::$app->params['lang'][$lang]) ? \Yii::$app->params['lang'][$lang] : \Yii::$app->params['lang'][self::$defaultLanguage];
       $email = \Yii::$app->request->post('email');
            $password = \Yii::$app->request->post('password');
            $confirmPassword = \Yii::$app->request->post('confirm_password');
       
            if(empty($email)){
                echo json_encode(array('response_code' => 0, 'response_text' => $langInfo['EMAIL_NOT_EMPTY_MSG']));
                return;
            }
            
            if(empty($email)){
                echo json_encode(array('response_code' => 0, 'response_text' => $langInfo['EMAIL_FORMAT_ERROR_MSG']));
                return;
            }
            
            if(empty($password)){
                echo json_encode(array('response_code' => 0, 'response_text' => $langInfo['PASSWORD_NOT_EMPTY']));
                return;
            }
            
            if(strlen($password) < 6){
                echo json_encode(array('response_code' => 0, 'response_text' => $langInfo['PASSWORD_LENGTH_LESS_THAN_SIX_CHAR']));
                return;
            }
            
            if($password != $confirmPassword){
                echo json_encode(array('response_code' => 0, 'msg' => $langInfo['PASSWORD_NOT_SAME']));
                return;
            }        

        $userModel = new \frontend\models\UserInfoModel();
        $userInfo = $userModel->getUserInfoByEmail($email);
        if(empty($userInfo)){
            throw new \Exception($langInfo['LOGIN_ERROR_USER_NOT_EXSITS_MSG']);
        }
            $res = $userModel->editUserPass($email,$password);
            //$session = \Yii::$app->session;
            //$sessionInfo = $session[\Yii::$app->request->hostInfo];
            //$sessionInfo['user_info'] = $userInfo;
            //$session[\Yii::$app->request->hostInfo] = $sessionInfo;
          echo json_encode(["response_code" => '1', 'response_text' => $langInfo['RESET_PASS_SUCESS']]);
            return;
       
    }

    /**
     * send verify code.
     *
     * @return mixed
     */
    public function actionSendVerifyCode()
    {
        $lang = \Yii::$app->request->get('lang');
        $langInfo = isset(\Yii::$app->params['lang'][$lang]) ? \Yii::$app->params['lang'][$lang] : \Yii::$app->params['lang'][self::$defaultLanguage];
        if(\Yii::$app->request->isPost && \Yii::$app->request->isAjax){
            $session = \Yii::$app->session;
            $sessionInfo = $session[\Yii::$app->request->hostInfo];
            if(empty($sessionInfo['user_info'])){
                echo json_encode(["response_code" => '0', 'response_text' => $langInfo['LOGIN_AGAIN_MSG']]);
                return;
            }
            $userInfo = $sessionInfo['user_info'];
            $userModel = new \frontend\models\UserInfoModel();
            $checkUser = $userModel->getUserInfoByEmail($userInfo['email']);
            if(!$checkUser){
                echo json_encode(["response_code" => '0', 'response_text' => $langInfo['MEMBER_NOT_EXSITS_MSG']]);
                return;
            }

            $verifyCode = $this->randomkeys(6);
            $addInfo = array();
            $addInfo['user_name'] = $userInfo['email'];
            $addInfo['verify_code'] = $verifyCode;
            $addInfo['type'] = 1;
            $addInfo['expire_time'] = date("Y-m-d H:i:s", strtotime("+10 minutes"));
            
            $verifyCodeModel = new \frontend\models\UserVerifyCodeModelInfo();
            $addRs = $verifyCodeModel->addInfo($addInfo);
            if($addRs){
                $mail = Yii::$app->mailer->compose();
                $mail->setFrom(\Yii::$app->params['register_from_email']);
                $mail->setTo($userInfo['email']);
                $mail->setSubject($langInfo['SEND_VERIFY_CODE_EMAIL_SUBJECT_MSG']);
                $emailMsg = $langInfo['SEND_VERIFY_CODE_EMAIL_CONTENT_MSG'];
                
                $emailMsg = str_replace('__REPLACE_APPROVE_VERIFY_CODE__', $verifyCode, $emailMsg);
                $mail->setHtmlBody($emailMsg);
                if ($mail->send())
                    \Yii::info("success send email:".$userInfo['email']);
                else
                    \Yii::error("error send email:".$userInfo['email']);
    
                echo json_encode(["response_code" => '1', 'response_text' => $langInfo['GET_VERIFY_CODE_SUCCESS_MSG']]);
                return;                
            } 
            echo json_encode(["response_code" => '0', 'response_text' => $langInfo['GET_VERIFY_CODE_FAILED_MSG']]);
            return;
        } else {
            throw new \Exception("错误");
        }
    }
    
    /**
     * send verify code.
     *
     * @return mixed
     */
    public function actionCheckVerifyCode()
    {
        $lang = \Yii::$app->request->get('lang');
        $langInfo = isset(\Yii::$app->params['lang'][$lang]) ? \Yii::$app->params['lang'][$lang] : \Yii::$app->params['lang'][self::$defaultLanguage];
        if(\Yii::$app->request->isPost && \Yii::$app->request->isAjax){
            $session = \Yii::$app->session;
            $sessionInfo = $session[\Yii::$app->request->hostInfo];
            if(empty($sessionInfo['user_info'])){
                echo json_encode(["response_code" => '0', 'response_text' => $langInfo['LOGIN_AGAIN_MSG']]);
                return;
            }
            $userInfo = $sessionInfo['user_info'];
            $userModel = new \frontend\models\UserInfoModel();
            $checkUser = $userModel->getUserInfoByEmail($userInfo['email']);
            if(!$checkUser){
                echo json_encode(["response_code" => '0', 'response_text' => $langInfo['MEMBER_NOT_EXSITS_MSG']]);
                return;
            }
    
            $verifyCode = \Yii::$app->request->post('verify-code');
            $verifyCodeModel = new \frontend\models\UserVerifyCodeModelInfo();
            $checkRs = $verifyCodeModel->checkUserVerifyInfoByCode($verifyCode);
            if($checkRs){
                echo json_encode(["response_code" => '1', 'address' => '0x591A95Ef45AeCc4CF649E779ddB970d1454F0c2a', 'response_text' => $langInfo['CHECK_VERIFY_CODE_SUCCESS_MSG']]);
                return;
            }
            echo json_encode(["response_code" => '0', 'response_text' => $langInfo['CHECK_VERIFY_CODE_FAILED_MSG']]);
            return;
        } else {
            throw new \Exception("错误");
        }
    }    

    /**
     * 产生定长的随机数
     * @param unknown $length
     * @return string
     */
    protected function randomkeys($length)
    {
        $pattern = '23456789abcdefghjkmnpqrstuvwxyzABCDEFGHJKLMNPQRSTUVWXYZ';
        $key = '';
        for($i=0;$i<$length;$i++)
        {
        $key .= $pattern{mt_rand(0,54)};    //生成php随机数
        }
        return $key;
    }
}
