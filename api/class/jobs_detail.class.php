<?php



require_once 'users.class.php';

require_once 'filemanager.class.php';

require_once 'client.class.php';

require_once 'tasktype.class.php';

require_once 'functions.class.php';

require_once 'sendmail/class.phpmailer.php';



class jobs_detail
{

    public function __construct()
    {

        $this->_db = db::getInstance();
    }



    public function getAll()
    {

        $qry = "SELECT * FROM `tms_summmery_view` WHERE `po_number` != ''";

        $data = $this->_db->rawQuery($qry);

        return $data;
    }



    public function getExternalUserJobs($id)
    {

        $qry = "SELECT * FROM tms_summmery_view WHERE po_number != '' && resource ='{$id}'";

        $data = $this->_db->rawQuery($qry);

        return $data;
    }

    public function select2JobCodeGet()
    {

        return $this->_db->get('tms_jobs');
    }





    public function itemupdateJobs($id, $data)
    {

        $data['updated_date'] = date('Y-m-d H:i:s');

        $this->_db->where('itemId', $id);

        $data = $this->_db->update('tms_items', $data);

        if ($id) {

            $return['status'] = 200;

            $return['msg'] = 'Successfully Updated.';
        } else {

            $return['status'] = 422;

            $return['msg'] = 'Not Updated.';
        }

        return $return;
    }



    public function jobpertitemGet($id)
    {

        $this->_db->where('itemId', $id);

        return $data = $this->_db->getone('tms_items');
    }



    public function jobpertjobGet($id, $pid)
    {

        $this->_db->where('job_id', $id);

        $data = $this->_db->getone('tms_jobs');

        $info = self::jobsummeryGet($pid);

        $this->_db->where('order_id', $pid);

        $itemData = $this->_db->getone('tms_items');

        $data['item_number'] = $itemData ? $itemData['item_number'] : '';

        if ($info) {

            foreach ($info as $in) {
            }

            if ($in) {

                if ($in == 0) {

                    $data['job_no'] = 1;
                } else {

                    $data['job_no'] = $in['job_no'] + 1;
                }
            }
        }

        if (!$info) {

            $data['job_no'] = 1;
        }

        return $data;
    }



    public function jobSummarySave($info)
    {   
        //echo '<pre>'; print_r($info); echo '</pre>';
        $this->_db->where('item_id', $info['item_id']);
        $this->_db->where('job_id', $info['job_id']);
        $this->_db->where('order_id', $info['order_id']);
        $alreadyExists = $this->_db->getOne('tms_summmery_view');

        // changes - If same job exist we can add new jobs
        $alreadyExists2 = false;

        if ($alreadyExists2) {

            return false;
            // $return['status'] = 404;
            // $return['msg'] = 'Job already Exists.';
        } else {
            //jobsummery insert
            if (isset($info['job_no'])) {
                $info['job_no'];
            } else {
                $info['job_no'] = 1;
            }
            // Add resource if Job is External Quality Assurance(EQA) = 11
            if($info['job_id'] == '11'){
                $this->_db->where('item_id', $info['item_id']);
                $this->_db->where('order_id', $info['order_id']);
                $this->_db->orderBy('job_summmeryId','DESC');
                $jobAssigned = $this->_db->getOne('tms_summmery_view');
                if (count($jobAssigned) > 0)
                    $info['resource'] = $jobAssigned['resource'];
            }

            $info['created_date'] = date('Y-m-d H:i:s');

            $info['updated_date'] = date('Y-m-d H:i:s');

            if(isset($info['contact_person']) && $info['contact_person'] == '')
                unset($info['contact_person']);

            $id = $this->_db->insert('tms_summmery_view', $info);

            //job folder create

            $this->_db->where('order_id', $info['order_id']);

            $this->_db->where('name', 'jobs');

            $getfolder = $this->_db->getOne('tms_filemanager');

            $data['name'] = $info['job_code'] . str_pad($info['job_no'], 3, '0', STR_PAD_LEFT);

            $data['order_id'] = $info['order_id'];

            $data['job_id'] = $id;

            $data['parent_id'] = isset($getfolder['fmanager_id']) ? $getfolder['fmanager_id'] : 0;

            $data['created_date'] = date('Y-m-d H:i:s');

            $data['updated_date'] = date('Y-m-d H:i:s');

            $pId = $this->_db->insert('tms_filemanager', $data);



            //job inner and outer folder auto

            $addIn = array('_in', '_out');

            foreach ($addIn as $value) {

                $in['name'] = $value;

                $in['parent_id'] = $pId;

                $in['created_date'] = date('Y-m-d H:i:s');

                $in['updated_date'] = date('Y-m-d H:i:s');

                $test = $this->_db->insert('tms_filemanager', $in);

            }
            if ($info['order_id'] && $info['item_id']) {
                // job Name External Quality Assurance (EQA) = 11
                if($info['job_id'] == '11'){
                    // item scoop status QA issues = 11 id
                    $qry_up = "UPDATE tms_items SET `item_status` = '11' WHERE order_id = '" . $info['order_id'] . "' AND item_number = '" . $info['item_id'] . "' ";
                } else {
                    // update item status if status 2 (Ongoing) back to 1 (Assign)
                    $qry_up = "UPDATE tms_items SET `item_status` = '1' WHERE order_id = '" . $info['order_id'] . "' AND item_number = '" . $info['item_id'] . "' AND item_status = '2' ";
                }
                if($qry_up)    
                    $this->_db->rawQuery($qry_up);
            }

            if ($id) {

                $return['status'] = 200;

                $return['msg'] = 'Successfully Inserted.';

                $return['order_id'] = $id;
            } else {

                $return['status'] = 422;

                $return['msg'] = 'Not Saved.';
            }
        }

        return $return;
    }



    public function jobsummeryGet($id)
    {

        $this->_db->join('tms_users tu', 'tsv.resource = tu.iUserId', 'LEFT');

        $this->_db->join('tms_users tsu', 'tsv.contact_person = tsu.iUserId', 'LEFT');

        $this->_db->where('tsv.order_id', $id);

        $data = $this->_db->get('tms_summmery_view tsv', null, 'tsv.*,tu.vUserName,tu.vProfilePic as resourcePic,tu.iUserId,tsu.vUserName AS contactPerson,tsu.iUserId AS contactPersonId');

        //echo $this->_db->getLastQuery();exit;

        return $data;
    }



    public function jobitemUserget($id)
    {

        $this->_db->where('iUserId', $id);

        $data = $this->_db->getone('tms_users');

        return $data;
    }



    public function jobitemsidget($orderId, $id)
    {

        $this->_db->join("tms_order tmo", "tmo.order_id=ti.order_id", "INNER");

        $this->_db->join("tms_customer tc", "ti.order_id=tc.order_id", "INNER");

        $this->_db->join("tms_proj_language tpl", "ti.item_language=tpl.pl_id", "LEFT");

        $this->_db->where('ti.order_id', $orderId);

        $this->_db->where('item_number', $id);

        $data = $this->_db->getone('tms_items ti', null, 'tpl.*,tc.*,ti.*,tmo.order_number, tmo.abbrivation');


        return $data;
    }



