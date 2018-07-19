<?php
namespace frontend\models;

use frontend\models\BaseModelInfo;
use Yii;

/**
 * User Model;
 * 用户信息
 */
class UserInfoModel extends BaseModelInfo
{
    /**
     * (ico_user_application)用户注册申请表
     * @access public
     * @return string
     */
    public static function tableName()
    {
        return '{{%ico_user_application}}';
    }
    
     /**
     * 根据邮箱和密码，获取用户的信息
     * @param string $email
     * @param string $passWord
     * @return multitype:|Ambigous <multitype:, boolean, \yii\db\mixed>
     */
    public function getUserInfoByEmailPassword($email = '', $passWord = ""){
        if(empty($email) || empty($passWord)){
            return array();
        }
    
        $db = Yii::$app->db;
        $sql = "SELECT * FROM " . self::tableName();
        $sql.= " where email = '" . $email . "' and password = '" . md5($passWord) . "' and status = 1";
        
        $rows = $db->createCommand($sql)->queryOne();
        return $rows;
    }


    /**
     * 根据邮箱，检查用户是否存在
     * @param string $email   邮箱号码
     * @return number|Ambigous <>
     */
    public function checkUserExisitsByEmail($email = ''){
        if(empty($email)){
            return 1;
        }
        
        $db = Yii::$app->db;
        $sql = "SELECT count(*) as cnt FROM " . self::tableName();
        $sql.= " where email = '" . $email . "'";
        
        $rows = $db->createCommand($sql)->queryOne();
        return $rows['cnt'];
    }
    

    /**
     * 根据邮箱，获取用户信息
     * @param string $email   邮箱号码
     * @return array
     */
    public function getUserInfoByEmail($email = ''){
        if(empty($email)){
            return [];
        }
    
        $db = Yii::$app->db;
        $sql = "SELECT * FROM " . self::tableName();
        $sql.= " where email = '" . $email . "'";
    
        $rows = $db->createCommand($sql)->queryOne();
        return $rows;
    }    
    
    /**
     * 根据用户手机号码，检查用户的登陆错误次数，如果等于或者超过5次的话，那么禁止当天登陆，第二天可继续登陆
     * @param string $telephone   手机号码
     * @return boolean
     */
    public function checkUserLoginErrorTimes($telephone = 0){
        if(empty($telephone)){
            return false;
        }
        
        $db = Yii::$app->db;
        $sql = "SELECT errortips,error_time FROM " . $this->usertableName();
        $sql.= " where telephone = '" . $telephone . "'";

        $rows = $db->createCommand($sql)->queryOne();
        
        $error_time = date_format(date_create($rows['error_time']), 'Y-m-d');
        $cur_time = date('Y-m-d', time());
        $diff_days = floor((strtotime($cur_time) - strtotime($error_time)) / 86400);
        
        // 隔天重置冻结
        if ($diff_days > 0) {
            $rs = $this->updateErrorTips($telephone);
            if($rs){
                $rows['errortips'] = 0;
            }
        }
        
        if($rows['errortips'] >= 5){
            return false;
        }
        return true;
    }

    public function addUser($postData = array()){
        if(empty($postData)){
            return false;
        }
        
        $keyStr = "";
        $valueStr = "";
        foreach($postData as $pk => $pv){
            $keyStr .= "$pk,";
            $valueStr .= "'" . addslashes($pv) . "',";
        }
        $keyStr = "(" . rtrim($keyStr, ",") . ")";
        $valueStr = "(" . rtrim($valueStr, ",") . ");";
    
        $db = Yii::$app->db;
        $sql = "insert into " . self::tableName() . $keyStr . " values " . $valueStr;
    
        $rs = array();
        $rows = $db->createCommand($sql)->execute();
        if($rows){
            return true;
        }
        return false;
    }
        

    /**
     * 根据用户ID，更新用户提交的ICO申请信息
     * @param int $userId   用户ID
     * @param array $icoApplicationInfo   客户提交的ICO信息
     * @return boolean
     */
    public function addUserIcoApplication($userId, $icoApplicationInfo = array()){
        if(empty($icoApplicationInfo)){
            return false;
        }
        
        $db = Yii::$app->db;
        $upSql = "update " . self::tableName() . " set first_name = '" . $icoApplicationInfo['first_name'] . "',application_time = '" . date("Y-m-d H:i:s")."'";
        $upSql.= ",last_name = '" . $icoApplicationInfo['last_name'] . "',telphone = '" . $icoApplicationInfo['telphone'] . "',application_email = '" . $icoApplicationInfo['email']."'";
        $upSql.= ",country = '" . $icoApplicationInfo['country'] . "',identification_id='".$icoApplicationInfo['identification_id']."',user_credentials_img = '" . $icoApplicationInfo['p1'] ."|" . $icoApplicationInfo['p2'] ."|" . $icoApplicationInfo['p3']."|" . $icoApplicationInfo['p4']."'";
        $upSql.= ",coin_type = '" . $icoApplicationInfo['coin_type'] . "',coin_number = '" . $icoApplicationInfo['coin_number'] . "'";
        $upSql.= ",send_coin_address = '" . $icoApplicationInfo['send_coin_address'] . "',get_coin_address = '" . $icoApplicationInfo['get_coin_address']."',application_status=1";
        $upSql.= " where id = " . $userId;

        $upRs = $db->createCommand($upSql)->execute();
        if($upRs !== false){
            return true;
        }
        return false;
    }




     /**
     * 根据用户EMAL，更新用户状态
     * @param int $userId   用户ID
     * @param array $icoApplicationInfo   客户提交的ICO信息
     * @return boolean
     */
    public function editUserStatus($email,$status=1){
        if(empty($email)){
            return false;
        }
        
        $db = Yii::$app->db;
        $upSql = "update " . self::tableName() . " set status = '" . $status .  "' where email = '" . $email."'";

        $upRs = $db->createCommand($upSql)->execute();
        if($upRs !== false){
            return true;
        }
        return false;
    }

         /**
     * 根据用户EMAL，重置密码
     * @param int $userId   用户ID
     * @param array $icoApplicationInfo   客户提交的ICO信息
     * @return boolean
     */
    public function editUserPass($email,$password){
        if(empty($email)){
            return false;
        }
        
        $db = Yii::$app->db;
        $upSql = "update " . self::tableName() . " set password = '" . md5($password
            ) .  "' where email = '" . $email."'";

        $upRs = $db->createCommand($upSql)->execute();
        if($upRs !== false){
            return true;
        }
        return false;
    }
 
}

