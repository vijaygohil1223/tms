<?php
require_once 'users.class.php';
require_once 'client.class.php';
require_once 'functions.class.php';


class Client_invoice {

	public function __construct() {
		$this->_db = db::getInstance ();
	}

	public function getAll($field, $id, $table) {
		$this->_db->where($field, $id);
		return $this->_db->get($table);
	}

	public function get($table) {
        return $this->_db->get($table);
    }

    public function getInvoiceNumberClient() {
		//$invoiceData = self::get('tms_invoice');
        $invoiceData = self::get('tms_invoice_client');
        return $invoiceData;
	}

	//invoice serach data get
	public function invoiceCreate($data1) {
		$infoD = array();
		$paymentDue = self::getAll('invoice_due_id',1,'tms_invoice_due_period');
		foreach ($data1['id'] as $k => $v) {
			$this->_db->where('job_summmeryId', $v['id']);
			$this->_db->join('tms_users tu', 'tu.iUserId=tsv.resource', 'LEFT');
			$this->_db->join('tms_general tg','tg.order_id = tsv.order_id', 'INNER');
			$this->_db->join('tms_customer tcu','tcu.order_id = tsv.order_id', 'INNER');
			$this->_db->join('tms_client tci', 'tci.iClientId=tcu.client', 'LEFT');
			$data = $this->_db->getOne('tms_summmery_view tsv', 'tsv.job_summmeryId AS jobId,tsv.item_id AS item_number, tsv.order_id AS orderId, tsv.po_number AS poNumber, tci.iClientId AS clientId, tci.vAddress1 AS companyAddress, tci.vEmailAddress  AS companyEmail, tci.vPhone AS companyPhone, tu.iUserId AS freelanceId, tu.vUserName AS freelanceName, tu.vEmailAddress AS freelanceEmail, tu.vAddress1 AS freelanceAddress, tu.vProfilePic AS freelancePic, tu.iMobile AS freelancePhone, tg.company_code, tsv.job_code AS jobCode');
			$companyName = self::getAll('abbrivation',substr($data['company_code'],0,-2),'tms_centers');

			$data['companyName'] = $companyName[0]['name'];

			//payment due date number of day
			$data['number_of_days'] = $paymentDue[0]['number_of_days'];

			//invoiceNumber Count
			$data['invoiceCount'] = count(self::get('tms_invoice'));
            //echo '<pre>'; print_r($data); echo '</pre>';exit;

			if(isset($data['orderId'])) {
				//$info = self::getAll('order_id',$data['orderId'],'tms_items');
                $this->_db->where('item_number',$data['item_number']);
                $this->_db->where('order_id',$data['orderId']);
                $info = $this->_db->getOne('tms_items');
                $data['item'] = [];
				if($info){
                    if($info['price']){
                        foreach (json_decode($info['price']) as $field => $val) {
                            $data['item'][] = (array) $val;
                        }
                    }
                }
                /*foreach ($info as $key => $value) {
                    echo '<pre>'; print_r($value); echo '</pre>';exit;
                    if($value['price']){
                        foreach (json_decode($value['price']) as $field => $val) {
    						$data['item'][] = (array) $val;
    					}
                    }
				}*/
			}
			$infoD[$k] = $data;
		}
        return $infoD;
	}
	
	//invoice and draft save
    public function saveInvoice($data) {
        $invoiceAlreadyAdded = false;
        if($data['job_id']){
            $invoiceRecords = $this->_db->get('tms_invoice');

            foreach ($invoiceRecords as $k => $v) {
                foreach (json_decode($v['job_id'],true) as $ke => $val) {
                    $existedJobId = $val['id'];
                    foreach (json_decode($data['job_id'],true) as $k1 => $v1) {
                        $postedJobId = $v1['id'];
                        if($postedJobId == $existedJobId){
                            $invoiceAlreadyAdded = true;
                        }
                    }
                }
            }
        }
        
        if(!$invoiceAlreadyAdded){
            $data['created_date'] = date('Y-m-d');
        	$data['modified_date'] = date('Y-m-d');
        	$data['value_date'] = date('Y-m-d');
        	$data['invoice_date'] = date('Y-m-d');
        	$id = $this->_db->insert('tms_invoice', $data);
        	if($id) {
        		$result['status'] = 200;
        		$result['msg'] = "Successfully saved";
        	} else {
        		$result['status'] = 401;
        		$result['msg'] = "Not saved";
        	}
        	return $result;
        }else{
            $result['status'] = 422;
            $result['msg'] = "Invoice already added for this job";
            return $result;
        }

    }
    
