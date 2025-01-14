<?php
require_once 'users.class.php';
require_once 'client.class.php';
require_once 'order.class.php';
require_once 'tasktype.class.php';
require_once 'functions.class.php';
require_once 'sendmail/class.phpmailer.php';
class general {

    public function __construct() {
        $this->_db = db::getInstance();
    }

    public function save($info) {
        if(isset($info['orderPreCode'])){
            $order = new order;
            $oNumber = $order->orderNumberget($info['orderPreCode']);
            $oNumber = $oNumber ? $oNumber : 0;
            $newOrderNumber = $info['orderPreCode']. str_pad($oNumber + 1, 4, '0', STR_PAD_LEFT);
            $info['order_no'] = $newOrderNumber; 
        }
        if(isset($info['orderPreCode']))
            unset($info['orderPreCode']);
        
        $info['created_date'] = date('Y-m-d H:i:s');
        $info['modified_date'] = date('Y-m-d H:i:s');
        $id = $this->_db->insert('tms_general', $info);
        if ($id) {
            $this->_db->where("general_id", $id);
            $data = $this->_db->getOne('tms_general');
            $return['order_data'] = $data;
            $return['status'] = 200;
            $return['msg'] = 'Successfully Inserted.';
        } else {
            $return['status'] = 422;
            $return['msg'] = 'Not Saved.';
        }
        return $return;
    }
    
    public function getByorderID($id,$client_id) {
        $this->_db->where("order_id", $id);
        $results = $this->_db->getOne('tms_general');
        $results['company_code'] = substr($results['order_no'],0,-4);
        if($client_id){
            $this->_db->where("iClientId", $client_id);
            $client_data = $this->_db->getOne('tms_client');
            $results['vProjectCoordinator'] = isset($client_data['vProjectCoordinator']) ? $client_data['vProjectCoordinator'] : '';
            $results['vProjectManager'] = isset($client_data['vProjectManager']) ? $client_data['vProjectManager'] : '';
            $results['vQASpecialist'] = isset($client_data['vQASpecialist']) ? $client_data['vQASpecialist'] : '';
        }
        return $results;
    }

    public function update($id, $data) {
        $data['modified_date'] = date('Y-m-d H:i:s');
        $this->_db->where("general_id", $id);
        $id = $this->_db->update('tms_general', $data);
        if ($id) {
            $return['status'] = 200;
            $return['msg'] = 'Successfully Inserted.';
        } else {
            $return['status'] = 422;
            $return['msg'] = 'Not Saved.';
        }
        return $return;
    }
    
    public function generalEmailsend($data){
        if (isset($data['email_subj'])){
            $to = $data['email_subj'];
        }else{
            $to = "";
        }
        //return $info;
        if (isset($data['order_no']))
            $jobNo = $data['order_no'];
        else
            $jobNo = "";
        if (isset($data['description']))
            $description = $data['description'];
        else
            $description = "";
        if (isset($data['project_name']))
            $resource = $data['project_name'];
        else
            $resource = "";
        if (isset($data['due_date']))
            $dueDate = $data['due_date'];
        else
            $dueDate = "";
        if (isset($data['late_delivery']))
            $itemStatus = $data['late_delivery'];
        else
            $itemStatus = "";

        $body = "<p>Hello</p>";
        $body .= "<p>Following Job has been created and assigned to you.</p>";
        $body .= "<p>Job No. : " . $jobNo . ",</p>";
        $body .= "<p>Detail : " . $description . ",</p>";
        $body .= "<p>Project Name : " . $resource . ",</p>";
        $body .= "<p>Due Date : " . $dueDate . ",</p>";
        $body .= "<p>Item Status : " . $itemStatus . ".</p>";
        $subject = "Job Information";
        
        $to_name = '';
        $attachments = '';

        $send_fn = new functions();
        $mailResponse = $send_fn->send_email_smtp($to, $to_name, $cc='', $bcc='', $subject, $body, $attachments);
            
        if($mailResponse['status'] == 200) {
        //if ($this->_mailer->Send()) { //output success or failure messages
            $result['status'] = 200;
            $result['msg'] = 'Thank you for your email';
        } else {
            $result['status'] = 200;
            $result['msg'] = 'Could not send mail!';
        }
        return $result;
    }

