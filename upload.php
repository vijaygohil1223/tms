<?php
if ($_SERVER['REQUEST_METHOD'] == 'GET' && realpath(__FILE__) == realpath($_SERVER['SCRIPT_FILENAME'])) {
	header('HTTP/1.0 403 Forbidden', TRUE, 403);
	die("<h2>Access Denied!</h2>");
}
$curTime = microtime(true);
$timeConsumed = 0;
if (0 < $_FILES['file']['error']) {
	echo 'Error: ' . $_FILES['file']['error'] . '<br>';
} else {
	$filename = str_replace(" ", "_", $_REQUEST['file2']);
	$uploadfile = move_uploaded_file($_FILES['file']['tmp_name'], 'uploads/discussionfile/' . $filename);
	if ($uploadfile) {
		//$timeConsumed = (microtime(true) - $curTime)*1000;
		echo 'success: 200';
	} else {
		echo '422';
	}
	//echo number_format((float)$timeConsumed, 2, '.', ''); 
}