    //display invoice
    public function viewAllClientInvoice($type,$userId) {
        $this->_db->join('tms_users tu', 'tu.iUserId=tmInvoice.freelance_id','LEFT');
		$this->_db->join('tms_client tc', 'tc.iClientId=tmInvoice.customer_id','LEFT');
		$this->_db->join('tms_items ti', 'ti.itemId=tmInvoice.scoop_id','LEFT');
        $this->_db->orderBy('tmInvoice.invoice_id', 'asc');
    	$this->_db->where('tmInvoice.invoice_type', $type);
    	//$this->_db->where('tu.iUserId', $userId);
    	$data = $this->_db->get('tms_invoice_client tmInvoice', null,'ti.itemId AS itemId, ti.order_id AS orderId, tc.iClientId AS clientId,tc.vUserName AS clientCompanyName, tc.vAddress1 AS companyAddress, tc.vEmailAddress  AS companyEmail, tc.vPhone AS companyPhone, tc.vCodeRights AS company_code, tu.iUserId AS freelanceId, tu.vUserName AS freelanceName, tu.vEmailAddress AS freelanceEmail, tu.vAddress1 AS freelanceAddress, tu.vProfilePic AS freelancePic, tu.iMobile AS freelancePhone, tmInvoice.invoice_number, tmInvoice.invoice_id, tmInvoice.invoice_status, tmInvoice.Invoice_cost, tmInvoice.paid_amount,tmInvoice.invoice_date,tmInvoice.created_date,tmInvoice.reminder_sent');

        if($data){
        	// $companyName = self::getAll('abbrivation',substr($value['company_code'],0,-2),'tms_centers');
    		// $data[$key]['companyName'] = isset($companyName[0]['name'])?$companyName[0]['name']:'';	
    	}
    	return $data;
    }
    public function viewAllInvoice1($type) {
		$this->_db->join('tms_users tu', 'tu.iUserId=tmInvoice.freelance_id','LEFT');
		$this->_db->join('tms_client tc', 'tc.iClientId=tmInvoice.customer_id','LEFT');
		$this->_db->join('tms_summmery_view tsv', 'tsv.job_summmeryId=tmInvoice.job_id','LEFT');
		$this->_db->orderBy('tmInvoice.invoice_id', 'asc');
    	$this->_db->where('tmInvoice.invoice_type', $type);
    	$data = $this->_db->get('tms_invoice tmInvoice', null,'tsv.job_summmeryId AS jobId, tsv.order_id AS orderId, tsv.po_number AS poNumber, tc.iClientId AS clientId, tc.vAddress1 AS companyAddress, tc.vEmailAddress  AS companyEmail, tc.vPhone AS companyPhone, tc.vCodeRights AS company_code, tu.iUserId AS freelanceId, tu.vUserName AS freelanceName, tu.vEmailAddress AS freelanceEmail, tu.vAddress1 AS freelanceAddress, tu.vProfilePic AS freelancePic, tu.iMobile AS freelancePhone, tsv.job_code AS jobCode, tmInvoice.invoice_number, tmInvoice.invoice_id, tmInvoice.invoice_status, tmInvoice.Invoice_cost, tmInvoice.paid_amount');
    	foreach ($data as $key => $value) {
    		$companyName = self::getAll('abbrivation',substr($value['company_code'],0,-2),'tms_centers');
    		$data[$key]['companyName'] = isset($companyName[0]['name'])?$companyName[0]['name']:'';	
    	}
    	
    	return $data;
    }
    
