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
        $this->_conn = new mysqli(DB_SERVER, DB_USERNAME, DB_PASSWORD, DB_DATABASE);
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
            if ($info['job_id'] == '11') {
                $this->_db->where('item_id', $info['item_id']);
                $this->_db->where('order_id', $info['order_id']);
                $this->_db->orderBy('job_summmeryId', 'DESC');
                $jobAssigned = $this->_db->getOne('tms_summmery_view');
                if (count($jobAssigned) > 0)
                    $info['resource'] = $jobAssigned['resource'];
            }

            $info['created_date'] = date('Y-m-d H:i:s');

            $info['updated_date'] = date('Y-m-d H:i:s');

            if (isset($info['contact_person']) && $info['contact_person'] == '')
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
                if ($info['job_id'] == '11') {
                    // item scoop status QA issues = 11 id
                    $qry_up = "UPDATE tms_items SET `item_status` = '11' WHERE order_id = '" . $info['order_id'] . "' AND item_number = '" . $info['item_id'] . "' ";
                } else {
                    // update item status if status 2 (Ongoing) back to 1 (Assign)
                    $qry_up = "UPDATE tms_items SET `item_status` = '1' WHERE order_id = '" . $info['order_id'] . "' AND item_number = '" . $info['item_id'] . "' AND item_status = '2' ";
                }
                if ($qry_up)
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
        $this->_db->join('tms_items ti', 'ti.order_id = tsv.order_id AND ti.item_number = tsv.item_id ', 'LEFT');
        //$this->_db->join('tms_discussion td', 'td.job_id = tsv.job_summmeryId AND td.externalChat = 1 ', 'LEFT');
        $this->_db->where('tsv.order_id', $id);
        //$this->_db->groupBy('tsv.job_summmeryId');
        $data = $this->_db->get('tms_summmery_view tsv', null, 'tsv.*,concat(tu.vFirstName, " ", tu.vLastName) as vUserName,tu.vProfilePic as resourcePic,tu.iUserId,tsu.vUserName AS contactPerson,tsu.iUserId AS contactPersonId, ti.itemId as scoopID ');
        foreach ($data as &$row) {
            $jobid = $row['job_summmeryId'];
            $discussion = $this->_db->rawQueryNew("select id as discussion_id, job_id as discussion_job_id, read_id as discussionReadId from tms_discussion where externalChat =1 and job_id=$jobid ORDER BY id DESC limit 1  ");
            $discussion = count($discussion)> 0 ? $discussion[0] : [];
            
            if ($discussion) {
                $row['discussion_id'] = $discussion['discussion_id'];
                $row['discussion_job_id'] = $discussion['discussion_job_id'];
                $row['discussionReadId'] = $discussion['discussionReadId'];
            } else {
                $row['discussion_id'] = null;
                $row['discussion_job_id'] = null;
                $row['discussionReadId'] = '';
            }
        }
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
        $this->_db->where('job_summmeryId', $id);
        $jobSummeryData = $this->_db->getOne('tms_summmery_view');

        if ($jobSummeryData) {
            if ($jobSummeryData['resource'] > 0 && $jobSummeryData['item_status'] != 'In preparation') {
                $return['is_delete'] = false;
                $return['status'] = 200;
                $return['msg'] = 'You can not delete. Status is ' . $jobSummeryData['item_status'];
                return $return;
            }
        }

        $invoiceAlreadyAdded = false;

        if ($id) {

            $invoiceRecords = $this->_db->get('tms_invoice');

            foreach ($invoiceRecords as $k => $v) {
                $decodedJobIds = json_decode($v['job_id'], true);
                if (is_array($decodedJobIds)) {
                    foreach ($decodedJobIds as $ke => $val) {
                        $existedJobId = $val['id'];
                        if ($id == $existedJobId) {
                            $invoiceAlreadyAdded = true;
                            break;
                        }
                    }
                }
                // foreach (json_decode($v['job_id'], true) as $ke => $val) {
                //     $existedJobId = $val['id'];
                //     if ($id == $existedJobId) {
                //         $invoiceAlreadyAdded = true;
                //     }
                // }
            }
        }

        if ($invoiceAlreadyAdded) {

            if ($jobSummeryData) {
                $return['jobNumber'] = $jobSummeryData['po_number'];
            }

            $return['is_invoice_exist'] = true;
            $return['status'] = 200;
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
                                @unlink($path . $value['name']);
                            }

                            $in = $filed->filefolderGet($value['fmanager_id'], $id, $externalResourceUserId);
                            foreach ($in as $key => $value) {
                                if (isset($value['ext'])) {
                                    $path = "../../uploads/fileupload/";
                                    $images = glob($path . $value['name']);
                                    if ($images) {
                                        @unlink($path . $value['name']);
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

        $data = $this->_db->get('tms_summmery_view tsv', null, 't2.job_summmeryId AS job_summmeryId1,tsv.job_summmeryId AS job_summmeryId2,t2.per_id AS per_id1,tsv.per_id AS per_id2,t2.order_id AS order_id2,tsv.order_id AS order_id1,t2.item_id AS item_id2,tsv.item_id AS item_id1,t2.job_id AS job_id2,tsv.job_id AS job_id1,t2.job_no AS job_no2,tsv.job_no AS job_no1,t2.job_code AS job_code2,tsv.job_code AS job_code1,t2.order_no AS order_no2,tsv.order_no AS order_no1,t2.due_date AS due_date2,tsv.due_date AS due_date1,t2.item_status AS item_status2,tsv.item_status AS item_status1,t2.company_code AS company_code2,tsv.company_code AS company_code1,concat(tu.vFirstName, " ", tu.vLastName) as vUserName');

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

    public function getJobRequestHistory($id)
    {
        $this->_db->join('tms_users tu', 'tu.iUserId = tjr.user_id', 'LEFT');
        $this->_db->where('job_summmeryId', $id);
        $data = $this->_db->get('tms_job_requests tjr', null, 'tjr.*, CONCAT(tu.vFirstName, " ", tu.vLastName) as resourceName');
        return $data;
    }

    public function allRecordsUpdateSummaryView()
    {
        // Fetch all required fields from tms_summmery_view and join the relevant tables in a single query
        $qry = "SELECT tsv.resource, tu.iUserId, tcu.current_curency_rate 
                FROM tms_summmery_view tsv
                LEFT JOIN tms_users tu ON tu.iUserId = tsv.resource
                LEFT JOIN tms_currency tcu ON SUBSTRING_INDEX(tcu.currency_code, ',', 1) = SUBSTRING_INDEX(tu.freelance_currency, ',', 1)";

        // Fetch all the data
        $data = $this->_db->rawQuery($qry);

        // Iterate through the data and update each record
        foreach ($data as $d) {
            // Prepare the update data
            $updateData = [
                'user_base_currency_rate' => !empty($d['current_curency_rate']) ? $d['current_curency_rate'] : 1
            ];

            // Update the tms_summmery_view table for the corresponding resource
            $this->_db->where('resource', $d['resource']);
            $this->_db->update('tms_summmery_view', $updateData);
        }

        return true;
    }




    public function jobselectContactNameupdate($id, $data)
    {
        if (isset($data['jobSummuryIds'])) {
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
                // New code tp update scoop status to 'Ongoing'
                if (isset($jobsData['order_id']) && isset($jobsData['item_id']) && $data['item_status'] == 'Ongoing') {
                    $qry_on = "UPDATE `tms_items` SET `item_status` = '2' WHERE order_id = '" . $jobsData['order_id'] . "' AND item_number = '" . $jobsData['item_id'] . "' AND (item_status = '1'  OR item_status = '2' OR item_status = '14')";
                    $this->_db->rawQuery($qry_on);
                }

                // Update scoop status to QA Ready
                if (isset($jobsData['order_id']) && isset($jobsData['item_id']) && $data['item_status'] == 'Completed') {


                    //Check if the job is a proofreading job with status 'Completed' or 'Complete'
                    $this->_db->where('order_id', $jobsData['order_id']);
                    $this->_db->where('item_id', $jobsData['item_id']);
                    $this->_db->where('job_id', 10);
                    //$this->_db->where('item_status', ['Completed', 'Complete'], 'IN');
                    $isProofReadingJob = $this->_db->getOne('tms_summmery_view');
                    $isScoopStatusUpdate = $isProofReadingJob && $isProofReadingJob['item_status'] != 'Completed' ? false : true ;

                    if($isScoopStatusUpdate ){
                        //$qry_up = "UPDATE `tms_items` SET `item_status` = '10' WHERE order_id = '" . $jobsData['order_id'] . "' AND item_number = '" . $jobsData['item_id'] . "' AND item_status NOT IN (3,4,5,6) ";
                        $qry_up = "
                                UPDATE `tms_items`
                                SET `item_status` = '10'
                                WHERE `order_id` = '" . $jobsData['order_id'] . "'
                                AND `item_number` = '" . $jobsData['item_id'] . "'
                                AND `item_status` NOT IN (3, 4, 5, 6, 7)
                            ";    
                        $this->_db->rawQuery($qry_up);
                    }

                    // check for purchase order
                    $qry = "SELECT tsv.job_summmeryId, tsv.order_id, tsv.item_id, tsv.resource, tsv.po_number, tu.vEmailAddress, tu.vFirstName, tu.vLastName from tms_summmery_view as tsv LEFT JOIN tms_users as tu ON tsv.resource = tu.iUserId WHERE tsv.job_summmeryId != " . $id . " AND tsv.order_id = " . $jobsData['order_id'] . " AND tsv.item_id = " . $jobsData['item_id'] . " AND tsv.item_status = 'In preparation'  AND tsv.resource > 0 AND tsv.isPoSent != 1  ORDER BY tsv.job_summmeryId ASC";
                    $scoopJoblist = $this->_db->rawQuery($qry);
                    if (count($scoopJoblist) > 0 && $scoopJoblist[0]['resource']) {
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

            $sql = "SELECT tcu.current_curency_rate
            FROM tms_summmery_view tsv
            LEFT JOIN tms_users tu ON tu.iUserId = tsv.resource
            LEFT JOIN tms_currency tcu ON SUBSTRING_INDEX(tcu.currency_code, ',', 1) = SUBSTRING_INDEX(tu.freelance_currency, ',', 1)
            WHERE tsv.resource = " . $data['resource'] . " LIMIT 1";
            $base_currency_rate = $this->_db->rawQuery($sql, $data['resource']);

            $data['user_base_currency_rate'] = !empty($base_currency_rate[0]['current_curency_rate'])
                ? $base_currency_rate[0]['current_curency_rate']
                : 1;

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
        $acceptLink = '<a href="' . SITE_URL . '#/job-accept/' . $urlSlug . '" target="blank" style="padding: 7px 7px; background: green; border-radius: 5px; color: white;"> Accept Job </a>';

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

        $data = $this->_db->getone('tms_proj_language');

        return $data;
    }



    public function jobSummeryDetailsGet($id)
    {

        //$this->_db->get('')
        //$qry = "select tsv.*,tsv.description As jobDesc,tg.due_date AS ProjectDueDate,tg.order_no AS company_code, tf.fmanager_id, CONCAT(ti.source_lang,'>',ti.target_lang) AS ItemLanguage, ti.item_name AS description, ti.project_type, ti.source_lang as scoop_source_lang, ti.target_lang as scoop_target_lang, tu.vUserName As userName,tpc.vUserName AS contactPerson, tg.project_name projectName,tg.specialization as proj_specialization,tpt.project_name as project_type_name, tpm.vUserName projectManager, tu.freelance_currency, tcl.vUserName as clientName, tcl.vCenterid  from tms_summmery_view AS tsv INNER JOIN tms_general AS tg ON tsv.order_id = tg.order_id INNER JOIN tms_filemanager AS tf ON tsv.job_summmeryId = tf.job_id LEFT JOIN tms_items AS ti ON tsv.order_id = ti.order_id AND tsv.item_id = ti.item_number LEFT JOIN tms_proj_language AS tpl ON ti.item_language = tpl.pl_id LEFT JOIN tms_users AS tu ON tsv.resource = tu.iUserId LEFT JOIN tms_users tpc ON tpc.iUserId = tsv.contact_person INNER JOIN tms_customer tc ON tc.order_id = tsv.order_id INNER JOIN tms_users tpm ON tpm.iUserId = tc.project_manager LEFT JOIN tms_project_type AS tpt ON ti.project_type = tpt.pr_type_id LEFT JOIN tms_client tcl ON tcl.iClientId = tc.client WHERE tsv.job_summmeryId = '" . $id . "'";
        //$qry = "SELECT tsv.*, tsv.description AS jobDesc, tg.due_date AS ProjectDueDate, tg.order_no AS company_code, tf.fmanager_id, CONCAT( ti.source_lang, '>', ti.target_lang ) AS ItemLanguage, ti.item_name AS description, ti.project_type, ti.source_lang AS scoop_source_lang, ti.target_lang AS scoop_target_lang, concat(tu.vFirstName, ' ', tu.vLastName) AS userName, tpc.vUserName AS contactPerson, tg.project_name projectName, tg.specialization AS proj_specialization, tpt.project_name AS project_type_name, tpm.vUserName projectManager, tu.freelance_currency, tcl.vUserName AS clientName, tcl.vCenterid, tic.vUserName as clientAccountName FROM tms_summmery_view AS tsv INNER JOIN tms_general AS tg ON tsv.order_id = tg.order_id INNER JOIN tms_filemanager AS tf ON tsv.job_summmeryId = tf.job_id LEFT JOIN tms_items AS ti ON tsv.order_id = ti.order_id AND tsv.item_id = ti.item_number LEFT JOIN tms_proj_language AS tpl ON ti.item_language = tpl.pl_id LEFT JOIN tms_users AS tu ON tsv.resource = tu.iUserId LEFT JOIN tms_users tpc ON tpc.iUserId = tsv.contact_person INNER JOIN tms_customer tc ON tc.order_id = tsv.order_id LEFT JOIN tms_client_indirect tic ON tc.indirect_customer = tic.vClientNumber INNER JOIN tms_users tpm ON tpm.iUserId = tc.project_manager LEFT JOIN tms_project_type AS tpt ON ti.project_type = tpt.pr_type_id LEFT JOIN tms_client tcl ON tcl.iClientId = tc.client WHERE tsv.job_summmeryId = '" . $id . "'";
        $qry = "SELECT tsv.*, tsv.description AS jobDesc, tg.due_date AS ProjectDueDate, tg.order_no AS company_code, tf.fmanager_id, CONCAT( ti.source_lang, '>', ti.target_lang ) AS ItemLanguage, ti.item_name AS description, ti.project_type, ti.source_lang AS scoop_source_lang, ti.target_lang AS scoop_target_lang, concat(tu.vFirstName, ' ', tu.vLastName) AS userName, tpc.vUserName AS contactPerson, tg.project_name projectName, tg.specialization AS proj_specialization, tpt.project_name AS project_type_name, tpm.vUserName projectManager, tu.freelance_currency, tcl.vUserName AS clientName, tcl.vCenterid, tic.vUserName as clientAccountName FROM tms_summmery_view AS tsv INNER JOIN tms_general AS tg ON tsv.order_id = tg.order_id INNER JOIN tms_filemanager AS tf ON tsv.job_summmeryId = tf.job_id LEFT JOIN tms_items AS ti ON tsv.order_id = ti.order_id AND tsv.item_id = ti.item_number LEFT JOIN tms_proj_language AS tpl ON ti.item_language = tpl.pl_id LEFT JOIN tms_users AS tu ON tsv.resource = tu.iUserId LEFT JOIN tms_users tpc ON tpc.iUserId = tsv.contact_person INNER JOIN tms_customer tc ON tc.order_id = tsv.order_id LEFT JOIN tms_client_indirect tic ON tc.indirect_customer = tic.iClientId INNER JOIN tms_users tpm ON tpm.iUserId = tc.project_manager LEFT JOIN tms_project_type AS tpt ON ti.project_type = tpt.pr_type_id LEFT JOIN tms_client tcl ON tcl.iClientId = tc.client WHERE tsv.job_summmeryId = '" . $id . "'";
        $data = $this->_db->rawQuery($qry);

        $qry = 'SELECT * FROM tms_invoice WHERE JSON_CONTAINS(job_id, \'{"id": ' . $id . '}\', "$")';
        $data['checkInvoice'] = $this->_db->rawQuery($qry);

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
        $info = $this->_db->update('tms_summmery_view', array('auto_job' => '0'));
        return $info;
    }

    public function jobSummeryDetailsAutoChangeoff($orderId, $autoId)
    {
        $this->_db->where('job_summmeryId', $orderId);
        $info = $this->_db->update('tms_summmery_view', array('auto_job' => $autoId));
        return $info;
    }



    public function jobSummeryDetailsUpdate($id, $data)
    {
        $this->_db->where('template_id', 11);
        $emailTemplateRegistration = $this->_db->getOne('tms_email_templates');
        $search_array = array("[JOBNO]", "[LANGUAGES]", '[JOBSTATUS]', '[DUEDATE]', '[ACCEPTLINK]', '[REJECTLINK]', '[JOBDETAILS]');

        $this->_db->where('job_summmeryId', $id);
        $jobDetails = $this->_db->getone('tms_summmery_view');

        if (isset($jobDetails['po_number']))
            $jobnumber = $jobDetails['po_number'];
        else
            $jobnumber = " ";
        if (isset($jobDetails['due_date']))
            $duedate = $jobDetails['due_date'];
        else
            $duedate = " ";
        if (isset($jobDetails['ItemLanguage']))
            $langPair = $jobDetails['ItemLanguage'];
        else
            $langPair = " ";

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
        $urlSlugJobdetail = base64_encode("jobId=$jobId&userId=$resource&jobDetails=1");
        $urlSlugAc = base64_encode("jobId=$jobId&userId=$resource&accept=1");
        $urlSlugRej = base64_encode("jobId=$jobId&userId=$resource&reject=1");
        $jobDetailsLink = '<a href="' . SITE_URL . '#/job-accept/' . $urlSlugJobdetail . '" target="blank" style="padding: 7px 7px; background: green; border-radius: 5px; color: white;"> Job Details </a>';
        $acceptLink = '<a href="' . SITE_URL . '#/job-accept/' . $urlSlugAc . '" target="blank" style="padding: 7px 7px; background: green; border-radius: 5px; color: white;"> Accept Job </a>';
        $rejectLink = '<a href="' . SITE_URL . '#/job-accept/' . $urlSlugRej . '" target="blank" style="padding: 7px 7px; background: red; border-radius: 5px; color: white;"> Reject Job </a>';

        // $body = "<p>Please login to account accept.</p>";
        // $body .= "<p>Job No. : " . $jobnumber . ",</p>";
        // $body .= "<p>Due Date : " . $duedate . ",</p>";
        // $body .= "<p>job Status : " . $itemStatus . ",</p>";
        // $body .= "<p> click here to accept the job <br>" . $acceptLink . "</p>";

        $replace_array = array($jobnumber, $langPair, $itemStatus, $duedate, $acceptLink, $rejectLink, $jobDetailsLink);
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
        $this->_db->where('template_id', 11);
        $emailTemplateRegistration = $this->_db->getOne('tms_email_templates');
        $search_array = array("[JOBNO]", "[LANGUAGES]", '[JOBSTATUS]', '[DUEDATE]', '[ACCEPTLINK]', '[REJECTLINK]', '[JOBDETAILS]');

        if (isset($data['id'])) {
            $this->_db->where('job_summmeryId', $data['id']);
            $jobDetails = $this->_db->getone('tms_summmery_view');

            $jobnumber = isset($jobDetails['po_number']) ? $jobDetails['po_number'] : '';
            if (isset($jobDetails['due_date'])) {
                $format = 'Y-m-d H:i:s';
                $due_date = $jobDetails['due_date'] ?? '';

                $datetime = DateTime::createFromFormat($format, $due_date);
                $duedateFrmt = ($datetime && $datetime->format($format) === $due_date) ? $datetime->format('d.m.Y H:i') : '';

                $duedate = $duedateFrmt ?? '';
            } else {
                $duedate = '';
            }

            if (isset($jobDetails['ItemLanguage']))
                $langPair = $jobDetails['ItemLanguage'];
            else
                $langPair = " ";

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
                    $urlSlugJobdetail = base64_encode("jobId=$jobId&userId=$val&jobDetails=1");
                    $urlSlugAc = base64_encode("jobId=$jobId&userId=$val&accept=1");
                    $urlSlugRej = base64_encode("jobId=$jobId&userId=$val&reject=1");
                    $jobDetailsLink = '<a href="' . SITE_URL . '#/job-accept/' . $urlSlugJobdetail . '" target="blank" style="padding: 7px 7px; background: green; border-radius: 5px; color: white;"> Job Details </a>';
                    $acceptLink = '<a href="' . SITE_URL . '#/job-accept/' . $urlSlugAc . '" target="blank" style="padding: 7px 7px; background: green; border-radius: 5px; color: white;"> Accept Job </a>';
                    $rejectLink = '<a href="' . SITE_URL . '#/job-accept/' . $urlSlugRej . '" target="blank" style="padding: 7px 7px; background: red; border-radius: 5px; color: white;"> Reject Job </a>';

                    if (isset($freelaceremail['vEmailAddress'])) {
                        $to = $freelaceremail['vEmailAddress'];
                        // Message
                        // $body = "<p> Please login to account accept Or Click on below link.</p>";
                        // $body .= "<p>Job No. : " . $jobnumber . ",</p>";
                        // $body .= "<p>Language Pair. : " . $langPair . ",</p>";
                        // $body .= "<p>Due Date : " . $duedate . ",</p>";
                        // $body .= "<p>job Status : " . $itemStatus . ",</p>";
                        // $body .= "<p> click here to accept the job <br><br>" . $acceptLink . "</p>";
                        // $body .= "<p> click here to reject the job <br><br>" . $rejectLink . "</p>";

                        $replace_array = array($jobnumber, $langPair, $itemStatus, $duedate, $acceptLink, $rejectLink, $jobDetailsLink);
                        $body = str_replace($search_array, $replace_array, $emailTemplateRegistration['template_content']);

                        $subject = isset($data['data']['subject']) ? $data['data']['subject'] : "Job Request";

                        $attachments = '';
                        $to_name = '';

                        $send_fn = new functions();
                        $mailResponse = $send_fn->send_email_smtp($to, $to_name, $cc = '', $bcc = '', $subject, $body, $attachments);

                        //save job request mail history
                        $save['job_summmeryId'] = $jobId;
                        $save['user_id'] = $val;
                        $save['subject'] = isset($data['data']['subject']) ? $data['data']['subject'] : "Job Request";
                        ;
                        $save['created_date'] = date('Y-m-d H:i:s');
                        $save['updated_date'] = date('Y-m-d H:i:s');
                        $id = $this->_db->insert('tms_job_requests', $save);
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
        } else {
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
                $dataUp['request_rejected_ids'] = $jobDetails && isset($jobDetails['request_rejected_ids']) && $jobDetails['request_rejected_ids'] != '' ? $jobDetails['request_rejected_ids'] . ',' . $data['resourceId'] : $data['resourceId'];
            }
            $this->_db->where('job_summmeryId', $data['jobId']);
            $updt = $this->_db->update('tms_summmery_view', $dataUp);

            //if($mailResponse['status'] == 200) {
            if ($updt) {
                $return['status'] = 200;
                $return['jobAccept'] = $data['jobAccept'];
                $return['msg'] = 'Successfully Updated.';
            }
        } else {
            $return['status'] = 422;
            $return['msg'] = 'Not Updated.';
        }

        return $return;
    }



    public function jobSummeryJobDetailsUpdate($id, $data)
    {
        unset($data['auto_job'], $data['fmanager_id'], $data['userName'], $data['contactPerson'], $data['projectName'], $data['projectManager'], $data['project_type_name'], $data['clientAccountName'], $data['project_type'], $data['proj_specialization'], $data['scoop_source_lang'], $data['scoop_target_lang'] );
        //unset($data['quantity'],$data['itemPrice']);
        // if (isset($data['proj_specialization'])) {
        //     unset($data['proj_specialization']);
        // }
        // if (isset($data['scoop_source_lang']))
        //     unset($data['scoop_source_lang']);
        // if (isset($data['scoop_target_lang']))
        //     unset($data['scoop_target_lang']);

        if (isset($data['due_date'])) {
            $data['due_date'] = date('Y-m-d H:i:s', strtoTime($data['due_date']));
        }
        if (isset($data['resource'])) {
            $explR = explode(",", $data['resource']);
            $data['resource'] = $explR[count($explR) - 1];
        }

        $data['updated_date'] = date('Y-m-d H:i:s');

        $data['user_base_currency_rate'] = 1;
        if (isset($data['resource']) && $data['resource'] > 0) {
            $sql = "SELECT tcu.current_curency_rate
                    FROM tms_summmery_view tsv
                    LEFT JOIN tms_users tu ON tu.iUserId = tsv.resource
                    LEFT JOIN tms_currency tcu ON SUBSTRING_INDEX(tcu.currency_code, ',', 1) = SUBSTRING_INDEX(tu.freelance_currency, ',', 1)
                    WHERE tsv.resource = " . $data['resource'] . " LIMIT 1";
            $base_currency_rate = $this->_db->rawQuery($sql, $data['resource']);

            $data['user_base_currency_rate'] = !empty($base_currency_rate[0]['current_curency_rate'])
                ? $base_currency_rate[0]['current_curency_rate']
                : 1;
        }
        
        //if ($update && isset($data['order_id'])) {
            // $qry = "SELECT count(*) as count FROM tms_summmery_view WHERE order_id = '".$data['order_id']."' AND item_id = '".$data['item_id']."' AND resource = '' ";
            // $res_exist = $this->_db->rawQuery($qry);
            // if ($res_exist && $res_exist[0]['count'] == 0) {
            //     $qry_up = "UPDATE `tms_items` SET `item_status` = '2' WHERE order_id = '".$data['order_id']."' AND item_number = '".$data['item_id']."' AND item_status = '1' ";
            //     $this->_db->rawQuery($qry_up);
            // }
        //}
        $invoiceCreated = 'SELECT * FROM tms_invoice WHERE JSON_CONTAINS(job_id, \'{"id": ' . $id . '}\', "$")';
        $checkInvoiceExist = $this->_db->rawQuery($invoiceCreated);
        
        if (!empty($checkInvoiceExist)) {
            // Invoice exists
            $return['status'] = 200;
            $return['is_invoice_exist'] = 1;
            $return['msg'] = 'Invoice already exists.';
        } else {
            // Invoice doesn't exist, proceed to update
            $this->_db->where('job_summmeryId', $id);
            $update = $this->_db->update('tms_summmery_view', $data);
        
            if ($update) {
                
                if (isset($data['item_status']) && $data['item_status'] == 'Completed' ) {
                    $this->_db->where('order_id', $data['order_id'] );
                    $this->_db->where('item_id', $data['item_id'] );
                    $this->_db->where('job_id', 10);
                    //$this->_db->where('item_status', ['Completed', 'Complete'], 'IN');
                    $isProofReadingJob = $this->_db->getOne('tms_summmery_view');
                    $isScoopStatusUpdate = $isProofReadingJob && $isProofReadingJob['item_status'] != 'Completed' ? false : true ;

                    if($isScoopStatusUpdate ){
                        $qry_up = "UPDATE `tms_items` SET `item_status` = '10' WHERE order_id = '" . $data['order_id'] . "' AND item_number = '" . $data['item_id'] . "' AND item_status NOT IN (3,4,5,6,7) ";
                        $this->_db->rawQuery($qry_up);
                    }
                }
                
                $return['status'] = 200;
                $return['msg'] = 'Successfully Updated.';
            } else {
                $return['status'] = 422;
                $return['msg'] = 'Not Updated.';
            }
        
            // Always return this key for consistency
            $return['is_invoice_exist'] = 0;
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
        }
        ;

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

        $data = $this->_db->getOne('tms_items');

        if ($data) {

            $this->_db->where('item_id', $data['item_number']);

            $this->_db->where('order_id', $orderId);

            $info = $this->_db->get('tms_summmery_view');
        } else {

            $info = "";
        }

        return $info;
    }



    public function autostatusUpdate($ItemId, $status, $orderId)
    {

        $this->_db->where('itemId', $ItemId);

        $data = $this->_db->getOne('tms_items');

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

        $data = $this->_db->getOne('tms_users');

        return $data['iUserId'];
    }



    public function jobItemIconsetdata($id, $orderId)
    {

        $this->_db->where('order_id', $orderId);

        $this->_db->where('item_id', $id);

        $data = $this->_db->getOne('tms_summmery_view');
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

        if ($data && isset($data['acceptJobType']) && $data['acceptJobType'] == 'accept') {
            $loginUserId = $data && isset($data['userId']) ? $data['userId'] : 0;
            $data['accept'] = $loginUserId;
            $data['resource'] = $loginUserId;
            unset($data['userId']);
            unset($data['acceptJobType']);
        }
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

                // temp stop email sending
                //$mailSendStatus = $this->sendEmail($to, $subject, $html);
                $mailSendStatus['emailSend'] = "true";

                //Sending Email to manager after job is Delivered END
                // Update status to QA Ready
                if (isset($jobsData['order_id']) && isset($jobsData['item_id'])) {

                    //Check if the job is a proofreading job with status 'Completed' or 'Complete'
                    $this->_db->where('order_id', $jobsData['order_id']);
                    $this->_db->where('item_id', $jobsData['item_id']);
                    $this->_db->where('job_id', 10);
                    //$this->_db->where('item_status', ['Completed', 'Complete'], 'IN');
                    $isProofReadingJob = $this->_db->getOne('tms_summmery_view');
                    $isScoopStatusUpdate = $isProofReadingJob && $isProofReadingJob['item_status'] != 'Completed' ? false : true ;

                    if($isScoopStatusUpdate ){
                        $qry_up = "UPDATE `tms_items` SET `item_status` = '10' WHERE order_id = '" . $jobsData['order_id'] . "' AND item_number = '" . $jobsData['item_id'] . "' AND item_status NOT IN (3,4,5,6,7) ";
                        $this->_db->rawQuery($qry_up);
                        }
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

        // $data['updated_date'] = date('Y-m-d H:i:s');
        // $data['item_status'] = 'In preparation';
        // $this->_db->where('job_summmeryId', $id);
        // $data = $this->_db->update('tms_summmery_view', $data);

        if ($id) {
            //Sending Email to manager after job is reject START
            $this->_db->where('job_summmeryId', $id);
            $jobsData = $this->_db->getOne('tms_summmery_view');

            $loginUserId = $data && isset($data['userId']) ? $data['userId'] : $jobsData['resource'];
            $rejectedId = $jobsData && isset($jobsData['request_rejected_ids']) && $jobsData['request_rejected_ids'] != '' ? $jobsData['request_rejected_ids'] . ',' . $data['userId'] : $data['userId'];

            if ($jobsData) {
                $sendRequest = explode(",", $jobsData['send_request']);
                $requestRejectedIds = explode(",", $jobsData['request_rejected_ids']);
                if (count($sendRequest) > 1 && count($requestRejectedIds) > 1) {
                    if (empty(array_diff($sendRequest, $requestRejectedIds)))
                        $data['item_status'] = 'In preparation';
                }
            }

            $data['updated_date'] = date('Y-m-d H:i:s');
            $data['request_rejected_ids'] = $rejectedId;
            unset($data['userId']);

            $this->_db->where('job_summmeryId', $id);
            $data = $this->_db->update('tms_summmery_view', $data);

            //$this->_db->where('iUserId', $jobsData['resource']);
            $this->_db->where('iUserId', $loginUserId);
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

    public function getJobsFromTmsSummeryViewSearch($data)
    {
        if (!empty($data)) {
            $qry_invc = " AND (tsv.resource = '" . $data['user_id'] . "' 
                        AND tsv.item_status = '" . $data['searchValue'] . "'
                        )";
        }


        $qry = "SELECT tcus.client AS Client, tcus.indirect_customer AS indirectClient, tsv.*, tsv.item_status AS jobStatus, ti.item_status AS scoopitem_status, ti.source_lang AS item_source_lang, ti.target_lang AS item_target_lang, ti.due_date AS item_due_date, tjb.service_name AS job_type_name, tcus.project_coordinator AS project_coordinator_id, tcus.project_manager AS project_manager_id, tcus.QA_specialist AS qa_specialist_id, tpc.iUserId AS job_manager_id, tc.vUserName AS clientName, tc.vLogo AS clientLogo, tic.vUserName AS indirectClientName, tu.vFirstName AS resourceFirstName, tu.vLastName AS resourceLastName, tu2.vFirstName AS contactFirstName, tu2.vLastName AS contactLastName FROM tms_summmery_view AS tsv INNER JOIN tms_general AS tg ON tsv.order_id = tg.order_id INNER JOIN tms_customer AS tcus ON tsv.order_id = tcus.order_id INNER JOIN tms_items AS ti ON tsv.order_id = ti.order_id LEFT JOIN tms_users tpc ON tpc.iUserId = tsv.contact_person LEFT JOIN tms_jobs AS tjb ON tsv.job_id = tjb.job_id LEFT JOIN tms_client AS tc ON tcus.client = tc.iClientId LEFT JOIN tms_client_indirect AS tic ON tcus.indirect_customer = tic.iClientId LEFT JOIN tms_users AS tu ON tsv.resource = tu.iUserId LEFT JOIN tms_users AS tu2 ON tsv.contact_person = tu2.iUserId WHERE ti.item_number = tsv.item_id" . $qry_invc;

        $data1 = $this->_db->rawQuery($qry);

        foreach ($data1 as &$row) {
            $row['Client'] = isset($row['clientName']) ? $row['clientName'] : '';
            $row['clientlogo'] = isset($row['clientLogo']) ? $row['clientLogo'] : '';
            $row['indirectClient'] = isset($row['indirectClientName']) ? $row['indirectClientName'] : '';
            $row['resource'] = isset($row['resourceFirstName']) ? $row['resourceFirstName'] . " " . $row['resourceLastName'] : '';
            $row['resourceId'] = isset($row['resource']) ? $row['resource'] : '';
            $row['contact_person'] = isset($row['contactFirstName']) ? $row['contactFirstName'] . " " . $row['contactLastName'] : '';
        }

        return $data1;
    }


    public function getJobsFromTmsSummeryView()
    {
        $qry = "SELECT tcus.client AS Client, tcus.indirect_customer AS indirectClient, tsv.*, tsv.item_status AS jobStatus, ti.item_status AS scoopitem_status, ti.source_lang AS item_source_lang, ti.target_lang AS item_target_lang, ti.due_date AS item_due_date, tjb.service_name AS job_type_name, tcus.project_coordinator AS project_coordinator_id, tcus.project_manager AS project_manager_id, tcus.QA_specialist AS qa_specialist_id, tpc.iUserId AS job_manager_id, tc.vUserName AS clientName, tc.vLogo AS clientLogo, tic.vUserName AS indirectClientName, tu.vFirstName AS resourceFirstName, tu.vLastName AS resourceLastName, tu2.vFirstName AS contactFirstName, tu2.vLastName AS contactLastName FROM tms_summmery_view AS tsv INNER JOIN tms_general AS tg ON tsv.order_id = tg.order_id INNER JOIN tms_customer AS tcus ON tsv.order_id = tcus.order_id INNER JOIN tms_items AS ti ON tsv.order_id = ti.order_id LEFT JOIN tms_users tpc ON tpc.iUserId = tsv.contact_person LEFT JOIN tms_jobs AS tjb ON tsv.job_id = tjb.job_id LEFT JOIN tms_client AS tc ON tcus.client = tc.iClientId LEFT JOIN tms_client_indirect AS tic ON tcus.indirect_customer = tic.iClientId LEFT JOIN tms_users AS tu ON tsv.resource = tu.iUserId LEFT JOIN tms_users AS tu2 ON tsv.contact_person = tu2.iUserId WHERE ti.item_number = tsv.item_id";

        $data = $this->_db->rawQuery($qry);

        foreach ($data as &$row) {
            $row['Client'] = isset($row['clientName']) ? $row['clientName'] : '';
            $row['clientlogo'] = isset($row['clientLogo']) ? $row['clientLogo'] : '';
            $row['indirectClient'] = isset($row['indirectClientName']) ? $row['indirectClientName'] : '';
            $row['resource'] = isset($row['resourceFirstName']) ? $row['resourceFirstName'] . " " . $row['resourceLastName'] : '';
            $row['resourceId'] = isset($row['resource']) ? $row['resource'] : '';
            $row['contact_person'] = isset($row['contactFirstName']) ? $row['contactFirstName'] . " " . $row['contactLastName'] : '';
        }

        return $data;
    }
    public function getJobsFromTmsSummeryView__()
    {
        // $qry = "select tcus.client As Client , tcus.indirect_customer As indirectClient ,tsv.*,tpt.project_name As type FROM tms_summmery_view AS tsv INNER JOIN tms_general AS tg ON tsv.order_id = tg.order_id INNER JOIN tms_project_type AS tpt ON tpt.pr_type_id = tg.project_type INNER JOIN tms_customer As tcus ON tsv.order_id = tcus.order_id";
        //$qry = "select tcus.client As Client , tcus.indirect_customer As indirectClient ,tsv.* FROM tms_summmery_view AS tsv INNER JOIN tms_general AS tg ON tsv.order_id = tg.order_id INNER JOIN tms_customer As tcus ON tsv.order_id = tcus.order_id";
        //$qry = "select tcus.client As Client , tcus.indirect_customer As indirectClient ,tsv.*,tsv.item_status as jobStatus, ti.item_status as scoopitem_status, ti.source_lang AS item_source_lang, ti.target_lang AS item_target_lang, ti.due_date AS item_due_date, tmp.name AS job_type_name, tcus.project_coordinator as project_coordinator_id, tcus.project_manager as project_manager_id, tcus.QA_specialist as qa_specialist_id,tpc.iUserId AS job_manager_id FROM tms_summmery_view AS tsv INNER JOIN tms_general AS tg ON tsv.order_id = tg.order_id INNER JOIN tms_customer As tcus ON tsv.order_id = tcus.order_id INNER JOIN tms_items AS ti ON tsv.order_id = ti.order_id LEFT JOIN tms_users tpc ON tpc.iUserId = tsv.contact_person LEFT JOIN tms_master_price AS tmp ON ti.project_type = tmp.master_price_id WHERE ti.item_number = tsv.item_id";
        $qry = "SELECT tcus.client AS Client, tcus.indirect_customer AS indirectClient, tsv.*, tsv.item_status AS jobStatus, ti.item_status AS scoopitem_status, ti.source_lang AS item_source_lang, ti.target_lang AS item_target_lang, ti.due_date AS item_due_date, tjb.service_name AS job_type_name, tcus.project_coordinator AS project_coordinator_id, tcus.project_manager AS project_manager_id, tcus.QA_specialist AS qa_specialist_id, tpc.iUserId AS job_manager_id FROM tms_summmery_view AS tsv INNER JOIN tms_general AS tg ON tsv.order_id = tg.order_id INNER JOIN tms_customer AS tcus ON tsv.order_id = tcus.order_id INNER JOIN tms_items AS ti ON tsv.order_id = ti.order_id LEFT JOIN tms_users tpc ON tpc.iUserId = tsv.contact_person LEFT JOIN tms_jobs AS tjb ON tsv.job_id = tjb.job_id WHERE ti.item_number = tsv.item_id";
        $data = $this->_db->rawQuery($qry);

        foreach ($data as $key => $value) {
            if ($value['Client']) {
                $this->_db->where('iClientId', $value['Client']);
                $clientName = $this->_db->getOne('tms_client');
                $data[$key]['Client'] = isset($clientName['vUserName']) ? $clientName['vUserName'] : '';
                $data[$key]['clientlogo'] = isset($clientName['vLogo']) ? $clientName['vLogo'] : '';
            }
            if ($value['indirectClient']) {
                $this->_db->where('iClientId', $value['indirectClient']);
                $IndirectClientName = $this->_db->getOne('tms_client_indirect');
                $data[$key]['indirectClient'] = isset($IndirectClientName['vUserName']) ? $IndirectClientName['vUserName'] : '';
            }
            if ($value['resource']) {
                $this->_db->where('iUserId', $value['resource']);
                $resourceData = $this->_db->getOne('tms_users');
                $data[$key]['resource'] = $resourceData ? $resourceData['vFirstName'] . " " . $resourceData['vLastName'] : '';
                $data[$key]['resourceId'] = isset($value['resource']) ? $value['resource'] : '';
            }
            if ($value['contact_person']) {
                $this->_db->where('iUserId', $value['contact_person']);
                $resourceName = $this->_db->getOne('tms_users');
                $data[$key]['contact_person'] = $resourceName ? $resourceName['vFirstName'] . " " . $resourceName['vLastName'] : '';
            }
        }

        return $data;
    }

    public function getJobsFromTmsSummeryViewDashboard()
    {
        $perPage = isset($_GET['perPage']) ? intval($_GET['perPage']) : 10;
        $currentPage = isset($_GET['page']) ? intval($_GET['page']) : 1;
        $offset = ($currentPage - 1) * $perPage;
        $whereCond = '';
        $totalCount = 0;

        $tabName = isset($_GET['tabName']) ? $_GET['tabName'] : '';
        if ($tabName != '') {

            if ($tabName == 'DueToday') {
                $whereCond = "  AND DATE(tsv.due_date) = CURDATE() AND tsv.item_status IN ('Delivered','Completed','Paid','Invoice Ready','Invoice Accepted','Invoiced','Cancelled') ";
            }
            if ($tabName == 'DueTomorrow') {
                $whereCond = "  AND DATE(tsv.due_date) = CURDATE() + INTERVAL 1 DAY AND tsv.item_status IN ('Delivered','Completed','Paid','Invoice Ready','Invoice Accepted','Invoiced','Cancelled')  ";
            }
            if ($tabName == 'Overdue') {
                $whereCond = "  AND DATE(tsv.due_date) < CURDATE() AND tsv.item_status IN ('In preparation','Requested','Assigned-waiting','Waiting','In-progress','Ongoing') ";
                // alternate 1
                // $this->_db->where('DATE(tsv.due_date) < CURDATE() AND tsv.item_status IN ("In preparation","Requested","Assigned-waiting","Waiting","In-progress","Ongoing")');
                // $qry_job = $this->_db->get('tms_summmery_view AS tsv', null);
                // $totalCount = (isset($qry_job) && !empty($qry_job)) ? count($qry_job) : 0;

                // alternate 2
                // $sql = "SELECT COUNT(*) AS totalItems FROM tms_summmery_view AS tsv INNER JOIN tms_general AS tg ON tsv.order_id = tg.order_id INNER JOIN tms_customer AS tcus ON tsv.order_id = tcus.order_id INNER JOIN tms_items AS ti ON tsv.order_id = ti.order_id LEFT JOIN tms_users tpc ON tpc.iUserId = tsv.contact_person LEFT JOIN tms_jobs AS tjb ON tsv.job_id = tjb.job_id LEFT JOIN tms_client AS tc ON tcus.client = tc.iClientId LEFT JOIN tms_client_indirect AS tic ON tcus.indirect_customer = tic.iClientId LEFT JOIN tms_users AS tu ON tsv.resource = tu.iUserId LEFT JOIN tms_users AS tu2 ON tsv.contact_person = tu2.iUserId WHERE ti.item_number = tsv.item_id $whereCond ";
                // $stmt = $this->_conn->prepare($sql);
                // $stmt->execute();
                // $get_query = $stmt->get_result();
                // $results_count = $get_query->fetch_all(MYSQLI_ASSOC);
                // $totalCount = count($results_count);
            }
            if ($tabName == 'inProgress') {
                $whereCond = "   AND tsv.item_status IN ('In-progress', 'Ongoing') ";
            }
            if ($tabName == 'Requested') {
                $whereCond = "  AND tsv.item_status = 'Requested' ";
            }
            //$currentPage = 0;
        }

        $search = isset($_GET['search']) ? $_GET['search'] : '';
        if ($search != '') {
            $sLang = " OR ti.source_lang LIKE '%\"sourceLang\":\"$search\"%' ";
            $tLang = " OR ti.target_lang LIKE '%\"sourceLang\":\"$search\"%' ";
            $clientName = " OR tc.vUserName LIKE '%$search%' ";
            $clientName_indirect = " OR tic.vUserName LIKE '%$search%'";
            $find_resource = "OR CONCAT(tu.vFirstName,' ',tu.vLastName) LIKE '%$search%'";
            $find_project_m = "OR CONCAT(tu2.vFirstName,' ',tu2.vLastName) LIKE '%$search%'";
            $attached_workflow = " OR its.attached_workflow LIKE '%$search%' ";
            $job_type = " OR tjb.service_name LIKE '%$search%'";
            $scoop_number = '';
            if (strpos($search, '-') !== false) {
                $parts = explode('-', $search);
                $beforeHyphen = $parts[0];
                $scoop_number = " OR tsv.company_code LIKE '%$beforeHyphen%'";
            }

            $whereCond .= " AND (tsv.po_number LIKE '%$search%'$sLang $tLang $clientName $clientName_indirect $find_resource $find_project_m $job_type $scoop_number)";
            //$currentPage = 0;
        }

        $sortBy = ' tsv.job_summmeryId  DESC';
        if (isset($_GET['sortBy']) && $_GET['sortBy'] != '') {
            $sortBy = $_GET['sortBy'];
            if ($_GET['sortBy'] == 'jobNumber')
                $sortBy = 'tsv.po_number';
            if ($_GET['sortBy'] == 'scoopNumber')
                $sortBy = 'tsv.po_number';
            if ($_GET['sortBy'] == 'jobStatus')
                $sortBy = 'tsv.item_status';
            if ($_GET['sortBy'] == 'clientName')
                $sortBy = 'tc.vUserName';
            if ($_GET['sortBy'] == 'jobType')
                $sortBy = 'tjb.service_name';
            if ($_GET['sortBy'] == 'jobResource')
                $sortBy = 'tu.vLastName';
            if ($_GET['sortBy'] == 'jobProjectManager')
                $sortBy = 'tu2.vFirstName';


            if ($_GET['sortBy'] == 'jobDuedate')
                $sortBy = 'DATE(tsv.due_date)';
            if ($_GET['sortBy'] == 'projectDuedate')
                $sortBy = 'DATE(ti.due_date)';

            $sortOrder = isset($_GET['sortOrder']) && $_GET['sortOrder'] != '' ? $_GET['sortOrder'] : 'ASC';
            $sortBy = " $sortBy $sortOrder  ";
        }

        //$qry = "SELECT its.itemId from tms_items as its LEFT JOIN tms_customer AS cust ON its.order_id = cust.order_id LEFT JOIN tms_client AS c ON cust.client = c.iClientId where its.order_id != 0  $whereCond  ";
        if ($tabName !== 'Overdue') {
            $qry = "SELECT COUNT(*) AS totalItems FROM tms_summmery_view AS tsv INNER JOIN tms_general AS tg ON tsv.order_id = tg.order_id INNER JOIN tms_customer AS tcus ON tsv.order_id = tcus.order_id INNER JOIN tms_items AS ti ON tsv.order_id = ti.order_id LEFT JOIN tms_users tpc ON tpc.iUserId = tsv.contact_person LEFT JOIN tms_jobs AS tjb ON tsv.job_id = tjb.job_id LEFT JOIN tms_client AS tc ON tcus.client = tc.iClientId LEFT JOIN tms_client_indirect AS tic ON tcus.indirect_customer = tic.iClientId LEFT JOIN tms_users AS tu ON tsv.resource = tu.iUserId LEFT JOIN tms_users AS tu2 ON tsv.contact_person = tu2.iUserId WHERE ti.item_number = tsv.item_id $whereCond ";
            $tCount = $this->_db->rawQuery($qry);
            $totalCount = $tCount && isset($tCount[0]['totalItems']) ? $tCount[0]['totalItems'] : 0;
        } else {
            $sql = "SELECT COUNT(*) AS totalItems FROM tms_summmery_view AS tsv INNER JOIN tms_general AS tg ON tsv.order_id = tg.order_id INNER JOIN tms_customer AS tcus ON tsv.order_id = tcus.order_id INNER JOIN tms_items AS ti ON tsv.order_id = ti.order_id LEFT JOIN tms_users tpc ON tpc.iUserId = tsv.contact_person LEFT JOIN tms_jobs AS tjb ON tsv.job_id = tjb.job_id LEFT JOIN tms_client AS tc ON tcus.client = tc.iClientId LEFT JOIN tms_client_indirect AS tic ON tcus.indirect_customer = tic.iClientId LEFT JOIN tms_users AS tu ON tsv.resource = tu.iUserId LEFT JOIN tms_users AS tu2 ON tsv.contact_person = tu2.iUserId WHERE ti.item_number = tsv.item_id $whereCond ";
            $stmt = $this->_conn->prepare($sql);
            $stmt->execute();
            $get_query = $stmt->get_result();
            $tCount = $get_query->fetch_all(MYSQLI_ASSOC);
            //print_r($tCount[0]['totalItems']);
            $totalCount = ($tCount && isset($tCount[0]['totalItems'])) ? $tCount[0]['totalItems'] : 0;
        }
        $totalPages = ceil($totalCount / $perPage);

        if ($tabName !== 'Overdue') {
            $selqry = "SELECT tcus.client AS Client, tcus.indirect_customer AS indirectClient, tsv.*, tsv.item_status AS jobStatus, ti.item_status AS scoopitem_status, ti.source_lang AS item_source_lang, ti.target_lang AS item_target_lang, ti.due_date AS item_due_date, tjb.service_name AS job_type_name, tcus.project_coordinator AS project_coordinator_id, tcus.project_manager AS project_manager_id, tcus.QA_specialist AS qa_specialist_id, tpc.iUserId AS job_manager_id, tc.vUserName AS clientName, tc.vLogo AS clientLogo, tic.vUserName AS indirectClientName, tu.vFirstName AS resourceFirstName, tu.vLastName AS resourceLastName, tu2.vFirstName AS contactFirstName, tu2.vLastName AS contactLastName FROM tms_summmery_view AS tsv INNER JOIN tms_general AS tg ON tsv.order_id = tg.order_id INNER JOIN tms_customer AS tcus ON tsv.order_id = tcus.order_id INNER JOIN tms_items AS ti ON tsv.order_id = ti.order_id LEFT JOIN tms_users tpc ON tpc.iUserId = tsv.contact_person LEFT JOIN tms_jobs AS tjb ON tsv.job_id = tjb.job_id LEFT JOIN tms_client AS tc ON tcus.client = tc.iClientId LEFT JOIN tms_client_indirect AS tic ON tcus.indirect_customer = tic.iClientId LEFT JOIN tms_users AS tu ON tsv.resource = tu.iUserId LEFT JOIN tms_users AS tu2 ON tsv.contact_person = tu2.iUserId WHERE ti.item_number = tsv.item_id $whereCond ORDER BY $sortBy limit $perPage offset $offset ";
            $data = $this->_db->rawQuery($selqry);
        } else {
            $selqry = "SELECT tcus.client AS Client, tcus.indirect_customer AS indirectClient, tsv.*, tsv.item_status AS jobStatus, ti.item_status AS scoopitem_status, ti.source_lang AS item_source_lang, ti.target_lang AS item_target_lang, ti.due_date AS item_due_date, tjb.service_name AS job_type_name, tcus.project_coordinator AS project_coordinator_id, tcus.project_manager AS project_manager_id, tcus.QA_specialist AS qa_specialist_id, tpc.iUserId AS job_manager_id, tc.vUserName AS clientName, tc.vLogo AS clientLogo, tic.vUserName AS indirectClientName, tu.vFirstName AS resourceFirstName, tu.vLastName AS resourceLastName, tu2.vFirstName AS contactFirstName, tu2.vLastName AS contactLastName FROM tms_summmery_view AS tsv INNER JOIN tms_general AS tg ON tsv.order_id = tg.order_id INNER JOIN tms_customer AS tcus ON tsv.order_id = tcus.order_id INNER JOIN tms_items AS ti ON tsv.order_id = ti.order_id LEFT JOIN tms_users tpc ON tpc.iUserId = tsv.contact_person LEFT JOIN tms_jobs AS tjb ON tsv.job_id = tjb.job_id LEFT JOIN tms_client AS tc ON tcus.client = tc.iClientId LEFT JOIN tms_client_indirect AS tic ON tcus.indirect_customer = tic.iClientId LEFT JOIN tms_users AS tu ON tsv.resource = tu.iUserId LEFT JOIN tms_users AS tu2 ON tsv.contact_person = tu2.iUserId WHERE ti.item_number = tsv.item_id $whereCond ORDER BY $sortBy limit $perPage offset $offset  ";
            // echo $selqry;
            // exit;
            $stmt = $this->_conn->prepare($selqry);
            $stmt->execute();
            $get_query = $stmt->get_result();
            $data = $get_query->fetch_all(MYSQLI_ASSOC);

        }

        foreach ($data as &$row) {
            $row['Client'] = isset($row['clientName']) ? $row['clientName'] : '';
            $row['clientlogo'] = isset($row['clientLogo']) ? $row['clientLogo'] : '';
            $row['indirectClient'] = isset($row['indirectClientName']) ? $row['indirectClientName'] : '';
            $row['resource'] = isset($row['resourceFirstName']) ? $row['resourceFirstName'] . " " . $row['resourceLastName'] : '';
            $row['resourceId'] = isset($row['resource']) ? $row['resource'] : '';
            $row['contact_person'] = isset($row['contactFirstName']) ? $row['contactFirstName'] . " " . $row['contactLastName'] : '';
        }

        $results = array(
            'totalItems' => $totalCount,
            'totalPages' => $totalPages,
            'currentPage' => $currentPage,
            'data' => $data
        );

        return $results;
    }

    public function getJobsFromTmsSummeryViewCount()
    {
        $data = [];

        // $qry = "SELECT tjs.job_status_name, tsv.item_status ,COUNT(*) AS totalItems FROM tms_summmery_view as tsv LEFT JOIN tms_job_status as tjs ON tjs.job_status_name = tsv.item_status GROUP BY tsv.item_status";
        // $data1 = $this->_db->rawQuery($qry);
        // if($data1){
        //     $data['tabStatus'] = $data1;
        // }

        $qry = " SELECT COUNT(*) AS totalItems FROM tms_summmery_view AS tsv INNER JOIN tms_general AS tg ON tsv.order_id = tg.order_id INNER JOIN tms_customer AS tcus ON tsv.order_id = tcus.order_id INNER JOIN tms_items AS ti ON tsv.order_id = ti.order_id LEFT JOIN tms_users tpc ON tpc.iUserId = tsv.contact_person LEFT JOIN tms_jobs AS tjb ON tsv.job_id = tjb.job_id LEFT JOIN tms_client AS tc ON tcus.client = tc.iClientId LEFT JOIN tms_client_indirect AS tic ON tcus.indirect_customer = tic.iClientId LEFT JOIN tms_users AS tu ON tsv.resource = tu.iUserId LEFT JOIN tms_users AS tu2 ON tsv.contact_person = tu2.iUserId WHERE ti.item_number = tsv.item_id AND tsv.item_status = 'Requested'  ";
        $dataOn = $this->_db->rawQuery($qry);
        if ($dataOn) {
            $data['requested'] = $dataOn[0]['totalItems'];
        }

        $qry = " SELECT COUNT(*) AS totalItems FROM tms_summmery_view AS tsv INNER JOIN tms_general AS tg ON tsv.order_id = tg.order_id INNER JOIN tms_customer AS tcus ON tsv.order_id = tcus.order_id INNER JOIN tms_items AS ti ON tsv.order_id = ti.order_id LEFT JOIN tms_users tpc ON tpc.iUserId = tsv.contact_person LEFT JOIN tms_jobs AS tjb ON tsv.job_id = tjb.job_id LEFT JOIN tms_client AS tc ON tcus.client = tc.iClientId LEFT JOIN tms_client_indirect AS tic ON tcus.indirect_customer = tic.iClientId LEFT JOIN tms_users AS tu ON tsv.resource = tu.iUserId LEFT JOIN tms_users AS tu2 ON tsv.contact_person = tu2.iUserId WHERE ti.item_number = tsv.item_id AND tsv.item_status IN ('In-progress', 'Ongoing')  ";
        $dataOn = $this->_db->rawQuery($qry);
        if ($dataOn) {
            $data['inProgress'] = $dataOn[0]['totalItems'];
        }

        $qry = " SELECT COUNT(*) AS totalItems FROM tms_summmery_view AS tsv INNER JOIN tms_general AS tg ON tsv.order_id = tg.order_id INNER JOIN tms_customer AS tcus ON tsv.order_id = tcus.order_id INNER JOIN tms_items AS ti ON tsv.order_id = ti.order_id LEFT JOIN tms_users tpc ON tpc.iUserId = tsv.contact_person LEFT JOIN tms_jobs AS tjb ON tsv.job_id = tjb.job_id LEFT JOIN tms_client AS tc ON tcus.client = tc.iClientId LEFT JOIN tms_client_indirect AS tic ON tcus.indirect_customer = tic.iClientId LEFT JOIN tms_users AS tu ON tsv.resource = tu.iUserId LEFT JOIN tms_users AS tu2 ON tsv.contact_person = tu2.iUserId WHERE ti.item_number = tsv.item_id AND DATE(tsv.due_date) = CURDATE() AND tsv.item_status IN ('Delivered','Completed','Paid','Invoice Ready','Invoice Accepted','Invoiced','Cancelled')  ";
        $dataToday = $this->_db->rawQuery($qry);
        if ($dataToday) {
            $data['dueToday'] = $dataToday[0]['totalItems'];
        }
        $qry = " SELECT COUNT(*) AS totalItems FROM tms_summmery_view AS tsv INNER JOIN tms_general AS tg ON tsv.order_id = tg.order_id INNER JOIN tms_customer AS tcus ON tsv.order_id = tcus.order_id INNER JOIN tms_items AS ti ON tsv.order_id = ti.order_id LEFT JOIN tms_users tpc ON tpc.iUserId = tsv.contact_person LEFT JOIN tms_jobs AS tjb ON tsv.job_id = tjb.job_id LEFT JOIN tms_client AS tc ON tcus.client = tc.iClientId LEFT JOIN tms_client_indirect AS tic ON tcus.indirect_customer = tic.iClientId LEFT JOIN tms_users AS tu ON tsv.resource = tu.iUserId LEFT JOIN tms_users AS tu2 ON tsv.contact_person = tu2.iUserId WHERE ti.item_number = tsv.item_id AND DATE(tsv.due_date) = CURDATE() + INTERVAL 1 DAY AND tsv.item_status IN ('Delivered','Completed','Paid','Invoice Ready','Invoice Accepted','Invoiced','Cancelled')  ";
        $datadueTomorrow = $this->_db->rawQuery($qry);
        if ($datadueTomorrow) {
            $data['dueTomorrow'] = $datadueTomorrow[0]['totalItems'];
        }

        // $qry = " SELECT COUNT(*) AS totalItems FROM tms_summmery_view AS tsv INNER JOIN tms_general AS tg ON tsv.order_id = tg.order_id INNER JOIN tms_customer AS tcus ON tsv.order_id = tcus.order_id INNER JOIN tms_items AS ti ON tsv.order_id = ti.order_id LEFT JOIN tms_users tpc ON tpc.iUserId = tsv.contact_person LEFT JOIN tms_jobs AS tjb ON tsv.job_id = tjb.job_id LEFT JOIN tms_client AS tc ON tcus.client = tc.iClientId LEFT JOIN tms_client_indirect AS tic ON tcus.indirect_customer = tic.iClientId LEFT JOIN tms_users AS tu ON tsv.resource = tu.iUserId LEFT JOIN tms_users AS tu2 ON tsv.contact_person = tu2.iUserId WHERE ti.item_number = tsv.item_id AND DATE(tsv.due_date) < CURDATE() AND tsv.item_status IN ('In preparation','Requested','Assigned-waiting','Waiting','In-progress','Ongoing')  ";
        // $dataOverdue = $this->_db->rawQuery($qry);
        // $this->_db->where('DATE(tsv.due_date) < CURDATE() AND tsv.item_status IN ("In preparation","Requested","Assigned-waiting","Waiting","In-progress","Ongoing")');
        // $qry_job = $this->_db->get('tms_summmery_view AS tsv', null);
        // $data['overdue'] = (isset($qry_job) && !empty($qry_job)) ? count($qry_job) : 0;
        $sql = "SELECT COUNT(*) AS totalItems FROM tms_summmery_view AS tsv INNER JOIN tms_general AS tg ON tsv.order_id = tg.order_id INNER JOIN tms_customer AS tcus ON tsv.order_id = tcus.order_id INNER JOIN tms_items AS ti ON tsv.order_id = ti.order_id LEFT JOIN tms_users tpc ON tpc.iUserId = tsv.contact_person LEFT JOIN tms_jobs AS tjb ON tsv.job_id = tjb.job_id LEFT JOIN tms_client AS tc ON tcus.client = tc.iClientId LEFT JOIN tms_client_indirect AS tic ON tcus.indirect_customer = tic.iClientId LEFT JOIN tms_users AS tu ON tsv.resource = tu.iUserId LEFT JOIN tms_users AS tu2 ON tsv.contact_person = tu2.iUserId WHERE ti.item_number = tsv.item_id AND DATE(tsv.due_date) < CURDATE() AND tsv.item_status IN ('In preparation','Requested','Assigned-waiting','Waiting','In-progress','Ongoing')";
        $stmt = $this->_conn->prepare($sql);
        $stmt->execute();
        $get_query = $stmt->get_result();
        $tCount = $get_query->fetch_all(MYSQLI_ASSOC);
        $data['overdue'] = ($tCount && isset($tCount[0]['totalItems'])) ? $tCount[0]['totalItems'] : 0;

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

                $query = "SELECT tsv.*,concat(tu.vFirstName, ' ', tu.vLastName) as vUserName,tu.vEmailAddress,tu.iUserId,tsu.vUserName AS contactPerson,tsu.iUserId AS contactPersonId FROM tms_summmery_view tsv LEFT JOIN tms_users tu on tsv.resource = tu.iUserId LEFT JOIN tms_users tsu on tsv.contact_person = tsu.iUserId WHERE tsv.`job_summmeryId` = $jobId";

                $chk = $this->_db->rawQuery($query);

                if ($chk) {

                    array_push($newArray, $chk[0]);
                }
            }
            //Actual Data from tmsSummery view by orderId

            $qry = "SELECT tsv.*,concat(tu.vFirstName, ' ', tu.vLastName) as vUserName,tu.vEmailAddress,tu.iUserId,tsu.vUserName AS contactPerson,tsu.iUserId AS contactPersonId FROM tms_summmery_view tsv LEFT JOIN tms_users tu on tsv.resource = tu.iUserId LEFT JOIN tms_users tsu on tsv.contact_person = tsu.iUserId WHERE tsv.`order_id` = $orderId";

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

                    $query = "SELECT tsv.*,concat(tu.vFirstName, ' ', tu.vLastName) as vUserName,tu.vEmailAddress,tu.iUserId,tsu.vUserName AS contactPerson,tsu.iUserId AS contactPersonId FROM tms_summmery_view tsv LEFT JOIN tms_users tu on tsv.resource = tu.iUserId LEFT JOIN tms_users tsu on tsv.contact_person = tsu.iUserId WHERE tsv.`job_summmeryId` = $jobId";

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
        $data['freelance_currency'] = '';
        if ($data && $data['resource'] != '') {
            $this->_db->where('iUserId', $data['resource']);
            $data2 = $this->_db->getone('tms_users');
            $data['freelance_currency'] = $data2 ? $data2['freelance_currency'] : '';
            $data['userName'] = $data2 ? $data2['vFirstName'] . ' ' . $data2['vLastName'] : '';
        }
        if ($data && $data['contact_person'] != '') {
            $this->_db->where('iUserId', $data['contact_person']);
            $data3 = $this->_db->getone('tms_users');
            $data['projectManager'] = $data3 ? $data3['vFirstName'] . ' ' . $data3['vLastName'] : '';
        }
        return $data;
    }

    public function sendPurchaseOrderLinguist($data)
    {
        $pdf_content = explode("base64,", $data['pdfData']);
        $bin = base64_decode($pdf_content[1], true);
        //$pdfFileName = $data['purchaseOrderNo'].'.pdf';
        $pdfFileName = isset($data['poFilenamePdf']) ? $data['poFilenamePdf'] : 'purchase_order.pdf';
        $resourceName = isset($data['resourceName']) ? $data['resourceName'] : '';
        $bodyTemp = "<p> Hi " . $resourceName . ", </p>";
        $bodyTemp .= "<p> Please see the attached Purchased Order : <b>" . $pdfFileName . "</b> </p>";
        $body = $bodyTemp;
        if (isset($data['mailTextContent'])) {
            $body = $data['mailTextContent'];
        }
        //$body .= "welcome to <img src=\"cid:id1\"></br>";

        $attachments = '';
        $subject = isset($data['emailSubject']) ? $data['emailSubject'] : 'Purchase Order';
        $to_name = '';
        //$to = 'anil.kanhasoft@gmail.com';
        $to = $data['resourceEmail'];

        if ($data['pdfData']) {
            if ($pdf_content != '') {
                $pdfFileContent = '';
                if (is_array($pdf_content)) {
                    $pdfFileContent = sizeof($pdf_content) > 1 ? $pdf_content[1] : '';
                    // pdf file
                    $attachments = [
                        [
                            'ContentType' => 'application/pdf',
                            'Filename' => $pdfFileName,
                            'Base64Content' => $pdfFileContent
                        ]
                    ];
                }
            }

            $send_fn = new functions();
            $mailResponse = $send_fn->send_email_smtp($to, $to_name, $cc = '', $bcc = '', $subject, $body, $attachments);

            if ($mailResponse['status'] == 200) {
                if (isset($data['order_id']) && isset($data['item_id'])) {
                    $qry_up = "UPDATE `tms_items` SET `item_status` = '2' WHERE order_id = '" . $data['order_id'] . "' AND item_number = '" . $data['item_id'] . "' AND item_status = '1' ";
                    $this->_db->rawQuery($qry_up);
                }
                if (isset($data['job_summmeryId']) && $data['job_summmeryId'] != '') {
                    $qry_up = "UPDATE `tms_summmery_view` SET `item_status` = 'Ongoing' WHERE job_summmeryId = '" . $data['job_summmeryId'] . "' AND (`item_status` = 'In preparation'  OR `item_status` = 'Requested') ";
                    $this->_db->rawQuery($qry_up);
                    $qry_up2 = "UPDATE `tms_summmery_view` SET `isPoSent` = 1 WHERE job_summmeryId = '" . $data['job_summmeryId'] . "' ";
                    $this->_db->rawQuery($qry_up2);
                }

                $result['status'] = 200;
                $result['msg'] = 'Thank you for your email';
                return $result;
            } else {
                $result['status'] = 422;
                $result['msg'] = 'Could not send mail!';
                return $result;
            }
        } else {
            return $result['status'] = 422;
        }
    }

    public function jobsummeryGetByItemidNumber($orderId, $itemNumber)
    {

        $this->_db->join('tms_users tu', 'tsv.resource = tu.iUserId', 'LEFT');
        $this->_db->join('tms_users tsu', 'tsv.contact_person = tsu.iUserId', 'LEFT');
        $this->_db->join('tms_items ti', 'ti.order_id = tsv.order_id AND ti.item_number = tsv.item_id ', 'LEFT');
        //$this->_db->join('tms_discussion td', 'td.job_id = tsv.job_summmeryId AND td.externalChat = 1 ', 'LEFT');
        $this->_db->where('tsv.order_id', $orderId);
        $this->_db->where('tsv.item_id', $itemNumber);
        $this->_db->groupBy('tsv.job_summmeryId');
        $data = $this->_db->get('tms_summmery_view tsv', null, 'tsv.*,concat(tu.vFirstName, " ", tu.vLastName) as vUserName,tu.vProfilePic as resourcePic,tu.iUserId,tsu.vUserName AS contactPerson,tsu.iUserId AS contactPersonId, ti.itemId as scoopID ');
        //echo $this->_db->getLastQuery();exit;
        foreach ($data as &$row) {
            $jobid = $row['job_summmeryId'];
            $discussion = $this->_db->rawQueryNew("select id as discussion_id, job_id as discussion_job_id, read_id as discussionReadId from tms_discussion where externalChat =1 and job_id=$jobid ORDER BY id DESC limit 1  ");
            $discussion = count($discussion)> 0 ? $discussion[0] : [];
            
            if ($discussion) {
                $row['discussion_id'] = $discussion['discussion_id'];
                $row['discussion_job_id'] = $discussion['discussion_job_id'];
                $row['discussionReadId'] = $discussion['discussionReadId'];
            } else {
                $row['discussion_id'] = null;
                $row['discussion_job_id'] = null;
                $row['discussionReadId'] = '';
            }
        }
        return $data;
    }


    public function checkUserAbsent($id, $date)
    {
        if (empty($date)) {
            echo "Date parameter is missing.";
            return;
        }

        // Retrieve user availability data
        $this->_db->where('iUserId', $id);
        $data = $this->_db->getOne('tms_users');
        $today2 = new DateTime();
        $today = $today2->format('Y-m-d');
        $dataArray = json_decode($data['is_available'], true);
        $dataArray2 = [];
        $dataArray2 = array_filter($dataArray, function ($period) use ($today) {
            $dateFrom = new DateTime($period['dateFrom']);
            $dateTo = new DateTime($period['dateTo']);
        
            return ($dateTo >= new DateTime($today));
            //return ($dateFrom <= new DateTime($today) && $dateTo >= new DateTime($today));
        });
        $isAbsent = false; // Assume the user is absent by default

        $checkStart = $today2->format('Y-m-d');
        $newValueDateObj = DateTime::createFromFormat('d.m.Y', $date['newValue']);
        $checkEnd = $newValueDateObj->format('Y-m-d');

        // Convert the check range to DateTime objects for comparison
        $checkStartDate = new DateTime($checkStart);
        $checkEndDate = new DateTime($checkEnd);

        foreach ($dataArray as $period) {
            $dateFrom = new DateTime($period['dateFrom']);
            $dateTo = new DateTime($period['dateTo']);

            // Check if the date ranges overlap
            if (($checkStartDate <= $dateTo) && ($checkEndDate >= $dateFrom)) {
                // If there's an overlap, the user is unavailable
                $isAbsent = true;
                break;
            }
        }

        if ($isAbsent) {
            $return['status'] = 200;
            //$return['date'] = $dataArray;
            $return['date'] = $dataArray2;
            $return['message'] = $data['vFirstName'] . " " . $data['vLastName'] . " resource is absent on below dates";
            return $return;
        }
    }


    //  ------ ***** Cron job to update job status to archived *********----- //
    public function jobStatusUpdateArchivedCron() {
        try {

            $baseQry = "SELECT
                            tsv.job_summmeryId
                        FROM
                            `tms_summmery_view` tsv
                        LEFT JOIN `tms_invoice_jobs` tij ON
                            tij.invc_job_id = tsv.job_summmeryId
                        WHERE
                            tsv.due_date <= CURDATE() - INTERVAL 6 MONTH AND tij.invc_job_id IS NULL AND tsv.due_date != '0000-00-00 00:00:00' AND tsv.due_date IS NOT NULL AND (
                                item_status != 'Invoiced' AND item_status != 'Without invoice' AND item_status != 'Cancelled' AND item_status != 'Paid' AND item_status != 'Archived'
                            ) ";

            $data = $this->_db->rawQueryNew($baseQry);
    
            if (!empty($data)) {
                $jbData = [
                    'updated_date' => date('Y-m-d H:i:s'),
                    'item_status'  => 'Archived'
                ];
                $update_date = date('Y-m-d H:i:s');
                $item_status = "Archived";
    
                $jobSummaries = array_column($data, 'job_summmeryId');

                $jobSummaryIds = implode(',', $jobSummaries);
                $sql = "UPDATE tms_summmery_view SET item_status = '$item_status', updated_date = '$update_date' 
                WHERE job_summmeryId IN ($jobSummaryIds) ";
                $response = $this->_db->rawQuery($sql);

                // $this->_db->where('job_summmeryId', $jobSummaries , ' IN ');
                // $this->_db->update('tms_summmery_view', $jbData);

                // log update
                // foreach ($jobSummaries as $jobId) {
                //     $logSql = "INSERT INTO tms_cron_log (item_id, type, updated_at, remarks)
                //                VALUES ('$jobId', '2', '$update_date', 'Status updated to Archived the record which are older than 6 month')";
                //     $this->_db->rawQuery($logSql);
                // }
    
                $ret['msg'] = "Status updated successfully";
                $ret['status'] = 200;
                $ret['response_query'] = $response;
            } else {
                // No records found for the last 6 months
                $ret['msg'] = "No record available for the last 6 months";
                $ret['status'] = 200;
            }
            
        } catch (Exception $e) {
            // Handle exceptions and provide error details
            $ret['status'] = 400;
            $ret['msg'] = "Failed to update status";
            $ret['message_error'] = $e->getMessage(); // Log the exception message
        }
    
        return $ret;
    }
    //  END  Cron job to update job status to archived ********-------- //

    public function select2JobdataByOrderid($id)
    {
        $qry = "SELECT * FROM tms_summmery_view WHERE po_number != '' && order_id = $id ";
        $data = $this->_db->rawQuery($qry);
        return $data;
    }


}