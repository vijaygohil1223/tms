<?php
require_once 'filemanager.class.php';
require_once 'currency.class.php';
require_once 'order.class.php';
require_once 'customer.class.php';
require_once 'client.class.php';

class item {

    public function __construct() {
        $this->_db = db::getInstance();
    }

    public function save($info) {
        $info['created_date'] = date('Y-m-d H:i:s');
        $info['modified_date'] = date('Y-m-d H:i:s');
        $id = $this->_db->insert('tms_item', $info);
        if ($id) {
            $return['status'] = 200;
            $return['msg'] = 'Successfully Inserted.';
        } else {
            $return['status'] = 422;
            $return['msg'] = 'Not Saved.';
        }
        return $return;
    }

     public function getByOrder($id) {
        $this->_db->where("order_id", $id);
        return $results = $this->_db->getOne('tms_proj_language');
    }

    public function update($id, $data) {
        $data['modified_date'] = date('Y-m-d H:i:s');
        $this->_db->where("pl_id", $id);
        $id = $this->_db->update('tms_item', $data);
        if ($id) {
            $return['status'] = 200;
            $return['msg'] = 'Successfully Inserted.';
        } else {
            $return['status'] = 422;
            $return['msg'] = 'Not Saved.';
        }
        return $return;
    }

    public function ItemSave($data) {
        $data['created_date'] = date('Y-m-d H:i:s');
        $data['updated_date'] = date('Y-m-d H:i:s');
        if(isset($data['due_date'])) {
            $yesterday = strtotime($data['due_date']);
            $dueDate = date("d-m-Y", $yesterday);
            $date = explode("-",$dueDate);
            $data['q_date'] = $date[1].'-'.$date[2];
        }
        $id = $this->_db->insert('tms_items', $data);
        if ($id) {
            
            try{
                if(isset($data['order_id'])){
                    $orderId = $data['order_id'];
                    $itemData = $this->_db->rawQuery("SELECT COUNT(`itemId`) as totalItems FROM `tms_items` WHERE order_id = $orderId  ");
                    $nextItem = $this->_db->count + 1;

                    $this->_db->where('order_id',$data['order_id']);
                    $this->_db->where('is_project_folder',1);
                    $fmanager = $this->_db->getOne('tms_filemanager');

                    if($fmanager){
                        $fdata['name'] = 'Scoop'.str_pad($nextItem ,3, "0", STR_PAD_LEFT);
                        $fdata['order_id'] = $data['order_id'];
                        $fdata['item_id'] = $id;
                        $fdata['parent_id'] = $fmanager['fmanager_id'];
                        $fdata['created_date'] = date('Y-m-d H:i:s');
                        $fdata['updated_date'] = date('Y-m-d H:i:s');
                        $fmid = $this->_db->insert('tms_filemanager',$fdata);

                        if($fmid){
                            $folderArr = ['Original Files','PO','QA Delivery','PM Delivery'];
                            foreach ($folderArr as $key => $value) {
                                $fdata['order_id'] = '';
                                $fdata['item_id'] = 0;
                                $fdata['name'] = $value;
                                $fdata['parent_id'] = $fmid;
                                $this->_db->insert('tms_filemanager',$fdata);
                            }
                        }
                    }

                }
            }catch (Exception $e) {
            
            }

            $return['status'] = 200;
            $return['msg'] = 'Successfully Inserted.';
        } else {
            $return['status'] = 422;
            $return['msg'] = 'Not Saved.';
        }
        return $return;
    }

    public function itemsGet($id) {
        //$data = $this->_db->rawQuery("SELECT ti.*,tg.project_name,tg.specialization, tis.item_status_name  FROM `tms_items` As ti INNER JOIN tms_general As tg ON ti.order_id = tg.order_id LEFT JOIN tms_item_status As tis ON ti.item_status = tis.item_status_id WHERE ti.order_id = $id");
        // to solve in case order no duplicate
        $data = $this->_db->rawQuery("SELECT ti.*,tg.project_name,tg.specialization, tis.item_status_name  FROM `tms_items` As ti INNER JOIN tms_general As tg ON ti.order_id = tg.order_id LEFT JOIN tms_item_status As tis ON ti.item_status = tis.item_status_id WHERE ti.order_id = $id GROUP BY ti.itemId ");

        return $data;
    }