    //display one invoice
    public function clientInvoiceViewOne($id) {
    	$id1 = self::getAll('invoice_id',$id,'tms_invoice_client');
        $paymentDue = self::getAll('invoice_due_id',1,'tms_invoice_due_period');

    		foreach (json_decode($id1[0]['scoop_id']) as $k => $v) {
                $this->_db->where('ti.itemId', $v->id);
                $this->_db->join('tms_users tu', 'tu.iUserId=ti.contact_person', 'LEFT');
                $this->_db->join('tms_users tum', 'tum.iUserId=ti.manager', 'LEFT');
                $this->_db->join('tms_general gen', 'gen.order_id=ti.order_id', 'LEFT');
                $this->_db->join('tms_customer tcu','tcu.order_id = ti.order_id', 'INNER');
                $this->_db->join('tms_client tci', 'tci.iClientId=tcu.client', 'LEFT');
                //$this->_db->join('tms_payment tp', 'tp.iClientId=tcu.client', 'LEFT');
                $this->_db->join('tms_payment tp', 'tp.iClientId = tci.iClientId AND tp.iType = 2', 'LEFT');
                $this->_db->join('tms_tax tx', 'tp.tax_rate = tx.tax_id', 'LEFT');
                //$this->_db->join('tms_client_contact tcc','tcc.iClientId = tci.iClientId', 'INNER');
                $this->_db->join('tms_client_contact tcc','tcc.iContactId = tcu.contact', 'LEFT');
                $this->_db->join('tms_client_contact tcce', 'tcce.iClientId = tci.iClientId AND tcce.is_client_invoice = 1', 'LEFT');
                $data = $this->_db->getOne('tms_items ti', 'ti.itemId AS itemId,ti.item_number, ti.order_id AS orderId, ti.price as scoopPrice, ti.total_price as scoop_value, gen.heads_up, gen.order_no AS orderNumber, tci.iClientId AS clientId, tci.vUserName as clientCompanyName, tci.vAddress1 AS companyAddress, tci.address1Detail AS companyAddressDtl, tci.vEmailAddress  AS companyEmail, tci.vPhone AS companyPhone, tci.invoice_no_of_days, tci.client_currency, tcc.vEmail as companycontactEmail, tcce.vEmail as companyInvoiceEmail, tu.iUserId AS freelanceId, tu.vUserName AS freelanceName, tum.vEmailAddress AS freelanceEmail, tu.vAddress1 AS freelanceAddress, tu.vProfilePic AS freelancePic, tu.iMobile AS freelancePhone, tp.vPaymentInfo as clientVatinfo, tx.tax_percentage as tax_rate, ti.po_number');
                
                //echo $this->_db->getLastQuery(); 
                
                //$companyName = self::getAll('abbrivation',substr($data['company_code'],0,-2),'tms_centers');
    
                //$data['companyName'] = 'test';                

                //payment due date number of day
                //$data['number_of_days'] = $paymentDue[0]['number_of_days'];
                $data['number_of_days'] = $data['invoice_no_of_days'] > 0 ? $data['invoice_no_of_days'] : $paymentDue[0]['number_of_days'];
            
                //invoiceNumber Count
                $data['invoiceCount'] = count(self::get('tms_invoice_client'));
                $this->_db->where('item_number',$data['item_number']);
                $this->_db->where('order_id',$data['orderId']);
                $info = $this->_db->getOne('tms_items');
                
                if($info){
                    if($info['price']){
                        foreach (json_decode($info['price']) as $field => $val) {
                            $data['item'][] = (array) $val;
                        }
                    }
                }

                if($data){
                    if($data['scoopPrice']){
                        foreach (json_decode($data['scoopPrice']) as $field => $val) {
                            $data['jobpriceList'][] = (array) $val;
                        }
                    }
                    
                    $data['vBankInfo'] = self::getDefaultbankDetails();
                }
				$infoD[$k] = array_merge($data, $id1[0]);
	    	}
	    	return $infoD;
    }

    //update invoice
    public function invoiceUpdate($id) {
        $data['value_date'] = date('Y-m-d H:i');
    	$data['invoice_type'] = "save";
    	$this->_db->where('invoice_id', $id);
    	$id = $this->_db->update('tms_invoice_client',$data);
    	return $id;
    }
    public function saveEditedInvoice($data,$id) {
        $updata['value_date'] = date('Y-m-d H:i');
        $updata['Invoice_cost'] = $data['Invoice_cost'];
        $updata['item_total'] = $data['item_total'];
        $updata['invoice_date'] = $data['invoice_date'];
        $updata['vat'] = isset($data['vat']) ? $data['vat'] : 0;
        if($id){
            $this->_db->where('invoice_id', $id);
    	    $up_id = $this->_db->update('tms_invoice_client',$updata);
            if($up_id){
                foreach($data['item'] as $item){
                    $scpData['updated_date'] = date('Y-m-d H:i:s');
                    $scpData['total_amount'] = $item['value'];
                    $scpData['total_price'] = $item['value'];
                    $this->_db->where('itemId', $item['id']);
                    $scpstsId = $this->_db->update('tms_items', $scpData);
                }
            }
        }
        if($id) {
    		$res['status'] = 200;
    		$res['msg'] = "Successfully updated";
    	} else {
    		$res['status'] = 401;
    		$res['msg'] = "Not updated";
    	}

    	return $res;
    }

