<?php
/*
Uploadify
Copyright (c) 2012 Reactive Apps, Ronnie Garcia
Released under the MIT License <http://www.opensource.org/licenses/mit-license.php> 
*/

ini_set("session.gc_maxlifetime","10800");
ini_set("max_input_time","10800");
ini_set("max_execution_time","10800");
ini_set("upload_max_filesize","10M");
ini_set("post_max_size","10M");

// Define a destination
$targetFolder = '/uploads/'; // Relative to the root

$verifyToken = md5('unique_salt' . $_POST['timestamp']);

if (!empty($_FILES) && $_POST['token'] == $verifyToken) {
	// Validate the file type
	$fileTypes = array('jpg','jpeg','gif','png','JPG','JPEG','GIF','PNG'); // File extensions
	$fileDataName = $_FILES['Filedata']['name'];
	$fileParts = pathinfo($fileDataName);
	
	$dir = $_POST['dir'];
	$type = $_POST['type'];

	$tempFile = $_FILES['Filedata']['tmp_name'];
	$targetPath = rtrim($_SERVER['DOCUMENT_ROOT'],'/');
	$targetDistDir = $targetFolder . $dir . '/' . date('Ymd') .'/';
	if(!is_dir($targetPath . $targetDistDir)){
	   mkdir($targetPath . $targetDistDir, 0775, true);
	}
	$targetFileName =  $targetDistDir.$type.'_'.time()."_".uniqid().".".$fileParts['extension'];
	$targetFile = $targetPath . $targetFileName;

	if (in_array($fileParts['extension'],$fileTypes)) {
		if(move_uploaded_file($tempFile,$targetFile)){
		    echo json_encode(array('code' => '1', 'msg' => $targetFileName, 'dist_img' => str_replace($targetFolder, '/', $targetFileName)));
		} else {
		    echo json_encode(array('code' => '0', 'msg' => '上传失败'));
		}
	} else {
		echo json_encode(array('code' => '0', 'msg' => '上传图片格式不正确'));
	}
} else {
    echo json_encode(array('code' => '0', 'msg' => '验证失败，无法上传图片。'));
}
?>