    public function generalVieData($id,$client_id) {
        
        $this->_db->where("order_id", $id);
        $results = $this->_db->getOne('tms_general');

        $this->_db->where("order_id", $id);
        $orderData = $this->_db->getOne('tms_order');
        
        $results['company_code'] = $orderData['abbrivation'];
        
        if(isset($results['project_type'])){
            $this->_db->where('pr_type_id',$results['project_type']);
            $data = $this->_db->getone('tms_project_type');
            $results['project_type'] = isset($data['project_name']) ? $data['project_name'] : '';
        }
        if(isset($results['project_status'])){
            $this->_db->where('pr_status_id',$results['project_status']);
            $data = $this->_db->getone('tms_project_status');
            $results['project_status'] = $data['project_status_name'];
            $results['status_color'] = $data['status_color'];   
        }
        return $results;
    }

    public function generalDatawithoutClient($id){
        $this->_db->where('order_id',$id);
        $data = $this->_db->getOne('tms_general');
        return $data;
    }

    public function generalfolder($id) {
        $this->_db->where('t1.order_id',$id);
        $this->_db->where('t1.name','%general','LIKE');
        $this->_db->join('tms_filemanager t2','t1.fmanager_id = t2.parent_id','INNER');
        return $data = $this->_db->get('tms_filemanager t1');
        
        // $this->_db->where('order_id',$id);
        // $this->_db->where('parent_id',0);
        // $data = $this->_db->getOne('tms_filemanager');
        // return $data;   
    }

    public function getGeneralByOrderId($id) {
        $this->_db->where("order_id", $id);
        $results = $this->_db->getOne('tms_general');
        return $results;
    }
    public function projectStartStatus($data,$orderId) {
        $this->_db->where("order_id", $orderId);
        $results = $this->_db->update('tms_general', $data);
        return $results;
    }

    public function copyProject($info) {

        //get Order Table Data
        $this->_db->where("order_id", $info['orderID']);
        $orderData = $this->_db->getOne('tms_order');

        //Copy and insert value of old order to new
        unset($orderData['order_number']);
        unset($orderData['order_id']);
        $order = new order;
        $oNumber = $order->orderNumberget($orderData['abbrivation']);

        $orderData['order_number'] =  $oNumber;
        $orderData['created_date'] = date('Y-m-d H:i:s');
        $orderData['modified_date'] = date('Y-m-d H:i:s');

        $orderId = $this->_db->insert('tms_order', $orderData);

        if ($orderId) {
            $this->_db->where("order_id", $orderId);
            $newOrder = $this->_db->getOne('tms_order');

            //get General Table Data
            $this->_db->where("order_id", $info['orderID']);
            $generalData = $this->_db->getOne('tms_general');

            unset($generalData['general_id']);
            unset($generalData['order_id']);
            unset($generalData['order_no']);

            if($newOrder['abbrivation']){
                $order = new order;
                $oNumber = $order->orderNumberget($newOrder['abbrivation']);
                $oNumber = $oNumber ? $oNumber : 0;
                $newOrderNumber = $newOrder['abbrivation']. str_pad($oNumber + 1, 4, '0', STR_PAD_LEFT);
                $generalData['order_no'] = $newOrderNumber;
            }
            $generalData['order_id'] = $newOrder['order_id'];
            $generalData['created_date'] = date('Y-m-d H:i:s');
            $generalData['modified_date'] = date('Y-m-d H:i:s');
            $this->_db->insert('tms_general', $generalData);

            //get General Table Data
            $this->_db->where("order_id", $info['orderID']);
            $customerData = $this->_db->getOne('tms_customer');

            unset($customerData['c_id']);
            unset($customerData['order_id']);
            $customerData['order_id'] = $newOrder['order_id'];
            $customerData['created_date'] = date('Y-m-d H:i:s');
            $customerData['modified_date'] = date('Y-m-d H:i:s');
            // $customerId = $this->_db->insert('tms_customer', $customerData);

            $customer = new customer();
            $customerId = $customer->save($customerData);
           
            $return['data'] = $newOrder;
            $return['status'] = 200;
            $return['msg'] = 'Project Successfully copied.';
        } else {
            $return['status'] = 422;
            $return['msg'] = 'Not Copied.';
        }
        return $return;
    }
}
