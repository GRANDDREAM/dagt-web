<?php
namespace frontend\controllers;

use yii\web\Controller;

class ImageController extends Controller
{
    public $enableCsrfValidation = false;
    
    /**
     * 默认语言
     * @var string
     */    
    static public $defaultLanguage = 'zh';
    
    public function actionUpload(){
//         $verifyToken = md5('unique_salt' . $_POST['timestamp']);
//         if (!empty($_FILES) && $_POST['token'] == $verifyToken) {    
    
        $lang = \Yii::$app->request->get('lang');
        $langInfo = isset(\Yii::$app->params['lang'][$lang]) ? \Yii::$app->params['lang'][$lang] : \Yii::$app->params['lang'][self::$defaultLanguage];        
        
            $uploadFileSize = !empty($_FILES['qqfile']['size']) ? $_FILES['qqfile']['size'] : '0';
            if(empty($uploadFileSize) || $uploadFileSize > (10 * 1024 * 1024)){
                echo json_encode(['success' => false, 'name'=> $_FILES['qqfile']['size'], 'status' => 'n', 'msg' => $langInfo['UPLOAD_FILE_MORE_THAN_LIMIT_SIZE'], 'path' => '']);
                return;
            }
            
            $uploadFileTmp = !empty($_FILES['qqfile']['tmp_name']) ? $_FILES['qqfile']['tmp_name'] : '';
            if(empty($uploadFileTmp)){
                echo json_encode(['success' => false, 'name'=> $_FILES['qqfile']['name'], 'status' => 'n', 'msg' => $langInfo['UPLOAD_FILE_SELECT_FILE_ERROR'], 'path' => '']);
                return;                
            }
            
            $uploadPath = !empty($_POST['dir']) ? $_POST['dir'] : 'user_credentials_img';
            $uploadDir = '/uploads/' . $uploadPath .'/';
            if(!is_dir($_SERVER['DOCUMENT_ROOT'].$uploadDir)){
                mkdir($_SERVER['DOCUMENT_ROOT'].$uploadDir, 0775, true);
            }
        
            if(!is_dir($_SERVER['DOCUMENT_ROOT'].$uploadDir)){
                echo json_encode(['success' => false, 'name'=> $_FILES['qqfile']['name'], 'status' => 'n', 'msg' => $langInfo['UPLOAD_FILE_CREATE_DIR_ERROR'], 'path' => '']);
                return;                
            }
            
             
            $uploadFileName = !empty($_FILES['qqfile']['name']) ? $_FILES['qqfile']['name'] : '';
            $pathInfo = pathinfo($uploadFileName);
            $uploadFile = time().'.'.$pathInfo['extension'];
        
            if(move_uploaded_file($uploadFileTmp, $_SERVER['DOCUMENT_ROOT'].$uploadDir . $uploadFile)){
                echo json_encode(['success' => true, 'name'=> $_FILES['qqfile']['name'], 'status' => 'y', 'msg' => $langInfo['UPLOAD_FILE_SUCCESS'], 'path' => $uploadDir . $uploadFile]);
                return;                
            } else {
                echo json_encode(['success' => false, 'name'=> $_FILES['qqfile']['name'], 'status' => 'n', 'msg' => $langInfo['UPLOAD_FILE_FAIL'], 'path' => $uploadDir . $uploadFile]);
                return;                
            }            
//         } else {
//             echo json_encode(['status' => 'n', 'msg' => '验证失败', 'path' => '']);
//             return;        
//         }
    }
    
}

?>