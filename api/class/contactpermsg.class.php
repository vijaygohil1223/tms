<?php

require_once 'functions.class.php';
require_once 'sendmail/class.phpmailer.php';

class contactPerMsg {

    public function __construct() {
        $this->_db = db::getInstance();
        $this->_status = new userstatus ();
    }

    public function contactPerMessage($id){
        $this->_db->where('iContactId',$id);
        $data = $this->_db->getOne('tms_client_contact');
        if($data){
            $this->_db->where('is_active',1);
            $info = $this->_db->getOne('tms_email_sign');
        }
        $data['data'] = $data;
        $data['info'] = $info;
        return $data;
    }

    public function contact_personGet($id) {
        $this->_db->where('iUserId',$id);
        return $this->_db->getOne('tms_users');
    }

    public function sendcontactPerMsg($data){
        if (isset($data['data']['messageData'])) {
            $this->_db->where('is_active', 1);
            $emailSign = $this->_db->getone('tms_email_sign');   
            $emailsignData = $emailSign['sign_detail'];
            $emailImage = $emailSign['sign_image']; 
            $emailImageData = $this->uploadimage($emailImage);
        } else {
            $emailsignData = " ";
            $emailImageData = " ";
        }
        if(isset($data['file'])) {
            $encoded_content = $this->uploadimage($data['file']);    
        } else {
            $encoded_content = " "; 
        }
        
        if (isset($data['data']['cc'])) {
            $cc = $data['data']['cc'];
        } else {
            $cc = "";
        }
        if (isset($data['data']['bcc'])) {
            $bcc = $data['data']['bcc'];
        } else {
            $bcc = "";
        }
        if (isset($data['data']['messageData'])) {
            $str = $data['data']['messageData'];
            $message = str_replace($emailsignData,"",$str);
        } else {
            $message = " ";
        }

        $body = "<p>" . $message . "</p>";
        //$body .= "<p>" . $emailsignData . "</p>";
        //$body .= "<p><img src='cid:logo_2u' width='80px'></p>";
        $subject = "Information";
        $Username = $data['data']['vUserName'];

        $to = $data['data']['vEmail'];

        $attachments = '';
        $to_name = 'TMS';
        if ($encoded_content != ' ') {
            $type = pathinfo($encoded_content, PATHINFO_EXTENSION);
            $fileNm = explode(',', $data['file']);
            $getFileType = explode(';',explode(':',$fileNm[0])[1]);
            $finalstring = base64_decode($fileNm[1]);
            $mimetype = self::getImageMimeType($finalstring,$getFileType[0]);
            $attachments =  [[
                'ContentType' => $getFileType[0],
                'Filename' => 'attachment.'.$type,
                'Base64Content' => $fileNm[1]
            ]];
        }

        $send_fn = new functions();
        $mailResponse = $send_fn->send_email_smtp($to, $to_name, $cc, $bcc, $subject, $body, $attachments);
        
        if($mailResponse['status'] == 200) {
            $result['status'] = 200;
            $result['msg'] = 'Thank you for your email';
        } else {
            $result['status'] = 200;
            $result['msg'] = 'Could not send mail!';
        }
        if(isset($result['status'])) {
            if(isset($emailImageData)) {
                $img = explode("/",$emailImageData);
                $image = end($img);
                if($img[0] != " ") {
                    $path = "../../uploads/attatchment/";
                    $images = glob($path.$image);
                    if($images){
                        //unlink($path.$image);
                    }    
                }    
            }
            if(isset($encoded_content)) {
                $img = explode("/",$encoded_content);
                $image = end($img);
                if($img[0] != " ") {
                    $path = "../../uploads/attatchment/";
                    $images = glob($path.$image);
                    if($image){
                        unlink($path.$image);
                    }    
                }       
            }
        }
        return $result;
    }

