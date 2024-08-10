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
            $filePath = "/var/www/html/tms/uploads/fileupload/". $filename;
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





}

?>