    public function jobitemDelete($id)
    {

        $invoiceAlreadyAdded = false;

        if ($id) {

            $invoiceRecords = $this->_db->get('tms_invoice');



            foreach ($invoiceRecords as $k => $v) {

                foreach (json_decode($v['job_id'], true) as $ke => $val) {

                    $existedJobId = $val['id'];

                    if ($id == $existedJobId) {

                        $invoiceAlreadyAdded = true;
                    }
                }
            }
        }



        if ($invoiceAlreadyAdded) {

            $this->_db->where('job_summmeryId', $id);

            $jobSummeryData = $this->_db->getOne('tms_summmery_view');



            if ($jobSummeryData) {

                $return['jobNumber'] = $jobSummeryData['po_number'];
            }



            $return['status'] = 422;

            $return['msg'] = 'You can not delete invoice created job.';

            return $return;
        } else {



            $externalResourceUserId = 'null';



            $this->_db->where('job_id', $id);

            $data = $this->_db->getOne('tms_filemanager');

            if ($data) {

                $filed = new filemanager();

                $info = $filed->filefolderGet($data['fmanager_id'], $id, $externalResourceUserId);

                if ($info) {

                    foreach ($info as $key => $value) {

                        if (isset($value['ext'])) {

                            $path = "../../uploads/fileupload/";

                            $images = glob($path . $value['name']);



                            if ($images) {

                                unlink($path . $value['name']);
                            }



                            $in = $filed->filefolderGet($value['fmanager_id'], $id, $externalResourceUserId);

                            foreach ($in as $key => $value) {

                                if (isset($value['ext'])) {

                                    $path = "../../uploads/fileupload/";

                                    $images = glob($path . $value['name']);

                                    if ($images) {

                                        unlink($path . $value['name']);
                                    }
                                }

                                $this->_db->where('parent_id', $value['parent_id']);

                                $this->_db->delete('tms_filemanager');
                            }
                        }

                        $this->_db->where('fmanager_id', $value['parent_id']);

                        $this->_db->delete('tms_filemanager');



                        $this->_db->where('parent_id', $value['parent_id']);

                        $this->_db->delete('tms_filemanager');
                    }
                }

                $this->_db->where('job_id', $data['job_id']);

                $this->_db->delete('tms_filemanager');
            }

            $this->_db->where('job_summmeryId', $id);

            $data = $this->_db->delete('tms_summmery_view');

            return $data;
        }
    }



    public function jobChainitemsGet($id)
    {

        $this->_db->join('tms_users tu', 'tsv.resource = tu.iUserId', 'LEFT');

        $this->_db->where('order_id', $id);

        $data = $this->_db->get('tms_summmery_view tsv');

        if ($data) {

            $this->_db->where('order_id', $id);

            $info = $this->_db->get('tms_items');
        }

        $result['data'] = $data;

        $result['info'] = $info;

        //print_r($result);exit;

        return $result;
    }



    public function jobChainsummerychain($id)
    {

        $this->_db->join('tms_users tu', 'tsv.resource = tu.iUserId', 'LEFT');

        $this->_db->join('tms_summmery_view t2', 'tsv.job_summmeryId = t2.per_id', 'INNER');

        $this->_db->where('tsv.order_id', $id);

        $data = $this->_db->get('tms_summmery_view tsv', null, 't2.job_summmeryId AS job_summmeryId1,tsv.job_summmeryId AS job_summmeryId2,t2.per_id AS per_id1,tsv.per_id AS per_id2,t2.order_id AS order_id2,tsv.order_id AS order_id1,t2.item_id AS item_id2,tsv.item_id AS item_id1,t2.job_id AS job_id2,tsv.job_id AS job_id1,t2.job_no AS job_no2,tsv.job_no AS job_no1,t2.job_code AS job_code2,tsv.job_code AS job_code1,t2.order_no AS order_no2,tsv.order_no AS order_no1,t2.due_date AS due_date2,tsv.due_date AS due_date1,t2.item_status AS item_status2,tsv.item_status AS item_status1,t2.company_code AS company_code2,tsv.company_code AS company_code1,tu.vUserName');

        $dataId = array();

        foreach ($data as $key => $value) {

            $dataId[] = $value['job_summmeryId1'] . ',' . $value['per_id1'];
        }



        $dId = implode(",", $dataId);

        if (!$dId) {

            $dId = 0;
        }



        $data1 = $this->_db->rawQuery("select * from tms_summmery_view AS tsv LEFT JOIN tms_users AS tu ON tsv.resource = tu.iUserId WHERE tsv.order_id = '" . $id . "' AND tsv.job_summmeryId NOT IN($dId)");

        $data2 = $this->_db->rawQuery("select * from tms_summmery_view AS tsv LEFT JOIN tms_users AS tu ON tsv.resource = tu.iUserId WHERE tsv.order_id = '" . $id . "' AND tsv.job_summmeryId IN($dId)");

        $this->_db->where('order_id', $id);

        $info = $this->_db->get('tms_items');

        $result['data1'] = $data1;

        $result['data'] = $data2;

        $result['info'] = $info;

        return $result;
    }



    public function jobChainitemsDayGet($orderid, $jobItemId)
    {

        $this->_db->where('order_id', $orderid);

        $this->_db->where('item_id', $jobItemId);

        $data = $this->_db->getOne("tms_summmery_view", "MAX(due_date) AS dueDate");

        return $data;
    }



    public function projectjobChainGet($id)
    {

        $this->_db->where('job_summmeryId', $id);

        $data = $this->_db->getone('tms_summmery_view');

        return $data;
    }



    public function projectjobGet($id)
    {

        $this->_db->where('item_id', array(0), 'NOT IN');

        $this->_db->where('order_id', $id);

        $data = $this->_db->get('tms_summmery_view');

        return $data;
    }



    public function projobChainsave($data)
    {

        $data['created_date'] = date('Y-m-d H:i:s');

        $data['updated_date'] = date('Y-m-d H:i:s');

        $id = $this->_db->insert('tms_summmery_view', $data);

        if ($id) {

            $return['status'] = 200;

            $return['msg'] = 'Successfully Inserted.';
        } else {

            $return['status'] = 422;

            $return['msg'] = 'Not Saved.';
        }

        return $return;
    }



    public function JobsummeryResourceGet()
    {

        $this->_db->where('status_type', 1);

        $this->_db->where('is_active', 1);

        $data = $this->_db->get('tms_user_status');

        return $data;
    }



    public function JobsummerycontactGet()
    {

        //$this->_db->where('iFkUserTypeId', 1);

        //$this->_db->where('vResourceType',2);

        $this->_db->where('eUserStatus', 3); //new Added after Set Inactive in External users

        $this->_db->where('FIND_IN_SET(2, vResourcePosition)');

        $data = $this->_db->get('tms_users');

        return $data;
    }



    public function JobsummeryitemstatusGet()
    {

        $this->_db->where('is_active', 1);

        $data = $this->_db->get('tms_item_status');

        return $data;
    }



    public function jobSummeryitemUpdate($id, $data)
    {

        unset($data['auto_status']);

        //$data ['created_date'] = date('Y-m-d H:i:s');

        $data['updated_date'] = date('Y-m-d H:i:s');

        $this->_db->where('job_summmeryId', $id);

        $id = $this->_db->update('tms_summmery_view', $data);

        if ($id) {

            $return['status'] = 200;

            $return['msg'] = 'Successfully Updated.';
        } else {

            $return['status'] = 422;

            $return['msg'] = 'Not Updated.';
        }

        return $return;
    }



    public function jobselectContactName($id)
    {

        $this->_db->where('iUserId', $id);

        $data = $this->_db->getone('tms_users');

        return $data['vEmailAddress'];
    }



