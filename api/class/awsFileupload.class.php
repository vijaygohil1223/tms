<?php

//require_once 'mpdf/vendor/autoload.php';
//use PhpOffice\PhpWord\Settings;
require 'awsbucket/vendor/autoload.php';

use Aws\S3\S3Client;
use Aws\Exception\AwsException;

class awsFileupload
{

    protected $_db;
    protected $_s3Client;

    public function __construct()
    {
        
        $this->_s3Client = new S3Client([
            'region'  => AWS_S3_BUCKET_REGION,
            'version' => 'latest',
            'credentials' => [
                'key'    => AWS_S3_BUCKET_KEY,
                'secret' => AWS_S3_BUCKET_SECRET,
            ]
        ]);

    }

    public function awsFileUpload($file, $keyName){
        if (empty($file)) {
            return [
                'is_upload' => false,
                'error' => [
                    'message' => 'No file provided.'
                ]
            ];
        }

        try {
            // Upload the file to S3
            $result = $this->_s3Client->putObject([
                'Bucket' => AWS_S3_BUCKET_NAME,
                'Key'    => $keyName, //file url
                'SourceFile' => $file,
                //'ContentType' => $contentType,
                // 'ACL'    => 'public-read', // Optional: Set permissions here if needed
            ]);
            // Return success response
            return [
                'message'     => 'File uploaded successfully.',
                'file_url'    => $result['ObjectURL'],
                'file_key'    => $keyName,
                'bucket_name' => AWS_S3_BUCKET_NAME,
                'is_upload'   => true
            ];

        } catch (AwsException $e) {
            // Return error response
            return [
                'is_upload' => false,
                'error'     => [
                    'message'    => $e->getMessage(),
                    'code'       => $e->getAwsErrorCode(),
                    'type'       => $e->getAwsErrorType(),
                    'request_id' => $e->getAwsRequestId()
                ]
            ];
        }
    }


    public function awsFileDelete($fileUrl){
        $status = false;
        $error = '';
        if (empty($fileUrl)) {
            return [
                'is_deleted' => false,
                'error' => [
                    'message' => 'No file key provided.'
                ]
            ];
        }

        try {
            $parsedUrl = parse_url($fileUrl);
            $host = $parsedUrl['host'];
            $bucketName = explode('.', $host)[0];
            $keyName = ltrim($parsedUrl['path'], '/');

            try {
                $result = $this->_s3Client->deleteObject([
                    'Bucket' => AWS_S3_BUCKET_NAME,
                    'Key'    => $keyName,
                ]);

                if (isset($result['DeleteMarker']) && $result['DeleteMarker'] === true) {
                    $status = true;
                }
            } catch (AwsException $e) {
                $error =  $e->getMessage();
            }
            
            return [
                'error' => $error,
                'file_url'    => $fileUrl,
                'is_deleted'  => $status,
            ];

        } catch (AwsException $e) {
            // Return error response
            return [
                'is_deleted' => false,
                'error'      => [
                    'message'    => $e->getMessage(),
                    'code'       => $e->getAwsErrorCode(),
                    'type'       => $e->getAwsErrorType(),
                    'request_id' => $e->getAwsRequestId()
                ]
            ];
        }
    }

    public function awsFileDownload($keyName, $fileDownloadName) {
        if (empty($keyName)) {
            header('Content-Type: application/json');
            http_response_code(400);
            echo json_encode([
                'is_upload' => false,
                'error' => ['message' => 'No file provided.']
            ]);
            exit;
        }
    
        try {
            $result = $this->_s3Client->getObject([
                'Bucket' => AWS_S3_BUCKET_NAME,
                'Key'    => $keyName,
            ]);
    
            // Ensure headers and content are properly set
            header('Content-Description: File Transfer');
            header('Content-Type: ' . $result['ContentType']);
            header('Content-Disposition: attachment; filename="' . $fileDownloadName . '"');
            header('Expires: 0');
            header('Cache-Control: must-revalidate');
            header('Pragma: public');
            header('Content-Length: ' . $result['ContentLength']);
            
            // Output the file content
            echo $result['Body'];
            exit;
    
        } catch (AwsException $e) {
            // Return error response
            header('Content-Type: application/json');
            http_response_code(500);
            echo json_encode([
                'is_upload' => false,
                'error' => [
                    'message'    => $e->getMessage(),
                    'code'       => $e->getAwsErrorCode(),
                    'type'       => $e->getAwsErrorType(),
                    'request_id' => $e->getAwsRequestId()
                ]
            ]);
            exit;
        }
    }
    

