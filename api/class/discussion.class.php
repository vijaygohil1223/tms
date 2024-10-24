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
                        $jobId = $data['job_id'];
                        //$jbupData['comment_read'] = 1;
                        //$jbupData['updated_date'] = date('Y-m-d H:i:s');
                        // $this->_db->where('job_summmeryId', $data['job_id']);
                        // $scpstsId = $this->_db->update('tms_summmery_view', $jbupData);
                        $jobsql = "UPDATE tms_summmery_view 
                        SET comment_read = comment_read + 1
                        WHERE job_summmeryId = $jobId ";
                        $scpstsId = $this->_db->rawQuery($jobsql);

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

        

        if($data && isset($data['is_updateByid']) && $data['is_updateByid'] === 1){
            if(isset($data['isLinguist']) && $data['isLinguist'] == 1 && isset($data['job_id']) && $data['job_id'] > 0 ){
                $reead_id = "'".$data['read_id'].",'";    
            
                $qry="UPDATE tms_discussion set read_id=concat(read_id, ".$reead_id.") WHERE job_id = " . $data['job_id'] . " AND FIND_IN_SET(".$data['read_id'].",read_id)=0 " ;
                $this->_db->rawQuery($qry);
                
                if(isset($data['loginUserType']) && $data['loginUserType'] != 1 ){
                    $this->_db->where('job_summmeryId', $data['job_id'] );
            	    $this->_db->update('tms_summmery_view', array('comment_read' => 0) );
                }
                    

            }

            if(isset($data['is_scoopUpdate']) && $data['is_scoopUpdate'] == true && isset($data['scoop_id']) && $data['scoop_id'] > 0 ){
                $reead_id = "'".$data['read_id'].",'";    
                
                $qry="UPDATE tms_discussion set read_id=concat(read_id, ".$reead_id.") WHERE scoop_id = " . $data['scoop_id'] . " AND FIND_IN_SET(".$data['read_id'].",read_id)=0 " ;
                $this->_db->rawQuery($qry);
            }
            $return['Status'] = 200;
        }else{
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
        }
        return $return;
    }
    public function discussionEmojitext() {
        $data = $this->_db->get('tms_emojitext');
        return $data;
    }

    public function discussionScoop($id) {
        $this->_db->where('td.scoop_id',$id);
        $this->_db->where('td.externalChat',0);
        $this->_db->join('tms_users AS tu','tu.iUserId = td.user_id','LEFT');
        $data = $this->_db->get('tms_discussion td', null, ' td.*, CONCAT(tu.vFirstName, " ", tu.vLastName) AS fullname, CONCAT("uploads/profilePic/",tu.vProfilePic) AS profile_picture_url, tu.vProfilePic as profileURL ');
        //$data = $this->_db->get('tms_discussion');
        return $data;
    }
    

    public function discussionScoopDetails($id) {
        //$qry = "SELECT its.itemId, its.order_id, its.item_number, its.total_price, its.total_amount, its.due_date, its.start_date, sts.item_status_name, gen.order_no FROM `tms_items` its LEFT JOIN tms_item_status sts ON sts.item_status_id = its.item_status LEFT JOIN tms_general gen ON gen.order_id = its.order_id WHERE its.itemId = $id ";
        //$dataAll = $this->_db->rawQuery($qry);
        
        $this->_db->where('its.itemId', $id);
        $this->_db->join('tms_general AS gen','its.order_id = gen.order_id','LEFT');
        $this->_db->join('tms_customer AS cust','its.order_id = cust.order_id','LEFT');
        $this->_db->join('tms_users AS tu','tu.iUserId = cust.project_manager','LEFT');
        $this->_db->join('tms_users AS sub_tu','sub_tu.iUserId = cust.sub_pm','LEFT');
        $this->_db->join('tms_users AS scoop_manager_tu','scoop_manager_tu.iUserId = its.manager','LEFT');
        $this->_db->join('tms_users AS sub_scp_tu','sub_scp_tu.iUserId = its.subPm','LEFT');
        $this->_db->join('tms_users AS gen_Qa','gen_Qa.iUserId = cust.QA_specialist','LEFT');
        $this->_db->join('tms_users AS sub_gen_Qa','sub_gen_Qa.iUserId = cust.sub_qa','LEFT');
        $this->_db->join('tms_users AS scp_Qa','scp_Qa.iUserId = its.qaSpecialist','LEFT');
        $this->_db->join('tms_users AS sub_scp_Qa','sub_scp_Qa.iUserId = its.subQa','LEFT');
        $this->_db->join('tms_users AS sub_scp_Qa','sub_scp_Qa.iUserId = its.subQa','LEFT');
        $this->_db->join('tms_users AS P_cordintr','P_cordintr.iUserId = cust.project_coordinator','LEFT');
        $this->_db->join('tms_users AS P_cordintr_sub','P_cordintr_sub.iUserId = cust.sub_pc','LEFT');
        $this->_db->join('tms_users AS scoop_cordintr','scoop_cordintr.iUserId = its.coordinator','LEFT');
        $this->_db->join('tms_users AS scoop_cordintr_sub','scoop_cordintr_sub.iUserId = its.subPc','LEFT');
        $this->_db->join('tms_item_status AS tis','its.item_status = tis.item_status_id','LEFT');
        $this->_db->join('tms_project_type AS tpt','its.project_type = tpt.pr_type_id','LEFT');
        $this->_db->join('tms_client AS clt','cust.client = clt.iClientId','LEFT');
        $results = $this->_db->getOne('tms_items as its','its.itemId, its.order_id, its.item_number, its.total_price, its.total_amount, its.due_date, its.start_date, tis.item_status_name, gen.order_no, tu.vUserName AS pm_name, CONCAT(tu.vFirstName, " ", tu.vLastName) AS pm_fullName, CONCAT( sub_tu.vFirstName, " ", sub_tu.vLastName ) AS sub_pm_name, CONCAT( scoop_manager_tu.vFirstName, " ", scoop_manager_tu.vLastName ) AS scoopPm_name, CONCAT( sub_scp_tu.vFirstName, " ", sub_scp_tu.vLastName ) AS sub_scoopPm_name, CONCAT(gen_Qa.vFirstName, " ", gen_Qa.vLastName) AS gen_Qa_fullName, CONCAT(sub_gen_Qa.vFirstName, " ", sub_gen_Qa.vLastName) AS gen_sub_Qa_fullName, CONCAT(scp_Qa.vFirstName, " ", scp_Qa.vLastName) AS scp_Qa_fullName, CONCAT(sub_scp_Qa.vFirstName, " ", sub_scp_Qa.vLastName) AS scp_sub_Qa_fullName, CONCAT( P_cordintr.vFirstName, " ", P_cordintr.vLastName ) AS P_cordintr_fullName, CONCAT( P_cordintr_sub.vFirstName, " ", P_cordintr_sub.vLastName ) AS P_cordintr_sub_fullName, tpt.project_name as project_type_name, tpt.code as project_type_code, clt.client_currency  ');
        
        if ($results) {
            $results['pm_fullName'] = !empty($results['scoop_subPm_id']) 
                ? $results['sub_scoopPm_name'] 
                : (!empty($results['scoopPm_name']) 
                    ? $results['scoopPm_name'] 
                    : (!empty($results['sub_pm_id']) 
                        ? $results['sub_pm_name'] 
                        : ($results['pm_fullName'] ?? ''))
                );
        
            $results['qa_fullName'] = !empty($results['scp_sub_Qa_fullName']) 
                ? $results['scp_sub_Qa_fullName'] 
                : (!empty($results['scp_Qa_fullName']) 
                    ? $results['scp_Qa_fullName'] 
                    : (!empty($results['gen_sub_Qa_fullName']) 
                        ? $results['gen_sub_Qa_fullName'] 
                        : ($results['gen_Qa_fullName'] ?? ''))
                );

            $results['pc_fullName'] = !empty($results['P_cordintr_sub_fullName'])
            ? $results['P_cordintr_sub_fullName']
            : (!empty($results['scoop_cordintr_fullName'])
                ? $results['scoop_cordintr_fullName']
                : (!empty($results['scoop_cordintr_sub_fullName'])
                    ? $results['scoop_cordintr_sub_fullName']
                    : $results['P_cordintr_fullName'] ?? ''));   
                    
            
            $this->_db->where('jsv.order_id', $results['order_id']);        
            $this->_db->where('jsv.item_id', $results['item_number']);        
            $this->_db->join('tms_users AS user','user.iUserId = jsv.resource','LEFT');
            //$this->_db->groupBy('user.iUserId');
            $lingsData = $this->_db->get('tms_summmery_view as jsv',null , 'jsv.job_summmeryId, user.iUserId as linguistId, CONCAT( user.vFirstName, " ", user.vLastName ) AS resource_fullName, user.vProfilePic ');
            $results['linguistList'] =   $lingsData;

        }

        return $results ;
    }

    public function discussionJobDetails($id) {
        // Check if ID is valid
        if (empty($id)) {
            return []; // or handle this case as needed
        }

        $this->_db->where("job_summmeryId", $id);
        $jobData = $this->_db->getOne('tms_summmery_view', 'order_id, item_id,contact_person, resource, total_price ');
        if (!$jobData) {
            return []; // No job data found
        }
    
        // Fetch scoop data
        $this->_db->where("order_id", $jobData['order_id']);
        $this->_db->where("item_number", $jobData['item_id']);
        $scoopData = $this->_db->getOne('tms_items');
    
        if (!$scoopData) {
            return []; // No scoop data found
        }
        // Fetch discussion scoop details
        $results = self::discussionScoopDetails($scoopData['itemId']);
        if ($results) {
            // Fetch user data
            $this->_db->where("iUserId", $jobData['contact_person']);
            $userData = $this->_db->getOne('tms_users', 'vFirstName, vLastName');
            if ($userData) {
                $results['pm_fullName'] = $userData['vFirstName'] . ' ' . $userData['vLastName'];
            } else {
                $results['pm_fullName'] = ''; // Handle case where user data is not found
            }
            $this->_db->where("iUserId", $jobData['resource'] );
            $userData2 = $this->_db->getOne('tms_users', 'vFirstName, vLastName, freelance_currency');

            $results['job_price'] = $jobData['total_price'];
            if ($userData2) {
                $results['resource_name'] = $userData2['vFirstName'] . ' ' . $userData2['vLastName'];
                $results['linguist_currency'] = $userData2['freelance_currency'];
                //client_currency
            }
        }
    
        return $results;
    }

    public function discussionByJobid($id) {
        $this->_db->where('td.job_id',$id);
        $this->_db->where('td.externalChat',1);
        $this->_db->join('tms_users AS tu','tu.iUserId = td.user_id','LEFT');
        $data = $this->_db->get('tms_discussion td', null, 'td.*, CONCAT(tu.vFirstName, " ", tu.vLastName) AS fullname, CONCAT("uploads/profilePic/",tu.vProfilePic) AS profile_picture_url, tu.vProfilePic as profileURL ');
        return $data;
    }
    
    public function getDiscussionMessageRead($scoopid){

        $discussion = $this->_db->rawQueryNew("select id as discussion_id, scoop_id as discussion_scoop_id,job_id as discussion_job_id, read_id as discussionReadId from tms_discussion where scoop_id=$scoopid ORDER BY id DESC limit 1  ");
        $discussion = count($discussion)> 0 ? $discussion[0] : [];

        $returnData['discussion_id'] = null;
        $returnData['discussion_job_id'] = null;
        $returnData['discussion_scoop_id'] = null;
        $returnData['discussionReadId'] = '';    
        if ($discussion) {
            $returnData['discussion_id'] = $discussion['discussion_id'];
            $returnData['discussion_job_id'] = $discussion['discussion_job_id'];
            $returnData['discussion_scoop_id'] = $discussion['discussion_scoop_id'];
            $returnData['discussionReadId'] = $discussion['discussionReadId'];
        }
        return $returnData;
    }        


}