    public function jobselectContactNameupdate($id, $data)
    {

        if(isset($data['jobSummuryIds'])){
            unset($data['jobSummuryIds']);
        }
        if (isset($data['contact_person'])) {

            $data['updated_date'] = date('Y-m-d H:i:s');

            $this->_db->where('job_summmeryId', $id);

            $id = $this->_db->update('tms_summmery_view', $data);

            if ($id) {

                $return['status'] = 200;

                $return['msg'] = 'Successfully Updated.';
            } else {

                $return['status'] = 422;

                $return['msg'] = 'Not Updated.';
            }

            return $return;
        }

        if (isset($data['item_status'])) {
            $this->_db->where('job_summmeryId', $id);
            $jobsData = $this->_db->getone('tms_summmery_view');

            $data['updated_date'] = date('Y-m-d H:i:s');
            $this->_db->where('job_summmeryId', $id);

            $id = $this->_db->update('tms_summmery_view', $data);

            
            if ($id) {
                // Update scoop status to QA Ready
                if(isset($jobsData['order_id']) && isset($jobsData['item_id']) && $data['item_status'] == 'Completed' ) {

                    $qry_up = "UPDATE `tms_items` SET `item_status` = '10' WHERE order_id = '".$jobsData['order_id']."' AND item_number = '".$jobsData['item_id']."' AND item_status != '4' ";
                    $this->_db->rawQuery($qry_up);

                    // check for purchase order
                    $qry = "SELECT tsv.job_summmeryId, tsv.order_id, tsv.item_id, tsv.resource, tsv.po_number, tu.vEmailAddress, tu.vFirstName, tu.vLastName from tms_summmery_view as tsv LEFT JOIN tms_users as tu ON tsv.resource = tu.iUserId WHERE tsv.job_summmeryId != ".$id. " AND tsv.order_id = ".$jobsData['order_id']. " AND tsv.item_id = ".$jobsData['item_id']. " AND tsv.item_status = 'In preparation'  AND tsv.resource > 0  ORDER BY tsv.job_summmeryId ASC" ;
                    $scoopJoblist = $this->_db->rawQuery($qry);
                    if(count($scoopJoblist) > 0 && $scoopJoblist[0]['resource']){
                            // $emailData = array();
                            // $emailData['pdfData'] =  $data['pdfData'];
                            // $emailData['resourceEmail'] =  $scoopJoblist[0]['vEmailAddress'];
                            // $emailData['resourceName'] =  $scoopJoblist[0]['vFirstName']. ' '.$scoopJoblist[0]['vLastName '];
                            // $emailData['order_id'] =  $scoopJoblist[0]['order_id'];
                            // $emailData['item_id'] =  $scoopJoblist[0]['item_id'];
                            // $emailData['poFilenamePdf'] =  'PO_'.$scoopJoblist[0]['po_number'].'.pdf';
                            //$sendEmail = self::sendPurchaseOrderLinguist($emailData);
                            $return['job_summmeryId'] = $scoopJoblist[0]['job_summmeryId'];            
                            $return['sendPurchaseOrder'] = true;            
                    }

                }

                $return['status'] = 200;

                $return['msg'] = 'Successfully Updated.';
            } else {

                $return['status'] = 422;

                $return['msg'] = 'Not Updated.';
            }

            return $return;
        }

        if (isset($data['due_date'])) {
            
            $data['updated_date'] = date('Y-m-d H:i:s');

            $data['due_date'] = date("Y.m.d H:i:s", strtotime($data['due_date']));

            $this->_db->where('job_summmeryId', $id);

            $id = $this->_db->update('tms_summmery_view', $data);

            if ($id) {

                $return['status'] = 200;

                $return['msg'] = 'Successfully Updated.';
            } else {

                $return['status'] = 422;

                $return['msg'] = 'Not Updated.';
            }

            return $return;
        }

        if (isset($data['resource'])) {

            $data['updated_date'] = date('Y-m-d H:i:s');

            $this->_db->where('job_summmeryId', $id);

            $id = $this->_db->update('tms_summmery_view', $data);

            //echo $this->_db_getLastQuery();exit;

            if ($id) {

                $return['status'] = 200;

                $return['msg'] = 'Successfully Updated.';
            } else {

                $return['status'] = 422;

                $return['msg'] = 'Not Updated.';
            }

            return $return;
        }
    }



    public function jobSummeryitemCopy($id, $data)
    {

        $info = self::jobsummeryGet($id);

        if ($info) {

            foreach ($info as $in) {
            }

            $in['job_no'] += 1;
        }



        if ($data) {

            foreach ($data as $d) {

                $this->_db->where('job_summmeryId', $d['id']);

                $id = $this->_db->getOne('tms_summmery_view');

                if ($id) {

                    if (isset($id['job_summmeryId'])) {

                        $id['job_summmeryId'] = " ";
                    }

                    if (isset($id['job_no'])) {

                        $id['job_no'] = $in['job_no'];
                    }

                    if (isset($id['description'])) {

                        $id['description'] = "Copy : " . $id['description'];
                    }

                    $inf = $this->_db->insert('tms_summmery_view', $id);

                    //job folder create

                    $this->_db->where('order_id', $id['order_id']);

                    $this->_db->where('name', '$jobs');

                    $getfolder = $this->_db->getOne('tms_filemanager');

                    $idm['name'] = $id['job_code'] . str_pad($id['job_no'], 3, '0', STR_PAD_LEFT);

                    $idm['order_id'] = $id['order_id'];

                    $idm['job_id'] = $inf;

                    $idm['parent_id'] = $getfolder['fmanager_id'];

                    $idm['created_date'] = date('Y-m-d H:i:s');

                    $idm['updated_date'] = date('Y-m-d H:i:s');

                    $pId = $this->_db->insert('tms_filemanager', $idm);

                    //job inner and outer folder auto

                    $addIn = array('_in', '_out');

                    foreach ($addIn as $value) {

                        $inG['name'] = $value;

                        $inG['parent_id'] = $pId;

                        $inG['created_date'] = date('Y-m-d H:i:s');

                        $inG['updated_date'] = date('Y-m-d H:i:s');

                        $this->_db->insert('tms_filemanager', $inG);
                    }
                }

                $in['job_no']++;
            }
        }
    }



    public function jobselectUserEmail($id, $data)
    {

        $this->_db->where('job_summmeryId', $id);

        $info = $this->_db->getOne('tms_summmery_view');

        $data = self::jobAlluserEmail($info, $data);

        return $data;
    }



    public function jobAlluserEmail($info, $data)
    {

        if (isset($data['userEmail']))

            $to = $data['userEmail'];

        else

            $to = "";

        //return $info;

        if (isset($info['job_code']) && isset($info['job_no']))

            $jobNo = $info['job_code'] . str_pad($info['job_no'], 3, '0', STR_PAD_LEFT);

        else

            $jobNo = "";

        if (isset($info['description']))

            $description = $info['description'];

        else

            $description = "";

        if (isset($info['resource']))

            $resource = $info['resource'];

        else

            $resource = "";

        if (isset($info['due_date']))

            $dueDate = $info['due_date'];

        else

            $dueDate = "";

        if (isset($info['item_status']))
            $itemStatus = $info['item_status'];

        else
            $itemStatus = "";

        $this->_db->where('iUserId', $info['resource']);

        $UserData = $this->_db->getOne('tms_users');

        $resource = $UserData['vUserName'];

        $urlSlug = base64_encode('jobId=147&userId=4');
        $acceptLink = '<a href="'.SITE_URL.'#/job-accept/'.$urlSlug.'" target="blank" style="padding: 7px 7px; background: green; border-radius: 5px; color: white;"> Accept Job </a>';
        
        $body = "<p>Hello " . $info['contact_person'] . "</p>";

        $body .= "<p>Following Job has been created and assigned to you.</p>";

        $body .= "<p>Job No. : " . $jobNo . ",</p>";

        $body .= "<p>Detail : " . $description . ",</p>";

        $body .= "<p>Resource : " . $resource . ",</p>";

        $body .= "<p>Due Date : " . $dueDate . ",</p>";

        $body .= "<p>Item Status : " . $itemStatus . ".</p>";

        $body .= "<br><p> click here to accept the job <br>" . $acceptLink . "</p>";
        
        $subject = "Job Detail's";

        //$this->_mailer = new PHPMailer();
        //$this->_mailer = 'ISO-8859-1';
        // $this->_mailer->IsSMTP();
        // $this->_mailer->Host = "ssl://smtp.gmail.com";
        // $this->_mailer->SMTPAuth = "true";
        // $this->_mailer->Port = "465";
        // $this->_mailer->Username = SMTP_EMAIL_USER;
        // $this->_mailer->Password = SMTP_EMAIL_PASSWORD;
        // $this->_mailer->From = "Kanhasoft.com";
        // $this->_mailer->FromName = "Kanhasoft";
        // $this->_mailer->Subject = "Job Detail's";
        // $this->_mailer->Body = $body;
        // $this->_mailer->WordWrap = 50;
        // $this->_mailer->AddAddress($to);
        // $this->_mailer->IsHTML(true);

        $attachments = '';
        $to_name = '';

        $send_fn = new functions();
        $mailResponse = $send_fn->send_email_smtp($to, $to_name, $cc = '', $bcc = '', $subject, $body, $attachments);

        if ($mailResponse['status'] == 200) {
            //if ($this->_mailer->Send()) { //output success or failure messages

            $result['status'] = 200;

            $result['msg'] = 'Thank you for your email';
        } else {

            $result['status'] = 200;

            $result['msg'] = 'Could not send mail!';
        }

        return $result;
    }