    public function invoiceStatusChange($data, $id) {
        /* Insert Part paid invoice payment detail in database START */
        if(isset($data['partPaid'])){
            $partPaidAmount = array();
            $partPaidAmount['invoice_id']                   = $id;
            $partPaidAmount['invoice_partial_paid_amount']  = $data['partPaid'];
            $partPaidAmount['created_date']                 = date('Y-m-d H:i:s');
            
            $partPaymentInsert = $this->_db->insert('tms_invoice_client_payments', $partPaidAmount);
        }    
        /* Insert Part paid invoice payment detail in database END */

        unset($data['partPaid']);
        if(isset($data['is_update'])){
            $partPaymentInsert = 1;
            unset($data['is_update']);
        }
        $data['modified_date'] = date('Y-m-d');
    	$this->_db->where('invoice_id', $id);
    	$idd = $this->_db->update('tms_invoice_client', $data);

        // Update scoop item status When invoice status change to complete
        if($idd && isset($data['invoice_status'])){
            $this->_db->where('invoice_id', $id);
            $invoiceRecords = $this->_db->get('tms_invoice_client');
            if($data['invoice_status'] == 'Complete'){
                foreach (json_decode($invoiceRecords[0]['scoop_id']) as $field => $val) {
                    $scpData['updated_date'] = date('Y-m-d H:i:s');
                    //$scpData['item_status'] = 'Paid';
                    $scpData['item_status'] = '7'; // Paid status ID
                    $this->_db->where('itemId', $val->id);
                    $scpstsId = $this->_db->update('tms_items', $scpData);
                }
            }    
        }    

        if($idd && isset($partPaymentInsert)) {
    		$request['status'] = 200;
    		$request['msg'] = "Successfully updated";
    	} else {
    		$request['status'] = 401;
    		$request['msg'] = "Not updated";
    	}

    	return $request;
    }
    public function invoiceStatusIrrecoverable($data, $id) {
        $data['modified_date'] = date('Y-m-d');
    	$this->_db->where('invoice_id', $id);
    	$idd = $this->_db->update('tms_invoice_client', $data);
    	
        if($idd) {
    		$request['status'] = 200;
    		$request['msg'] = "Successfully updated";
    	} else {
    		$request['status'] = 401;
    		$request['msg'] = "Not updated";
    	}

    	return $request;
    }


    public function updateJobSummeryItemStatus($data, $id) {
    	$this->_db->where('job_summmeryId', $id);
    	$idd = $this->_db->update('tms_summmery_view', $data);
    	if($idd) {
    		$request['status'] = 200;
    		$request['msg'] = "Successfully updated";
    	} else {
    		$request['status'] = 401;
    		$request['msg'] = "Not updated";
    	}

    	return $request;
    }
    public function getFreelanceStatement($id){
         
        $data = $this->_db->rawQuery("SELECT tu.vUserName,tmInvoice.invoice_number AS InvoiceNo,tmInvoice.paid_date As Date,tmInvoice.Invoice_cost As Amount,tmInvoice.paid_amount,tmInvoice.freelance_id,tmInvoice.customer_id,tmInvoice.value_date,tmInvoice.invoice_type,tmInvoice.invoice_status,tmInvoice.created_date FROM tms_users AS tu INNER JOIN tms_invoice AS tmInvoice ON tu.iUserId = tmInvoice.freelance_id WHERE tu.iUserId = $id");
        return $data;
    }
    public function filterStatement($filterParams){
        //echo '<pre>'; print_r($filterParams); echo '</pre>';
        $this->_db->join('tms_users tu', 'tu.iUserId=tmInvoice.freelance_id','INNER');
        if(isset($filterParams['dueDateFrom']) && isset($filterParams['dueDateTo'])){

            $Frm = $filterParams['dueDateFrom'].' '.'00:00:00';
            $To = $filterParams['dueDateTo'].' '.'00:00:00';
            $this->_db->where('tmInvoice.created_date', Array ($Frm,$To),'BETWEEN');
        }
        
        if(isset($filterParams['comapanyCode'])){
            $cCode = $filterParams['comapanyCode'];
            $this->_db->where('tmInvoice.invoice_number','%'.$cCode.'%', 'like');
        }

        if(isset($filterParams['resource'])){
            $this->_db->where('tmInvoice.freelance_id', $filterParams['resource']);
        }
        if(isset($filterParams['invoiceStatus'])){
            $this->_db->where('tmInvoice.invoice_status', $filterParams['invoiceStatus']);
        }
        if(isset($filterParams['invoiceNumber'])){
            $this->_db->where('tmInvoice.invoice_number', $filterParams['invoiceNumber']);
        }
        
        $data = $this->_db->get('tms_invoice tmInvoice', null,' tu.vUserName,tmInvoice.invoice_number AS InvoiceNo,tmInvoice.paid_date As Date,tmInvoice.Invoice_cost As Amount,tmInvoice.paid_amount,tmInvoice.freelance_id,tmInvoice.customer_id,tmInvoice.value_date,tmInvoice.invoice_type,tmInvoice.invoice_status,tmInvoice.created_date');
        return $data;
    }