    public function itemsGetSingleScoop($id) {
        // to solve in case order no duplicate
        $data = $this->_db->rawQuery("SELECT ti.*,tg.project_name,tg.specialization, tis.item_status_name  FROM `tms_items` As ti INNER JOIN tms_general As tg ON ti.order_id = tg.order_id LEFT JOIN tms_item_status As tis ON ti.item_status = tis.item_status_id WHERE ti.itemId = $id GROUP BY ti.itemId ");

        return $data;
    }

    public function itemsgetone($id) {
        $this->_db->where("itemId", $id);
        $results = $this->_db->getOne('tms_items');
        return $results; 
    }

    public function allRecordsUpdateItems()
    {
        // Step 1: Fetch all required data in a single query with necessary joins
        $qry = "SELECT ti.itemId, ti.order_id, tcu.current_curency_rate, tci.client_currency 
                FROM tms_items ti
                LEFT JOIN tms_customer tc ON ti.order_id = tc.order_id
                LEFT JOIN tms_client tci ON tc.client = tci.iClientId
                LEFT JOIN tms_currency tcu ON SUBSTRING_INDEX(tcu.currency_code, ',', 1) = SUBSTRING_INDEX(tci.client_currency, ',', 1)";
        
        $data = $this->_db->rawQuery($qry);

        // Step 2: Loop through each record and update the base_currency_rate
        foreach ($data as $d) {
            if ($d['order_id'] && isset($d['current_curency_rate'])) {
                // Case where an order and a currency rate exists
                $updateData = [
                    'base_currency_rate' => $d['current_curency_rate']
                ];
            } else {
                // Default base_currency_rate when no order or currency rate is found
                $updateData = [
                    'base_currency_rate' => 1
                ];
            }

            // Update the record in the tms_items table
            $this->_db->where('itemId', $d['itemId']);
            $this->_db->update('tms_items', $updateData);
        }
        return true;
    }

    

