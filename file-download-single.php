<?php

require_once('api/includes/config.php');
// error_reporting(E_ALL);
// ini_set('display_errors', 1);

// File path
//$file = 'https://tms.dosina.no/uploads/fileuploads/SFX3_SV.zip'; // Change this to the actual file path
// $file = '/home/dosinxdu/tms.dosina.no/uploads/fileupload/SFX3_SV.zip'; // Change this to the actual file path
// $file = $_SERVER['DOCUMENT_ROOT'].'/uploads/fileupload/'.'Assignment_A-720656-3294796.zip'; 
// $file = $_SERVER['DOCUMENT_ROOT'].'/uploads/fileupload/'.'TM_Update.PNG'; 

// // Check if the file path is valid
// $file = realpath($file);

// if ($file === false) {
//     die('Invalid file path.');
// }

//$basePath = DOCUMENT_ROOT.'uploads/fileupload/';

//$basePath = realpath(DOCUMENT_ROOT . 'uploads/fileupload') . '/' ;
$basePath = realpath(DOCUMENT_ROOT . 'uploads/fileupload') . DIRECTORY_SEPARATOR;

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Get the raw POST data
    $postData = file_get_contents('php://input');
    // Decode JSON data
    $data = json_decode($postData, true);

    if (isset($data['filename'])) {
        // Sanitize and validate the file name
        $file = basename($data['filename']);
        $fileDownloadName = isset($data['fileDownloadName']) ? basename($data['fileDownloadName']) : $file;

        // Construct the full path to the file
        $filePath = $basePath . $file;

        // Print file path for debugging
        //echo 'File Path: ' . $filePath . '<br>';
        
        // Check if the file exists and is within the base directory
        $realFilePath = realpath($filePath);
        if ($realFilePath && strpos($realFilePath, $basePath) === 0 && file_exists($filePath)) {
            //echo 'File exists and path is valid.<br>';

            // Check file size
            $fileSize = filesize($filePath);
            //echo 'File Size: ' . $fileSize . '<br>';

            // Clear output buffer
            ob_end_clean();

            // Set headers to force download
            header('Content-Description: File Transfer');
            header('Content-Type: application/octet-stream');
            header('Content-Disposition: attachment; filename="' . $fileDownloadName . '"');
            header('Expires: 0');
            header('Cache-Control: must-revalidate');
            header('Pragma: public');
            header('Content-Length: ' . $fileSize);

            // Read the file and output its content
            flush();
            readfile($filePath);

            exit;
        } else {
            // Handle error if file does not exist or is out of bounds
            http_response_code(404);
            echo 'File not found or access denied.';
        }
    } else {
        // Handle error if 'filename' is not provided
        http_response_code(400);
        echo 'Filename not provided.';
    }
} else {
    // Handle error if the request method is not POST
    http_response_code(405);
    echo 'Invalid request method.';
}
?>