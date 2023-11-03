<?php
if ($_SERVER['REQUEST_METHOD'] == 'GET' && realpath(__FILE__) == realpath($_SERVER['SCRIPT_FILENAME'])) {
    header('HTTP/1.0 403 Forbidden', TRUE, 403);
    die("<h2>Access Denied!</h2>");
}
//to get size of file
function formatSizeUnits($bytes)
{
    if ($bytes >= 1073741824) {
        $bytes = number_format($bytes / 1073741824, 2) . ' GB';
    } elseif ($bytes >= 1048576) {
        $bytes = number_format($bytes / 1048576, 2) . ' MB';
    } elseif ($bytes >= 1024) {
        $bytes = number_format($bytes / 1024, 2) . ' KB';
    } elseif ($bytes > 1) {
        $bytes = $bytes . ' bytes';
    } elseif ($bytes == 1) {
        $bytes = $bytes . ' byte';
    } else {
        $bytes = '0 bytes';
    }

    return $bytes;
}
//If directory doesnot exists create it.
$output_dir = "uploads/fileupload/";

function checkFileExist($output_dir, $fileNameToCheck, $extensionName){
    $newFileName = $fileNameToCheck;
    $fileCount = 1;
    while (file_exists($output_dir. $newFileName)) {
        $fileInfo = pathinfo($fileNameToCheck);
        $newFileName = $fileInfo['filename'] . " ($fileCount)." . $extensionName;
        $fileCount++;
    }
    return $newFileName;
}

if (isset($_FILES["myfile"])) {
    $ret = array();
    $error = $_FILES["myfile"]["error"]; {
        if (!is_array($_FILES["myfile"]['name'])) //single file
        {
            $defaultFileName = $_FILES['myfile']['name'];
            $extensionName = pathinfo($defaultFileName, PATHINFO_EXTENSION);
            $fname = checkFileExist($output_dir, $defaultFileName, $extensionName);
            $filename = $fname ? $fname : $defaultFileName;
            //$ex = str_replace(' ', '_', $_FILES["myfile"]["name"]);
            //$filename = rand(0, 1000) . '_' . $ex;
            move_uploaded_file($_FILES["myfile"]["tmp_name"], $output_dir . $filename);
            //echo "<br> Error: ".$_FILES["myfile"]["error"];

            //$ret[$fileName]= $output_dir.$fileName;
            $checkext = explode('.', $filename);
            $ret['ext'] = strtolower(end($checkext));
            $size = $_FILES['myfile']['size'];
            $ret['size'] = formatSizeUnits($size);
            $ret['name'] = $filename;
        } else {
            $fileCount = count($_FILES["myfile"]['name']);
            for ($i = 0; $i < $fileCount; $i++) {
                //$fileName = $_FILES["myfile"]["name"][$i];
                //$ret[$fileName]= $output_dir.$fileName;
                $defaultFileName = $_FILES['myfile']['name'][$i];
                $extensionName = pathinfo($defaultFileName, PATHINFO_EXTENSION);
                $fname = checkFileExist($output_dir, $defaultFileName, $extensionName);
                $filename = $fname ? $fname : $defaultFileName;
                //$ex = str_replace(' ', '_', $_FILES["myfile"]["name"][$i]);
                //$filename = rand(0, 1000) . '_' . $ex;

                move_uploaded_file($_FILES["myfile"]["tmp_name"][$i], $output_dir . $filename);

                $checkext = explode('.', $filename);

                $ret['ext'][$i] = strtolower(end($checkext));
                $size = $_FILES['myfile']['size'][$i];
                $ret['size'][$i] = formatSizeUnits($size);
                $ret['name'][$i] = $filename;
            }
        }
    }
    echo json_encode($ret);
}