    public function sendcontactPerMsg_gmailsmtp2($data){

        if (isset($data['data']['messageData'])) {
            $this->_db->where('is_active', 1);
            $emailSign = $this->_db->getone('tms_email_sign');   
            $emailsignData = $emailSign['sign_detail'];
            $emailImage = $emailSign['sign_image']; 
            $emailImageData = $this->uploadimage($emailImage);
        } else {
            $emailsignData = " ";
            $emailImageData = " ";
        }
        if(isset($data['file'])) {
            $encoded_content = $this->uploadimage($data['file']);    
        } else {
            $encoded_content = " "; 
        }
        
        if (isset($data['data']['cc'])) {
            $cc = $data['data']['cc'];
        } else {
            $cc = "";
        }
        if (isset($data['data']['bcc'])) {
            $bcc = $data['data']['bcc'];
        } else {
            $bcc = "";
        }
        if (isset($data['data']['messageData'])) {
            $str = $data['data']['messageData'];
            $message = str_replace($emailsignData,"",$str);
            
        } else {
            $message = " ";
        }

        $body = "<p>" . $message . "</p>";
        $body .= "<p>" . $emailsignData . "</p>";
        $body .= "<p><img src='cid:logo_2u' width='80px'></p>";
        $subject = "Information";
        $Username = $data['data']['vUserName'];

        $to = $data['data']['vEmail'];
        //$from = $data['data']['vEmailAddress']
        $this->_mailer = new PHPMailer();
        //        $this->_mailer = 'ISO-8859-1';
        $this->_mailer->IsSMTP();
        $this->_mailer->Host = "ssl://smtp.gmail.com";
        $this->_mailer->SMTPAuth = "true";
        $this->_mailer->Port = "465";
        // $this->_mailer->Username = "ChrisGilesItWorks@gmail.com";
        // $this->_mailer->Password = "Knh@Admin@123";

        $this->_mailer->Username = SMTP_EMAIL_USER;
        $this->_mailer->Password = SMTP_EMAIL_PASSWORD;

        $this->_mailer->From = "Kanhasoft.com";
        $this->_mailer->FromName = "TMS";

        $this->_mailer->Subject = $subject;

        $this->_mailer->Body = $body;
        $this->_mailer->WordWrap = 50;
        $this->_mailer->AddAddress($to);
        $this->_mailer->AddEmbeddedImage($emailImageData, 'logo_2u');
        $this->_mailer->IsHTML(true);
        
        if ($cc != "") {
            $cCAddresses = explode(',',$cc);
            foreach ($cCAddresses as $cCAddress) {
                $this->_mailer->AddCC(trim($cCAddress));
            }
        }

        if ($bcc != "") {
            $bcCAddresses = explode(',',$bcc);
            foreach ($bcCAddresses as $bcCAddress) {
                $this->_mailer->AddBCC(trim($bcCAddress));
            }
        }

        if ($encoded_content != '') {
            $this->_mailer->AddAttachment($encoded_content);
        }
        if ($this->_mailer->Send()) { //output success or failure messages
            $result['status'] = 200;
            $result['msg'] = 'Thank you for your email';
        } else {
            $result['status'] = 200;
            $result['msg'] = 'Could not send mail!';
        }
        if(isset($result['status'])) {
            if(isset($emailImageData)) {
                $img = explode("/",$emailImageData);
                $image = end($img);
                if($img[0] != " ") {
                    $path = "../../uploads/attatchment/";
                    $images = glob($path.$image);
                    if($images){
                        unlink($path.$image);
                    }    
                }    
            }
            if(isset($encoded_content)) {
                $img = explode("/",$encoded_content);
                $image = end($img);
                if($img[0] != " ") {
                    $path = "../../uploads/attatchment/";
                    $images = glob($path.$image);
                    if($images){
                        unlink($path.$image);
                    }    
                }       
            }
        }
        return $result;
    }

    public function projectTeamMsg($id){
        $this->_db->where('vUserName',$id);
        $data = $this->_db->getOne('tms_users');
        if($data){
            $this->_db->where('is_active',1);
            $info = $this->_db->getOne('tms_email_sign');
        }
        $data['data'] = $data;
        $data['info'] = $info;
        return $data;
    }

