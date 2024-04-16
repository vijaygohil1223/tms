<?php

require_once 'users.class.php';
require_once 'client.class.php';
require_once 'tasktype.class.php';

class freelanceJob {
	//pr1 data manage
    public function __construct() {
        $this->_db = db::getInstance();
    }
    
    public function getByAll($field, $getVar,  $table) {
    	$this->_db->where($field, $getVar);
    	return $this->_db->getOne($table);
    }
    
    public function freelanceJobget($id) {
    	$this->_db->join('tms_general tg', 'tsv.order_id = tg.order_id', 'INNER');
    	$this->_db->join('tms_users tu', 'tsv.resource = tu.iUserId', 'LEFT');
    	//$this->_db->where("tsv.resource = $id ");
        $this->_db->where("tsv.resource = $id OR ((tsv.accept = $id OR tsv.accept = 0) AND (tsv.item_status = 'Requested' OR tsv.item_status = 'In preparation' ) AND (FIND_IN_SET($id, tsv.send_request) AND NOT FIND_IN_SET($id, tsv.request_rejected_ids)) )");
    	$this->_db->where("tsv.item_id != '0' ");
        //$this->_db->where("tsv.item_status", array('Requested','Assigned-waiting','In-progress','Delivered','Approved','Invoice Accepted'),"IN");
    	$this->_db->where("tsv.item_status", array('Requested','Waiting','In-progress','Ongoing','Delivered','Completed','Approved','Invoice Ready','Invoice Accepted'),"IN");
    	$data = $this->_db->get('tms_summmery_view tsv', null, 'tg.order_no,tsv.job_no,tsv.job_code,tsv.item_status,tsv.description,tsv.job_summmeryId, tsv.due_date,tsv.order_id,tsv.item_id,tsv.po_number AS poNumber, tsv.total_price, tsv.comment_read, tg.company_code,  tu.freelance_currency');
        //echo $this->_db->getLastQuery();
        //exit;
        foreach ($data as $key => $value) { 
            if($value['order_id']){
                $this->_db->where("order_id", $value['order_id']);
                $getCustomerData = $this->_db->getOne('tms_customer');
                if($getCustomerData){
                    
                    $this->_db->where("iClientId", $getCustomerData['client']);
                    $getClient = $this->_db->getOne('tms_client');
                    
                    $data[$key]['clientName'] = $getClient ? $getClient['vUserName'] : '';

                    $this->_db->where("iClientId", $getCustomerData['indirect_customer']);
                    $getIndirectClient = $this->_db->getOne('tms_client_indirect');

                    $data[$key]['IndirectClientName'] = $getIndirectClient ? $getIndirectClient['vUserName'] : '';
                    
                }
            }
        }
        
        return $data;
    }
    
    //crone job for job status
    public function autostatusSet() {
    	$date = date('m/d/Y');
    	$this->_db->where('due_date',$date,'<');
    	$this->_db->where('item_status','In-progress');
    	return $this->_db->update('tms_summmery_view',array('item_status'=>'Overdue'));
    }
    
}