    // Client statement page
    public function getClientStatement($id){
        $data = $this->_db->rawQuery("SELECT tu.vUserName,tmInvoice.invoice_number AS InvoiceNo,tmInvoice.paid_date As Date,tmInvoice.Invoice_cost As Amount,tmInvoice.paid_amount,tmInvoice.freelance_id,tmInvoice.customer_id,tmInvoice.value_date,tmInvoice.invoice_type,tmInvoice.invoice_status,tmInvoice.created_date FROM tms_users AS tu INNER JOIN tms_invoice_client AS tmInvoice ON tu.iUserId = tmInvoice.freelance_id WHERE tu.iUserId = $id");
        return $data;
    }
    // Client statement page
    public function filterClientStatement($filterParams){
        //echo '<pre>'; print_r($filterParams); echo '</pre>';
        //$this->_db->join('tms_users tu', 'tu.iUserId=tmInvoice.freelance_id','INNER');
        $this->_db->join('tms_users tu', 'tu.iUserId=tmInvoice.freelance_id','LEFT');
        $this->_db->join('tms_client tc', 'tc.iClientId=tmInvoice.customer_id','LEFT');
        if(isset($filterParams['dueDateFrom']) && isset($filterParams['dueDateTo'])){

            $Frm = $filterParams['dueDateFrom'].' '.'00:00:00';
            $To = $filterParams['dueDateTo'].' '.'00:00:00';
            $this->_db->where('tmInvoice.created_date', Array ($Frm,$To),'BETWEEN');
        }
        
        if(isset($filterParams['comapanyCode'])){
            $cCode = $filterParams['comapanyCode'];
            $this->_db->where('tmInvoice.invoice_number','%'.$cCode.'%', 'like');
        }

        if(isset($filterParams['resource'])){
            $this->_db->where('tmInvoice.freelance_id', $filterParams['resource']);
        }
        if(isset($filterParams['invoiceStatus'])){
            $this->_db->where('tmInvoice.invoice_status', $filterParams['invoiceStatus']);
        }
        if(isset($filterParams['invoiceNumber'])){
            $this->_db->where('tmInvoice.invoice_number', $filterParams['invoiceNumber']);
        }
        
        $data = $this->_db->get('tms_invoice_client tmInvoice', null,' tu.vUserName,tmInvoice.invoice_number AS InvoiceNo,tmInvoice.paid_date As Date,tmInvoice.Invoice_cost As Amount,tmInvoice.paid_amount,tmInvoice.freelance_id,tmInvoice.customer_id,tmInvoice.value_date,tmInvoice.invoice_type,tmInvoice.invoice_status,tmInvoice.created_date,tc.vUserName as companyName,tc.vCodeRights');
        //echo $this->_db->getLastQuery();
        return $data;
    }
    /* Get All save invoice BY FreelancerId/UserId */
    public function getAllInvoiceByUserId($type,$userId) {
        //echo $userId;exit;
        $this->_db->join('tms_users tu', 'tu.iUserId=tmInvoice.freelance_id','LEFT');
        $this->_db->join('tms_client tc', 'tc.iClientId=tmInvoice.customer_id','LEFT');
        $this->_db->join('tms_summmery_view tsv', 'tsv.job_summmeryId=tmInvoice.job_id','LEFT');
        $this->_db->orderBy('tmInvoice.invoice_id', 'asc');
        $this->_db->where('tmInvoice.invoice_type', $type);
        $this->_db->where('tmInvoice.freelance_id',$userId);
        $data = $this->_db->get('tms_invoice tmInvoice', null,'tsv.job_summmeryId AS jobId, tsv.order_id AS orderId, tsv.po_number AS poNumber, tc.iClientId AS clientId, tc.vAddress1 AS companyAddress, tc.vEmailAddress  AS companyEmail, tc.vPhone AS companyPhone, tc.vCodeRights AS company_code, tu.iUserId AS freelanceId, tu.vUserName AS freelanceName, tu.vEmailAddress AS freelanceEmail, tu.vAddress1 AS freelanceAddress, tu.vProfilePic AS freelancePic, tu.iMobile AS freelancePhone, tsv.job_code AS jobCode, tmInvoice.invoice_number, tmInvoice.invoice_id, tmInvoice.invoice_status, tmInvoice.Invoice_cost, tmInvoice.paid_amount');
        foreach ($data as $key => $value) {
            $companyName = self::getAll('abbrivation',substr($value['company_code'],0,-2),'tms_centers');
            $data[$key]['companyName'] = isset($companyName[0]['name'])?$companyName[0]['name']:''; 
        }
        
        return $data;
    }


    // getInvoicePartPayments
    public function getClientInvoicePartPayments($id) {
        $this->_db->where('invoice_id', $id);
        $data = $this->_db->get('tms_invoice_client_payments');
        return $data;
    }