    public function sendprojectTeamMsg($data){
        if (isset($data['data']['messageData'])) {
            $this->_db->where('is_active', 1);
            $emailSign = $this->_db->getone('tms_email_sign');   
            $emailsignData = $emailSign['sign_detail'];
            $emailImage = $emailSign['sign_image']; 
            $emailImageData = $this->uploadimage($emailImage);
        } else {
            $emailsignData = " ";
            $emailImageData = " ";
        }
        
        if(isset($data['file'])) {
            $encoded_content = $this->uploadimage($data['file']);
        } else {
            $encoded_content = " ";
        }

        if (isset($data['data']['cc'])) {
            $cc = $data['data']['cc'];
        } else {
            $cc = "";
        }
        if (isset($data['data']['bcc'])) {
            $bcc = $data['data']['bcc'];
        } else {
            $bcc = "";
        }
        if (isset($data['data']['messageData'])) {
            $str = $data['data']['messageData'];
            $message = str_replace($emailsignData,"",$str);
        } else {
            $message = " ";
        }

        $body = "<p>" . $message . "</p>";
        //$body .= "<p>" . $emailsignData . "</p>";
        //$body .= "<p><img src='cid:logo_2u' width='80px'></p>";
        $subject = "Information";
        $Username = $data['data']['vUserName'];

        $to = $data['data']['vEmailAddress'];

        if ($cc != "") {
            $cCAddresses = explode(',',$cc);
            foreach ($cCAddresses as $cCAddress) {
                $this->_mailer->AddCC(trim($cCAddress));
            }
        }

        if ($bcc != "") {
            $bcCAddresses = explode(',',$bcc);
            foreach ($bcCAddresses as $bcCAddress) {
                $this->_mailer->AddBCC(trim($bcCAddress));
            }
        }

        $to_name = '';
        $attachments = '';
        
        if ($encoded_content != '') {
            $type = pathinfo($encoded_content, PATHINFO_EXTENSION);
            $fileNm = explode(',', $data['file']);
            $getFileType = explode(';',explode(':',$fileNm[0])[1]);
            $finalstring = base64_decode($fileNm[1]);
            $mimetype = self::getImageMimeType($finalstring,$getFileType[0]);
            $attachments =  [[
                'ContentType' => $getFileType[0],
                'Filename' => 'attachment.'.$type,
                'Base64Content' => $fileNm[1]
            ]];
        }    
        $send_fn = new functions();
        $mailResponse = $send_fn->send_email_smtp($to, $to_name, $cc, $bcc, $subject, $body, $attachments);
            
        if($mailResponse['status'] == 200) {
        //if ($this->_mailer->Send()) { //output success or failure messages
            $result['status'] = 200;
            $result['msg'] = 'Thank you for your email';
        } else {
            $result['status'] = 200;
            $result['msg'] = 'Could not send mail!';
        }
        if(isset($result['status'])) {
            if(isset($emailImageData)) {
                $img = explode("/",$emailImageData);
                $image = end($img);
                if($img[0] != " ") {
                    $path = "../../uploads/attatchment/";
                    $images = glob($path.$image);
                    if($image){
                        //unlink($path.$image);
                    }    
                }    
            }
            if(isset($encoded_content)) {
                $img = explode("/",$encoded_content);
                $image = end($img);
                if($img[0] != " ") {
                    $path = "../../uploads/attatchment/";
                    $images = glob($path.$image);
                    if($images){
                        unlink($path.$image);
                    }    
                }       
            }
        }
        return $result;
    }

    public function generalMsg(){
        $this->_db->where('is_active',1);
        $info = $this->_db->getOne('tms_email_sign');
        return $info;
    }