    public function jobchainitemsDelete($id)
    {

        $data = self::jobpertitemGet($id);

        if (isset($data['item_number'])) {

            $itemId = $data['item_number'];

            if ($itemId == '001' && $id) {

                $this->_db->where('item_id', $id);

                $info = $this->_db->delete('tms_summmery_view');

                $this->_db->where('item_id', 1);

                $info = $this->_db->delete('tms_summmery_view');
            } else {

                $this->_db->where('item_id', $id);

                $info = $this->_db->delete('tms_summmery_view');
            }
        }

        return $info;
    }



    public function itemOverviewGet($id)
    {

        $this->_db->where('order_id', $id);

        $data = $this->_db->get('tms_summmery_view');

        if ($data) {

            $info = array();

            foreach ($data as $d) {
            }
        }
    }



    public function jobDetailLanguageGet($id)
    {

        $this->_db->where('order_id', $id);

        $data =  $this->_db->getone('tms_proj_language');

        return $data;
    }



    public function jobSummeryDetailsGet($id)
    {

        //$this->_db->get('')
        //$qry = "select tsv.*,tsv.description As jobDesc,tg.due_date AS ProjectDueDate,tg.order_no AS company_code, tf.fmanager_id, CONCAT(ti.source_lang,'>',ti.target_lang) AS ItemLanguage, ti.item_name AS description, ti.project_type, ti.source_lang as scoop_source_lang, ti.target_lang as scoop_target_lang, tu.vUserName As userName,tpc.vUserName AS contactPerson, tg.project_name projectName,tg.specialization as proj_specialization,tpt.project_name as project_type_name, tpm.vUserName projectManager, tu.freelance_currency, tcl.vUserName as clientName, tcl.vCenterid  from tms_summmery_view AS tsv INNER JOIN tms_general AS tg ON tsv.order_id = tg.order_id INNER JOIN tms_filemanager AS tf ON tsv.job_summmeryId = tf.job_id LEFT JOIN tms_items AS ti ON tsv.order_id = ti.order_id AND tsv.item_id = ti.item_number LEFT JOIN tms_proj_language AS tpl ON ti.item_language = tpl.pl_id LEFT JOIN tms_users AS tu ON tsv.resource = tu.iUserId LEFT JOIN tms_users tpc ON tpc.iUserId = tsv.contact_person INNER JOIN tms_customer tc ON tc.order_id = tsv.order_id INNER JOIN tms_users tpm ON tpm.iUserId = tc.project_manager LEFT JOIN tms_project_type AS tpt ON ti.project_type = tpt.pr_type_id LEFT JOIN tms_client tcl ON tcl.iClientId = tc.client WHERE tsv.job_summmeryId = '" . $id . "'";
        $qry = "SELECT tsv.*, tsv.description AS jobDesc, tg.due_date AS ProjectDueDate, tg.order_no AS company_code, tf.fmanager_id, CONCAT( ti.source_lang, '>', ti.target_lang ) AS ItemLanguage, ti.item_name AS description, ti.project_type, ti.source_lang AS scoop_source_lang, ti.target_lang AS scoop_target_lang, tu.vUserName AS userName, tpc.vUserName AS contactPerson, tg.project_name projectName, tg.specialization AS proj_specialization, tpt.project_name AS project_type_name, tpm.vUserName projectManager, tu.freelance_currency, tcl.vUserName AS clientName, tcl.vCenterid, tic.vUserName as clientAccountName FROM tms_summmery_view AS tsv INNER JOIN tms_general AS tg ON tsv.order_id = tg.order_id INNER JOIN tms_filemanager AS tf ON tsv.job_summmeryId = tf.job_id LEFT JOIN tms_items AS ti ON tsv.order_id = ti.order_id AND tsv.item_id = ti.item_number LEFT JOIN tms_proj_language AS tpl ON ti.item_language = tpl.pl_id LEFT JOIN tms_users AS tu ON tsv.resource = tu.iUserId LEFT JOIN tms_users tpc ON tpc.iUserId = tsv.contact_person INNER JOIN tms_customer tc ON tc.order_id = tsv.order_id LEFT JOIN tms_client_indirect tic ON tc.indirect_customer = tic.vClientNumber INNER JOIN tms_users tpm ON tpm.iUserId = tc.project_manager LEFT JOIN tms_project_type AS tpt ON ti.project_type = tpt.pr_type_id LEFT JOIN tms_client tcl ON tcl.iClientId = tc.client WHERE tsv.job_summmeryId = '" . $id . "'";
        $data = $this->_db->rawQuery($qry);

        return $data;
    }



    public function jobdetailItemStatusGet()
    {

        //$data = array('1' => 'In preparation', '2' => 'Requested', '3' => 'Assigned-waiting', '4' => 'In-progress', '5' => 'Overdue', '6' => 'Delivered', '7' => 'Approved', '8' => 'Invoice Accepted', '9' => 'Paid', '10' => 'Canceled', '11' => 'Without invoice', '12' => 'Pending', '13' => 'New', '14' => 'Ready to be Delivered', '15' => 'Completed');
        $this->_db->where('is_active', 1);
        $data = $this->_db->get('tms_job_status');

        return $data;
    }


    public function scoopdetailItemStatusGet()
    {

        $this->_db->where('is_active', 1);

        $data = $this->_db->get('tms_item_status');

        return $data;
    }

    public function jobdetailresourceGet()
    {
        // $this->_db->where('iFkUserTypeId', 2);
        // $this->_db->where('eUserStatus', 3);
        // $this->_db->where('activation_status', 1);
        // $data =  $this->_db->get('tms_users');
        $data = $this->_db->rawQuery("select * from tms_users where iFkUserTypeId = 2 AND eUserStatus!=4 AND activation_status=1");
        return $data;
    }



    public function jobSummeryDetailsAutoChangeon($orderId, $autoId)
    {
        $this->_db->where('job_summmeryId', $orderId);
        $info =  $this->_db->update('tms_summmery_view', array('auto_job' => '0'));
        return $info;
    }

    public function jobSummeryDetailsAutoChangeoff($orderId, $autoId)
    {
        $this->_db->where('job_summmeryId', $orderId);
        $info =  $this->_db->update('tms_summmery_view', array('auto_job' => $autoId));
        return $info;
    }