    public function awsFileUploadAnother($file, $keyName, $filename){
        if (empty($file)) {
            return [
                'is_upload' => false,
                'error' => [
                    'message' => 'No file provided.'
                ]
            ];
        }

        try {
            //$filePath = "/var/www/html/tms/uploads/fileupload/". $filename;
            //$filePath = "/home/dosinxdu/tms.dosina.no/uploads/fileupload/". $filename;
            //$filePath = "/home/beconmxb/tms.beconnected.no/uploads/fileupload/". $filename;
            
            // Upload the file to S3
            $result = $this->_s3Client->putObject([
                'Bucket' => AWS_S3_BUCKET_NAME,
                'Key'    => $keyName, //file url
                'SourceFile' => $filePath,
            ]);
            // Return success response
            return [
                'message'     => 'File uploaded successfully.',
                'file_url'    => $result['ObjectURL'],
                'file_key'    => $keyName,
                'bucket_name' => AWS_S3_BUCKET_NAME,
                'is_upload'   => true
            ];
        } catch (AwsException $e) {
            // Return error response
            return [
                'is_upload' => false,
                'error'     => [
                    'message'    => $e->getMessage(),
                    'code'       => $e->getAwsErrorCode(),
                    'type'       => $e->getAwsErrorType(),
                    'request_id' => $e->getAwsRequestId()
                ]
            ];
        }
    }

    public function awsFileUploadBase64($file, $keyName, $contentType){
        if (empty($file)) {
            return [
                'is_upload' => false,
                'error' => [
                    'message' => 'No file provided.'
                ]
            ];
        }

        try {
            // Upload the file to S3
            $result = $this->_s3Client->putObject([
                'Bucket' => AWS_S3_BUCKET_NAME,
                'Key'    => $keyName, //file url
                'Body' => $file,
                'ContentType' => $contentType,
                // 'ACL'    => 'public-read', // Optional: Set permissions here if needed
            ]);
            // Return success response
            return [
                'message'     => 'File uploaded successfully.',
                'file_url'    => $result['ObjectURL'],
                'file_key'    => $keyName,
                'bucket_name' => AWS_S3_BUCKET_NAME,
                'is_upload'   => true
            ];

        } catch (AwsException $e) {
            // Return error response
            return [
                'is_upload' => false,
                'error'     => [
                    'message'    => $e->getMessage(),
                    'code'       => $e->getAwsErrorCode(),
                    'type'       => $e->getAwsErrorType(),
                    'request_id' => $e->getAwsRequestId()
                ]
            ];
        }
    }

    // temp api to list down all files in folder 
    public function tempAwsFilelist($tempfolder){
        $folder = $tempfolder ? $tempfolder : 'db_backup/2024/December_17/'; // Corrected prefix format

        try {
            // List objects (files) within the folder
            $result = $this->_s3Client->listObjectsV2([
                'Bucket' => AWS_S3_BUCKET_NAME,
                'Prefix' => $folder,   // Limits results to the folder
                'Delimiter' => '/',    // Treats folder structure as directories
            ]);

            // Debug the response to verify contents
            $tempArr = [];
            // Check if objects are found
            if (!empty($result['Contents'])) {
                //echo "Files in folder '$folder':\n";
                foreach ($result['Contents'] as $object) {
                    //$tempArr[] = 'https://tmsbetconnected.s3.amazonaws.com/'.$object['Key'];
                    $tempArr[] = $object['Key'];
                }
            } else {
                echo "No files found in the folder '$folder'.\n";
            }
            return $tempArr;
            // echo "<PRE>";
            // print_r($tempArr);
        } catch (AwsException $e) {
            echo "Error: " . $e->getMessage() . "\n";
        }
        return true;
    }

    function backupDatabaseToS3()
    {
        $dbHost = DB_SERVER;
        $dbUser = DB_USERNAME; 
        $dbPass = DB_PASSWORD;
        $dbName = DB_DATABASE; 
        $s3KeyPrefix = 'db_backup/'. date('Y/F_m').'/';

        try {
            // Step 1: Dump the database to a temporary file
            $dumpFile = sys_get_temp_dir() . '/' . $dbName . '_' . date('Y_m_d_His') . '.sql';
            $command = "mysqldump --host={$dbHost} --user={$dbUser} --password={$dbPass} {$dbName} > {$dumpFile}";
            exec($command, $output, $returnVar);

            if ($returnVar !== 0) {
                throw new Exception('Failed to create database dump. Command: ' . $command);
            }

            // Step 3: Upload the dump file to S3
            $s3Key = $s3KeyPrefix . basename($dumpFile); // Define S3 object key
            $result = $this->_s3Client->putObject([
                'Bucket'      => AWS_S3_BUCKET_NAME,
                'Key'         => $s3Key,
                'SourceFile'  => $dumpFile,
                'ContentType' => 'application/sql',
            ]);
            // Step 4: Clean up the temporary file
            unlink($dumpFile);

            // Return the uploaded file's URL
            return $result['ObjectURL'];
        } catch (AwsException $e) {
            return 'AWS Error: ' . $e->getMessage();
        } catch (Exception $e) {
            return 'Error: ' . $e->getMessage();
        }
    }


}

?>