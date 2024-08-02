<?php

require_once 'functions.class.php';
require_once 'customer.class.php';
require_once 'client.class.php';

class discussion {
    public function __construct() {
        $this->_db = db::getInstance();
    }
    
    public function discussionOrderGet($id) {
        $this->_db->where('order_id',$id);
        $data = $this->_db->get('tms_discussion');
        return $data;
    }
    
    public function discussionOrder($data) {
        if($data['created_by_current_user'] == 1) 
            $data['created_by_current_user'] = "true";
        else
            $data['created_by_current_user'] = "false";
        if($data['user_has_upvoted'] == 1) 
            $data['user_has_upvoted'] = "true";
        else
            $data['user_has_upvoted'] = "false";

        $sendEmail = false;
        if(isset($data['isCommentEmailsend']) ){
            $sendEmail = $data['isCommentEmailsend'] == true ? true : false;
            unset($data['isCommentEmailsend']);
        }    
        
        $id = $this->_db->insert('tms_discussion',$data);
        if($id) {
            if ($sendEmail && isset($data['job_id']) && $data['job_id'] > 0) {
                
                $this->_db->where("job_summmeryId", $data['job_id']);
                $jobData = $this->_db->getOne('tms_summmery_view');
                // UPLOADS_ROOT
                if ($jobData && isset($jobData['resource'])) {
                    //$this->_db->where("iUserId", $data['user_id']);
                    //$fromData = $this->_db->getOne('tms_users');
                
                    $this->_db->where("iUserId", $jobData['resource']);
                    $userData = $this->_db->getOne('tms_users');
                    if ($userData && $userData['vEmailAddress'] != '') {
                        
                        // update job table
                        $jbupData['comment_read'] = 1;
                        $jbupData['updated_date'] = date('Y-m-d H:i:s');
                        $this->_db->where('job_summmeryId', $data['job_id']);
                        $scpstsId = $this->_db->update('tms_summmery_view', $jbupData);

                        $attachment = '';
                        if (isset($data['fileURL'])) {
                            $fileURL = SITE_URL.'/' . $data['fileURL'];
                            $filename = basename($fileURL);
                            $attachment = " \n ";
                            $attachment .= "Attachment: \n ";
                            $attachment .= " <a target='_blank' href=\"$fileURL\" target=\"_blank\">$filename</a>";
                        }
                        $jobid = $data['job_id'];
                        $resourceId = $userData['iUserId'];
                        $baseurl = SITE_URL."#/dashboard1?";
                        $queryParams = [
                            'chatpage' => 1,
                            'jobid' => $jobid,
                            'resourceId' => $resourceId,
                        ];
                        $encodedQueryParams = base64_encode(http_build_query($queryParams));
                        $redirectUrl = $baseurl . $encodedQueryParams;
                        $atag = sprintf(
                            '<br><div><p><a href="%s" target="_blank" style="color: #f3eded; background: #4e2fc4; padding: 8px; border-radius: 7px; border-color: #4e2fc4;" > View messages </a></p></div><br>',
                            htmlspecialchars($redirectUrl)
                        );

                        $html = nl2br(htmlspecialchars(" \n "));
                        $html .= isset($data['content']) ? nl2br(htmlspecialchars($data['content'])) : '';
                        $html .= $attachment; // Attach the file name wrapped in <a> tag to the email content
                        $html .= $atag;
                        $userEmail = $userData['vEmailAddress']; 
                        $to_name = '';
                        $subject = 'Job comment: '.$jobData['po_number'];
                        $send_fn = new functions();
                        $response = $send_fn->send_email_smtp($userEmail, $to_name, $cc='', $bcc='', $subject, $html, $attachments='');
                    }
                }
            }
            $result['Status'] = 200;
            $result['msg'] = "Inserted Successfully";
        } else {
            $result['Status'] = 401;
            $result['msg'] = "No Inserted";
        }
        return $result;
    }

    public function discussionOrderDelete($id,$data) {
        $this->_db->where('id',$id);
        $cols = Array ("user_id");
        $getMatch = $this->_db->getOne("tms_discussion", null, $cols);
        if($data == $getMatch['user_id']){
             $this->_db->where('id',$id);
            $del = $this->_db->delete('tms_discussion');
            if($del) {
                $result['Status'] = 200;
                $result['msg'] = "Deleted Successfully";
            } else {
                $result['Status'] = 401;
                $result['msg'] = "No Updated";
            }   
        }else{
            $result['Status'] = 401;
            $result['msg'] = "You can not delete other user post";
        }
        return $result;
    }

    public function discussionOrderUpdate($data,$id) {
        $this->_db->where('id',$id);
        $cols = Array ("user_id");
        $getMatch = $this->_db->getOne("tms_discussion", null, $cols);
        //echo $getMatch['user_id'];exit;
        if($data['login_userid'] == $getMatch['user_id']){
            unset($data['login_userid']);
            if($data['created_by_current_user'] == 1) 
                $data['created_by_current_user'] = "true";
            else
                $data['created_by_current_user'] = "false";
            if($data['user_has_upvoted'] == 1) 
                $data['user_has_upvoted'] = "true";
            else
                $data['user_has_upvoted'] = "false";
            
            $this->_db->where('id',$id);
            $id = $this->_db->update('tms_discussion',$data);
            if($id) {
                $result['Status'] = 200;
                $result['msg'] = "Updated Successfully";
            } else {
                $result['Status'] = 401;
                $result['msg'] = "No Updated";
            }
            
        }else{
            $result['Status'] = 401;
            $result['msg'] = "You can not edit other user post";
        }

        
        return $result;
    }


    public function discussionCommentread($data,$orderId) {
        //$this->_db->where('order_id',$orderId);
        //$cmtData = $this->_db->get("tms_discussion");
        /*$menu_access = $this->_db->rawQuery("SELECT * FROM " . tms_discussion . " WHERE user_id = '" . $orderId . "' AND FIND_IN_SET('" . 1 . "', read_id)");*/
        $return['Status'] = '';
        foreach ($data as $value) {
            $reead_id = "'".$value['read_id'].",'";    
            //$qry="UPDATE tms_discussion set read_id=concat(read_id, ".$reead_id.") WHERE id = " . $value['id'] ;
            $qry="UPDATE tms_discussion set read_id=concat(read_id, ".$reead_id.") WHERE id = " . $value['id'] . " AND FIND_IN_SET(".$value['read_id'].",read_id)=0 " ;
            $this->_db->rawQuery($qry);
            
            if(isset($value['isLinguist']) && $value['isLinguist'] == 1 && isset($value['job_id']) && $value['job_id'] > 0 ){
                $this->_db->where('job_summmeryId', $value['job_id'] );
            	$this->_db->update('tms_summmery_view', array('comment_read'=>0) );
            }
            $return['Status'] = 200;
        }
        return $return;
    }
    public function discussionEmojitext() {
        $data = $this->_db->get('tms_emojitext');
        return $data;
    }

}