    public function jobSummeryDetailsUpdate($id, $data)
    {
        $this->_db->where('template_id',11);
        $emailTemplateRegistration = $this->_db->getOne('tms_email_templates');
        $search_array = array("[JOBNO]", "[LANGUAGES]",'[JOBSTATUS]','[DUEDATE]','[ACCEPTLINK]','[REJECTLINK]');

        $this->_db->where('job_summmeryId', $id);
        $jobDetails = $this->_db->getone('tms_summmery_view');
        
        if (isset($jobDetails['po_number']))
            $jobnumber = $jobDetails['po_number'];
        else
            $jobnumber = " ";
        if (isset($jobDetails['due_date']))
            $duedate = $jobDetails['due_date'];
        else
            $duedate =  " ";
        if (isset($jobDetails['ItemLanguage']))
            $langPair = $jobDetails['ItemLanguage'];
        else
            $langPair =  " ";
        
        if (isset($jobDetails['resource']))
            $resource = $jobDetails['resource'];
        else
            $resource = " ";    
        // if (isset($data['jobnumber']))
        //     $jobnumber = $data['jobnumber'];
        // else
        //     $jobnumber = " ";
        // if (isset($data['jduedate']))
        //     $duedate = $data['jduedate'];
        // else
        //     $duedate =  " ";
        if (isset($data['jobEmail']))
            $to = $data['jobEmail'];
        else
            $to = " ";
        if (isset($data['item_status']))
            $itemStatus = $data['item_status'];
        else
            $itemStatus = " ";
            

        $jobId = $id;
        $urlSlugAc = base64_encode("jobId=$jobId&userId=$resource&accept=1");
        $urlSlugRej = base64_encode("jobId=$jobId&userId=$resource&reject=1");
        $acceptLink = '<a href="'.SITE_URL.'#/job-accept/'.$urlSlugAc.'" target="blank" style="padding: 7px 7px; background: green; border-radius: 5px; color: white;"> Accept Job </a>';
        $rejectLink = '<a href="'.SITE_URL.'#/job-accept/'.$urlSlugRej.'" target="blank" style="padding: 7px 7px; background: red; border-radius: 5px; color: white;"> Reject Job </a>';        

        // $body = "<p>Please login to account accept.</p>";
        // $body .= "<p>Job No. : " . $jobnumber . ",</p>";
        // $body .= "<p>Due Date : " . $duedate . ",</p>";
        // $body .= "<p>job Status : " . $itemStatus . ",</p>";
        // $body .= "<p> click here to accept the job <br>" . $acceptLink . "</p>";

        $replace_array = array($jobnumber,$langPair,$itemStatus,$duedate,$acceptLink,$rejectLink);
        $body = str_replace($search_array, $replace_array, $emailTemplateRegistration['template_content']);

        $subject = "Job Request";

        // $this->_mailer = new PHPMailer();
        //$this->_mailer = 'ISO-8859-1';
        // $this->_mailer->IsSMTP();
        // $this->_mailer->Host = "ssl://smtp.gmail.com";
        // $this->_mailer->SMTPAuth = "true";
        // $this->_mailer->Port = "465";
        // $this->_mailer->Username = SMTP_EMAIL_USER;
        // $this->_mailer->Password = SMTP_EMAIL_PASSWORD;
        // $this->_mailer->From = "Kanhasoft.com";
        // $this->_mailer->FromName = "Kanhasoft";
        // $this->_mailer->Subject = "Job Detail's";
        // $this->_mailer->Body = $body;
        // $this->_mailer->WordWrap = 50;
        // $this->_mailer->AddAddress($to);
        // $this->_mailer->IsHTML(true);

        $attachments = '';
        $to_name = '';
        $send_fn = new functions();
        $mailResponse = $send_fn->send_email_smtp($to, $to_name, $cc = '', $bcc = '', $subject, $body, $attachments);

        unset($data['auto_job'], $data['jobnumber'], $data['jobEmail'], $data['jduedate']);

        $data['updated_date'] = date('Y-m-d H:i:s');

        $this->_db->where('job_summmeryId', $id);

        $data = $this->_db->update('tms_summmery_view', $data);

        if ($id) {

            $return['status'] = 200;

            $return['msg'] = 'Successfully Updated.';
        } else {

            $return['status'] = 422;

            $return['msg'] = 'Not Updated.';
        }

        return $return;
    }

    public function jobSendRequest($data)
    {
        $this->_db->where('template_id',11);
        $emailTemplateRegistration = $this->_db->getOne('tms_email_templates');
        $search_array = array("[JOBNO]", "[LANGUAGES]",'[JOBSTATUS]','[DUEDATE]','[ACCEPTLINK]','[REJECTLINK]');

        if (isset($data['id'])) {
            $this->_db->where('job_summmeryId', $data['id']);
            $jobDetails = $this->_db->getone('tms_summmery_view');
            
            if (isset($jobDetails['po_number']))
                $jobnumber = $jobDetails['po_number'];
            else
                $jobnumber = " ";
                if (isset($jobDetails['due_date']))
                $duedate = $jobDetails['due_date'];
            else
                $duedate =  " ";
            if (isset($jobDetails['ItemLanguage']))
                $langPair = $jobDetails['ItemLanguage'];
            else
                $langPair =  " ";
                    
            if (isset($jobDetails['item_status']))
                $itemStatus = $jobDetails['item_status'];
            else
                $itemStatus = " ";
    
            if (isset($data['data']['vEmailAddress'])) {
                $eIds = explode(',', $data['data']['vEmailAddress']);
                $dataUp['send_request'] = $data['data']['vEmailAddress'];
                foreach ($eIds as $val) {
                    $this->_db->where('iUserId', $val);
                    $freelaceremail = $this->_db->getone('tms_users');

                    $jobId = $data['id'];
                    $urlSlugAc = base64_encode("jobId=$jobId&userId=$val&accept=1");
                    $urlSlugRej = base64_encode("jobId=$jobId&userId=$val&reject=1");
                    $acceptLink = '<a href="'.SITE_URL.'#/job-accept/'.$urlSlugAc.'" target="blank" style="padding: 7px 7px; background: green; border-radius: 5px; color: white;"> Accept Job </a>';
                    $rejectLink = '<a href="'.SITE_URL.'#/job-accept/'.$urlSlugRej.'" target="blank" style="padding: 7px 7px; background: red; border-radius: 5px; color: white;"> Reject Job </a>';

                    if (isset($freelaceremail['vEmailAddress'])){
                        $to = $freelaceremail['vEmailAddress'];
                        // Message
                        // $body = "<p> Please login to account accept Or Click on below link.</p>";
                        // $body .= "<p>Job No. : " . $jobnumber . ",</p>";
                        // $body .= "<p>Language Pair. : " . $langPair . ",</p>";
                        // $body .= "<p>Due Date : " . $duedate . ",</p>";
                        // $body .= "<p>job Status : " . $itemStatus . ",</p>";
                        // $body .= "<p> click here to accept the job <br><br>" . $acceptLink . "</p>";
                        // $body .= "<p> click here to reject the job <br><br>" . $rejectLink . "</p>";

                        $replace_array = array($jobnumber,$langPair,$itemStatus,$duedate,$acceptLink,$rejectLink);
                        $body = str_replace($search_array, $replace_array, $emailTemplateRegistration['template_content']);
                        
                        $subject = isset($data['data']['subject']) ? $data['data']['subject'] : "Job Send Request ";
                
                        $attachments = '';
                        $to_name = '';

                        $send_fn = new functions();
                        $mailResponse = $send_fn->send_email_smtp($to, $to_name, $cc = '', $bcc = '', $subject, $body, $attachments);
                    }
                }
            }

            $dataUp['updated_date'] = date('Y-m-d H:i:s');
            $dataUp['item_status'] = 'Requested';
            $this->_db->where('job_summmeryId', $data['id']);
            $updt = $this->_db->update('tms_summmery_view', $dataUp);
            
            //if($mailResponse['status'] == 200) {
            if ($updt) {
                $return['status'] = 200;
                $return['msg'] = 'Successfully Sent.';
            } 
        }else {
            $return['status'] = 422;
            $return['msg'] = 'Not Sent.';
        }

        return $return;
    }

    public function jobAcceptUpdate($data)
    {
        if (isset($data['jobId'])) {
            $this->_db->where('job_summmeryId', $data['jobId']);
            $jobDetails = $this->_db->getone('tms_summmery_view');
        
            $dataUp['updated_date'] = date('Y-m-d H:i:s');
            if (isset($data['jobAccept']) && $data['jobAccept'] == '1') {
                $dataUp['accept'] = $data['resourceId'];
                $dataUp['resource'] = $data['resourceId'];
                //$dataUp['item_status'] = 'Waiting';
                $dataUp['item_status'] = 'Ongoing';
            } else {
                $dataUp['rejection'] = $data['resourceId'];
            }   
            $this->_db->where('job_summmeryId', $data['jobId']);
            $updt = $this->_db->update('tms_summmery_view', $dataUp);
        
            //if($mailResponse['status'] == 200) {
            if ($updt) {
                $return['status'] = 200;
                $return['jobAccept'] = $data['jobAccept'];
                $return['msg'] = 'Successfully Updated.';
            } 
        }else {
            $return['status'] = 422;
            $return['msg'] = 'Not Updated.';
        }

        return $return;
    }