    public function ItemUpdate($id,$data) {
        unset($data['project_name']);
        unset($data['item_status_name']);
        unset($data['specialization']);
        
        if(isset($data['currencyRate'])) {
            $cur['currency'] = $data['currencyRate'];
            $cur['modified_date'] = date('Y-m-d H:i:s');
            $this->_db->where('order_id',$data['order_id']);    
            $this->_db->update('tms_order',$cur);
        }        

        $data['updated_date'] = date('Y-m-d H:i:s');
        if(isset($data['due_date'])) {
            $datetimeString = $data['due_date'];
            //$dateTimeObj = DateTime::createFromFormat('Y-m-d H:i', $datetimeString);
            //if ($dateTimeObj && $dateTimeObj->format('Y-m-d H:i') === $datetimeString) {
            if (strtotime($datetimeString) !== false) {
                $yesterday = strtotime($data['due_date']);
                $dueDate = date("d-m-Y", $yesterday);
                $date = explode("-",$dueDate);
                $data['q_date'] = $date[1].'-'.$date[2];
            } else {
                unset($data['due_date']);
            }
        }
        // removed no longer needed
        // if (isset($data['pm_deadline'])) {
        //     $datetimeString = $data['pm_deadline'];
        //     $dateTimeObj = DateTime::createFromFormat('d.m.Y', $datetimeString);
        //     if ($dateTimeObj) {
        //         $formattedPMDate = $dateTimeObj->format('Y-m-d');
        //         $data['pm_deadline'] = $formattedPMDate;
        //     }else{
        //         $data['qa_deadline'] = null;
        //     }
        // }
        // if (isset($data['qa_deadline'])) {
        //     $datetimeString = $data['qa_deadline'];
        //     $dateTimeObj1 = DateTime::createFromFormat('d.m.Y', $datetimeString);
        //     if ($dateTimeObj1) {
        //         $formattedQADate = $dateTimeObj1->format('Y-m-d');
        //         $data['qa_deadline'] = $formattedQADate;
        //     }else{
        //         $data['qa_deadline'] = null;
        //     }
        // }
        
        $sql = "SELECT tcu.current_curency_rate
            FROM tms_items ti
            LEFT JOIN tms_customer tc ON ti.order_id = tc.order_id
            LEFT JOIN tms_client tci ON tc.client = tci.iClientId
            LEFT JOIN tms_currency tcu ON SUBSTRING_INDEX(tcu.currency_code, ',', 1) = SUBSTRING_INDEX(tci.client_currency, ',', 1)
            WHERE ti.order_id = ".$data['order_id']." LIMIT 1";
        $base_currency_rate = $this->_db->rawQuery($sql, $data['order_id']);

        $data['base_currency_rate'] = !empty($base_currency_rate[0]['current_curency_rate']) ? $base_currency_rate[0]['current_curency_rate'] : 1;
        unset($data['currency'],$data['currencyRate']);
        $this->_db->where("itemId", $id);
        $idd = $this->_db->update('tms_items', $data);
        if ($idd) {
            try {
                $info['user_id'] = 0;
                $this->_db->where('item_id',$id);
                $this->_db->update('tms_filemanager',$info);

                // 
                // if scoop status Cancelled (status id = 9) all jobs will be cancel for that scoop
                // scoop status Approved = 5 , jobs will get Invoice ready status 
                $jobStatus = '';
                $andWhere = "";
                // if ($data['item_status'] == '5') {
                //     $jobStatus = 'Invoice Ready'; // if job is complete by linguist then status will be Invoice Ready
                //     //$andWhere = " AND resource!=''  AND item_status NOT IN ('Cancelled','Canceled','Invoiced','Paid') ";
                //     $andWhere = " AND resource!='' AND item_status='Completed' ";
                // }
                if ($data['item_status'] == '9'){
                    $jobStatus = 'Cancelled';
                }
                switch ($data['item_status']) {
                    case '4':
                        $jobStatus = 'Approved';
                        break;
                    case '5':
                        $jobStatus = 'Completed';
                        break;
                    case '6':
                        $jobStatus = 'Invoice Ready';
                        break;
                    default:
                    $andWhere = " AND resource != '' ";
                    //$andWhere = " AND resource!='' AND item_status='Completed' ";
                }
                if (isset($data['order_id']) && $jobStatus != '') {
                    // Sanitize the inputs
                    $order_id = $this->_db->escape($data['order_id']);
                    $item_number = $this->_db->escape($data['item_number']);
                    
                    $qry_up = "UPDATE tms_summmery_view 
                            SET item_status = ? 
                            WHERE order_id = ? AND item_id = ?  AND NOT EXISTS (
                            SELECT 1 FROM tms_invoice_jobs AS tij 
                            WHERE tij.invc_job_id = job_summmeryId
                        ) " . $andWhere;
                    $this->_db->rawQuery($qry_up, [$jobStatus, $order_id, $item_number]);
                }

                // if (isset($data['order_id']) && $jobStatus != '' ) {
                //     $qry_up = "UPDATE tms_summmery_view SET item_status = '".$jobStatus."' WHERE order_id = '".$data['order_id']."' AND item_id = '".$data['item_number']."' ".$andWhere." ";
                //     $this->_db->rawQuery($qry_up);
                // }
                // End job status update

            }catch (Exception $e) {
                $return['message_error'] = $e;
            }

            $return['status'] = 200;
            $return['msg'] = 'Successfully Updated.';
        } else {
            $return['status'] = 422;
            $return['msg'] = 'Not Updated.';
        }
        return $return;
    }