    public function sendInvoiceMail($data) {
        $pdf_content = explode("base64,",$data['pdfData']);
        $bin = base64_decode($pdf_content[1], true);
        $pdfFileName = $data['invoiceno'].'.pdf';
        $invoiceDue = isset($data['invoiceDue']) ? $data['invoiceDue'] : '';
        $this->_db->where('template_id',12);
        $emailTemplateInvoice = $this->_db->getOne('tms_email_templates');
        $search_array = array("[INVOICENO]", "[PAYDUE]");
        $replace_array = array($data['invoiceno'], $invoiceDue );

        $body = str_replace($search_array, $replace_array, $emailTemplateInvoice['template_content']);
        //$body = "<p> Hello ".$data['clientCompanyName']." </p>";
        //$body .= "<p>Please see the attached invoice : <b>" .$data['invoiceno']. "</b> </p>";
        //$body .= "Email: " .$data['freelanceEmail']. "</p>";
        
        $attachments = '';
        $subject = ($data['outstanding_reminder']==1) ? "Invoice Outstanding" : 'Invoice';
        $to_name = ' ';
        //$to = 'anil.kanhasoft@gmail.com';
        $to = $data['companycontactEmail'];

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
        //if ($response->success()) { //output success or failure messages
                if(isset($data['outstanding_reminder'])){
                    if($data['outstanding_reminder']==1)
                        $upData['reminder_sent'] = 1;
                }
                $upData['modified_date'] = date('Y-m-d');
                $upData['is_invoice_sent'] = 1;
                $this->_db->where('invoice_id', $data['invoice_id']);
                $this->_db->update('tms_invoice_client',$upData);

                // start Update status in scoop table
                $qry_invc = "SELECT scoop_id FROM tms_invoice_client WHERE invoice_id = '".$data['invoice_id']."' ";
                $invcData = $this->_db->rawQuery($qry_invc);
                if ( count($invcData) && array_key_exists("scoop_id", $invcData[0])) {
                    $invcScpIds = json_decode($invcData[0]['scoop_id']);
                    foreach ($invcScpIds as $key => $value) {
                        $scpData['updated_date'] = date('Y-m-d H:i:s');
                        $scpData['item_status'] = '6'; // Invoiced status ID
                        $this->_db->where('itemId', $value->id);
                        $scpstsId = $this->_db->update('tms_items', $scpData);
                    }
                }
                // End Update status in scoop table

                $result['status'] = 200;
                $result['msg'] = 'Success';
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
    public function sendInvoiceMail_smtp($data) {
        $pdf_content = explode("base64,",$data['pdfData']);
        $bin = base64_decode($pdf_content[1], true);
        // if (strpos($bin, '%PDF') !== 0) {
        //     throw new Exception('Missing the PDF file ');
        // }
        $path = '../../uploads/invoice/';
        // if ( !file_exists($dir) ) {
        //     mkdir ($dir, 0755);
        // }
        $pdfFile = $path.$data['invoiceno'].'.pdf';

        // Start Email Config
        $body = "<p> Hi ".$data['clientCompanyName']." </p>";
        $body .= "<p>Please see attached invoice number : <b>" .$data['invoiceno']. "</b> </p>";
        $body .= "<p> From :TMS </p>";
        $body .= "Email: " .$data['freelanceEmail']. "</p>";
        
        $subject = ($data['outstanding_reminder']==1) ? "Outstanding Invoice" : 'Invoice';

        $to = $data['companycontactEmail'];
        //$to = 'anil.kanhasoft@gmail.com';
        //$from = $data['data']['vEmailAddress'];
        $this->_mailer = new PHPMailer();
        // $this->_mailer = 'ISO-8859-1';
        $this->_mailer->IsSMTP();
        $this->_mailer->Host = "ssl://smtp.gmail.com";
        $this->_mailer->SMTPAuth = "true";
        $this->_mailer->Port = "465";
        $this->_mailer->Username = SMTP_EMAIL_USER;
        $this->_mailer->Password = SMTP_EMAIL_PASSWORD;

        $this->_mailer->From = "TMS";
        $this->_mailer->SetFrom = 'tmsadmin@tms.com';
        $this->_mailer->FromName = $data['freelanceName'];
            
        $this->_mailer->Subject = $subject;

        $this->_mailer->Body = $body;
        $this->_mailer->WordWrap = 100;
        $this->_mailer->AddAddress($to);
        //$this->_mailer->AddEmbeddedImage($emailImageData, 'logo_2u');
        $this->_mailer->IsHTML(true);
        // End email config
        // Write the PDF contents to a local file
        
        if(file_put_contents($pdfFile, $bin)){
            if ($pdfFile != '') {
                $this->_mailer->AddAttachment($pdfFile);
            }
            if ($this->_mailer->Send()) { //output success or failure messages
                if(isset($data['outstanding_reminder'])){
                    if($data['outstanding_reminder']==1)
                    $upData['reminder_sent'] = 1;
                }
                $upData['modified_date'] = date('Y-m-d');
                $upData['is_invoice_sent'] = 1;
                $this->_db->where('invoice_id', $data['invoice_id']);
                $this->_db->update('tms_invoice_client',$upData);

                $result['status'] = 200;
                $result['msg'] = 'Thank you for your email';
                $path = "../../uploads/invoice/";
                $pdfFiles = glob($pdfFile);
                if($pdfFiles){
                    //unlink($pdfFile);
                }
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

	// Client invoice serach data get
	public function clientInvoiceCreate($data1) {
		$infoD = array();
		$paymentDue = self::getAll('invoice_due_id',1,'tms_invoice_due_period');
		foreach ($data1['id'] as $k => $v) {
			$this->_db->where('itemId', $v['id']);
			$this->_db->join('tms_users tu', 'tu.iUserId=ti.contact_person', 'LEFT');
			$this->_db->join('tms_general gen', 'gen.order_id=ti.order_id', 'LEFT');
			$this->_db->join('tms_customer tcu','tcu.order_id = ti.order_id', 'INNER');
			$this->_db->join('tms_client tci', 'tci.iClientId=tcu.client', 'LEFT');
            //$this->_db->join('tms_payment tp', 'tp.iClientId=tcu.client', 'LEFT');
            $this->_db->join('tms_payment tp', 'tp.iClientId = tci.iClientId AND tp.iType = 2', 'LEFT');
			$this->_db->join('tms_tax tx', 'tp.tax_rate = tx.tax_id', 'LEFT');
            $this->_db->join('tms_client_contact tcc','tcc.iClientId = tci.iClientId', 'INNER');
			//$data = $this->_db->getOne('tms_summmery_view tsv', 'tsv.job_summmeryId AS jobId,tsv.item_id AS item_number, tsv.order_id AS orderId, tsv.po_number AS poNumber, tci.iClientId AS clientId, tci.vAddress1 AS companyAddress, tci.vEmailAddress  AS companyEmail, tci.vPhone AS companyPhone, tu.iUserId AS freelanceId, tu.vUserName AS freelanceName, tu.vEmailAddress AS freelanceEmail, tu.vAddress1 AS freelanceAddress, tu.vProfilePic AS freelancePic, tu.iMobile AS freelancePhone, tg.company_code, tsv.job_code AS jobCode');
			$data = $this->_db->getOne('tms_items ti', 'ti.itemId AS itemId,ti.item_number, ti.item_name, ti.order_id AS orderId,ti.total_price as scoop_value, gen.heads_up, gen.order_no AS orderNumber, tci.iClientId AS clientId, tci.vUserName as clientCompanyName, tci.vAddress1 AS companyAddress, tci.vEmailAddress  AS companyEmail, tci.vPhone AS companyPhone,tci.address1Detail AS companyAddressDtl,tci.invoice_no_of_days, tci.client_currency, tu.iUserId AS freelanceId, tu.vUserName AS freelanceName, tu.vEmailAddress AS freelanceEmail, tu.vAddress1 AS freelanceAddress, tu.vProfilePic AS freelancePic, tu.iMobile AS freelancePhone, tp.vPaymentInfo as clientVatinfo, tx.tax_percentage as tax_rate, ti.po_number');

            // echo $this->_db->getLastQuery();
            //$companyName = self::getAll('abbrivation',substr($data['company_code'],0,-2),'tms_centers');
			//$data['companyName'] = $companyName;

			//payment due date number of day
			//$data['number_of_days'] = $paymentDue[0]['number_of_days'];
            $data['number_of_days'] = $data['invoice_no_of_days'] > 0 ? $data['invoice_no_of_days'] : $paymentDue[0]['number_of_days'];
            
			//invoiceNumber Count
			$data['invoiceCount'] = count(self::get('tms_invoice_client'));
            //echo '<pre>'; print_r($data); echo '</pre>';exit;

			if(isset($data['orderId'])) {
				//$info = self::getAll('order_id',$data['orderId'],'tms_items');
                $this->_db->where('item_number',$data['item_number']);
                $this->_db->where('order_id',$data['orderId']);
                $info = $this->_db->getOne('tms_items');
                $data['item'] = [];
				if($info){
                    if($info['price']){
                        foreach (json_decode($info['price']) as $field => $val) {
                            $data['item'][] = (array) $val;
                        }
                    }
                }

                $data['vBankInfo'] = self::getDefaultbankDetails();
			}
			$infoD[$k] = $data;
		}
        return $infoD;
	}

    //invoice save and draft invoice save
    public function saveclientInvoice($data) {
        $invoiceAlreadyAdded = false;
        if($data['scoop_id']){
            $invoiceRecords = $this->_db->get('tms_invoice_client');
            foreach ($invoiceRecords as $k => $v) {
                foreach (json_decode($v['scoop_id'],true) as $ke => $val) {
                    $existedJobId = $val['id'];
                    foreach (json_decode($data['scoop_id'],true) as $k1 => $v1) {
                        $postedJobId = $v1['id'];
                        if($postedJobId == $existedJobId){
                            $invoiceAlreadyAdded = true;
                        }
                    }
                }
            }
        }
        $scoopData = array();
        if(isset($data['item'])){
            $scoopData = $data['item'];
            unset($data['item']);
        }
        if(!$invoiceAlreadyAdded){
            $data['created_date'] = date('Y-m-d');
            $data['modified_date'] = date('Y-m-d');
            $data['value_date'] = date('Y-m-d');
            //$data['invoice_date'] = date('Y-m-d');
            $id = $this->_db->insert('tms_invoice_client', $data);
            if($id && $scoopData){
                foreach($scoopData as $item){
                    $scpData['updated_date'] = date('Y-m-d H:i:s');
                    $scpData['total_amount'] = $item['value'];
                    $scpData['total_price'] = $item['value'];
                    $scpData['item_status'] = '6'; // status id Invoiced = 6
                    $this->_db->where('itemId', $item['id']);
                    $scpstsId = $this->_db->update('tms_items', $scpData);
                }
            }
            if($id) {
                $result['status'] = 200;
                $result['inserted_id'] = $id;
                $result['msg'] = "Successfully saved";
            } else {
                $result['status'] = 401;
                $result['msg'] = "Not saved";
            }
            return $result;
        }else{
            $result['status'] = 422;
            $result['msg'] = "Invoice already added for this Project / scoop";
            return $result;
        }

    }

    public function clientInvoiceExcelStatus($data) {
        $allUpdated = false;
        $i = 0;
        $len = count($data);
        $updata['value_date'] = date('Y-m-d H:i');
        $updata['is_excel_download'] = 1;
        foreach ($data as $item) {
            $this->_db->where('invoice_id', $item);
            $scpstsId = $this->_db->update('tms_invoice_client', $updata);
            if($i == $len - 1) {
                $allUpdated = true;
            }
            $i++;
        }
        if($allUpdated){
            $result['status'] = 200;
            $result['msg'] = "Successfully Updated";
        }else{
            $result['status'] = 422;
            $result['msg'] = "Not updated";
        }
        return $result;
    }
    
    /* Get All client invoice */
    public function getAllInvoiceClient($type,$userId) {
        //echo $userId;exit;
        $this->_db->join('tms_users tu', 'tu.iUserId=tmInvoice.freelance_id','LEFT');
        $this->_db->join('tms_client tc', 'tc.iClientId=tmInvoice.customer_id','LEFT');
        $this->_db->join('tms_items ti', 'ti.itemId=tmInvoice.scoop_id','LEFT');
        $this->_db->orderBy('tmInvoice.invoice_id', 'asc');
        $this->_db->where('tmInvoice.invoice_type', $type);
        //$this->_db->where('tmInvoice.freelance_id',$userId);
        $data = $this->_db->get('tms_invoice_client tmInvoice', null,'ti.itemId AS jobId, ti.order_id AS orderId, tc.iClientId AS clientId, tc.vUserName as clientCompanyName, tc.vAddress1 AS companyAddress, tc.vEmailAddress  AS companyEmail, tc.vPhone AS companyPhone, tc.vCodeRights AS company_code, tc.client_currency, tc.invoice_no_of_days, tu.iUserId AS freelanceId, tu.vUserName AS freelanceName, tu.vEmailAddress AS freelanceEmail, tu.vAddress1 AS freelanceAddress, tu.vProfilePic AS freelancePic, tu.iMobile AS freelancePhone, tmInvoice.invoice_number, tmInvoice.invoice_id, tmInvoice.invoice_status, tmInvoice.Invoice_cost, tmInvoice.paid_amount, tmInvoice.scoop_id, tmInvoice.is_excel_download, tmInvoice.paid_date,  tmInvoice.invoice_date, tmInvoice.created_date');
        //echo $this->_db->getLastQuery();
        foreach ($data as $key => $value) {
            $data[$key]['companyName'] = ''; 
        }
        
        return $data;
    }

    // get Default Bank Details
    public function getDefaultbankDetails() {
        $this->_db->where('is_default', 1);
        $data = $this->_db->get('tms_banking_info');
        return $data;
    }

    // Get all invoice list
    public function getClientInvoicelistAll() {
        $data = $this->_db->get('tms_invoice_client');
        return $data;
    }
    // Invoice Design template
    public function clientInvoiceDesignType() {
        $data = $this->_db->getOne('tms_invoice_setting');
        return $data;
    }
    // Invoice setting data
    public function getClientInvoiceSetting() {
        $data = $this->_db->get('tms_invoice_setting');
        return $data;
    }
    
}