    public function jobSummeryJobDetailsUpdate($id, $data)
    {
        unset($data['auto_job'], $data['fmanager_id'], $data['userName'], $data['contactPerson'], $data['projectName'], $data['projectManager'], $data['project_type_name'], $data['clientAccountName']);
        //unset($data['quantity'],$data['itemPrice']);
        if (isset($data['proj_specialization'])) {
            unset($data['proj_specialization']);
        }
        if (isset($data['scoop_source_lang']))
            unset($data['scoop_source_lang']);
        if (isset($data['scoop_target_lang']))
            unset($data['scoop_target_lang']);    
        
        if (isset($data['due_date'])) {
            $data['due_date'] = date('Y-m-d H:i:s', strtoTime($data['due_date']));
        }
        if (isset($data['resource'])) {
            $explR = explode(",", $data['resource']);
            $data['resource'] = $explR[count($explR)-1];
        }
        
        $data['updated_date'] = date('Y-m-d H:i:s');

        $this->_db->where('job_summmeryId', $id);

        $update = $this->_db->update('tms_summmery_view', $data);

        if($update && isset($data['order_id'])) {
            // $qry = "SELECT count(*) as count FROM tms_summmery_view WHERE order_id = '".$data['order_id']."' AND item_id = '".$data['item_id']."' AND resource = '' ";
            // $res_exist = $this->_db->rawQuery($qry);
            // if ($res_exist && $res_exist[0]['count'] == 0) {
            //     $qry_up = "UPDATE `tms_items` SET `item_status` = '2' WHERE order_id = '".$data['order_id']."' AND item_number = '".$data['item_id']."' AND item_status = '1' ";
            //     $this->_db->rawQuery($qry_up);
            // }
        }

        if ($id) {
            $return['status'] = 200;
            $return['msg'] = 'Successfully Updated.';
        } else {
            $return['status'] = 422;
            $return['msg'] = 'Not Updated.';
        }

        return $return;
    }



    public function jobsummeryResourceMail($resourceName, $summeryId)
    {

        $this->_db->where('job_summmeryId', $summeryId);

        $data = $this->_db->getone('tms_summmery_view');

        if ($data != "") {

            $this->_db->where('vUserName', $resourceName);

            $this->_db->orwhere('iUserId', $resourceName);

            $info = $this->_db->getone('tms_users');

            $data['vEmailAddress'] = $info['vEmailAddress'];
        };

        if (isset($data['vEmailAddress']))

            $to = $data['vEmailAddress'];

        else

            $to = "";

        if (isset($data['job_code']) && isset($data['job_no']))

            $jobNo = $data['job_code'] . str_pad($data['job_no'], 3, '0', STR_PAD_LEFT);

        else

            $jobNo = "";

        if (isset($data['description']))

            $description = $data['description'];

        else

            $description = "";

        if (isset($data['resource']))

            $resource = $data['resource'];

        else

            $resource = "";

        if (isset($data['due_date']))

            $dueDate = $data['due_date'];

        else

            $dueDate = "";

        if (isset($data['item_status']))

            $itemStatus = $data['item_status'];

        else

            $itemStatus = "";





        $body = "<p>Hello " . $data['contact_person'] . "</p>";

        $body .= "<p>Following Job has been created and assigned to you.</p>";

        $body .= "<p>Job No. : " . $jobNo . ",</p>";

        $body .= "<p>Detail : " . $description . ",</p>";

        $body .= "<p>Resource : " . $resource . ",</p>";

        $body .= "<p>Due Date : " . $dueDate . ",</p>";

        $body .= "<p>Item Status : " . $itemStatus . ".</p>";



        $subject = "Job Information";

        // $this->_mailer = new PHPMailer();
        //$this->_mailer = 'ISO-8859-1';
        // $this->_mailer->IsSMTP();
        // $this->_mailer->Host = "ssl://smtp.gmail.com";
        // $this->_mailer->SMTPAuth = "true";
        // $this->_mailer->Port = "465";
        // $this->_mailer->Username = SMTP_EMAIL_USER;
        // $this->_mailer->Password = SMTP_EMAIL_PASSWORD;
        // $this->_mailer->From = "Kanhasoft.com";
        // $this->_mailer->FromName = "Kanhasoft";
        // $this->_mailer->Subject = "Job Detail's";
        // $this->_mailer->Body = $body;
        // $this->_mailer->WordWrap = 50;
        // $this->_mailer->AddAddress($to);
        // $this->_mailer->IsHTML(true);

        $attachments = '';

        $send_fn = new functions();
        $mailResponse = $send_fn->send_email_smtp($to, $to_name = '', $cc = '', $bcc = '', $subject, $body, $attachments);

        if ($mailResponse['status'] == 200) {

            $result['status'] = 200;

            $result['msg'] = 'Thank you for your email';
        } else {

            $result['status'] = 200;

            $result['msg'] = 'Could not send mail!';
        }

        return $result;
    }



    public function itemsjobStatusGet($ItemId, $orderId)
    {

        $this->_db->where('itemId', $ItemId);

        $data =  $this->_db->getOne('tms_items');

        if ($data) {

            $this->_db->where('item_id', $data['item_number']);

            $this->_db->where('order_id', $orderId);

            $info  = $this->_db->get('tms_summmery_view');
        } else {

            $info = "";
        }

        return $info;
    }



    public function autostatusUpdate($ItemId, $status, $orderId)
    {

        $this->_db->where('itemId', $ItemId);

        $data =  $this->_db->getOne('tms_items');

        if ($data) {

            $summeryitemNo = $data['item_number'];

            $this->_db->where('itemId', $ItemId);

            $this->_db->update('tms_items', array('auto_status' => $status));



            $this->_db->where('order_id', $orderId);

            $this->_db->where('item_id', $summeryitemNo);

            $info = $this->_db->update('tms_summmery_view', array('auto_status' => $status));
        }

        //return $info;

    }



    public function resourceRedirect($resource)
    {

        $this->_db->where('vUserName', $resource);

        $data =  $this->_db->getOne('tms_users');

        return $data['iUserId'];
    }



    public function jobItemIconsetdata($id, $orderId)
    {

        $this->_db->where('order_id', $orderId);

        $this->_db->where('item_id', $id);

        $data =  $this->_db->getOne('tms_summmery_view');
    }



    public function jobDetailchangeGet($id)
    {

        $this->_db->where('job_summmeryId', $id);

        $data = $this->_db->getOne('tms_summmery_view');

        return $data;
    }



    public function jobpertjobChainGet($id, $orderId, $itemId)
    {

        $this->_db->where('job_chain_id', $id);

        $data['newJob'] = $this->_db->get('tms_new_job');

        $info = self::jobsummeryGet($orderId);

        if ($info) {

            foreach ($info as $in) {
            }

            if ($in) {

                if ($in == 0) {

                    $data['job_no'] = 0;
                } else {

                    $data['job_no'] = $in['job_no'];
                }
            }
        }

        return $data;
    }



    public function acceptJobStatus($id, $data)
    {

        $data['updated_date'] = date('Y-m-d H:i:s');

        $data['rejection'] = '';

        $this->_db->where('job_summmeryId', $id);

        $idd = $this->_db->update('tms_summmery_view', $data);

        if ($idd) {

            $this->_db->where('job_summmeryId', $id);
            $jobsData = $this->_db->getOne('tms_summmery_view');

            $this->_db->where('iUserId', $jobsData['resource']);
            $resourceData = $this->_db->getOne('tms_users');

            $this->_db->where('order_id', $jobsData['order_id']);
            $jobEmailData = $this->_db->getOne('tms_customer');

            $this->_db->where('iUserId', $jobEmailData['project_manager']);
            $proManagerEmail = $this->_db->getOne('tms_users');

            if ($data['item_status'] == 'Delivered' || $data['item_status'] == 'Completed') {

                //Sending Email to manager after job is Delivered START

                $jobNo = $jobsData['po_number'];
                $jobDescription = $jobsData['description'];
                $jobDeliverynote = '';

                $this->_db->where('template_id', 10);

                $emailTemplateAcceptJob = $this->_db->getOne('tms_email_templates');
                $search_array = array("[JOBNO]", "[JOBDESCRIPTION]", '[DELIVERYNOTE]');

                $replace_array = array($jobNo, $jobDescription, $jobDeliverynote);

                $html = str_replace($search_array, $replace_array, $emailTemplateAcceptJob['template_content']);

                $subject = $emailTemplateAcceptJob['template_subject'];

                $to = $proManagerEmail['vEmailAddress'];

                $mailSendStatus = $this->sendEmail($to, $subject, $html);

                //Sending Email to manager after job is Delivered END
                // Update status to QA Ready
                if(isset($jobsData['order_id']) && isset($jobsData['item_id'])) {
                    $qry_up = "UPDATE `tms_items` SET `item_status` = '10' WHERE order_id = '".$jobsData['order_id']."' AND item_number = '".$jobsData['item_id']."' ";
                    $this->_db->rawQuery($qry_up);
                }

            } else {

                //Sending Email to manager after job is accepted START

                $jobNo = $jobsData['po_number'];

                $jobLanguage = $jobsData['ItemLanguage'];

                $jobResource = $resourceData['vUserName'];



                $this->_db->where('template_id', 6);

                $emailTemplateAcceptJob = $this->_db->getOne('tms_email_templates');

                $search_array = array("[JOBNO]", "[LANGUAGES]", '[RESOURCENAME]', '[JOBREQUESTCOMMENT]');





                $replace_array = array($jobNo, $jobLanguage, $jobResource);



                $html = str_replace($search_array, $replace_array, $emailTemplateAcceptJob['template_content']);



                $subject = $emailTemplateAcceptJob['template_subject'];

                $to = $proManagerEmail['vEmailAddress'];



                $mailSendStatus = $this->sendEmail($to, $subject, $html);

                //Sending Email to manager after job is accepted END



            }

            $return['status'] = 200;

            $return['emailSend'] = $mailSendStatus['emailSend'];

            $return['msg'] = 'Successfully Updated.';
        } else {

            $return['status'] = 422;

            $return['msg'] = 'Not Updated.';
        }

        return $return;
    }