    public function sendgeneralMsg($data){
                    
        if (isset($data['data']['messageData'])) {
            $this->_db->where('is_active', 1);
            $emailSign = $this->_db->getone('tms_email_sign');   
            $emailsignData = $emailSign['sign_detail'];
            $emailImage = $emailSign['sign_image']; 
            $emailImageData = $this->uploadimage($emailImage);
            $sign_picture = $emailSign['sign_picture']; 
        } else {
            $emailsignData = " ";
            $emailImageData = " ";
            $sign_picture = " ";
        }

        
        $encoded_content = " ";
        if(isset($data['file'])) {
            //$encoded_content = $this->uploadimage($data['file']);
        }

        if (isset($data['data']['cc'])) {
            $cc = $data['data']['cc'];
        } else {
            $cc = "";
        }
        if (isset($data['data']['bcc'])) {
            $bcc = $data['data']['bcc'];
        } else {
            $bcc = "";
        }
        if (isset($data['data']['messageData'])) {
            //$str = $data['data']['messageData'];
            //$message = str_replace($emailsignData,"",$str);
            $message = $data['data']['messageData'];
        } else {
            $message = " ";
        }
        if(isset($data['data']['msgEmailSubject']) && $data['data']['msgEmailSubject']!='') {
            $subject = $data['data']['msgEmailSubject'] ;
            $emailsignData = '';
        } else {
            $subject = "Information";
        }
        
        $body = "<div>" . $message . "</div>";
        //$body .= "<p>" . $emailsignData . "</p>";
        $body .= "<div><img src='cid:signid' width='100px'></div>";
        //$body .= "<p><img src='cid:logo_2u' width='80px'></p>";
        
        $to = $data['data']['vEmailAddress'];
        
        // $this->_mailer->From = "Kanhasoft.com";
        // $this->_mailer->FromName = "TMS";

        if ($encoded_content != '') {
            //$this->_mailer->AddAttachment($encoded_content);
        }
        
        $attachments = '';
        if(isset($data['file'])){
            $file_content = explode("base64,",$data['file']);
            $fileContentType = explode(';',explode(':',$file_content[0])[1]);
            $fileContentType = $fileContentType[0];
            $fileType = explode('/',$fileContentType);
            $fileType = $fileType[1];
            
            $fileName = 'download-file.'.$fileType;   
            if($fileContentType == 'application/vnd.openxmlformats-officedocument.wordprocessingml.document')
                $fileName = 'download-file.docx';
            if($fileContentType == 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet')
                $fileName = 'download-file.xls';
            
            // Array for mailjet
            if ($file_content != '') {
                $allFileContent = ''; 
                if(is_array($file_content)){
                    $allFileContent = sizeof($file_content)>1 ? $file_content[1] : '';
                    $attachments =  [[
                        'ContentType' => $fileContentType,
                        'Filename' => $fileName,
                        'Base64Content' => $allFileContent
                    ]]; 
                }
            }
            $inlineAttachments = false;
        }
        $inlineImageAttachement = '';
        if($emailSign && isset($emailSign['sign_image']) && $emailSign['sign_picture'] !='' ){
            $base64_image = $emailSign['sign_image'];
            $attachInline = explode(',', $base64_image);
            // Get the content type
            $content_type = '';
            if (count($attachInline) > 0) {
                preg_match('/^data:(.*?);/', $attachInline[0], $matches);
                if (isset($matches[1])) {
                    $content_type = $matches[1];
                }
            }
            // Get the base64 string
            $base64_string = '';
            if (count($attachInline) > 1) {
                $base64_string = $attachInline[1];
            }
            $inlineImageAttachement =  [[
                'ContentType' => $content_type,
                'Filename' => 'sign.png',
                'ContentID' => "signid",
                'Base64Content' => $base64_string
            ]];
        }
            
        // mailjet function
        $send_fn = new functions();
        $response = $send_fn->send_email_smtp($to, $to_name = '', $cc, $bcc, $subject, $body, $attachments, $inlineImageAttachement);
        //$response = $send_fn->send_email_smtp($to, $to_name = '', $cc, $bcc, $subject, $message, $attachments);
        
        if ($response && $response['status']==200) { //output success or failure messages
            $result['status'] = 200;
            $result['msg'] = 'Thank you for your email';
        } else {
            $result['status'] = 200;
            $result['msg'] = 'Could not send mail!';
        }
        if(isset($result['status'])) {
            if(isset($emailImageData)) {
                $img = explode("/",$emailImageData);
                $image = end($img);
                if($img[0] != " ") {
                    $path = "../../uploads/attatchment/";
                    $images = glob($path.$image);
                    if($images){
                        @unlink($path.$image);
                    }    
                }    
            }
            if(isset($encoded_content)) {
                $img = explode("/",$encoded_content);
                $image = end($img);
                if($img[0] != " ") {
                    $path = "../../uploads/attatchment/";
                    $images = glob($path.$image);
                    if($image){
                        unlink($path.$image);
                    }    
                }       
            }
        }
        return $result;
    }

    //public function sendgeneralMsg($data){
    public function sendgeneralMsg_gmailSMTP($data){
            if (isset($data['data']['messageData'])) {
            $this->_db->where('is_active', 1);
            $emailSign = $this->_db->getone('tms_email_sign');   
            $emailsignData = $emailSign['sign_detail'];
            $emailImage = $emailSign['sign_image']; 
            $emailImageData = $this->uploadimage($emailImage);
        } else {
            $emailsignData = " ";
            $emailImageData = " ";
        }
        
        if(isset($data['file'])) {
            $encoded_content = $this->uploadimage($data['file']);
        } else {
            $encoded_content = " ";
        }

        if (isset($data['data']['cc'])) {
            $cc = $data['data']['cc'];
        } else {
            $cc = "";
        }
        if (isset($data['data']['bcc'])) {
            $bcc = $data['data']['bcc'];
        } else {
            $bcc = "";
        }
        if (isset($data['data']['messageData'])) {
            $str = $data['data']['messageData'];
            $message = str_replace($emailsignData,"",$str);
        } else {
            $message = " ";
        }
        if(isset($data['data']['msgEmailSubject'])) {
            $subject = 'Invoice comment-' .$data['data']['msgEmailSubject'];
            $emailsignData = '';
        } else {
            $subject = "Information";
        }

        $body = "<p>" . $message . "</p>";
        $body .= "<p>" . $emailsignData . "</p>";
        $body .= "<p><img src='cid:logo_2u' width='80px'></p>";
        
        $to = $data['data']['vEmailAddress'];
        
        $this->_mailer = new PHPMailer();
        
        $this->_mailer->IsSMTP();
        $this->_mailer->Host = "smtp.gmail.com";
        $this->_mailer->SMTPAuth = "true";
        $this->_mailer->Username = SMTP_EMAIL_USER;
        $this->_mailer->Password = SMTP_EMAIL_PASSWORD;
        $this->_mailer->SMTPSecure = "tls";  
        $this->_mailer->Port = "25";

        //$this->_mailer->From = "anil.kanhasoft@gmail.com";
        $this->_mailer->FromName = "TMS";

        $this->_mailer->Subject = $subject;

        $this->_mailer->Body = $body;
        $this->_mailer->WordWrap = 50;
        $this->_mailer->AddAddress($to);
        $this->_mailer->AddEmbeddedImage($emailImageData, 'logo_2u');
        $this->_mailer->IsHTML(true);

        if ($cc != "") {
            $cCAddresses = explode(',',$cc);
            foreach ($cCAddresses as $cCAddress) {
                $this->_mailer->AddCC(trim($cCAddress));
            }
        }
        if ($bcc != "") {
            $bcCAddresses = explode(',',$bcc);
            foreach ($bcCAddresses as $bcCAddress) {
                $this->_mailer->AddBCC(trim($bcCAddress));
            }
        }

        if ($encoded_content != '') {
            $this->_mailer->AddAttachment($encoded_content);
        }
        if ($this->_mailer->Send()) { //output success or failure messages
            $result['status'] = 200;
            $result['msg'] = 'Thank you for your email';
        } else {
            $result['status'] = 200;
            $result['msg'] = 'Could not send mail!';
        }
        if(isset($result['status'])) {
            if(isset($emailImageData)) {
                $img = explode("/",$emailImageData);
                $image = end($img);
                if($img[0] != " ") {
                    $path = "../../uploads/attatchment/";
                    $images = glob($path.$image);
                    if($images){
                        unlink($path.$image);
                    }    
                }    
            }
            if(isset($encoded_content)) {
                $img = explode("/",$encoded_content);
                $image = end($img);
                if($img[0] != " ") {
                    $path = "../../uploads/attatchment/";
                    $images = glob($path.$image);
                    if($images){
                        unlink($path.$image);
                    }    
                }       
            }
        }
        return $result;
    }

    public function jobResourceMsg($id){
        $this->_db->where('iUserId',$id);
        $data = $this->_db->getOne('tms_users');
        if($data){
            $this->_db->where('is_active',1);
            $info = $this->_db->getOne('tms_email_sign');    
        }
        $data['data'] = $data;
        $data['info'] = $info;
        return $data;
    }

    public function sendjobResourceMsg($data){
        if (isset($data['data']['messageData'])) {
            $this->_db->where('is_active', 1);
            $emailSign = $this->_db->getone('tms_email_sign');   
            $emailsignData = $emailSign['sign_detail'];
            $emailImage = $emailSign['sign_image']; 
            //$emailImageData = $this->uploadimage($emailImage);
        } else {
            $emailsignData = " ";
            $emailImageData = " ";
        }
        
        if(isset($data['file'])) {
            $encoded_content = $this->uploadimage($data['file']);
        } else {
            $encoded_content = "";
        }

        if (isset($data['data']['cc'])) {
            $cc = $data['data']['cc'];
        } else {
            $cc = "";
        }
        if (isset($data['data']['bcc'])) {
            $bcc = $data['data']['bcc'];
        } else {
            $bcc = "";
        }
        if (isset($data['data']['messageData'])) {
            $str = $data['data']['messageData'];
            //$message = str_replace($emailsignData,"",$str);
            $message = $data['data']['messageData'];
        } else {
            $message = " ";
        }

        $body = "<div>" . $message . "</div>";
        $body .= "<div><img src='cid:signid' width='100px'></div>";
        //$body .= "<p>" . $emailsignData . "</p>";
        //$body .= "<p><img src='cid:logo_2u' width='80px'></p>";
        $subject = isset($data['data']['subject']) && $data['data']['subject'] != '' ? $data['data']['subject'] : "Information";
        $Username = $data['data']['vUserName'];
        $to = $data['data']['vEmailAddress'];
        
        $to_name = '';
        $attachments = '';
        
        if ($encoded_content != '') {
            $type = pathinfo($encoded_content, PATHINFO_EXTENSION);
            $fileNm = explode(',', $data['file']);
            $getFileType = explode(';',explode(':',$fileNm[0])[1]);
            $finalstring = base64_decode($fileNm[1]);
            $mimetype = self::getImageMimeType($finalstring,$getFileType[0]);
            $attachments =  [[
                'ContentType' => $getFileType[0],
                'Filename' => 'attachment.'.$type,
                'Base64Content' => $fileNm[1]
            ]];
        }    
        
        $inlineImageAttachement = '';
        if($emailSign && isset($emailSign['sign_image']) && $emailSign['sign_picture'] !='' ){
            $base64_image = $emailSign['sign_image'];
            $attachInline = explode(',', $base64_image);
            // Get the content type
            $content_type = '';
            if (count($attachInline) > 0) {
                preg_match('/^data:(.*?);/', $attachInline[0], $matches);
                if (isset($matches[1])) {
                    $content_type = $matches[1];
                }
            }
            // Get the base64 string
            $base64_string = '';
            if (count($attachInline) > 1) {
                $base64_string = $attachInline[1];
            }
            $inlineImageAttachement =  [[
                'ContentType' => $content_type,
                'Filename' => 'sign.png',
                'ContentID' => "signid",
                'Base64Content' => $base64_string
            ]];
        }

        $send_fn = new functions();
        $mailResponse = $send_fn->send_email_smtp($to, $to_name, $cc, $bcc, $subject, $body, $attachments, $inlineImageAttachement);
            
        if($mailResponse['status'] == 200) {
        //if ($this->_mailer->Send()) { //output success or failure messages
            $result['status'] = 200;
            $result['msg'] = 'Thank you for your email';
        } else {
            $result['status'] = 200;
            $result['msg'] = 'Could not send mail!';
        }

        if(isset($result['status'])) {
            $path = "../../uploads/attatchment/";
            if(isset($emailImageData)) {
                $img = explode("/",$emailImageData);
                $image = end($img);
                if($img[0] != " ") {
                    // $images = glob($path.$image);
                    // if($images){
                    //     unlink($path.$image);
                    // }
                    // remove file from folder
                    if($image)
                        $removeImage = self::checkFileExistAndDelete($path.$image, true);    
                }    
            }
            if(isset($encoded_content) && $encoded_content!='') {
                $img = explode("/",$encoded_content);
                $image = end($img);
                if($img[0] != " ") {
                    // $images = glob($path.$image);
                    // if($image){
                    //     unlink($path.$image);
                    // }    
                    if($image)
                        $removeImage = self::checkFileExistAndDelete($path.$image, true);    
                }       
            }
        }
        return $result;
    }

    public function uploadimage($data) {
        $result = explode(',', $data);

        $getFileType = explode(';',explode(':',$result[0])[1]);
        
        $finalstring = base64_decode($result[1]);
        
        $mimetype = self::getImageMimeType($finalstring,$getFileType[0]);
        if($mimetype == 'jpeg'){
            $mimetype = 'jpg';
        }
        $filename = time() . "." . $mimetype;
        $output_file = UPLOADS_ROOT . "attatchment/" . $filename;
        if($getFileType[0]=='application/vnd.openxmlformats-officedocument.wordprocessingml.document'){
            $output_file = $output_file.'docx';   
        }
        $ifp = fopen($output_file, "wb");
        fwrite($ifp, $finalstring);
        fclose($ifp);
        
        return $output_file;
    }

    public static function getBytesFromHexString($hexdata) {
        for ($count = 0; $count < strlen($hexdata); $count+=2)
            $bytes[] = chr(hexdec(substr($hexdata, $count, 2)));
        return implode($bytes);
    }

    public static function getImageMimeType($imagedata,$FileType='') {
        // $imagemimetypes = array(
        //     "jpeg" => "FFD8",
        //     "png" => "89504E470D0A1A0A",
        //     "gif" => "474946",
        //     "bmp" => "424D",
        //     "tiff" => "4949",
        //     "tiff" => "4D4D",
        //     "zip" => "630000000000",
        //     "doc" => "CFAD12FE",
        //     "docx" => "504B030414000600",
        //     "doc" => "D0CF11E0A1B11AE100",
        //     "pdf" => "255044462D312E",
        //     "text" => "EFBBBF",
        //     "xlsx" => "504B030414000600",
        //     "rar" => "526172211A0700"
        // );
        $imagemimetypes =
            array(  
                array('jpeg',   'FFD8',                 'image/jpeg',                                                                   ),
                array('png',    '89504E470D0A1A0A',     'image/png',                                                                    ),
                array('gif',    '474946',               'image/gif',                                                                 ),
                array('bmp',    '424D',                 'image/bmp',                                                                             ),
                array('tiff',   '4949',                 'image/tiff',                                                                             ),
                array('zip',    '504B0304',             'application/zip',                                                                             ),
                array('pdf',    '255044462D312E',       'application/pdf',                                                                             ),
                array('text',   'EFBBBF',               'text/plain',                                                                   ),
                array('rar',    '526172211A0700',       '',                                                                             ),
                array('xlsx',   '504B030414000600',     'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet',            ),
                array('docx',   '504B0506',     'application/vnd.openxmlformats-officedocument.wordprocessingml.document',      ),
                array('pptx',   '504B030414000600',     'application/vnd.openxmlformats-officedocument.presentationml.presentation',    ),
            );
        foreach ($imagemimetypes as $row) {
            $mime=$row[0];
            $hexbytes=$row[1];
            $bytes = self::getBytesFromHexString($hexbytes);
            if (substr($imagedata, 0, strlen($bytes)) == $bytes){
                if(empty($FileType)){
                    return $mime;
                }
                elseif($FileType == $row[2]){
                    return $mime;
                }
            }
        }

        return NULL;
    }
    public static function checkFileExistAndDelete($filePath,$isDelete=true) {
        $return = false;
        if (file_exists($filePath)) {
            // Attempt to delete the file
            $return = true;
            if($isDelete == true){
                if (unlink($filePath)) {
                    $return = true;
                } else {
                    $return = false; 
                }
            }
        }
        return $return;
    }

}
?>