<?php
namespace frontend\models;

use frontend\models\BaseModelInfo;
use Yii;

class UserVerifyCodeModelInfo extends BaseModelInfo
{
    /**
     * (user_verify_code)用户验证码表
     * @access public
     * @return string
     */
    public static function tableName()
    {
        return '{{%user_verify_code}}';
    }
    

    /**
     * 根据邮箱，获取用户信息
     * @param string $email   邮箱号码
     * @return array
     */
    public function checkUserVerifyInfoByCode($code = '', $date = '', $type = 1){
        if(empty($code)){
            return 0;
        }
    
        $date = empty($date) ? date("Y-m-d H:i:s") : $date;
        $type = empty($type) ? 1 : $type;
        
        $db = Yii::$app->db;
        $sql = "SELECT count(*) cnt FROM " . self::tableName();
        $sql.= " where type = ".$type." and verify_code = '" . $code . "' and expire_time >= '".$date."'";
    
        $rows = $db->createCommand($sql)->queryOne();
        if(empty($rows['cnt'])){
            return 0;
        }
        return $rows['cnt'];
    }    

    public function addInfo($verifyData = array()){
        if(empty($verifyData)){
            return false;
        }
        
        $keyStr = "";
        $valueStr = "";
        foreach($verifyData as $vdk => $vdv){
            $keyStr .= "$vdk,";
            $valueStr .= "'" . addslashes($vdv) . "',";
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
}

?>