    public function rejectJobStatus($id, $data)
    {

        $data['updated_date'] = date('Y-m-d H:i:s');

        $data['item_status'] = 'In preparation';

        $this->_db->where('job_summmeryId', $id);

        $data = $this->_db->update('tms_summmery_view', $data);

        if ($id) {

            //Sending Email to manager after job is reject START

            $this->_db->where('job_summmeryId', $id);

            $jobsData = $this->_db->getOne('tms_summmery_view');



            $this->_db->where('iUserId', $jobsData['resource']);

            $resourceData = $this->_db->getOne('tms_users');



            $this->_db->where('order_id', $jobsData['order_id']);

            $jobEmailData = $this->_db->getOne('tms_customer');



            $this->_db->where('iUserId', $jobEmailData['project_manager']);

            $proManagerEmail = $this->_db->getOne('tms_users');





            $jobNo = $jobsData['po_number'];

            $projectName = explode("_", $jobNo)[0];

            $jobLanguage = $jobsData['ItemLanguage'];

            $deadline = $jobsData['due_date'];

            $rejectReason = $jobsData['rejection'];



            $this->_db->where('template_id', 7);

            $emailTemplateAcceptJob = $this->_db->getOne('tms_email_templates');

            $search_array = array("[JOBNO]", "[PROJECTNAME]", '[LANGUAGES]', '[DEADLINE]', '[REJECTREASON]');



            $replace_array = array($jobNo, $projectName, $jobLanguage, $deadline, $rejectReason);



            $html = str_replace($search_array, $replace_array, $emailTemplateAcceptJob['template_content']);

            $subject = $emailTemplateAcceptJob['template_subject'];

            $to = $proManagerEmail['vEmailAddress'];



            $mailSendStatus = $this->sendEmail($to, $subject, $html);

            //Sending Email to manager after job is reject END



            $return['status'] = 200;

            $return['emailSend'] = $mailSendStatus['emailSend'];

            $return['msg'] = 'Successfully Updated.';
        } else {

            $return['status'] = 422;

            $return['msg'] = 'Not Updated.';
        }

        return $return;
    }



    public function getJobsFromTmsSummeryView()
    {

        // $qry = "select tcus.client As Client , tcus.indirect_customer As indirectClient ,tsv.*,tpt.project_name As type FROM tms_summmery_view AS tsv INNER JOIN tms_general AS tg ON tsv.order_id = tg.order_id INNER JOIN tms_project_type AS tpt ON tpt.pr_type_id = tg.project_type INNER JOIN tms_customer As tcus ON tsv.order_id = tcus.order_id";
        //$qry = "select tcus.client As Client , tcus.indirect_customer As indirectClient ,tsv.* FROM tms_summmery_view AS tsv INNER JOIN tms_general AS tg ON tsv.order_id = tg.order_id INNER JOIN tms_customer As tcus ON tsv.order_id = tcus.order_id";
        $qry = "select tcus.client As Client , tcus.indirect_customer As indirectClient ,tsv.*,ti.item_status as scoopitem_status, ti.source_lang AS item_source_lang, ti.target_lang AS item_target_lang, ti.due_date AS item_due_date, tmp.name AS job_type_name, tcus.project_coordinator as project_coordinator_id, tcus.project_manager as project_manager_id, tcus.QA_specialist as qa_specialist_id,tpc.iUserId AS job_manager_id FROM tms_summmery_view AS tsv INNER JOIN tms_general AS tg ON tsv.order_id = tg.order_id INNER JOIN tms_customer As tcus ON tsv.order_id = tcus.order_id INNER JOIN tms_items AS ti ON tsv.order_id = ti.order_id LEFT JOIN tms_users tpc ON tpc.iUserId = tsv.contact_person LEFT JOIN tms_master_price AS tmp ON ti.project_type = tmp.master_price_id WHERE ti.item_number = tsv.item_id";

        $data = $this->_db->rawQuery($qry);

        foreach ($data as $key => $value) {

            if ($value['Client']) {

                $this->_db->where('iClientId', $value['Client']);

                $clientName = $this->_db->getOne('tms_client');

                $data[$key]['Client'] = $clientName['vUserName'];
                $data[$key]['clientlogo'] = $clientName['vLogo'];
            }

            if ($value['indirectClient']) {

                $this->_db->where('iClientId', $value['indirectClient']);

                $IndirectClientName = $this->_db->getOne('tms_client_indirect');

                $data[$key]['indirectClient'] = $IndirectClientName['vUserName'];
            }

            if ($value['resource']) {

                $this->_db->where('iUserId', $value['resource']);

                $resourceName = $this->_db->getOne('tms_users');

                $data[$key]['resource'] = $resourceName ? $resourceName['vUserName'] : '';
            }

            if ($value['contact_person']) {

                $this->_db->where('iUserId', $value['contact_person']);

                $resourceName = $this->_db->getOne('tms_users');

                $data[$key]['contact_person'] = $resourceName ? $resourceName['vUserName'] : '';
            }
        }

        return $data;
    }



    public function assignPoToJob($data, $id)
    {

        $this->_db->where('job_summmeryId', $id);

        $id = $this->_db->update('tms_summmery_view', $data);

        if ($id) {

            $request['status'] = 200;

            $request['msg'] = "Successfully updated";
        } else {

            $request['status'] = 401;

            $request['msg'] = "Not updated";
        }



        return $request;
    }

    public function moveJob($data, $jobSummeryId)
    {

        $this->_db->where('order_id', $data['oId']);

        $this->_db->where('item_id', $data['item_id']);

        if (isset($data['job_id'])) {

            $this->_db->where('job_id', $data['job_id']);
        }

        $result = $this->_db->getOne('tms_summmery_view');



        if (!$result) {

            unset($data['oId']);

            $this->_db->where('job_summmeryId', $jobSummeryId);

            $id = $this->_db->update('tms_summmery_view', $data);

            if ($id) {

                $request['status'] = 200;

                $request['msg'] = "Successfully moved";
            } else {

                $request['status'] = 401;

                $request['msg'] = "Not updated";
            }
        } else {

            $this->_db->where('job_summmeryId', $jobSummeryId);

            $jobSummeryData = $this->_db->getOne('tms_summmery_view');





            if ($jobSummeryData) {

                $request['jobNumber'] = $jobSummeryData['po_number'];
            }

            $request['status'] = 422;

            $request['msg'] = "Job already exits in item.";
        }



        return $request;
    }