    public function fileFolderDelete($id){
        // Delete files folder from scoops jobs 
        $externalResourceUserId = 'null';
        $this->_db->where('item_id',$id);
        $scoop = $this->_db->getOne('tms_filemanager');
        if ($scoop) {
            $filed = new filemanager();
            $infoFolder = $filed->filefolderGet($scoop['fmanager_id'], $id, $externalResourceUserId);
            $path = "../../uploads/fileupload/";
            if ($infoFolder) {
                foreach ($infoFolder as $key => $value) {
                    if (isset($value['ext'])) {
                        $images = glob($path . $value['name']);
                        if ($images) {
                            print_r($images);
                            exit;
                            unlink($path . $value['name']);
                        }
                        $in = $filed->filefolderGet($value['fmanager_id'], $id, $externalResourceUserId);
                        foreach ($in as $key => $value) {
                            if (isset($value['ext'])) {
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

            $this->_db->where('item_id', $scoop['item_id']);
            $this->_db->delete('tms_filemanager');
        
        }
        return true;
        // End file folder delete in filemanager
    }

    public function itemDelete($idItem,$orderId) { 
        $id = explode('-',$idItem)[0];
        $iNumber = explode('-',$idItem)[1];
        
        $this->_db->where('order_id',$orderId);
        $this->_db->where('item_id',$iNumber);
        $jobAvailable = $this->_db->get('tms_summmery_view');
        
        //if(!$jobAvailable){
            $this->_db->where('itemId',$id);
            $data = $this->_db->getOne('tms_items');
            if($data) {
                $itemId = $data['item_number'];
                $this->_db->where('item_id',$itemId);
                $this->_db->where('order_id',$orderId);
                $this->_db->delete('tms_summmery_view');

                // $this->_db->where('item_id',$id);
                // $this->_db->delete('tms_filemanager');
                $dltFlFolder = self::fileFolderDelete($id);

                $this->_db->where('itemId',$id);
                $data = $this->_db->delete('tms_items');

                // Delete jobs
                $this->_db->where('order_id',$orderId);
                $this->_db->where('item_id',$iNumber);
                $jobDelete = $this->_db->delete('tms_summmery_view');

            } else {
                $data = 0;  
            }
        // }else{
        //     $data['status'] = 422;
        //     $data['msg'] = 'You can not delete because jobs available in this scoop.';
        // }    
        
        return $data; 
    }

    public function contactPersonget($id) {
        $this->_db->where('order_id',$id);
        $data = $this->_db->getone('tms_customer');
        $getcust = array($data['project_coordinator'],$data['project_manager'],$data['QA_specialist']);
        $users = new users();
        $customer = array();
        foreach ($getcust as $key => $value) {
            $cust = $users->getUser($value,"");
            array_push($customer, $cust);
        }
        return $customer;   
    }

    public function itemsNumberGet($id) {
        $file = new filemanager();
        $fileGet = $file->filegetByfield('order_id',$id);

        $this->_db->where('order_id',$id);
        $info = $this->_db->get('tms_items');
        if($info) {
            foreach($info As $in) {
                $itemId = $in['item_number'];
            }
        } else {
            $itemId = 0;  
        }

        $item['order_id'] = $id;
        $item['item_number'] = 0;
        $item['created_date'] = date('Y-m-d H:i:s');
        $item['updated_date'] = date('Y-m-d H:i:s');
        $itmId = $this->_db->insert('tms_items',$item);
        if($itmId) {
            $data['order_id'] = $id;
            $data['parent_id'] = $fileGet['fmanager_id'];
            $data['user_id'] = 1;
            $data['item_id'] = $itmId;
            $data['name'] = "item".str_pad($itemId + 1, 3, '0', STR_PAD_LEFT);
            $data['created_date'] = date('Y-m-d H:i:s');
            $data['updated_date'] = date('Y-m-d H:i:s');
            $this->_db->insert('tms_filemanager',$data);    
        }
        $idd['itemId'] = $itmId;
        $idd['itemNumber'] = $itemId;
        return $idd;
    }

    public function saveDirectory($data) {
        $name = $data['item_no'];
        $dir = $output_file = UPLOADS_ROOT . $name;
        if(!is_dir($dir)) {
            mkdir( $dir, 0777, true );
        }
    }
    
    public function itemFilemanagerCheck($id){
        $this->_db->where('order_id',$id);
        $this->_db->where('user_id',1);
        $data = $this->_db->getOne('tms_filemanager');
        if($data) {
            $this->_db->where('parent_id',$data['fmanager_id']);
            $this->_db->delete('tms_filemanager');

            $this->_db->where('fmanager_id',$data['fmanager_id']);
            $info = $this->_db->delete('tms_filemanager');

            // $this->_db->where('order_id',$id);
            // $this->_db->where('item_number',0);
            // $info = $this->_db->delete('tms_items');
        } else {
            $info = "No Item";
        }
        return $info;
    }

    public function orderCurrencyMatch ($id) {
        $currency = new currency();
        $default = $currency->defaultCurrencyGet();

        $order = new order();
        $data = $order->getById($id);

        $result['currency'] = $data['currency'];
        $result['defCurrency'] = $default['country_name'];
        return $result;
    }

    public function itemCurrencyGet($id) {
        $currency = new currency();
        $default = $currency->defaultCurrencyGet();        
        $from = $default['country_name'];
        $to = $id;
        $amount = urlencode(1);
        $from_Currency = urlencode($from);
        $to_Currency = urlencode($to);
        //echo 'https://www.google.com/finance/converter?a=1&from='.$from.'&to='.$to;exit;
        $get = file_get_contents("https://www.google.com/finance/converter?a=1&from=$from&to=$to");
        $get = explode("<span class=bld>",$get);
        $get = explode("</span>",$get[1]);  
        $converted_amount = preg_replace("/[^0-9.]/", null, $get[0]);
        $result['currency'] = $id;
        $result['defCurrency'] = $default['country_name'];
        $result['currencyRate'] = round($converted_amount,3);
        return $result;
    }

    public function AddNumberOfItems($data) {
        // /$data = $this->_db->rawQuery("SELECT COUNT(items) AS NumberOfProducts FROM TMS;");
        $this->_db->where('order_id',$data['order_id']);
        $info = $this->_db->get('tms_items');
        if($info) {
            foreach($info As $in) {
                $itemId = $in['item_number'];
            }
        } else {
            $itemId = 0;  
        }
        
        $no_of_items = $data['no_of_items'];
        $order_id = $data['order_id'];
        if($data['order_id']){
            $this->_db->where('order_id',$order_id);
            $this->_db->where('is_project_folder',1);
            $info = $this->_db->getOne('tms_filemanager');
            
            //Get Client from order Id
            $client = new customer();
            $result = $client->getByorderID($order_id);
            
            $Indirectclient = new client();
            $IcData = $Indirectclient->getIndirectClient($result['indirect_customer']);
            
            //$itemName = $IcData['vUserName'].' | English (US) - English (US)';
            $itemName = $IcData['vUserName'];
            //$contactPerson = $result['client'];
            $contactPerson = $result['contact']; // default contact person
            
            $this->_db->where("order_id", $order_id);
            $genData = $this->_db->getOne('tms_general');
            $gen_due_date = $genData['due_date']; // default due date for scoop item
            //echo $itemId;exit;
            $current_date = date('Y-m-d');
            $due_date = date('Y-m-d', strtotime($gen_due_date));
            $is_urgent_scoop = 0;
            if ($due_date == $current_date) {
                $is_urgent_scoop = 1;  // Mark as urgent if due date is today
            }

            $this->_db->where('is_default',1);
            $this->_db->where('is_active',1);
            $scoopStatus = $this->_db->getOne('tms_item_status');
            $statusId = $scoopStatus ? $scoopStatus['item_status_id'] : '';
            for($i=$itemId+1;$i<=$no_of_items+$itemId;$i++){
                $Idata['item_number'] =$i;
                $Idata['contact_person'] = $contactPerson;
                $Idata['item_name'] =$itemName;
                $Idata['order_id'] = $data['order_id'];
                $Idata['item_status'] = $statusId;
                $Idata['due_date'] = $gen_due_date;
                $Idata['is_urgent_scoop'] = $is_urgent_scoop;
                $Idata['created_date'] = date('Y-m-d H:i:s');
                $Idata['updated_date'] = date('Y-m-d H:i:s');

                //Item Start Date
                /*$currentDate = date('Y-m-d H:i:s');
                $date= explode(' ',$currentDate);
                $convertedDate = explode('-',$date[0]);//Like 25.10.2017
                $Idata['start_date'] = $convertedDate[2].'.'.$convertedDate[1].'.'.$convertedDate[0];*/
                $Idata['start_date'] = date('Y-m-d H:i:s');
                
                $ItemId = $this->_db->insert('tms_items',$Idata);
                if($ItemId){
                    //$fdata['name'] = 'Item'.str_pad($i,3, "0", STR_PAD_LEFT);
                    $fdata['name'] = 'Scoop'.str_pad($i,3, "0", STR_PAD_LEFT);
                    $fdata['order_id'] = $data['order_id'];
                    $fdata['item_id'] = $ItemId;
                    $fdata['parent_id'] = $info['fmanager_id'];
                    $fdata['created_date'] = date('Y-m-d H:i:s');
                    $fdata['updated_date'] = date('Y-m-d H:i:s');
                    $fmid = $this->_db->insert('tms_filemanager',$fdata);

                    if($fmid){
                        $folderArr = ['Original Files','PO','QA Delivery','PM Delivery'];
                        foreach ($folderArr as $key => $value) {
                            $fdata['order_id'] = '';
                            $fdata['item_id'] = 0;
                            $fdata['name'] = $value;
                            $fdata['parent_id'] = $fmid;
                            $this->_db->insert('tms_filemanager',$fdata);
                        }
                    }
                }
            }

            $return['status'] = 200;
            $return['msg'] = 'Inserted';

        }else{

            $return['status'] = 422;
            $return['msg'] = 'Error';
        }

        return $return;
    }

    public function scoopStatusChange($updateRec) {
        //$scoopId = json_decode($updateRec['scoop_id'], TRUE);

        try {
            $result['all_update'] = 1;
            $scoopIds = json_decode($updateRec['scoop_id'], TRUE);
            $item_status = $updateRec['item_status'];
            $update_date = date('Y-m-d H:i:s');
            $updateIdsArrSttring = implode(',', $scoopIds);
                    
            try {
                $updateSql = "
                UPDATE tms_items 
                SET item_status = $item_status, updated_date = '$update_date' 
                WHERE itemId IN ($updateIdsArrSttring) 
                AND itemId NOT IN (
                    SELECT invc_scoop_id FROM tms_invoice_scoops
                ) ";

                $response = $this->_db->rawQuery($updateSql);

            } catch (Exception $e) {
                $result = [
                    'status' => 422,
                    'msg' => 'Record not updated',
                    'message_error' => $e->getMessage(),
                ];

                return $result;
            }

            $jobStatus = '';
            switch ($item_status) {
                case '4':
                    $jobStatus = 'Approved';
                    break;
                case '5':
                    $jobStatus = 'Completed';
                    break;
                case '6':
                    $jobStatus = 'Invoice Ready';
                    break;
                case '9':
                        $jobStatus = 'Cancelled';
                        break;
                default:
                //$andWhere = " AND resource != ''  ";
            }

            if($jobStatus !=''){
                $updateJobSql = "
                UPDATE tms_summmery_view AS tsv 
                JOIN tms_items AS its ON its.order_id = tsv.order_id AND its.item_number = tsv.item_id 
                SET tsv.item_status = '$jobStatus' 
                WHERE its.itemId IN ($updateIdsArrSttring) AND tsv.resource != '' AND NOT EXISTS (
                    SELECT 1 FROM tms_invoice_jobs AS tij 
                    WHERE tij.invc_job_id = tsv.job_summmeryId
                ) ";

                $updateJobStatus = $this->_db->rawQuery($updateJobSql);
            }

            $result = [
                'all_update' => 0,
                'status' => 200,
                'msg' => 'Record updated',
            ];

        } catch (Exception $e) {
            $result = [
                'status' => 422,
                'msg' => 'Record not updated',
                'message_error' => $e->getMessage(),
            ];
        }

        return $result;
        
        // foreach ($scoopId as $key => $value) {
        //     $statusData['item_status'] = $updateRec['item_status'];
        //     $update_date = date('Y-m-d H:i:s');
		// 	$item_status = $updateRec['item_status'];
        //     $updateSql = "
        //     UPDATE tms_items 
        //     SET item_status = $item_status, updated_date = '$update_date' 
        //     WHERE itemId = $value 
        //     AND itemId NOT IN (
        //         SELECT invc_scoop_id FROM tms_invoice_scoops
        //     ) ";
        //     $id = $this->_db->rawQuery($updateSql);

        //     if($key == count($scoopId)-1 ){
        //         $result['all_update'] = 1;
        //     }

        //     // if scoop status Cancelled (status id = 9) all jobs will be cancel for that scoop
        //     // scoop status Approved = 5 , jobs will get Invoice ready status 
        //     $this->_db->where("itemId", $value);
        //     $itemData = $this->_db->getOne('tms_items');
            
        //     $jobStatus = '';
        //     $andWhere = "";
        //     if ($updateRec['item_status'] == 9)
        //         $jobStatus = 'Cancelled';
        //     if ($updateRec['item_status'] == 5) {
        //         $jobStatus = 'Invoice Ready';
        //         $andWhere = " AND item_status NOT IN ('Cancelled','Canceled','Invoiced','Paid','Invoiced') ";
        //     }    
        //     if (isset($itemData['order_id']) && $jobStatus != '' ) {
        //         $qry_up = "UPDATE tms_summmery_view SET item_status = '".$jobStatus."' WHERE order_id = '".$itemData['order_id']."' AND item_id = '".$itemData['item_number']."' ".$andWhere." ";
        //         $this->_db->rawQuery($qry_up);
        //     }
        //     // End job status update

        // }

    }

    public function languagesGet() {
        // $data = $this->_db->rawQuery("SELECT * FROM `tms_languages` WHERE is_active=1 ORDER BY `is_favourite`=1 DESC");
        // $data = $this->_db->rawQuery("SELECT *, ROW_NUMBER() OVER (ORDER BY display_order IS NULL, display_order ASC) AS sequential_display_order FROM tms_languages WHERE is_active = 1 ORDER BY sequential_display_order ASC");
        $data = $this->_db->rawQuery("SELECT * FROM tms_languages WHERE is_active=1 ORDER BY COALESCE(display_order, 999999999) ASC");

        return $data;
    }

    public function getFilestotal($id) {
        $data = $this->_db->rawQuery("SELECT COUNT(`parent_id`) as totalfile FROM `tms_filemanager` WHERE parent_id IN (SELECT `fmanager_id` FROM tms_filemanager WHERE `item_id`=$id) ");
        return $data;
    }

    public function checkItemPonumberExist($id, $searchText){
        $data = $this->_db->rawQuery("SELECT itemId FROM `tms_items` WHERE itemId != '".$id."' AND po_number='".$searchText."' ");
        return $this->_db->count;
    }

    public function itemStatusUpdate($id){
        // status 1 = Assign
        if($id){
            $this->_db->where("itemId", $id);
            $update = $this->_db->update('tms_items', array('item_status' => 1));
            $result['status'] = 200;
            $result['msg'] = 'Record updated';
        }else{
            $result['status'] = 422;
            $result['msg'] = 'Not updated';
        }
        return $result;
    }

    public function itemsScoopsDropdown($orderId){

        $data = $this->_db->rawQuery("SELECT its.itemId, its.item_number, gen.order_no FROM `tms_items` its LEFT JOIN tms_general gen ON gen.order_id = its.order_id WHERE its.order_id = $orderId ");
        return $data;
    }

    // public function formatDeadline($dateString, $format = 'd.m.Y', $outputFormat = 'Y-m-d') {
    //     if (!empty($dateString)) {
    //         $dateTimeObj = DateTime::createFromFormat($format, $dateString);
    
    //         // Check if the date is valid according to the given format.
    //         if ($dateTimeObj && $dateTimeObj->format($format) === $dateString) {
    //             return $dateTimeObj->format($outputFormat);
    //         }
    //     }
    //     // Return null if the date is invalid or empty.
    //     return null;
    // }
    

}

?>