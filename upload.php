<?php
   	if ( 0 < $_FILES['file']['error'] ) {
        echo 'Error: ' . $_FILES['file']['error'] . '<br>';
    }
    else {
    	$filename = str_replace(" ", "_",$_REQUEST['file2']);
    	move_uploaded_file($_FILES['file']['tmp_name'], 'uploads/discussionfile/' .$filename);

    	$upload_time = time() - $_SERVER['REQUEST_TIME'];
    echo $upload_time;
    }
?>