    public function saveSortedJobsData($data)
    {

        $this->_db->where('order_id', $data[0][0]['order_id']);

        $found = $this->_db->getOne('tms_summmery_view_sorting');

        if ($found) {

            $save['order_id'] = $data[0][0]['order_id'];

            $save['sorted_json'] = json_encode($data);



            $this->_db->where('id', $found['id']);

            $id = $this->_db->update('tms_summmery_view_sorting', $save);



            if ($id) {

                $request['status'] = 200;

                $request['msg'] = "Successfully Updated";
            } else {

                $request['status'] = 401;

                $request['msg'] = "Not updated";
            }
        } else {

            $save['order_id'] = $data[0][0]['order_id'];

            $save['sorted_json'] = json_encode($data);

            $save['created_date'] = date('Y-m-d H:i:s');



            $id = $this->_db->insert('tms_summmery_view_sorting', $save);

            if ($id) {

                $request['status'] = 200;

                $request['msg'] = "Successfully saved";
            } else {

                $request['status'] = 401;

                $request['msg'] = "Not Saved";
            }
        }



        return $request;
    }

    public function getsaveSortedJobsData($orderId)
    {

        $this->_db->where("order_id", $orderId);

        $data = $this->_db->getOne('tms_summmery_view_sorting');

        $res = [];

        $newArray = [];



        if ($data) {

            $jobs = json_decode($data['sorted_json'], true);

            foreach ($jobs as $key => $value) {

                $res = array_merge($res, $jobs[$key]);
            }

            foreach ($res as $key => $value) {

                $jobId = $value['job_summmeryId'];

                $query = "SELECT tsv.*,tu.vUserName,tu.vEmailAddress,tu.iUserId,tsu.vUserName AS contactPerson,tsu.iUserId AS contactPersonId FROM tms_summmery_view tsv LEFT JOIN tms_users tu on tsv.resource = tu.iUserId LEFT JOIN tms_users tsu on tsv.contact_person = tsu.iUserId WHERE tsv.`job_summmeryId` = $jobId";

                $chk = $this->_db->rawQuery($query);

                if ($chk) {

                    array_push($newArray, $chk[0]);
                }
            }
            //Actual Data from tmsSummery view by orderId

            $qry = "SELECT tsv.*,tu.vUserName,tu.vEmailAddress,tu.iUserId,tsu.vUserName AS contactPerson,tsu.iUserId AS contactPersonId FROM tms_summmery_view tsv LEFT JOIN tms_users tu on tsv.resource = tu.iUserId LEFT JOIN tms_users tsu on tsv.contact_person = tsu.iUserId WHERE tsv.`order_id` = $orderId";

            $actualData = $this->_db->rawQuery($qry);

            if ($actualData) {

                foreach ($res as $aV) {

                    $aTmp1[] = $aV['job_summmeryId'];
                }

                foreach ($actualData as $aV) {

                    $aTmp2[] = $aV['job_summmeryId'];
                }

                $newlyAddedJobs = array_diff($aTmp2, $aTmp1);

                foreach ($newlyAddedJobs as $key => $value) {

                    $jobId = $value;

                    $query = "SELECT tsv.*,tu.vUserName,tu.vEmailAddress,tu.iUserId,tsu.vUserName AS contactPerson,tsu.iUserId AS contactPersonId FROM tms_summmery_view tsv LEFT JOIN tms_users tu on tsv.resource = tu.iUserId LEFT JOIN tms_users tsu on tsv.contact_person = tsu.iUserId WHERE tsv.`job_summmeryId` = $jobId";

                    $row = $this->_db->rawQuery($query);

                    if ($row) {
                        array_push($newArray, $row[0]);
                    }
                }
            } else {

                $newArray = [];
            }
        }





        return $newArray;
    }



    public function sendEmail($to, $subject, $html)
    {

        // Mailjet function
        $send_fn = new functions();
        $mailResponse = $send_fn->send_email_smtp($to, $to_name = '', $cc = '', $bcc = '', $subject, $html, $attachments = '');

        // $this->_mailer = new PHPMailer();
        // $this->_mailer->IsSMTP();
        // $this->_mailer->Host = "ssl://smtp.gmail.com";
        // $this->_mailer->SMTPAuth = "true";
        // $this->_mailer->Port = "465";
        // $this->_mailer->Username = SMTP_EMAIL_USER;
        // $this->_mailer->Password = SMTP_EMAIL_PASSWORD;
        // $this->_mailer->From = "Kanhasoft.com";
        // $this->_mailer->FromName = "TMS Admin";
        // $this->_mailer->Subject = $subject;
        // $this->_mailer->Body = $html;
        // $this->_mailer->WordWrap = 50;
        // $this->_mailer->AddAddress($to);
        // $this->_mailer->IsHTML(true);
        //if ($this->_mailer->Send()) { //output success or failure messages

        if ($mailResponse['status'] == 200) {
            $return['emailSend'] = 'true';
        } else {
            $return['emailSend'] = 'false';
        }
        return $return;
    }

    public function jobSummeryWorkinstructUpdate($id, $data)
    {
        $updt = json_encode($data);
        $this->_db->where('job_summmeryId', $id);
        $id = $this->_db->update('tms_summmery_view', array('work_instruction' => $updt));
        if ($id) {
            $request['status'] = 200;
            $request['msg'] = "Successfully updated";
        } else {
            $request['status'] = 401;
            $request['msg'] = "Not updated";
        }
        return $request;
    }

    public function getJobsAll()
    {
        $qry = "SELECT * FROM `tms_summmery_view` ";
        $data = $this->_db->rawQuery($qry);
        return $data;
    }    

    public function getOneJobsummury($id)
    {
        $this->_db->where('job_summmeryId', $id);
        $data = $this->_db->getOne('tms_summmery_view');
        return $data;
    }

    public function sendPurchaseOrderLinguist($data) {
        $pdf_content = explode("base64,",$data['pdfData']);
        $bin = base64_decode($pdf_content[1], true);
        //$pdfFileName = $data['purchaseOrderNo'].'.pdf';
        $pdfFileName = isset($data['poFilenamePdf']) ? $data['poFilenamePdf'] : 'purchase_order.pdf';
        $resourceName = isset($data['resourceName']) ? $data['resourceName'] : '';
        $bodyTemp = "<p> Hello ".$resourceName." </p>";
        $bodyTemp .= "<p>Please see the attached Purchased Order : <b>" .$pdfFileName. "</b> </p>";
        $bodyTemp .= "<p> From :SpellUp </p>";
        $body = $bodyTemp;
        if(isset($data['mailTextContent'])){
            $body = $data['mailTextContent'];
        }
        //$body .= "welcome to <img src=\"cid:id1\"></br>";
        
        $attachments = '';
        $subject = 'Purchase Order';
        $to_name = '';
        //$to = 'anil.kanhasoft@gmail.com';
        $to = $data['resourceEmail'];

        if($data['pdfData']){
            if ($pdf_content != '') {
                $pdfFileContent = ''; 
                if(is_array($pdf_content)){
                    $pdfFileContent = sizeof($pdf_content)>1 ? $pdf_content[1] : '';
                    // pdf file
                    $attachments =  [[
                        'ContentType' => 'application/pdf',
                        'Filename' => $pdfFileName,
                        'Base64Content' => $pdfFileContent
                    ]]; 
                }
            }    
            
            $send_fn = new functions();
            $mailResponse = $send_fn->send_email_smtp($to, $to_name, $cc='', $bcc='', $subject, $body, $attachments);
            
            if($mailResponse['status'] == 200) {
                if(isset($data['order_id']) && isset($data['item_id'])) {
                    $qry_up = "UPDATE `tms_items` SET `item_status` = '2' WHERE order_id = '".$data['order_id']."' AND item_number = '".$data['item_id']."' AND item_status = '1' ";
                    $this->_db->rawQuery($qry_up);
                }
                if(isset($data['job_summmeryId']) && $data['job_summmeryId'] != '' ) {
                    $qry_up = "UPDATE `tms_summmery_view` SET `item_status` = 'Ongoing' WHERE job_summmeryId = '".$data['job_summmeryId']."' AND `item_status` = 'In preparation' ";
                    $this->_db->rawQuery($qry_up);
                }

                $result['status'] = 200;
                $result['msg'] = 'Thank you for your email';
                return $result;
            } else {
                $result['status'] = 422;
                $result['msg'] = 'Could not send mail!';
                return $result;
            }
        }else{
            return $result['status'] = 422;
        }
    }

}
