<?php
namespace frontend\models;

use frontend\models\BaseModelInfo;
use Yii;

class SiteTraceLogModelInfo extends BaseModelInfo
{
    /**
     * (site_trace_log)用户访问页面追踪表
     * @access public
     * @return string
     */
    public static function tableName()
    {
        return '{{%site_trace_log}}';
    }
    

    public function addLogInfo($logData = array()){
        if(empty($logData)){
            return false;
        }
        
        $keyStr = "";
        $valueStr = "";
        foreach($logData as $ldk => $ldv){
            $keyStr .= "$ldk,";
            $valueStr .= "'" . addslashes($ldv) . "',";
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