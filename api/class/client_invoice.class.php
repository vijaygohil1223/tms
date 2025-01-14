<?php
require_once 'users.class.php';
require_once 'client.class.php';
require_once 'functions.class.php';
require_once 'mpdf.class.php';

require_once 'phpWordDoc.class.php';
class Client_invoice
{

    public function __construct()
    {
        $this->_db = db::getInstance();
    }

    public function getAll($field, $id, $table)
    {
        $this->_db->where($field, $id);
        return $this->_db->get($table);
    }

    public function get($table)
    {
        return $this->_db->get($table);
    }

    public function getInvoiceNumberClient()
    {
        //$invoiceData = self::get('tms_invoice');
        $invoiceData = self::get('tms_invoice_client');
        return $invoiceData;
    }

    //invoice serach data get
    public function invoiceCreate($data1)
    {
        $infoD = array();
        $paymentDue = self::getAll('invoice_due_id', 1, 'tms_invoice_due_period');
        foreach ($data1['id'] as $k => $v) {
            $this->_db->where('job_summmeryId', $v['id']);
            $this->_db->join('tms_users tu', 'tu.iUserId=tsv.resource', 'LEFT');
            $this->_db->join('tms_general tg', 'tg.order_id = tsv.order_id', 'INNER');
            $this->_db->join('tms_customer tcu', 'tcu.order_id = tsv.order_id', 'INNER');
            $this->_db->join('tms_client tci', 'tci.iClientId=tcu.client', 'LEFT');
            $data = $this->_db->getOne('tms_summmery_view tsv', 'tsv.job_summmeryId AS jobId,tsv.item_id AS item_number, tsv.order_id AS orderId, tsv.po_number AS poNumber, tci.iClientId AS clientId, tci.vAddress1 AS companyAddress, tci.vEmailAddress  AS companyEmail, tci.vPhone AS companyPhone, tu.iUserId AS freelanceId, concat(tu.vFirstName, " ", tu.vLastName) AS freelanceName, tu.vEmailAddress AS freelanceEmail, tu.vAddress1 AS freelanceAddress, tu.vProfilePic AS freelancePic, tu.iMobile AS freelancePhone, tg.company_code, tsv.job_code AS jobCode');
            $companyName = self::getAll('abbrivation', substr($data['company_code'], 0, -2), 'tms_centers');

            $data['companyName'] = $companyName[0]['name'];

            //payment due date number of day
            $data['number_of_days'] = $paymentDue[0]['number_of_days'];

            //invoiceNumber Count
            $data['invoiceCount'] = count(self::get('tms_invoice'));
            //echo '<pre>'; print_r($data); echo '</pre>';exit;

            if (isset($data['orderId'])) {
                //$info = self::getAll('order_id',$data['orderId'],'tms_items');
                $this->_db->where('item_number', $data['item_number']);
                $this->_db->where('order_id', $data['orderId']);
                $info = $this->_db->getOne('tms_items');
                $data['item'] = [];
                if ($info) {
                    if ($info['price']) {
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
    public function saveInvoice($data)
    {
        $invoiceAlreadyAdded = false;
        if ($data['job_id']) {
            $invoiceRecords = $this->_db->get('tms_invoice');

            foreach ($invoiceRecords as $k => $v) {
                foreach (json_decode($v['job_id'], true) as $ke => $val) {
                    $existedJobId = $val['id'];
                    foreach (json_decode($data['job_id'], true) as $k1 => $v1) {
                        $postedJobId = $v1['id'];
                        if ($postedJobId == $existedJobId) {
                            $invoiceAlreadyAdded = true;
                        }
                    }
                }
            }
        }

        if (!$invoiceAlreadyAdded) {
            $data['created_date'] = date('Y-m-d');
            $data['modified_date'] = date('Y-m-d');
            $data['value_date'] = date('Y-m-d');
            $data['invoice_date'] = date('Y-m-d');
            $id = $this->_db->insert('tms_invoice', $data);
            if ($id) {
                $result['status'] = 200;
                $result['msg'] = "Successfully saved";
            } else {
                $result['status'] = 401;
                $result['msg'] = "Not saved";
            }
            return $result;
        } else {
            $result['status'] = 422;
            $result['msg'] = "Invoice already added for this job";
            return $result;
        }

    }

    //display invoice
    public function viewAllClientInvoice($type, $userId)
    {
        $this->_db->join('tms_users tu', 'tu.iUserId=tmInvoice.freelance_id', 'LEFT');
        $this->_db->join('tms_client tc', 'tc.iClientId=tmInvoice.customer_id', 'LEFT');
        $this->_db->join('tms_items ti', 'ti.itemId=tmInvoice.scoop_id', 'LEFT');
        $this->_db->orderBy('tmInvoice.invoice_id', 'asc');
        $this->_db->where('tmInvoice.invoice_type', $type);
        //$this->_db->where('tu.iUserId', $userId);
        $data = $this->_db->get('tms_invoice_client tmInvoice', null, 'ti.itemId AS itemId, ti.order_id AS orderId, tc.iClientId AS clientId,tc.vUserName AS clientCompanyName, tc.vAddress1 AS companyAddress, tc.vEmailAddress  AS companyEmail, tc.vPhone AS companyPhone, tc.vCodeRights AS company_code, tu.iUserId AS freelanceId, tu.vUserName AS freelanceName, tu.vEmailAddress AS freelanceEmail, tu.vAddress1 AS freelanceAddress, tu.vProfilePic AS freelancePic, tu.iMobile AS freelancePhone, tmInvoice.invoice_number, tmInvoice.invoice_id, tmInvoice.invoice_status, tmInvoice.Invoice_cost, tmInvoice.paid_amount,tmInvoice.invoice_date,tmInvoice.created_date,tmInvoice.reminder_sent,tmInvoice.currency_rate ');

        if ($data) {
            // $companyName = self::getAll('abbrivation',substr($value['company_code'],0,-2),'tms_centers');
            // $data[$key]['companyName'] = isset($companyName[0]['name'])?$companyName[0]['name']:'';	
        }
        return $data;
    }
    public function viewAllInvoice1($type)
    {
        $this->_db->join('tms_users tu', 'tu.iUserId=tmInvoice.freelance_id', 'LEFT');
        $this->_db->join('tms_client tc', 'tc.iClientId=tmInvoice.customer_id', 'LEFT');
        $this->_db->join('tms_summmery_view tsv', 'tsv.job_summmeryId=tmInvoice.job_id', 'LEFT');
        $this->_db->orderBy('tmInvoice.invoice_id', 'asc');
        $this->_db->where('tmInvoice.invoice_type', $type);
        $data = $this->_db->get('tms_invoice tmInvoice', null, 'tsv.job_summmeryId AS jobId, tsv.order_id AS orderId, tsv.po_number AS poNumber, tc.iClientId AS clientId, tc.vAddress1 AS companyAddress, tc.vEmailAddress  AS companyEmail, tc.vPhone AS companyPhone, tc.vCodeRights AS company_code, tu.iUserId AS freelanceId, concat(tu.vFirstName, " ", tu.vLastName) AS freelanceName, tu.vEmailAddress AS freelanceEmail, tu.vAddress1 AS freelanceAddress, tu.vProfilePic AS freelancePic, tu.iMobile AS freelancePhone, tsv.job_code AS jobCode, tmInvoice.invoice_number, tmInvoice.invoice_id, tmInvoice.invoice_status, tmInvoice.Invoice_cost, tmInvoice.paid_amount');
        foreach ($data as $key => $value) {
            $companyName = self::getAll('abbrivation', substr($value['company_code'], 0, -2), 'tms_centers');
            $data[$key]['companyName'] = isset($companyName[0]['name']) ? $companyName[0]['name'] : '';
        }

        return $data;
    }

    //display one invoice
    public function clientInvoiceViewOne($id)
    {
        //$invc = self::getAll('invoice_id',$id,'tms_invoice_client');
        $this->_db->where('ticl.invoice_id', $id);
        $this->_db->join('tms_invoice_credit_notes tcn', 'ticl.invoice_id=tcn.invoice_id', 'LEFT');
        $this->_db->join('tms_users tu', 'tu.iUserId=tcn.createdByUser', 'LEFT');
        $invc = $this->_db->getOne('tms_invoice_client ticl', 'ticl.*, tcn.credit_note_no, tcn.created_date as credit_created_date, CONCAT(tu.vFirstName," ",tu.vLastName) as credit_created_by, tu.vEmailAddress as credit_user_email  ');

        $paymentDue = self::getAll('invoice_due_id', 1, 'tms_invoice_due_period');

        // get payment information
        $this->_db->where('tic.invoice_id', $id);
        $this->_db->join('tms_invoice_client tic', 'tic.customer_id=tp.iClientId', 'LEFT');
        $paymentInfo = $this->_db->getOne('tms_payment tp', 'tp.vPaymentInfo');

        // get sign data.
        $this->_db->where('tic.created_by', $invc['created_by']);
        $this->_db->join('tms_invoice_client tic', 'tic.created_by=tu.iUserId', 'LEFT');
        $userSignInfo = $this->_db->getOne('tms_users tu', 'tu.vSignUpload,tu.vFirstName,tu.vLastName');

        // get client payment info for the invoice details
        $this->_db->where('tmc.iClientId', $invc['customer_id']);
        $this->_db->join('tms_client tmc', 'tmc.client_currency=tb.currency_code', 'LEFT');
        $matchBankInfo = $this->_db->getOne('tms_banking_info tb', 'tb.*');

        $this->_db->where('tis.invc_Id', $id);
        //$scoopData = $this->_db->get('tms_invoice_scoops tis', null, 'tis.invc_Id, tis.invc_scoop_id, tis.scoop_price, tis.scoop_order_number, tis.scoop_item_number, tis.scoop_name, tis.scoop_po_number ');
        $scoopData = $this->_db->get('tms_invoice_scoops tis', null, 'tis.invc_Id, tis.invc_scoop_id as itemId, tis.scoop_price as scoop_value, tis.scoop_order_number as orderNumber, tis.scoop_item_number as item_number, tis.scoop_name as item_name, tis.scoop_po_number as po_number, tis.accounting_inv_comment ');

        $this->_db->where('ti.invc_Id', $id);
        $this->_db->join('tms_invoice_scoops ti', 'ti.invc_Id = ticNew.invoice_id', 'INNER');
        $this->_db->join('tms_general gen', 'gen.order_id=ti.scoop_order_id', 'LEFT');
        $this->_db->join('tms_customer tcu', 'tcu.order_id = ti.scoop_order_id', 'INNER');
        $this->_db->join('tms_client tci', 'tci.iClientId=tcu.client', 'LEFT');
        $this->_db->join('tms_payment tp', 'tp.iClientId = tci.iClientId AND tp.iType = 2', 'LEFT');
        $this->_db->join('tms_tax tx', 'tp.tax_rate = tx.tax_id', 'LEFT');
        $this->_db->join('tms_client_contact tcc', 'tcc.iContactId = tcu.contact', 'LEFT');
        $this->_db->join('tms_client_contact tcce', 'tcce.iClientId = tci.iClientId AND tcce.is_client_invoice = 1', 'LEFT');
        $data = $this->_db->getOne('tms_invoice_client ticNew', ' tci.iClientId AS clientId, tci.vUserName as clientCompanyName, tci.vAddress1 AS companyAddress, tci.address1Detail AS companyAddressDtl, tci.vEmailAddress  AS companyEmail, tci.vPhone AS companyPhone, tci.invoice_no_of_days, tci.client_currency, tci.vCenterid, tcc.vEmail as companycontactEmail, tcce.vEmail as companyInvoiceEmail, tp.vPaymentInfo as clientVatinfo, tx.tax_percentage as tax_rate ');

        $data['vBankInfo'] = self::getDefaultbankDetails();
        $data['paymentInfoClient'] = (isset($paymentInfo) && !empty($paymentInfo)) ? $paymentInfo['vPaymentInfo'] : "";
        $data['userSignInfo'] = (isset($userSignInfo) && !empty($userSignInfo)) ? $userSignInfo : "";
        $data['matchBankInfo'] = (isset($matchBankInfo) && !empty($matchBankInfo)) ? $matchBankInfo : "";
        $data['scoopData'] = (isset($scoopData) && !empty($scoopData)) ? $scoopData : "";
        $infoD = array_merge($data, $invc);
        // foreach (json_decode($invc['scoop_id']) as $k => $v) {
        //     $this->_db->where('ti.itemId', $v->id);
        //     //$this->_db->join('tms_users tu', 'tu.iUserId=ti.contact_person', 'LEFT');
        //     //$this->_db->join('tms_users tum', 'tum.iUserId=ti.manager', 'LEFT');
        //     $this->_db->join('tms_general gen', 'gen.order_id=ti.order_id', 'LEFT');
        //     $this->_db->join('tms_customer tcu', 'tcu.order_id = ti.order_id', 'INNER');
        //     $this->_db->join('tms_client tci', 'tci.iClientId=tcu.client', 'LEFT');
        //     //$this->_db->join('tms_payment tp', 'tp.iClientId=tcu.client', 'LEFT');
        //     $this->_db->join('tms_payment tp', 'tp.iClientId = tci.iClientId AND tp.iType = 2', 'LEFT');
        //     $this->_db->join('tms_tax tx', 'tp.tax_rate = tx.tax_id', 'LEFT');
        //     //$this->_db->join('tms_client_contact tcc','tcc.iClientId = tci.iClientId', 'INNER');
        //     $this->_db->join('tms_client_contact tcc', 'tcc.iContactId = tcu.contact', 'LEFT');
        //     $this->_db->join('tms_client_contact tcce', 'tcce.iClientId = tci.iClientId AND tcce.is_client_invoice = 1', 'LEFT');
        //     //$data = $this->_db->getOne('tms_items ti', 'ti.itemId AS itemId,ti.item_number, ti.order_id AS orderId, ti.price as scoopPrice, ti.total_price as scoop_value, gen.heads_up, gen.order_no AS orderNumber, tci.iClientId AS clientId, tci.vUserName as clientCompanyName, tci.vAddress1 AS companyAddress, tci.address1Detail AS companyAddressDtl, tci.vEmailAddress  AS companyEmail, tci.vPhone AS companyPhone, tci.invoice_no_of_days, tci.client_currency, tci.vCenterid, tcc.vEmail as companycontactEmail, tcce.vEmail as companyInvoiceEmail, tu.iUserId AS freelanceId, tu.vUserName AS freelanceName, tum.vEmailAddress AS freelanceEmail, tu.vAddress1 AS freelanceAddress, tu.vProfilePic AS freelancePic, tu.iMobile AS freelancePhone, tp.vPaymentInfo as clientVatinfo, tx.tax_percentage as tax_rate, ti.po_number, ti.item_name, ti.accounting_inv_comment');
        //     $data = $this->_db->getOne('tms_items ti', 'ti.itemId AS itemId,ti.item_number, ti.order_id AS orderId, ti.price as scoopPrice, ti.total_price as scoop_value, gen.heads_up, gen.order_no AS orderNumber, tci.iClientId AS clientId, tci.vUserName as clientCompanyName, tci.vAddress1 AS companyAddress, tci.address1Detail AS companyAddressDtl, tci.vEmailAddress  AS companyEmail, tci.vPhone AS companyPhone, tci.invoice_no_of_days, tci.client_currency, tci.vCenterid, tcc.vEmail as companycontactEmail, tcce.vEmail as companyInvoiceEmail, tp.vPaymentInfo as clientVatinfo, tx.tax_percentage as tax_rate, ti.po_number, ti.item_name, ti.accounting_inv_comment');

        //     //echo $this->_db->getLastQuery(); 

        //     //$companyName = self::getAll('abbrivation',substr($data['company_code'],0,-2),'tms_centers');

        //     //$data['companyName'] = 'test';                

        //     //payment due date number of day
        //     //$data['number_of_days'] = $paymentDue[0]['number_of_days'];
        //     $data['number_of_days'] = isset($data['invoice_no_of_days']) && $data['invoice_no_of_days'] > 0 ? $data['invoice_no_of_days'] : $paymentDue[0]['number_of_days'];

        //     //invoiceNumber Count
        //     $data['invoiceCount'] = count(self::get('tms_invoice_client'));
        //     $this->_db->where('item_number', $data['item_number']);
        //     $this->_db->where('order_id', $data['orderId']);
        //     $info = $this->_db->getOne('tms_items');

        //     if ($info) {
        //         if ($info['price']) {
        //             foreach (json_decode($info['price']) as $field => $val) {
        //                 $data['item'][] = (array) $val;
        //             }
        //         }
        //     }

        //     // if ($data) {
        //     //     if ($data['scoopPrice']) {
        //     //         foreach (json_decode($data['scoopPrice']) as $field => $val) {
        //     //             $data['jobpriceList'][] = (array) $val;
        //     //         }
        //     //     }
        //     //     //$data['vBankInfo'] = self::getDefaultbankDetails();
        //     // }
            
        //     $data['vBankInfo'] = self::getDefaultbankDetails();
        //     $data['paymentInfoClient'] = (isset($paymentInfo) && !empty($paymentInfo)) ? $paymentInfo['vPaymentInfo'] : "";
        //     $data['userSignInfo'] = (isset($userSignInfo) && !empty($userSignInfo)) ? $userSignInfo : "";
        //     $data['matchBankInfo'] = (isset($matchBankInfo) && !empty($matchBankInfo)) ? $matchBankInfo : "";
        //     $data['scoopData'] = (isset($scoopData) && !empty($scoopData)) ? $scoopData : "";
        //     $infoD[$k] = array_merge($data, $invc);
        // }
        return $infoD;
    }

    //update invoice
    public function invoiceUpdate($id)
    {
        $data['value_date'] = date('Y-m-d H:i');
        $data['invoice_type'] = "save";
        $this->_db->where('invoice_id', $id);
        $id = $this->_db->update('tms_invoice_client', $data);
        return $id;
    }
    public function saveEditedInvoice($data, $id)
    {
        // print_r($data);
        // exit;
        $updata['value_date'] = date('Y-m-d H:i');
        $updata['Invoice_cost'] = $data['Invoice_cost'];
        $updata['item_total'] = $data['item_total'];
        $updata['invoice_date'] = $data['invoice_date'];
        $updata['vat'] = isset($data['vat']) ? $data['vat'] : 0;
        $updata['custom_invoice_number'] = isset($data['custom_invoice_number']) ? $data['custom_invoice_number'] : $data['invoice_number'];
        $updata['inv_notes'] = isset($data['inv_notes']) ? $data['inv_notes'] : "";

        if (isset($data['scoop_additional_detail'])) {
            $updata['scoop_additional_detail'] = $data['scoop_additional_detail'];
        }
        if (isset($data['scoop_additional_price'])) {
            $updata['scoop_additional_price'] = $data['scoop_additional_price'];
        }

        if (isset($data['currency_rate']))
            $updata['currency_rate'] = $data['currency_rate'];

        if (isset($data['scoop_id'])) {
            $updata['scoop_id'] = $data['scoop_id'];
        }

        if ($id) {
            $this->_db->where('invoice_id', $id);
            $up_id = $this->_db->update('tms_invoice_client', $updata);
            if ($up_id) {
                foreach ($data['item'] as $item) {
                    $scpData['updated_date'] = date('Y-m-d H:i:s');
                    $scpData['total_amount'] = $item['value'];
                    $scpData['total_price'] = $item['value'];
                    $this->_db->where('itemId', $item['id']);
                    $scpstsId = $this->_db->update('tms_items', $scpData);

                    
                    $invScpData['modified_date'] = date('Y-m-d H:i:s');
                    $invScpData['scoop_price'] = $item['value'];
                    $this->_db->where('invc_Id', $id );
                    $this->_db->where('invc_scoop_id', $item['id'] );
                    $updateInvoiceScoopID = $this->_db->update('tms_invoice_scoops', $invScpData);
                }
                if (isset($data['deleted_scoopId']) && $data['deleted_scoopId'] != 0) {
                    $scpStatusData['item_status'] = 5;
                    $this->_db->where('itemId', $data['deleted_scoopId']);
                    $scpstsId = $this->_db->update('tms_items', $scpStatusData);
                    
                    // record delete from invoice scooop table
                    $this->_db->where('invc_Id', $id );
                    $this->_db->where('invc_scoop_id', $data['deleted_scoopId'] );
                    $delete = $this->_db->delete('tms_invoice_scoops');
                }
            }
        }
        if ($id) {
            $res['status'] = 200;
            $res['msg'] = "Successfully updated";
        } else {
            $res['status'] = 401;
            $res['msg'] = "Not updated";
        }

        return $res;
    }

    public function deleteClientInvoice($data)
    {
        $modifiedData = date('Y-m-d H:i:s');
        $delete = false;
            
        if (isset($data['deleted_scoopId']) && $data['deleted_scoopId'] != 0) {
            $updateItemData['updated_date'] = $modifiedData;
            $scpStatusData['item_status'] = 5;
            $this->_db->where('itemId', $data['deleted_scoopId']);
            $scpstsId = $this->_db->update('tms_items', $scpStatusData);
        }
        if (isset($data['invoice_id'])) {
            // soft delete
            $invoiceUpdate['is_deleted'] = 1;
            $invoiceUpdate['modified_date'] = $modifiedData;
            $this->_db->where('invoice_id', $data['invoice_id']);
            $delete = $this->_db->update('tms_invoice_client', $invoiceUpdate);
            //$delete = $this->_db->delete('tms_invoice_client'); // hard delete
        }
        if ($delete) {
            $res['status'] = 200;
            $res['msg'] = "Successfully updated";
        } else {
            $res['status'] = 401;
            $res['msg'] = "Not updated";
        }

        return $res;
    }

    public function invoiceStatusChange($data, $id)
    {
        /* Insert Part paid invoice payment detail in database START */
        if (isset($data['partPaid'])) {
            $partPaidAmount = array();
            $partPaidAmount['invoice_id'] = $id;
            $partPaidAmount['invoice_partial_paid_amount'] = $data['partPaid'];
            //$partPaidAmount['created_date']                 = date('Y-m-d H:i:s');
            // Check if the datetime is valid

            $ins_createdate = date('Y-m-d H:i:s');
            if (isset($data['created_date'])) {
                $createdate = DateTime::createFromFormat('Y-m-d H:i:s', $data['created_date']);
                if ($createdate && $createdate->format('Y-m-d H:i:s') === $data['created_date']) {
                    $ins_createdate = $data['created_date'];
                    $data['paid_date'] = $data['created_date'];
                }
            }
            $partPaidAmount['created_date'] = $ins_createdate;
            if ($partPaidAmount['invoice_partial_paid_amount'] > 0)
                $partPaymentInsert = $this->_db->insert('tms_invoice_client_payments', $partPaidAmount);
            else
                $partPaymentInsert = 1;
        }
        $invoiceQ = "SELECT invoice_id, SUM(invoice_partial_paid_amount) AS total_partial_paid 
        FROM tms_invoice_client_payments 
        WHERE invoice_id = ? AND is_deleted = 0
        GROUP BY invoice_id";

        $invoiceData1 = $this->_db->rawQuery($invoiceQ, [$id]);
        $this->_db->where('invoice_id', $id);
        $invoiceRecords = $this->_db->get('tms_invoice_client');
        if ( $data['invoice_status'] != 'Open' && !empty($invoiceData1) && !empty($invoiceRecords)) {
        //if (!empty($invoiceData1) && !empty($invoiceRecords)) {
            if($invoiceData1[0]['total_partial_paid'] == $invoiceRecords[0]['Invoice_cost']){
                $data['invoice_status'] = 'Completed';
            }
        }
        /* Insert Part paid invoice payment detail in database END */

        unset($data['partPaid']);
        if (isset($data['is_update'])) {
            $partPaymentInsert = 1;
            unset($data['is_update']);
        }
        $data['modified_date'] = date('Y-m-d');
        if (!in_array($data['invoice_status'], ['Complete', 'Completed', 'Paid'])) {
            $data['paid_date'] = "0000-00-00 00:00:00";
        }
        // status 'Open' is for Outstanding as per new changes
        if($data['invoice_status'] == 'Open'){
            $data['paid_amount'] = 0;
            $payData['is_deleted'] = 1;
            $this->_db->where('invoice_id', $id);
            $this->_db->update('tms_invoice_client_payments', $payData);
        }
        
        $this->_db->where('invoice_id', $id);
        $idd = $this->_db->update('tms_invoice_client', $data);

        // Update scoop item status When invoice status change to complete
        if ($idd && isset($data['invoice_status'])) {
            $this->_db->where('invoice_id', $id);
            $invoiceRecords = $this->_db->get('tms_invoice_client');
            if ($data['invoice_status'] == 'Complete' || $data['invoice_status'] == 'Completed' || $data['invoice_status'] == 'Paid') {
                foreach (json_decode($invoiceRecords[0]['scoop_id']) as $field => $val) {
                    $scpData['updated_date'] = date('Y-m-d H:i:s');
                    //$scpData['item_status'] = 'Paid';
                    $scpData['item_status'] = '7'; // Paid status ID
                    $this->_db->where('itemId', $val->id);
                    $scpstsId = $this->_db->update('tms_items', $scpData);
                }
            }
        }

        if ($idd && isset($partPaymentInsert)) {
            $request['status'] = 200;
            $request['msg'] = "Successfully updated";
        } else {
            $request['status'] = 401;
            $request['msg'] = "Not updated";
        }

        return $request;
    }
    public function invoiceStatusIrrecoverable($data, $id)
    {
        $data['modified_date'] = date('Y-m-d');
        $this->_db->where('invoice_id', $id);
        $idd = $this->_db->update('tms_invoice_client', $data);

        if ($idd) {
            $request['status'] = 200;
            $request['msg'] = "Successfully updated";
        } else {
            $request['status'] = 401;
            $request['msg'] = "Not updated";
        }

        return $request;
    }


    public function updateJobSummeryItemStatus($data, $id)
    {
        $this->_db->where('job_summmeryId', $id);
        $idd = $this->_db->update('tms_summmery_view', $data);
        if ($idd) {
            $request['status'] = 200;
            $request['msg'] = "Successfully updated";
        } else {
            $request['status'] = 401;
            $request['msg'] = "Not updated";
        }

        return $request;
    }
    public function getFreelanceStatement($id)
    {

        $data = $this->_db->rawQuery("SELECT concat(tu.vFirstName, ' ', tu.vLastName) as vUserName,tmInvoice.invoice_number AS InvoiceNo,tmInvoice.paid_date As Date,tmInvoice.Invoice_cost As Amount,tmInvoice.paid_amount,tmInvoice.freelance_id,tmInvoice.customer_id,tmInvoice.value_date,tmInvoice.invoice_type,tmInvoice.invoice_status,tmInvoice.created_date FROM tms_users AS tu INNER JOIN tms_invoice AS tmInvoice ON tu.iUserId = tmInvoice.freelance_id WHERE tu.iUserId = $id");
        return $data;
    }
    public function filterStatement($filterParams)
    {
        //echo '<pre>'; print_r($filterParams); echo '</pre>';
        $this->_db->join('tms_users tu', 'tu.iUserId=tmInvoice.freelance_id', 'INNER');
        if (isset($filterParams['dueDateFrom']) && isset($filterParams['dueDateTo'])) {

            $Frm = $filterParams['dueDateFrom'] . ' ' . '00:00:00';
            $To = $filterParams['dueDateTo'] . ' ' . '00:00:00';
            $this->_db->where('tmInvoice.created_date', array($Frm, $To), 'BETWEEN');
        }

        if (isset($filterParams['comapanyCode'])) {
            $cCode = $filterParams['comapanyCode'];
            $this->_db->where('tmInvoice.invoice_number', '%' . $cCode . '%', 'like');
        }

        if (isset($filterParams['resource'])) {
            $this->_db->where('tmInvoice.freelance_id', $filterParams['resource']);
        }
        if (isset($filterParams['invoiceStatus'])) {
            $this->_db->where('tmInvoice.invoice_status', $filterParams['invoiceStatus']);
        }
        if (isset($filterParams['invoiceNumber'])) {
            $this->_db->where('tmInvoice.invoice_number', $filterParams['invoiceNumber']);
        }

        $data = $this->_db->get('tms_invoice tmInvoice', null, ' concat(tu.vFirstName, " ", tu.vLastName) as vUserName,tmInvoice.invoice_number AS InvoiceNo,tmInvoice.paid_date As Date,tmInvoice.Invoice_cost As Amount,tmInvoice.paid_amount,tmInvoice.freelance_id,tmInvoice.customer_id,tmInvoice.value_date,tmInvoice.invoice_type,tmInvoice.invoice_status,tmInvoice.created_date');
        return $data;
    }

    // Client statement page
    public function getClientStatement($id)
    {
        $data = $this->_db->rawQuery("SELECT concat(tu.vFirstName, ' ', tu.vLastName) vUserName,tmInvoice.invoice_number AS InvoiceNo,tmInvoice.paid_date As Date,tmInvoice.Invoice_cost As Amount,tmInvoice.paid_amount,tmInvoice.freelance_id,tmInvoice.customer_id,tmInvoice.value_date,tmInvoice.invoice_type,tmInvoice.invoice_status,tmInvoice.created_date FROM tms_users AS tu INNER JOIN tms_invoice_client AS tmInvoice ON tu.iUserId = tmInvoice.freelance_id WHERE tu.iUserId = $id");
        return $data;
    }
    // Client statement page
    public function filterClientStatement($filterParams)
    {
        //echo '<pre>'; print_r($filterParams); echo '</pre>';
        //$this->_db->join('tms_users tu', 'tu.iUserId=tmInvoice.freelance_id','INNER');
        $this->_db->join('tms_users tu', 'tu.iUserId=tmInvoice.freelance_id', 'LEFT');
        $this->_db->join('tms_client tc', 'tc.iClientId=tmInvoice.customer_id', 'LEFT');
        if (isset($filterParams['dueDateFrom']) && isset($filterParams['dueDateTo'])) {

            $Frm = $filterParams['dueDateFrom'] . ' ' . '00:00:00';
            $To = $filterParams['dueDateTo'] . ' ' . '00:00:00';
            $this->_db->where('tmInvoice.created_date', array($Frm, $To), 'BETWEEN');
        }

        if (isset($filterParams['comapanyCode'])) {
            $cCode = $filterParams['comapanyCode'];
            $this->_db->where('tmInvoice.invoice_number', '%' . $cCode . '%', 'like');
        }

        if (isset($filterParams['resource'])) {
            $this->_db->where('tmInvoice.freelance_id', $filterParams['resource']);
        }
        if (isset($filterParams['invoiceStatus'])) {
            $this->_db->where('tmInvoice.invoice_status', $filterParams['invoiceStatus']);
        }
        if (isset($filterParams['invoiceNumber'])) {
            $this->_db->where('tmInvoice.invoice_number', $filterParams['invoiceNumber']);
        }

        $data = $this->_db->get('tms_invoice_client tmInvoice', null, ' tu.vUserName,tmInvoice.invoice_number AS InvoiceNo,tmInvoice.paid_date As Date,tmInvoice.Invoice_cost As Amount,tmInvoice.paid_amount,tmInvoice.freelance_id,tmInvoice.customer_id,tmInvoice.value_date,tmInvoice.invoice_type,tmInvoice.invoice_status,tmInvoice.created_date, tmInvoice.currency_rate, tc.vUserName as companyName,tc.vCodeRights, tc.client_currency');
        //echo $this->_db->getLastQuery();
        return $data;
    }
    /* Get All save invoice BY FreelancerId/UserId */
    public function getAllInvoiceByUserId($type, $userId)
    {
        //echo $userId;exit;
        $this->_db->join('tms_users tu', 'tu.iUserId=tmInvoice.freelance_id', 'LEFT');
        $this->_db->join('tms_client tc', 'tc.iClientId=tmInvoice.customer_id', 'LEFT');
        $this->_db->join('tms_summmery_view tsv', 'tsv.job_summmeryId=tmInvoice.job_id', 'LEFT');
        $this->_db->orderBy('tmInvoice.invoice_id', 'asc');
        $this->_db->where('tmInvoice.invoice_type', $type);
        $this->_db->where('tmInvoice.freelance_id', $userId);
        $data = $this->_db->get('tms_invoice tmInvoice', null, 'tsv.job_summmeryId AS jobId, tsv.order_id AS orderId, tsv.po_number AS poNumber, tc.iClientId AS clientId, tc.vAddress1 AS companyAddress, tc.vEmailAddress  AS companyEmail, tc.vPhone AS companyPhone, tc.vCodeRights AS company_code, tu.iUserId AS freelanceId, concat(tu.vFirstName, " ", tu.vLastName) AS freelanceName, tu.vEmailAddress AS freelanceEmail, tu.vAddress1 AS freelanceAddress, tu.vProfilePic AS freelancePic, tu.iMobile AS freelancePhone, tsv.job_code AS jobCode, tmInvoice.invoice_number, tmInvoice.invoice_id, tmInvoice.invoice_status, tmInvoice.Invoice_cost, tmInvoice.paid_amount');
        foreach ($data as $key => $value) {
            $companyName = self::getAll('abbrivation', substr($value['company_code'], 0, -2), 'tms_centers');
            $data[$key]['companyName'] = isset($companyName[0]['name']) ? $companyName[0]['name'] : '';
        }

        return $data;
    }


    // getInvoicePartPayments
    public function getClientInvoicePartPayments($id)
    {
        $this->_db->where('invoice_id', $id);
        $this->_db->where('is_deleted', 0);
        $data = $this->_db->get('tms_invoice_client_payments');
        return $data;
    }

    public function sendInvoiceMail($data)
    {
        // temp
        $this->_db->where('is_active', 1);
        $emailSign = $this->_db->getone('tms_email_sign');

        $tempId = 12;
        if (isset($data['credit_notes_email']) && $data['credit_notes_email'] == 1) {
            $tempId = 16;
        }

        $pdf_content = explode("base64,", $data['pdfData']);
        $bin = base64_decode($pdf_content[1], true);
        $pdfFileName = $data['invoiceno'] . '.pdf';
        $invoiceDue = isset($data['invoiceDue']) ? $data['invoiceDue'] : '';
        $this->_db->where('template_id', $tempId);
        $emailTemplateInvoice = $this->_db->getOne('tms_email_templates');
        $search_array = array("[INVOICENO]", "[PAYDUE]");
        $replace_array = array($data['invoiceno'], $invoiceDue);

        if (isset($data['data']['messageData']) && $data['data']['messageData'] != '') {
            $body = $data['data']['messageData'];
        } else {
            $body = str_replace($search_array, $replace_array, $emailTemplateInvoice['template_content']);
        }


        $body = "<div>" . $body . "</div>";
        // $body .= "<div><img src='cid:signid' width='100px'></div>";
        // if(isset($data['data']['userSign']) && !empty($data['data']['userSign'])){
        //     $body .= "<div><img src='".SITE_URL.$data['data']['userSign']."' width='100px'></div>";
        // }

        $attachments = '';
        $subject = isset($data['data']['msgEmailSubject']) && $data['data']['msgEmailSubject'] != '' ? $data['data']['msgEmailSubject'] : "Invoice";
        //$subject = ($data['outstanding_reminder']==1) ? "Invoice Outstanding" : 'Invoice';
        $to_name = ' ';
        //$to = 'anil.kanhasoft@gmail.com';
        $to = isset($data['data']['vEmailAddress']) && $data['data']['vEmailAddress'] != '' ? $data['data']['vEmailAddress'] : $data['companycontactEmail'];
        $cc = $bcc = '';
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

        if (isset($data['pdfData']) && $data['pdfData']) {
            if (isset($data['file']) && $data['file'] != '') {
                $file_content = explode("base64,", $data['file']);
                $fileContentType = explode(';', explode(':', $file_content[0])[1]);
                $fileContentType = $fileContentType[0];
                $fileType = explode('/', $fileContentType);
                $fileType = $fileType[1];

                $fileName = 'download-file.' . $fileType;
                if ($fileContentType == 'application/vnd.openxmlformats-officedocument.wordprocessingml.document')
                    $fileName = 'download-file.docx';
                if ($fileContentType == 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet')
                    $fileName = 'download-file.xls';

                // Array for mailjet
                if ($file_content != '') {
                    $allFileContent = '';
                    if (is_array($file_content)) {
                        $allFileContent = sizeof($file_content) > 1 ? $file_content[1] : '';
                        $attachments = [
                            [
                                'ContentType' => $fileContentType,
                                'Filename' => $fileName,
                                'Base64Content' => $allFileContent
                            ]
                        ];
                    }
                }
            } else {
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
            }
            $inlineImageAttachement = '';
            // if($emailSign && isset($emailSign['sign_image']) && $emailSign['sign_picture'] !='' ){
            //     $base64_image = $emailSign['sign_image'];
            //     $attachInline = explode(',', $base64_image);
            //     // Get the content type
            //     $content_type = '';
            //     if (count($attachInline) > 0) {
            //         preg_match('/^data:(.*?);/', $attachInline[0], $matches);
            //         if (isset($matches[1])) {
            //             $content_type = $matches[1];
            //         }
            //     }
            //     // Get the base64 string
            //     $base64_string = '';
            //     if (count($attachInline) > 1) {
            //         $base64_string = $attachInline[1];
            //     }
            //     $inlineImageAttachement =  [[
            //         'ContentType' => $content_type,
            //         'Filename' => 'sign.png',
            //         'ContentID' => "signid",
            //         'Base64Content' => $base64_string
            //     ]];
            // }

            $send_fn = new functions();
            $mailResponse = $send_fn->send_email_smtp($to, $to_name, $cc, $bcc, $subject, $body, $attachments, $inlineImageAttachement, $sendFromInvoiceEmail = 1 );

            if ($mailResponse['status'] == 200) {
                //if ($response->success()) { //output success or failure messages
                if (isset($data['outstanding_reminder']) && $data['outstanding_reminder'] == 1) {
                    $upData['reminder_sent'] = 1;
                }
                if (isset($data['credit_notes_email']) && $data['credit_notes_email'] == 1) {
                    $upData['is_credit_notes_email_sent'] = 1;
                    //$upData['is_invoice_sent'] = 0;
                } else {
                    $upData['is_invoice_sent'] = 1;
                }
                $upData['modified_date'] = date('Y-m-d');

                $this->_db->where('invoice_id', $data['invoice_id']);
                $this->_db->update('tms_invoice_client', $upData);

                // start Update status in scoop table
                $qry_invc = "SELECT scoop_id FROM tms_invoice_client WHERE invoice_id = '" . $data['invoice_id'] . "' ";
                $invcData = $this->_db->rawQuery($qry_invc);
                if (count($invcData) && array_key_exists("scoop_id", $invcData[0])) {
                    $invcScpIds = json_decode($invcData[0]['scoop_id']);
                    foreach ($invcScpIds as $key => $value) {
                        $scpData['updated_date'] = date('Y-m-d H:i:s');
                        if (isset($data['credit_notes_email']) && $data['credit_notes_email'] == 1) {
                            $scpData['item_status'] = '9'; // cancel status  ID scoop status
                        } else {
                            $scpData['item_status'] = '6'; // Invoiced status ID scoop status
                        }
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
        } else {
            return $result['status'] = 422;
        }
    }
    public function sendInvoiceMail_smtp($data)
    {
        $pdf_content = explode("base64,", $data['pdfData']);
        $bin = base64_decode($pdf_content[1], true);
        // if (strpos($bin, '%PDF') !== 0) {
        //     throw new Exception('Missing the PDF file ');
        // }
        $path = '../../uploads/invoice/';
        // if ( !file_exists($dir) ) {
        //     mkdir ($dir, 0755);
        // }
        $pdfFile = $path . $data['invoiceno'] . '.pdf';

        // Start Email Config
        $body = "<p> Hi " . $data['clientCompanyName'] . " </p>";
        $body .= "<p>Please see attached invoice number : <b>" . $data['invoiceno'] . "</b> </p>";
        $body .= "<p> From :TMS </p>";
        $body .= "Email: " . $data['freelanceEmail'] . "</p>";

        $subject = ($data['outstanding_reminder'] == 1) ? "Outstanding Invoice" : 'Invoice';

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

        if (file_put_contents($pdfFile, $bin)) {
            if ($pdfFile != '') {
                $this->_mailer->AddAttachment($pdfFile);
            }
            if ($this->_mailer->Send()) { //output success or failure messages
                if (isset($data['outstanding_reminder'])) {
                    if ($data['outstanding_reminder'] == 1)
                        $upData['reminder_sent'] = 1;
                }
                $upData['modified_date'] = date('Y-m-d');
                $upData['is_invoice_sent'] = 1;
                $this->_db->where('invoice_id', $data['invoice_id']);
                $this->_db->update('tms_invoice_client', $upData);

                $result['status'] = 200;
                $result['msg'] = 'Thank you for your email';
                $path = "../../uploads/invoice/";
                $pdfFiles = glob($pdfFile);
                if ($pdfFiles) {
                    //unlink($pdfFile);
                }
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

    // Client invoice serach data get
    public function clientInvoiceCreate($data1)
    {
        $infoD = array();
        $paymentDue = self::getAll('invoice_due_id', 1, 'tms_invoice_due_period');
        foreach ($data1['id'] as $k => $v) {
            $this->_db->where('itemId', $v['id']);
            $this->_db->join('tms_users tu', 'tu.iUserId=ti.contact_person', 'LEFT');
            $this->_db->join('tms_general gen', 'gen.order_id=ti.order_id', 'LEFT');
            $this->_db->join('tms_customer tcu', 'tcu.order_id = ti.order_id', 'INNER');
            $this->_db->join('tms_client tci', 'tci.iClientId=tcu.client', 'LEFT');
            //$this->_db->join('tms_payment tp', 'tp.iClientId=tcu.client', 'LEFT');
            $this->_db->join('tms_payment tp', 'tp.iClientId = tci.iClientId AND tp.iType = 2', 'LEFT');
            $this->_db->join('tms_payment tpp', 'tpp.iClientId = tci.iClientId', 'LEFT');
            $this->_db->join('tms_tax tx', 'tp.tax_rate = tx.tax_id', 'LEFT');
            $this->_db->join('tms_client_contact tcc', 'tcc.iClientId = tci.iClientId', 'INNER');
            //$data = $this->_db->getOne('tms_summmery_view tsv', 'tsv.job_summmeryId AS jobId,tsv.item_id AS item_number, tsv.order_id AS orderId, tsv.po_number AS poNumber, tci.iClientId AS clientId, tci.vAddress1 AS companyAddress, tci.vEmailAddress  AS companyEmail, tci.vPhone AS companyPhone, tu.iUserId AS freelanceId, tu.vUserName AS freelanceName, tu.vEmailAddress AS freelanceEmail, tu.vAddress1 AS freelanceAddress, tu.vProfilePic AS freelancePic, tu.iMobile AS freelancePhone, tg.company_code, tsv.job_code AS jobCode');
            $data = $this->_db->getOne('tms_items ti', 'ti.itemId AS itemId,ti.item_number, ti.item_name, ti.order_id AS orderId,ti.total_price as scoop_value, gen.heads_up, gen.order_no AS orderNumber, tci.iClientId AS clientId, tci.vUserName as clientCompanyName, tci.vAddress1 AS companyAddress, tci.vEmailAddress  AS companyEmail, tci.vPhone AS companyPhone,tci.address1Detail AS companyAddressDtl,tci.invoice_no_of_days, tci.client_currency, tci.vCenterid, tu.iUserId AS freelanceId, concat(tu.vFirstName, " ", tu.vLastName) AS freelanceName, tu.vEmailAddress AS freelanceEmail, tu.vAddress1 AS freelanceAddress, tu.vProfilePic AS freelancePic, tu.iMobile AS freelancePhone, tp.vPaymentInfo as clientVatinfo, tx.tax_percentage as tax_rate, ti.po_number, tpp.vPaymentInfo, ti.accounting_inv_comment');
            // echo $this->_db->getLastQuery();
            //$companyName = self::getAll('abbrivation',substr($data['company_code'],0,-2),'tms_centers');
            //$data['companyName'] = $companyName;

            //payment due date number of day
            //$data['number_of_days'] = $paymentDue[0]['number_of_days'];
            $data['number_of_days'] = $data['invoice_no_of_days'] > 0 ? $data['invoice_no_of_days'] : $paymentDue[0]['number_of_days'];

            //invoiceNumber Count
            $maxrawQuery = 'SELECT MAX(invoice_number_max) AS max_count FROM tms_invoice_client';
            $maxcount = $this->_db->rawQuery($maxrawQuery);
            // $data['invoiceCount'] = count(self::get('tms_invoice_client'));
            $data['invoiceCount'] = (int) $maxcount[0]['max_count'];
            //echo '<pre>'; print_r($data); echo '</pre>';exit;

            if (isset($data['orderId'])) {
                //$info = self::getAll('order_id',$data['orderId'],'tms_items');
                $this->_db->where('item_number', $data['item_number']);
                $this->_db->where('order_id', $data['orderId']);
                $info = $this->_db->getOne('tms_items');
                $data['item'] = [];
                if ($info) {
                    if ($info['price']) {
                        foreach (json_decode($info['price']) as $field => $val) {
                            $data['item'][] = (array) $val;
                        }
                    }
                }

                $data['vBankInfo'] = self::getDefaultbankDetails();
                $data['paymentInfoClient'] = (isset($data) && !empty($data)) ? $data['vPaymentInfo'] : "";
                $matchBankInfo = "";
                if (isset($data['clientId']) && !empty($data['clientId'])) {
                    $this->_db->where('tmc.iClientId', $data['clientId']);
                    $this->_db->join('tms_client tmc', 'tmc.client_currency=tb.currency_code', 'LEFT');
                    $matchBankInfo = $this->_db->getOne('tms_banking_info tb', 'tb.*');
                }
                $data['matchBankInfo'] = (isset($matchBankInfo) && !empty($matchBankInfo)) ? $matchBankInfo : "";
            }
            $infoD[$k] = $data;
        }
        return $infoD;
    }

    //invoice save and draft invoice save
    public function saveclientInvoice($data)
    {
        $invoiceAlreadyAdded = false;
        if ($data['scoop_id']) {
            try{
                //$this->_db->where('is_deleted != 1 ');
                $this->_db->where('is_deleted', 1, '!=');
                $invoiceRecords = $this->_db->get('tms_invoice_client');
                
                foreach ($invoiceRecords as $k => $v) {
                    $decodedScoopId = json_decode($v['scoop_id'], true);
                    if ($decodedScoopId !== null) {
                        foreach (json_decode($v['scoop_id'], true) as $ke => $val) {
                            $existedJobId = $val['id'];
                            foreach (json_decode($data['scoop_id'], true) as $k1 => $v1) {
                                $postedJobId = $v1['id'];
                                if ($postedJobId == $existedJobId) {
                                    $invoiceAlreadyAdded = true;
                                }
                            }
                        }
                    }
                }
            }catch (Exception $e) {
            }
        }
        $scoopData = array();
        if (isset($data['item'])) {
            $scoopData = $data['item'];
            unset($data['item']);
        }
        if (!$invoiceAlreadyAdded) {
            $prfxQry = $this->_db->getOne('tms_invoice_setting');
            $invPrefix = $prfxQry ? $prfxQry['invoiceNoPrefix'] : '';
            $maxrawQuery = 'SELECT MAX(invoice_number_max) AS max_count FROM tms_invoice_client';
            $maxcount = $this->_db->rawQuery($maxrawQuery);
            $maxCount = $maxcount ? (int) $maxcount[0]['max_count'] + 1 : 1;
            $maxInvoiceNo = $invPrefix . str_pad($maxCount, 7, '0', STR_PAD_LEFT);

            $data['invoice_number_max'] = $maxCount;
            if ($data['invoice_number'] == $data['custom_invoice_number']) {
                $data['custom_invoice_number'] = $maxInvoiceNo;
            }
            $data['invoice_number'] = $maxInvoiceNo;

            $data['created_date'] = date('Y-m-d H:i:s');
            $data['modified_date'] = date('Y-m-d H:i:s');
            $data['currency_rate'] = (isset($data['currency_rate'])) ? $data['currency_rate'] : 1;
            $data['value_date'] = date('Y-m-d');
            //$data['invoice_date'] = date('Y-m-d');

            $id = $this->_db->insert('tms_invoice_client', $data);
            if ($id && $scoopData) {
                foreach ($scoopData as $item) {
                    $scpData['updated_date'] = date('Y-m-d H:i:s');
                    //$scpData['total_amount'] = $item['value'];
                    //$scpData['total_price'] = $item['value'];
                    $scpData['item_status'] = '6'; // status id Invoiced = 6
                    $this->_db->where('itemId', $item['id']);
                    $scpstsId = $this->_db->update('tms_items', $scpData);

                    $this->_db->where('itemId', $item['id']);
                    $this->_db->join('tms_general tgn', 'tgn.order_id=its.order_id', 'LEFT');
                    $scoopOneData = $this->_db->getOne('tms_items its','its.order_id, its.item_number, its.item_name, its.total_price, its.po_number, its.accounting_inv_comment, tgn.order_no');

                    $insertData['invc_Id'] = $id;
                    $insertData['invc_scoop_id'] = $item['id'];
                    $insertData['scoop_price'] = $scoopOneData['total_price'];
                    $insertData['scoop_order_number'] = $scoopOneData['order_no'];
                    $insertData['scoop_order_id'] = $scoopOneData['order_id'];
                    $insertData['scoop_item_number'] = $scoopOneData['item_number'];
                    $insertData['scoop_name'] = $scoopOneData['item_name'];
                    $insertData['scoop_po_number'] = $scoopOneData['po_number'];
                    $insertData['accounting_inv_comment'] = $scoopOneData['accounting_inv_comment'];
                    $insertData['created_date'] = date('Y-m-d H:i:s');
                    $insertData['modified_date'] = date('Y-m-d H:i:s');
                    $insertedInScpID = $this->_db->insert('tms_invoice_scoops', $insertData);

                }
            }
            if ($id) {
                $result['status'] = 200;
                $result['inserted_id'] = $id;
                $result['msg'] = "Successfully saved";
            } else {
                $result['status'] = 401;
                $result['msg'] = "Not saved";
            }
            return $result;
        } else {
            $result['status'] = 422;
            $result['msg'] = "Invoice already added for this Project / scoop";
            return $result;
        }

    }

    public function clientInvoiceExcelStatus($data)
    {
        $allUpdated = false;
        $i = 0;
        $len = count($data);
        $updata['value_date'] = date('Y-m-d H:i');
        $updata['is_excel_download'] = 1;
        foreach ($data as $item) {
            $this->_db->where('invoice_id', $item);
            $scpstsId = $this->_db->update('tms_invoice_client', $updata);
            if ($i == $len - 1) {
                $allUpdated = true;
            }
            $i++;
        }
        if ($allUpdated) {
            $result['status'] = 200;
            $result['msg'] = "Successfully Updated";
        } else {
            $result['status'] = 422;
            $result['msg'] = "Not updated";
        }
        return $result;
    }

    /* Get All client invoice */
    public function getAllInvoiceClient($type, $userId)
    {
        //echo $userId;exit;
        $this->_db->join('tms_users tu', 'tu.iUserId=tmInvoice.freelance_id', 'LEFT');
        $this->_db->join('tms_client tc', 'tc.iClientId=tmInvoice.customer_id', 'LEFT');
        //$this->_db->join('tms_items ti', 'ti.itemId=tmInvoice.scoop_id', 'LEFT');
        $this->_db->join('tms_invoice_credit_notes tcn', 'tcn.invoice_id=tmInvoice.invoice_id', 'LEFT');
        $this->_db->join('(SELECT invoice_id, SUM(invoice_partial_paid_amount) AS total_partial_paid FROM tms_invoice_client_payments WHERE is_deleted = 0 GROUP BY invoice_id) tcp', 'tcp.invoice_id=tmInvoice.invoice_id', 'LEFT');
        $this->_db->orderBy('tmInvoice.invoice_id', 'asc');
        $this->_db->where('tmInvoice.invoice_type', $type);
        $this->_db->where('tmInvoice.is_deleted ', ' != 1');
        //$this->_db->where('tmInvoice.freelance_id',$userId);
        $data = $this->_db->get('tms_invoice_client tmInvoice', null, 'tmInvoice.invoice_id, tc.iClientId AS clientId, tc.vUserName as clientCompanyName, tc.vAddress1 AS companyAddress, tc.vEmailAddress  AS companyEmail, tc.vPhone AS companyPhone, tc.vCodeRights AS company_code, tc.client_currency, tc.invoice_no_of_days, tu.iUserId AS freelanceId, concat(tu.vFirstName, " ", tu.vLastName) AS freelanceName, tu.vEmailAddress AS freelanceEmail, tu.vAddress1 AS freelanceAddress, tu.vProfilePic AS freelancePic, tu.iMobile AS freelancePhone, tmInvoice.invoice_number, tmInvoice.custom_invoice_number, tmInvoice.invoice_status, tmInvoice.Invoice_cost, tmInvoice.paid_amount, tmInvoice.scoop_id, tmInvoice.is_excel_download, tmInvoice.paid_date,  tmInvoice.invoice_date, tmInvoice.created_date, tmInvoice.is_credit_note, tmInvoice.is_credit_notes_email_sent, tmInvoice.invoice_due_date, tcn.credit_note_no, tcn.created_date as credit_note_create_date, tu.vSignUpload, tc.accounting_tripletex, tcp.total_partial_paid AS invoice_partial_paid_total');
        //$data = $this->_db->get('tms_invoice_client tmInvoice', null, 'tmInvoice.invoice_id, ti.itemId AS jobId, ti.order_id AS orderId, tc.iClientId AS clientId, tc.vUserName as clientCompanyName, tc.vAddress1 AS companyAddress, tc.vEmailAddress  AS companyEmail, tc.vPhone AS companyPhone, tc.vCodeRights AS company_code, tc.client_currency, tc.invoice_no_of_days, tu.iUserId AS freelanceId, concat(tu.vFirstName, " ", tu.vLastName) AS freelanceName, tu.vEmailAddress AS freelanceEmail, tu.vAddress1 AS freelanceAddress, tu.vProfilePic AS freelancePic, tu.iMobile AS freelancePhone, tmInvoice.invoice_number, tmInvoice.custom_invoice_number, tmInvoice.invoice_status, tmInvoice.Invoice_cost, tmInvoice.paid_amount, tmInvoice.scoop_id, tmInvoice.is_excel_download, tmInvoice.paid_date,  tmInvoice.invoice_date, tmInvoice.created_date, tmInvoice.is_credit_note, tmInvoice.is_credit_notes_email_sent, tmInvoice.invoice_due_date, tcn.credit_note_no, tcn.created_date as credit_note_create_date, tu.vSignUpload, tc.accounting_tripletex');
        //echo $this->_db->getLastQuery();
        foreach ($data as $key => $value) {
            $data[$key]['companyName'] = '';
        }

        $creditdata = self::getAllInvoiceCreditNote();

        return array_merge($data, $creditdata);
        //return $data;
    }

    /* Get All client Credit Notes */
    public function getAllInvoiceCreditNote()
    {
        $this->_db->join('tms_invoice_client tmInvoice', 'tcn.invoice_id=tmInvoice.invoice_id', 'LEFT');
        $this->_db->join('tms_users tu', 'tu.iUserId=tmInvoice.freelance_id', 'LEFT');
        $this->_db->join('tms_client tc', 'tc.iClientId=tmInvoice.customer_id', 'LEFT');
        $this->_db->join('tms_items ti', 'ti.itemId=tmInvoice.scoop_id', 'LEFT');
        //$this->_db->join('tms_invoice_credit_notes tcn', 'tcn.invoice_id=tmInvoice.invoice_id','LEFT');
        //$this->_db->orderBy('tcn.invoice_id', 'asc');
        $this->_db->where('tmInvoice.is_deleted ', ' != 1');
        $data = $this->_db->get('tms_invoice_credit_notes tcn', null, 'tcn.id credit_note_id ,ti.itemId AS jobId, ti.order_id AS orderId, tc.iClientId AS clientId, tc.vUserName as clientCompanyName, tc.vAddress1 AS companyAddress, tc.vEmailAddress  AS companyEmail, tc.vPhone AS companyPhone, tc.vCodeRights AS company_code, tc.client_currency, tc.invoice_no_of_days, tu.iUserId AS freelanceId, concat(tu.vFirstName, " ", tu.vLastName) AS freelanceName, tu.vEmailAddress AS freelanceEmail, tu.vAddress1 AS freelanceAddress, tu.vProfilePic AS freelancePic, tu.iMobile AS freelancePhone, tmInvoice.invoice_number, tmInvoice.custom_invoice_number, tmInvoice.invoice_id, tmInvoice.invoice_status, tmInvoice.Invoice_cost, tmInvoice.paid_amount, tmInvoice.scoop_id, tmInvoice.is_excel_download, tmInvoice.paid_date,  tmInvoice.invoice_date, tmInvoice.created_date, tmInvoice.is_credit_note, tmInvoice.is_credit_notes_email_sent, tcn.credit_note_no, tcn.created_date as credit_note_create_date, tu.vSignUpload, tc.accounting_tripletex, tmInvoice.invoice_due_date ');
        //echo $this->_db->getLastQuery();
        foreach ($data as $key => $value) {
            $data[$key]['companyName'] = '';
        }
        return $data;
    }

    // get Default Bank Details
    public function getDefaultbankDetails()
    {
        $this->_db->where('is_default', 1);
        $data = $this->_db->get('tms_banking_info');
        return $data;
    }

    // Get all invoice list
    public function getClientInvoicelistAll()
    {
        
        //$this->_db->where('is_deleted != 1 ');
        //$this->_db->where('is_deleted', ' != 1');
        $this->_db->where('is_deleted', 1, '!=');
        $data = $this->_db->get('tms_invoice_client');
        //echo $this->_db->getLastQuery();
        //print_r($data);
        //exit;
        return $data;
    }
    // Invoice Design template
    public function clientInvoiceDesignType()
    {
        
        $data = $this->_db->getOne('tms_invoice_setting');
        // if ($data['postcode'] && preg_match('/^0/', $data['postcode'])) {
        //     // if number start with zero it remove zero from string i.e 0123=123
        //     $data['postcode'] = $data["postcode"] . " ";
        // }
        if (!empty($data) && isset($data['postcode']) && preg_match('/^0/', $data['postcode'])) {
            // Check if postcode starts with zero and add a space at the end
            //$postcode = $data['postcode'];
            $data['postcode'] .= ' ';
        }
        return $data;
    }
    // Invoice setting data
    public function getClientInvoiceSetting()
    {
        $data = $this->_db->get('tms_invoice_setting');
        foreach ($data as $key => $value) {
            if ($data[$key]['postcode'] && preg_match('/^0/', $data[$key]['postcode'])) {
                // if number start with zero it remove zero from string i.e 0123=123
                $data[$key]['postcode'] = $value["postcode"] . " ";
            }
        }
        return $data;
    }

    public function downloadInvoicePDF($data)
    {
        //print_r($data);
        //exit;
        $htmlConent = $data && isset($data['pdfContent']) ? $data : '';
        $mpdf = new mpdf();
        $isPdfDownload = $mpdf->downloadPDF($htmlConent);
        if ($isPdfDownload) {
            $result['pdfFile'] = $isPdfDownload;
            $result['status'] = 200;
            $result['msg'] = "Download";
        } else {
            $result['pdfFile'] = $isPdfDownload;
            $result['status'] = 422;
            $result['msg'] = "Not downloaded";
        }
        return $result;
    }

    public function deleteInvoice($id)
    {
        $modifiedData = date('Y-m-d H:i:s');
        $delete = false;

        $this->_db->where('invoice_id', $id);
        $getInvoiceData = $this->_db->getOne('tms_invoice_client', 'scoop_id');
        if (isset($getInvoiceData) && !empty($getInvoiceData)) {
            foreach (json_decode($getInvoiceData['scoop_id']) as $k => $itemId) {
                try {
                    // updating status of items once we delete invoice.
                    $updateItemData['updated_date'] = $modifiedData;
                    $updateItemData['item_status'] = 5;
                    $this->_db->where('itemId', $itemId->id);
                    $this->_db->update('tms_items', $updateItemData);
                } catch (Exception $e) {
                }
            }

            // delete invoice
            // soft delete
            $invoiceUpdate['is_deleted'] = 1;
            $invoiceUpdate['modified_date'] = $modifiedData;
            $this->_db->where('invoice_id', $id);
            $delete = $this->_db->update('tms_invoice_client', $invoiceUpdate);
            //$delete = $this->_db->delete('tms_invoice_client');

            // delete invoice payment data
            $this->_db->where('invoice_id', $id);
            //$this->_db->where('is_deleted', 0);
            $paymentdelete = $this->_db->delete('tms_invoice_client_payments');

            if ($delete) {
                $return['status'] = 200;
                $return['msg'] = 'Successfully deleted.';
            } else {
                $return['status'] = 422;
                $return['msg'] = 'Not deleted.';
            }
        } else {
            $return['status'] = 422;
            $return['msg'] = 'Details not found.';
        }

        return $return;
    }

    public function getUserDetails($id)
    {
        $data = $this->_db->rawQuery("SELECT concat(tu.vFirstName, ' ', tu.vLastName) as vUserName, tu.vEmailAddress, tup.position_name FROM `tms_users` tu LEFT JOIN tms_user_position tup ON FIND_IN_SET(tup.position_id, tu.vResourcePosition) WHERE tu.iUserId = $id");
        return $data;
    }

    public function getClientScoopData($clientId)
    {
        $qry = "SELECT its.itemId, its.heads_up, gen.order_no AS orderNumber, gen.due_date AS DueDate, gen.order_id AS orderId, cust.created_date AS orderDate, cust.client AS customer, gen.project_name AS projectName, c.vUserName AS contactName, c.iClientId, stus.status_name AS clientStatus, c.vlogo AS clientlogo, c.tPoInfo AS ponumber, gen.company_code AS companyCode, gen.project_price, gen.expected_start_date, cust.contact AS contactPerson, its.item_number, its.po_number AS itemPonumber, its.start_date AS itemStartdate, its.due_date AS itemDuedate, its.upcomingDate, its.source_lang AS itemsSourceLang, its.target_lang AS itemsTargetLang, its.price AS scoop_price, its.subPm AS scoop_subPm_id, its.attached_workflow, gen.project_status AS projectStatus, gen.project_type AS projectType, c.project_branch, plang.source_lang AS sourceLanguage, plang.target_lang AS targetLanguage, its.total_price AS totalAmount, its.item_name AS scoopName, its.item_email_subject AS itemEmailSubject, inc.vUserName AS accountname, tu.vUserName AS pm_name, CONCAT(tu.vFirstName, ' ', tu.vLastName) AS pm_fullName, CONCAT( sub_tu.vFirstName, ' ', sub_tu.vLastName ) AS sub_pm_name, CONCAT( sub_scp_tu.vFirstName, ' ', sub_scp_tu.vLastName ) AS sub_scoopPm_name, CONCAT(gen_Qa.vFirstName, ' ', gen_Qa.vLastName) AS gen_Qa_fullName, CONCAT(sub_gen_Qa.vFirstName, ' ', sub_gen_Qa.vLastName) AS gen_sub_Qa_fullName, CONCAT(scp_Qa.vFirstName, ' ', scp_Qa.vLastName) AS scp_Qa_fullName, CONCAT(sub_scp_Qa.vFirstName, ' ', sub_scp_Qa.vLastName) AS scp_sub_Qa_fullName, cust.project_coordinator AS project_coordinator_id, cust.project_manager AS project_manager_id, cust.QA_specialist AS qa_specialist_id, cust.sub_pm AS sub_pm_id, ps.project_status_name AS projectstatus_name, ps.status_color AS projectstatus_color, tis.item_status_name AS itemStatus, tis.item_status_id AS itemStatusId, c.client_currency, cp.price_currency, cp2.price_currency AS price_currency2, GROUP_CONCAT(DISTINCT(jsv.resources)) AS linguistId, GROUP_CONCAT( DISTINCT( CONCAT( jsv.vFirstName, ' ', jsv.vLastName ) ) ) AS linguistName, COUNT(td.id) AS comment_status, COUNT(td.id) AS comment_id FROM tms_items AS its LEFT JOIN tms_general AS gen ON its.order_id = gen.order_id LEFT JOIN tms_customer AS cust ON its.order_id = cust.order_id LEFT JOIN tms_proj_language AS plang ON its.order_id = plang.order_id LEFT JOIN tms_client AS c ON cust.client = c.iClientId LEFT JOIN tms_user_status AS stus ON c.vStatus = stus.status_id LEFT JOIN tms_client_indirect AS inc ON inc.iClientId = cust.indirect_customer LEFT JOIN tms_users AS tu ON tu.iUserId = cust.project_manager LEFT JOIN tms_users AS sub_tu ON sub_tu.iUserId = cust.sub_pm LEFT JOIN tms_users AS sub_scp_tu ON sub_scp_tu.iUserId = its.subPm LEFT JOIN tms_users AS gen_Qa ON gen_Qa.iUserId = cust.QA_specialist LEFT JOIN tms_users AS sub_gen_Qa ON sub_gen_Qa.iUserId = cust.sub_qa LEFT JOIN tms_users AS scp_Qa ON scp_Qa.iUserId = its.qaSpecialist LEFT JOIN tms_users AS sub_scp_Qa ON sub_scp_Qa.iUserId = its.subQa LEFT JOIN tms_project_status AS ps ON ps.pr_status_id = gen.project_status LEFT JOIN tms_customer_price_list AS cp ON its.project_pricelist = cp.price_list_id LEFT JOIN tms_item_status AS tis ON its.item_status = tis.item_status_id LEFT JOIN( SELECT resource_id, price_currency FROM tms_customer_price_list WHERE price_id = 1 GROUP BY resource_id ) AS cp2 ON cp2.resource_id = cust.client LEFT JOIN( SELECT tu.iUserId AS resources, tu.vFirstName, tu.vLastName, tu.vUserName, tsv.order_id, tsv.item_id, tsv.job_summmeryId FROM tms_summmery_view AS tsv LEFT JOIN tms_users AS tu ON tu.iUserId = tsv.resource ) AS jsv ON ( its.order_id = jsv.order_id AND its.item_number = jsv.item_id ) LEFT JOIN tms_discussion AS td ON ( td.order_id = its.order_id AND(NOT FIND_IN_SET('1', td.read_id)) ) WHERE its.order_id != 0 and its.item_status = 5 and c.iClientId = $clientId GROUP BY its.itemId ORDER BY `its`.`itemId` DESC";
        return $this->_db->rawQuery($qry);
    }

    public function getSingleInvoiceScoopId($id)
    {
        $this->_db->where('invoice_id', $id);
        return $this->_db->getOne('tms_invoice_client', 'scoop_id');
    }

    public function updateScoopIds($scoopArr, $id)
    {
        $scoopString = json_encode($scoopArr);
        $data['scoop_id'] = $scoopString;
        $this->_db->where('invoice_id', $id);
        $updateId = $this->_db->update('tms_invoice_client', $data);
        
        if ($id) {
        //if ($updateId) {
                try {
                    foreach ($scoopArr as $item) {
                        
                        if ($item && isset($item['id'])) {
                            
                            $this->_db->where('invc_scoop_id', $item['id']);
                            $scoopExist = $this->_db->getOne('tms_invoice_scoops iscp','iscp.id');
                            
                            if(! $scoopExist){
                                $this->_db->where('itemId', $item['id']);
                                $this->_db->join('tms_general tgn', 'tgn.order_id=its.order_id', 'LEFT');
                                $scoopOneData = $this->_db->getOne('tms_items its','its.order_id, its.item_number, its.item_name, its.total_price, its.po_number, its.accounting_inv_comment, tgn.order_no');

                                $insertData['invc_Id'] = $id;
                                $insertData['invc_scoop_id'] = $item['id'];
                                $insertData['scoop_price'] = $scoopOneData['total_price'];
                                $insertData['scoop_order_number'] = $scoopOneData['order_no'];
                                $insertData['scoop_order_id'] = $scoopOneData['order_id'];
                                $insertData['scoop_item_number'] = $scoopOneData['item_number'];
                                $insertData['scoop_name'] = $scoopOneData['item_name'];
                                $insertData['scoop_po_number'] = $scoopOneData['po_number'];
                                $insertData['accounting_inv_comment'] = $scoopOneData['accounting_inv_comment'];
                                $insertData['created_date'] = date('Y-m-d H:i:s');
                                $insertData['modified_date'] = date('Y-m-d H:i:s');

                                $insertedInScpID = $this->_db->insert('tms_invoice_scoops', $insertData);
                            }

                            $scpData['updated_date'] = date('Y-m-d H:i:s');
                            $scpData['item_status'] = 6;
                            $this->_db->where('itemId', $item['id']);
                            $scpstsId = $this->_db->update('tms_items', $scpData);

                        }
                    }

                    $this->_db->where('invoice_id', $id );
                    $this->_db->join('tms_payment tp', 'tp.iClientId = tci.customer_id AND tp.iType = 2', 'LEFT');
                    $this->_db->join('tms_tax tx', 'tp.tax_rate = tx.tax_id', 'LEFT');
                    $taxPercentage = $this->_db->getOne('tms_invoice_client tci','tx.tax_percentage');
                    
                    $taxPercentageRate = 0;
                    if($taxPercentage && isset($taxPercentage['tax_percentage']) ){
                        $taxPercentageRate = $taxPercentage['tax_percentage'] > 0 ? $taxPercentage['tax_percentage'] : 0; 
                    }
                    $this->_db->where('invc_Id', $id);
                    $invoiceSoops = $this->_db->get('tms_invoice_scoops iscp',null,'iscp.scoop_price');
                    
                    $priceTotal = 0;
                    foreach ($invoiceSoops as $scpInc) {
                        $priceTotal += $scpInc['scoop_price'];
                    }

                    // Calculate the tax amount
                    $taxAmount = ($priceTotal * $taxPercentageRate) / 100;
                    // Calculate the final total
                    $finalTotal = $priceTotal + $taxAmount;

                    $this->_db->where('invoice_id', $id);
                    $invClientUpdt = $this->_db->update('tms_invoice_client', ['Invoice_cost'=> $finalTotal, 'item_total'=> $finalTotal ] );

            }catch (Exception $e) {
            }

            $res['status'] = 200;
            $res['msg'] = "Successfully updated";
        } else {
            $res['status'] = 401;
            $res['msg'] = "Not updated";
        }

        return $res;
    }

    public function getClientInvoiceApprovedScoop($id)
    {
        //$qry = "SELECT its.itemId, its.heads_up, gen.order_no AS orderNumber, gen.due_date AS DueDate, gen.order_id AS orderId, cust.created_date AS orderDate, cust.client AS customer, gen.project_name AS projectName, c.vUserName AS contactName, c.iClientId, stus.status_name AS clientStatus, c.vlogo AS clientlogo, c.tPoInfo AS ponumber, gen.company_code AS companyCode, gen.project_price, gen.expected_start_date, cust.contact AS contactPerson, its.item_number, its.po_number AS itemPonumber, its.start_date AS itemStartdate, its.due_date AS itemDuedate, its.upcomingDate, its.source_lang AS itemsSourceLang, its.target_lang AS itemsTargetLang, its.price AS scoop_price, its.subPm AS scoop_subPm_id, its.attached_workflow, gen.project_status AS projectStatus, gen.project_type AS projectType, c.project_branch, plang.source_lang AS sourceLanguage, plang.target_lang AS targetLanguage, its.total_price AS totalAmount, its.item_name AS scoopName, its.item_email_subject AS itemEmailSubject, inc.vUserName AS accountname, tu.vUserName AS pm_name, CONCAT(tu.vFirstName, ' ', tu.vLastName) AS pm_fullName, CONCAT( sub_tu.vFirstName, ' ', sub_tu.vLastName ) AS sub_pm_name, CONCAT( sub_scp_tu.vFirstName, ' ', sub_scp_tu.vLastName ) AS sub_scoopPm_name, CONCAT( gen_Qa.vFirstName, ' ', gen_Qa.vLastName ) AS gen_Qa_fullName, CONCAT( sub_gen_Qa.vFirstName, ' ', sub_gen_Qa.vLastName ) AS gen_sub_Qa_fullName, CONCAT( scp_Qa.vFirstName, ' ', scp_Qa.vLastName ) AS scp_Qa_fullName, CONCAT( sub_scp_Qa.vFirstName, ' ', sub_scp_Qa.vLastName ) AS scp_sub_Qa_fullName, cust.project_coordinator AS project_coordinator_id, cust.project_manager AS project_manager_id, cust.QA_specialist AS qa_specialist_id, cust.sub_pm AS sub_pm_id, ps.project_status_name AS projectstatus_name, ps.status_color AS projectstatus_color, tis.item_status_name AS itemStatus, tis.item_status_id AS itemStatusId, c.client_currency, cp.price_currency, cp2.price_currency AS price_currency2, GROUP_CONCAT(DISTINCT(jsv.resources)) AS linguistId, GROUP_CONCAT( DISTINCT( CONCAT( jsv.vFirstName, ' ', jsv.vLastName ) ) ) AS linguistName FROM tms_items AS its LEFT JOIN tms_general AS gen ON its.order_id = gen.order_id LEFT JOIN tms_customer AS cust ON its.order_id = cust.order_id LEFT JOIN tms_proj_language AS plang ON its.order_id = plang.order_id LEFT JOIN tms_client AS c ON cust.client = c.iClientId LEFT JOIN tms_user_status AS stus ON c.vStatus = stus.status_id LEFT JOIN tms_client_indirect AS inc ON inc.iClientId = cust.indirect_customer LEFT JOIN tms_users AS tu ON tu.iUserId = cust.project_manager LEFT JOIN tms_users AS sub_tu ON sub_tu.iUserId = cust.sub_pm LEFT JOIN tms_users AS sub_scp_tu ON sub_scp_tu.iUserId = its.subPm LEFT JOIN tms_users AS gen_Qa ON gen_Qa.iUserId = cust.QA_specialist LEFT JOIN tms_users AS sub_gen_Qa ON sub_gen_Qa.iUserId = cust.sub_qa LEFT JOIN tms_users AS scp_Qa ON scp_Qa.iUserId = its.qaSpecialist LEFT JOIN tms_users AS sub_scp_Qa ON sub_scp_Qa.iUserId = its.subQa LEFT JOIN tms_project_status AS ps ON ps.pr_status_id = gen.project_status LEFT JOIN tms_customer_price_list AS cp ON its.project_pricelist = cp.price_list_id LEFT JOIN tms_item_status AS tis ON its.item_status = tis.item_status_id LEFT JOIN( SELECT resource_id, price_currency FROM tms_customer_price_list WHERE price_id = 1 GROUP BY resource_id ) AS cp2 ON cp2.resource_id = cust.client LEFT JOIN( SELECT tu.iUserId AS resources, tu.vFirstName, tu.vLastName, tu.vUserName, tsv.order_id, tsv.item_id, tsv.job_summmeryId FROM tms_summmery_view AS tsv LEFT JOIN tms_users AS tu ON tu.iUserId = tsv.resource ) AS jsv ON ( its.order_id = jsv.order_id AND its.item_number = jsv.item_id ) WHERE its.order_id != 0 AND tis.item_status_id = '5' GROUP BY its.itemId ORDER BY `its`.`itemId` DESC";
        //$qry = "SELECT its.itemId, its.heads_up, gen.order_no AS orderNumber, gen.due_date AS DueDate, gen.order_id AS orderId, cust.created_date AS orderDate, cust.client AS customer, gen.project_name AS projectName, c.vUserName AS contactName, c.iClientId, stus.status_name AS clientStatus, c.vlogo AS clientlogo, c.tPoInfo AS ponumber, gen.company_code AS companyCode, gen.project_price, gen.expected_start_date, cust.contact AS contactPerson, its.item_number, its.po_number AS itemPonumber, its.start_date AS itemStartdate, its.due_date AS itemDuedate, its.upcomingDate, its.source_lang AS itemsSourceLang, its.target_lang AS itemsTargetLang, its.price AS scoop_price, its.subPm AS scoop_subPm_id, its.attached_workflow, gen.project_status AS projectStatus, gen.project_type AS projectType, c.project_branch, its.total_price AS totalAmount, its.item_name AS scoopName, its.item_email_subject AS itemEmailSubject, inc.vUserName AS accountname, tu.vUserName AS pm_name, CONCAT(tu.vFirstName, ' ', tu.vLastName) AS pm_fullName, CONCAT( sub_tu.vFirstName, ' ', sub_tu.vLastName ) AS sub_pm_name, CONCAT( sub_scp_tu.vFirstName, ' ', sub_scp_tu.vLastName ) AS sub_scoopPm_name, cust.project_coordinator AS project_coordinator_id, cust.project_manager AS project_manager_id, cust.QA_specialist AS qa_specialist_id, cust.sub_pm AS sub_pm_id, ps.project_status_name AS projectstatus_name, ps.status_color AS projectstatus_color, tis.item_status_name AS itemStatus, tis.item_status_id AS itemStatusId, c.client_currency, cp.price_currency, cp2.price_currency AS price_currency2 FROM tms_items AS its LEFT JOIN tms_general AS gen ON its.order_id = gen.order_id LEFT JOIN tms_customer AS cust ON its.order_id = cust.order_id LEFT JOIN tms_client AS c ON cust.client = c.iClientId LEFT JOIN tms_user_status AS stus ON c.vStatus = stus.status_id LEFT JOIN tms_client_indirect AS inc ON inc.iClientId = cust.indirect_customer LEFT JOIN tms_users AS tu ON tu.iUserId = cust.project_manager LEFT JOIN tms_users AS sub_tu ON sub_tu.iUserId = cust.sub_pm LEFT JOIN tms_users AS sub_scp_tu ON sub_scp_tu.iUserId = its.subPm LEFT JOIN tms_project_status AS ps ON ps.pr_status_id = gen.project_status LEFT JOIN tms_customer_price_list AS cp ON its.project_pricelist = cp.price_list_id LEFT JOIN tms_item_status AS tis ON its.item_status = tis.item_status_id LEFT JOIN( SELECT resource_id, price_currency FROM tms_customer_price_list WHERE price_id = 1 GROUP BY resource_id ) AS cp2 ON cp2.resource_id = cust.client WHERE its.order_id != 0 AND tis.item_status_id = '5'  GROUP BY its.itemId ORDER BY `its`.`itemId` DESC";
        //$qry = "SELECT its.itemId, its.heads_up, gen.order_no AS orderNumber, gen.due_date AS DueDate, gen.order_id AS orderId, cust.created_date AS orderDate, cust.client AS customer, gen.project_name AS projectName, c.vUserName AS contactName, c.iClientId, stus.status_name AS clientStatus, c.vlogo AS clientlogo, c.tPoInfo AS ponumber, gen.company_code AS companyCode, gen.project_price, gen.expected_start_date, cust.contact AS contactPerson, its.item_number, its.po_number AS itemPonumber, its.start_date AS itemStartdate, its.due_date AS itemDuedate, its.upcomingDate, its.source_lang AS itemsSourceLang, its.target_lang AS itemsTargetLang, its.price AS scoop_price, its.subPm AS scoop_subPm_id, its.attached_workflow, gen.project_status AS projectStatus, gen.project_type AS projectType, c.project_branch, its.total_price AS totalAmount, its.item_name AS scoopName, its.item_email_subject AS itemEmailSubject, inc.vUserName AS accountname, tu.vUserName AS pm_name, ps.project_status_name AS projectstatus_name, ps.status_color AS projectstatus_color, tis.item_status_name AS itemStatus, tis.item_status_id AS itemStatusId, c.client_currency, cp.price_currency, cp2.price_currency AS price_currency2 FROM tms_items AS its LEFT JOIN tms_general AS gen ON its.order_id = gen.order_id LEFT JOIN tms_customer AS cust ON its.order_id = cust.order_id LEFT JOIN tms_client AS c ON cust.client = c.iClientId LEFT JOIN tms_user_status AS stus ON c.vStatus = stus.status_id LEFT JOIN tms_client_indirect AS inc ON inc.iClientId = cust.indirect_customer LEFT JOIN tms_users AS tu ON tu.iUserId = cust.project_manager LEFT JOIN tms_project_status AS ps ON ps.pr_status_id = gen.project_status LEFT JOIN tms_customer_price_list AS cp ON its.project_pricelist = cp.price_list_id LEFT JOIN tms_item_status AS tis ON its.item_status = tis.item_status_id LEFT JOIN( SELECT resource_id, price_currency FROM tms_customer_price_list WHERE price_id = 1 GROUP BY resource_id ) AS cp2 ON cp2.resource_id = cust.client WHERE its.order_id != 0 AND tis.item_status_id = '5' GROUP BY its.itemId ORDER BY `its`.`itemId` DESC";
        // last new change 
        // LEFT JOIN tms_invoice_client AS invc ON iscp.invc_Id = invc.invoice_id AND invc.is_deleted != 1  
        // AND ( iscp.invc_scoop_id IS NULL OR invc.invoice_id IS NULL)
        $qry = "SELECT its.itemId, its.heads_up, gen.order_no AS orderNumber, gen.due_date AS DueDate, gen.order_id AS orderId, cust.created_date AS orderDate, cust.client AS customer, gen.project_name AS projectName, c.vUserName AS contactName, c.iClientId, stus.status_name AS clientStatus, c.vlogo AS clientlogo, c.tPoInfo AS ponumber, gen.company_code AS companyCode, gen.project_price, gen.expected_start_date, cust.contact AS contactPerson, its.item_number, its.po_number AS itemPonumber, its.start_date AS itemStartdate, its.due_date AS itemDuedate, its.upcomingDate, its.source_lang AS itemsSourceLang, its.target_lang AS itemsTargetLang, its.price AS scoop_price, its.subPm AS scoop_subPm_id, its.attached_workflow, gen.project_status AS projectStatus, gen.project_type AS projectType, c.project_branch, its.total_price AS totalAmount, its.item_name AS scoopName, its.item_email_subject AS itemEmailSubject, inc.vUserName AS accountname, tu.vUserName AS pm_name, ps.project_status_name AS projectstatus_name, ps.status_color AS projectstatus_color, tis.item_status_name AS itemStatus, tis.item_status_id AS itemStatusId, c.client_currency, cp.price_currency, cp2.price_currency AS price_currency2, iscp.invc_scoop_id FROM tms_items AS its 
        LEFT JOIN tms_general AS gen ON its.order_id = gen.order_id 
        LEFT JOIN tms_customer AS cust ON its.order_id = cust.order_id 
        LEFT JOIN tms_client AS c ON cust.client = c.iClientId 
        LEFT JOIN tms_user_status AS stus ON c.vStatus = stus.status_id 
        LEFT JOIN tms_client_indirect AS inc ON inc.iClientId = cust.indirect_customer 
        LEFT JOIN tms_users AS tu ON tu.iUserId = cust.project_manager 
        LEFT JOIN tms_project_status AS ps ON ps.pr_status_id = gen.project_status 
        LEFT JOIN tms_customer_price_list AS cp ON its.project_pricelist = cp.price_list_id 
        LEFT JOIN tms_item_status AS tis ON its.item_status = tis.item_status_id 
        LEFT JOIN( SELECT resource_id, price_currency FROM tms_customer_price_list WHERE price_id = 1 GROUP BY resource_id ) AS cp2 ON cp2.resource_id = cust.client 
        LEFT JOIN tms_invoice_scoops AS iscp ON its.itemId = iscp.invc_scoop_id 
        LEFT JOIN tms_invoice_client AS invc ON iscp.invc_Id = invc.invoice_id AND invc.is_deleted != 1  
        WHERE its.order_id != 0 AND tis.item_status_id = '5' AND ( iscp.invc_scoop_id IS NULL OR invc.invoice_id IS NULL) GROUP BY its.itemId ORDER BY `its`.`itemId` DESC ";
        $data = $this->_db->rawQuery($qry);

        return $data;
    }

    public function getClientInvoiceByScoopId($id)
    {
        $qry = 'SELECT * FROM tms_invoice_client WHERE JSON_CONTAINS(scoop_id, \'{"id": ' . $id . '}\', "$")';
        $data = $this->_db->rawQuery($qry);
        $response = []; 
        if ($data !== false && !empty($data)) {
        //if ($data) {
            $response['status'] = 200;
            $response['msg'] = "success";
            $response['data'] = $data;
        } else {
            $response['status'] = 422;
            $response['msg'] = "No record";
        }
        return $response;
    }

    public function insertTempInvoiceData($id)
    {
        $res = [];
        // Fetch rows from tms_invoice_client table
        $invoices = $this->_db->rawQuery("SELECT invoice_id, scoop_id FROM tms_invoice_client WHERE is_deleted != 1 ");
        //$invoices = $this->_db->rawQuery("SELECT invoice_id, scoop_id FROM tms_invoice_client where  invoice_id = $id");
        //$invoices = $this->_db->rawQuery("SELECT invoice_id, scoop_id FROM tms_invoice_client");

        foreach ($invoices as $invoice) {
            $invoice_id = $invoice['invoice_id'];
            $scoop_ids = json_decode($invoice['scoop_id'], true);

            foreach ($scoop_ids as $scoop) {
                $scoop_id = $scoop['id'];

                // Fetch price from tms_items table based on scoop_id
                //$scoopOneData = $this->_db->rawQuery("SELECT total_price FROM tms_items WHERE itemId = $scoop_id");
                $this->_db->where('itemId', $scoop_id );
                $this->_db->join('tms_general tgn', 'tgn.order_id=its.order_id', 'LEFT');
                $scoopOneData = $this->_db->getOne('tms_items its','its.order_id, its.item_number, its.item_name, its.total_price, its.po_number, its.accounting_inv_comment, tgn.order_no');

                if ($scoopOneData) {
                    // $price = $price_data[0]['total_price'];

                    // $insertData['invc_Id'] = $invoice_id;
                    // $insertData['invc_scoop_id'] = $scoop_id;
                    
                    $insertData['invc_Id'] = $invoice_id;
                    $insertData['invc_scoop_id'] = $scoop_id;
                    $insertData['scoop_price'] = $scoopOneData['total_price'];
                    $insertData['scoop_order_number'] = $scoopOneData['order_no'];
                    $insertData['scoop_order_id'] = $scoopOneData['order_id'];
                    $insertData['scoop_item_number'] = $scoopOneData['item_number'];
                    $insertData['scoop_name'] = $scoopOneData['item_name'];
                    $insertData['scoop_po_number'] = $scoopOneData['po_number'];
                    $insertData['accounting_inv_comment'] = $scoopOneData['accounting_inv_comment'];
                    
                    $insertData['created_date'] = date('Y-m-d H:i:s');
                    $insertData['modified_date'] = date('Y-m-d H:i:s');
                    $inserted = $this->_db->insert('tms_invoice_scoops', $insertData);

                    if ($inserted) {
                        $res['msg'] = "New record created successfully for invoice_id: $invoice_id, scoop_id: $scoop_id, \n";
                    } else {
                        $res['msg'] = "Error: " . $inserted . "\n";
                    }
                } else {
                    $res['msg'] = "No price found for scoop_id: $scoop_id\n";
                }
            }
        }

        return $res;

    }

    public function getInvoiceCreditnotes($id)
    {
        $this->_db->where('tic.invoice_id', $id);
        $this->_db->join('tms_invoice_client tic', 'tic.invoice_id=tcn.invoice_id', 'LEFT');
        $result = $this->_db->getOne('tms_invoice_credit_notes tcn', 'tcn.*');

        if ($result) {
            $result['status'] = 200;
            $result['msg'] = "success";
        } else {
            $result['status'] = 422;
            $result['msg'] = "No record";
        }
        return $result;
    }

    public function createInvoiceCreditnotes($postdata)
    {
        if ($postdata) {
            $this->_db->where('invoice_id', $postdata['invoice_id']);
            $sameRecordExist = $this->_db->getOne('tms_invoice_credit_notes');

            if ($sameRecordExist) {
                $result['status'] = 422;
                $result['is_exist'] = TRUE;
                $result['msg'] = "Record alredy exist with same invoice";
                return $result;
            }
            $invPrefix = 'CN00-';
            $maxRawQuery = 'SELECT MAX(credit_number_max) AS max_count FROM tms_invoice_credit_notes';
            $maxResult = $this->_db->rawQuery($maxRawQuery);
            // Set maxCount based on query result, defaulting to 45 if no result is found
            $maxCount = isset($maxResult[0]['max_count']) && $maxResult[0]['max_count'] ? (int) $maxResult[0]['max_count'] : DEFAULT_CREDIT_NOTES_NO;
            $maxCount += 1;
            $maxCreditNoteNo = $invPrefix . str_pad($maxCount, 5, '0', STR_PAD_LEFT);

            $insdata['credit_note_no'] = $maxCreditNoteNo;
            $insdata['credit_number_max'] = $maxCount;
            $insdata['invoice_id'] = $postdata['invoice_id'];
            $insdata['createdByUser'] = $postdata['createdByUser'];
            $insdata['created_date'] = date('Y-m-d H:i:s');
            $insdata['modified_date'] = date('Y-m-d H:i:s');

            $id = $this->_db->insert('tms_invoice_credit_notes', $insdata);
            if ($id) {
                $invData['modified_date'] = date('Y-m-d H:i:s');
                $invData['is_credit_note'] = '1';
                $invData['invoice_status'] = 'Credited';
                $this->_db->where('invoice_id', $postdata['invoice_id']);
                $invUpdate = $this->_db->update('tms_invoice_client', $invData);

                $this->_db->where('id', $id);
                $lastInsData = $this->_db->getOne('tms_invoice_credit_notes');

                $result['data'] = $lastInsData;
                $result['is_exist'] = false;
                $result['status'] = 200;
                $result['msg'] = "Credit notes successfully created and Creadit notes number = " . $maxCreditNoteNo;
            } else {
                $result['status'] = 401;
                $result['msg'] = "Not saved";
            }
            return $result;
        } else {
            $result['status'] = 422;
            $result['msg'] = "Post data not exist";
            return $result;
        }

    }

    public function clientInvoiceDueDate($data)
    {   
        if (isset($data['post_inv_due_date']) && strtotime($data['post_inv_due_date']) !== false) {
            $updataData['invoice_due_date'] = $data['post_inv_due_date'];
            $this->_db->where('invoice_id', $data['invoice_id']);
            $dueDateUpdate = $this->_db->update('tms_invoice_client', $updataData);
            if ($dueDateUpdate) {
                $result['status'] = 200;
                $result['msg'] = "Successfully Updated";
            } else {
                $result['status'] = 422;
                $result['msg'] = "Not updated";
            }
        } else {
            $result['status'] = 422;
            $result['msg'] = "Date format is not proper";
        }    
        return $result;
    }

    public function clientInvoicePaymentDate($data){
        if (isset($data['post_inv_payment_date']) && strtotime($data['post_inv_payment_date']) !== false) {
            $updataData['paid_date'] = $data['post_inv_payment_date'];
            $this->_db->where('invoice_id', $data['invoice_id']);
            $dueDateUpdate = $this->_db->update('tms_invoice_client', $updataData);
            if ($dueDateUpdate) {
                $result['status'] = 200;
                $result['msg'] = "Successfully Updated";
            } else {
                $result['status'] = 422;
                $result['msg'] = "Not updated";
            }
        } else {
            $result['status'] = 422;
            $result['msg'] = "Date format is not proper";
        }    
        return $result;
    }

    public function downloadInvoiceWord($data)
    {
        $headerHtml = '';
        $htmlContent =  $data['invoiceContent'];
        $htmlFooter =  $data['invoiceFooter'];
        // Create instance of PhpWordDoc class
        $phpWordDoc = new PhpWordDoc();

        $fiileName = 'invoiceword-'.time(). '-file'.'.docx';
        $fileFolder = 'invoice/client/'.$fiileName;
        $filePath = UPLOADS_ROOT . $fileFolder ;

        $flPath = UPLOADS_ROOT .'invoice/client/';
        
        // Generate Word document
        $outputWordFile = $phpWordDoc->generateWordDocument($headerHtml, $htmlContent, $htmlFooter, $filePath);

        if ($outputWordFile) {
            $result['worFile'] = $fiileName;
            $result['filePath'] = $fileFolder;
            $result['status'] = 200;
            $result['msg'] = "File geenrated successflly";            

            try{
                if (substr($flPath, -1) != '/') {
                    $flPath .= '/';
                }
                $files = glob($flPath . '*');
                foreach ($files as $file) {
                    if (is_file($file) && $file !== $filePath) {
                        unlink($file); // Delete file
                    }
                }
            }catch( Exception $e ){

            } 

        } else {
            $result['worFile'] = $fileFolder;
            $result['status'] = 422;
            $result['msg'] = "Not downloaded";
        }
        return $result;
    }

    public function statusinvoiceReportFilter($filterParams){
        if(isset($filterParams['customer'])){
            $this->_db->where('tmInvoice.customer_id', $filterParams['customer']);
        }
        if(isset($filterParams['invoiceStatus'])){
            if($filterParams['invoiceStatus'] === "Outstanding"){
                $this->_db->where('tmInvoice.invoice_status', "Open");
            }else if($filterParams['invoiceStatus'] === "Complete" || $filterParams['invoiceStatus'] === "Completed" || $filterParams['invoiceStatus'] === "Paid"){
                $this->_db->where('tmInvoice.invoice_status IN ("Paid", "Complete", "Completed")');
            }else{
                $this->_db->where('tmInvoice.invoice_status', "'" . $filterParams['invoiceStatus'] . "'");
            }
        }
        if(isset($filterParams['invoiceNumber'])){
            $this->_db->where('tmInvoice.invoice_number',"\"%" .$filterParams['invoiceNumber']. "%\"", "like");
        }
        if(isset($filterParams['InvoicePrice'])){
            $this->_db->where('tmInvoice.Invoice_cost',"\"%" .$filterParams['InvoicePrice']. "%\"", "like");
        }
        if(isset($filterParams['currency'])){
            $this->_db->where("tc.client_currency", "\"%" . $filterParams['currency'] . "%\"", "like");
        }
        if(isset($filterParams['itemDuedateStart']) && isset($filterParams['itemDuedateEnd'])){
            // $Frm = $filterParams['itemDuedateStart'].' '.'00:00:00';
            // $To = $filterParams['itemDuedateEnd'].' '.'00:00:00';
            $Frm = '"' . $filterParams['itemDuedateStart'] . ' 00:00:00"';
            $To = '"' . $filterParams['itemDuedateEnd'] . ' 00:00:00"';
            $this->_db->where('tmInvoice.invoice_due_date', Array ($Frm,$To),'BETWEEN');
        }else if(isset($filterParams['itemDuedateStart'])){
            // $Frm = $filterParams['itemDuedateStart'].' '.'00:00:00';
            $Frm = '"' . $filterParams['itemDuedateStart'] . ' 00:00:00"';
            $this->_db->where('tmInvoice.invoice_due_date', $Frm, '>');
        }else if(isset($filterParams['itemDuedateEnd'])){
            // $To = $filterParams['itemDuedateEnd'].' '.'00:00:00';
            $To = '"' . $filterParams['itemDuedateEnd'] . ' 00:00:00"';
            $this->_db->where('tmInvoice.invoice_due_date', $To, '<');
        }else{}

        if(isset($filterParams['createDateFrom']) && isset($filterParams['createDateTo'])){
            //$Frm = $filterParams['createDateFrom'].' '.'00:00:00';
            //$To = $filterParams['createDateTo'].' '.'00:00:00';
            $Frm = '"' . $filterParams['createDateFrom'] . ' 00:00:00"';
            $To = '"' . $filterParams['createDateTo'] . ' 00:00:00"';
            $this->_db->where('tmInvoice.invoice_date', Array ($Frm,$To),'BETWEEN');
        }else if(isset($filterParams['createDateFrom'])){
            // $Frm = $filterParams['createDateFrom'].' '.'00:00:00';
            $Frm = '"' . $filterParams['createDateFrom'] . ' 00:00:00"';
            $this->_db->where('tmInvoice.invoice_date', $Frm, '>');
        }else if(isset($filterParams['createDateTo'])){
           // $To = $filterParams['createDateTo'].' '.'00:00:00';
            $To = '"' . $filterParams['createDateTo'] . ' 00:00:00"';
            $this->_db->where('tmInvoice.invoice_date', $Frm, '<');
        }else {}

        $this->_db->join('tms_users tu', 'tu.iUserId=tmInvoice.freelance_id', 'LEFT');
        $this->_db->join('tms_client tc', 'tc.iClientId=tmInvoice.customer_id', 'LEFT');
        // $this->_db->join('tms_invoice_credit_notes tcn', 'tcn.invoice_id=tmInvoice.invoice_id', 'LEFT');
        // $this->_db->orderBy('tmInvoice.invoice_id', 'asc');
        $this->_db->where('tmInvoice.is_deleted ', '1', '!=');
        if(isset($filterParams['invoiceStatus']) && $filterParams['invoiceStatus'] === "Overdue"){
            $this->_db->where('tmInvoice.invoice_due_date IS NOT NULL');
            $this->_db->where('tmInvoice.invoice_status NOT IN ("Paid", "Complete", "Completed")');
            // $this->_db->where('tmInvoice.invoice_due_date', date('Y-m-d H:i:s'), '<');
            $this->_db->where('tmInvoice.invoice_due_date', "'" . date('Y-m-d H:i:s') . "'", '<');
        }
        $this->_db->get('tms_invoice_client tmInvoice', null, 'tmInvoice.invoice_id, tc.iClientId AS clientId, tc.vUserName as clientCompanyName, tc.vAddress1 AS companyAddress, tc.vEmailAddress  AS companyEmail, tc.vPhone AS companyPhone, tc.vCodeRights AS company_code, tc.client_currency, tc.invoice_no_of_days, tu.iUserId AS freelanceId, concat(tu.vFirstName, " ", tu.vLastName) AS freelanceName, tu.vEmailAddress AS freelanceEmail, tu.vAddress1 AS freelanceAddress, tu.vProfilePic AS freelancePic, tu.iMobile AS freelancePhone, tmInvoice.invoice_number, tmInvoice.custom_invoice_number, tmInvoice.invoice_status, tmInvoice.Invoice_cost, tmInvoice.paid_amount, tmInvoice.scoop_id, tmInvoice.is_excel_download, tmInvoice.paid_date,  tmInvoice.invoice_date, tmInvoice.created_date, tmInvoice.is_credit_note, tmInvoice.is_credit_notes_email_sent, tmInvoice.invoice_due_date, tu.vSignUpload, tc.accounting_tripletex');
        $rawQuery = $this->_db->getLastQuery();
        $data = $this->_db->rawQuery("$rawQuery");
        return $data;
    }

    public function linguistInvoiceCustomPage($post)
    {
        // Get search, order, pagination parameters from the request
        $searchValue = $post['search'] ?? ''; // Search value
        $orderColumnIndex = $post['order'][0]['column'] ?? 1; // Index of the column to sort
        $orderDir = $post['order'][0]['dir'] ?? 'asc'; // Order direction (asc or desc)
        $start = $post['start'] ?? 0; // Starting point for pagination
        $length = $post['length'] ?? 20; // Number of records to fetch
        $filterParams = $post['filterParams'] ?? '';
        // Define the columns array corresponding to DataTables columns
        $columns = [
            0 => 'invoice_id',
            1 => 'org_invoice_number',
            2 => 'freelanceName',
            3 => 'Invoice_cost',
            4 => 'client_currency',
            5 => 'custom_invoice_no',
            6 => 'invoice_date',
            7 => 'inv_due_date',
            8 => 'paid_date',
            9 => 'invoice_status'
        ];

        // Determine the column to sort by based on DataTables order index
        $orderColumn = $columns[$orderColumnIndex] ?? 'create_date';

        // Ensure the order direction is valid
        $orderDir = strtolower($orderDir) === 'desc' ? 'DESC' : 'ASC';

        // Base query
        $qry_invc = '';
        function convertDateFormat($date)
        {
            $dateParts = explode('.', $date);
            if (count($dateParts) === 3) {
                return $dateParts[2] . '-' . $dateParts[1] . '-' . $dateParts[0];
            }
            return $date; // Return the original date if format is incorrect
        }

        // Assuming $searchValue can contain a date in dd.mm.yyyy format
        $searchValueConverted = convertDateFormat($searchValue);

        // Apply search functionality
        if (!empty($searchValue)) {
            $qry_invc .= " AND (concat(tu.vFirstName, ' ', tu.vLastName) LIKE '%" . $this->_db->escape($searchValue) . "%' 
                        OR tu.vFirstName LIKE '%" . $this->_db->escape($searchValue) . "%'
                        OR tu.vLastName LIKE '%" . $this->_db->escape($searchValue) . "%'
                        OR CAST(tmInvoice.invoice_number AS CHAR) LIKE '%" . $this->_db->escape($searchValue) . "%'
                        OR tc.client_currency LIKE '%" . $this->_db->escape($searchValue) . "%'
                        OR tmInvoice.Invoice_cost LIKE '%" . $this->_db->escape($searchValue) . "%'
                        OR tmInvoice.invoice_number LIKE '%" . $this->_db->escape($searchValue) . "%'
                        OR DATE(tmInvoice.inv_due_date) LIKE '%" . $this->_db->escape($searchValueConverted) . "%'
                        OR DATE(tmInvoice.invoice_date) LIKE '%" . $this->_db->escape($searchValueConverted) . "%'
                        OR tmInvoice.invoice_status LIKE '%" . $this->_db->escape($searchValueConverted) . "%'
                        )";
        }

        // Apply additional filters from $filterParams
        if (isset($filterParams['invoiceStatus'])) {
            if ($filterParams['invoiceStatus'] === "Open") {
                $qry_invc .= " AND (tmInvoice.is_approved = 1 OR tmInvoice.invoice_status = 'Approved') 
                            AND tmInvoice.invoice_status NOT IN ('Complete', 'Completed', 'Partly Paid', 'Paid')";
            } elseif (in_array($filterParams['invoiceStatus'], ["Complete", "Completed", "Paid"])) {
                $qry_invc .= " AND tmInvoice.invoice_status IN ('Paid', 'Complete', 'Completed')";
            } elseif ($filterParams['invoiceStatus'] === "Overdue") {
                $today = date('Y-m-d'); // Get today's date
                $qry_invc .= " AND tmInvoice.inv_due_date IS NOT NULL 
                            AND DATE(tmInvoice.inv_due_date) < '" . $this->_db->escape($today) . "' 
                            AND tmInvoice.invoice_status NOT IN ('Paid', 'Complete', 'Completed')";
            } elseif ($filterParams['invoiceStatus'] === "Approved") {
                $qry_invc .= " AND (tmInvoice.is_approved = 1 OR tmInvoice.invoice_status = 'Approved') 
                            AND tmInvoice.invoice_status NOT IN ('Complete', 'Completed', 'Partly Paid', 'Paid')";
            } else {
                $qry_invc .= " AND tmInvoice.invoice_status = '" . $this->_db->escape($filterParams['invoiceStatus']) . "'";
            }
        }

        if (isset($filterParams['freelanceName'])) {
            $qry_invc .= " AND tu.iUserid = '" . $this->_db->escape($filterParams['freelanceName']) . "'";
        }

        if (isset($filterParams['itemDuedateStart']) && isset($filterParams['itemDuedateEnd'])) {
            $qry_invc .= " AND tmInvoice.inv_due_date BETWEEN '" . $this->_db->escape($filterParams['itemDuedateStart'] . ' 00:00:00') . "' 
                        AND '" . $this->_db->escape($filterParams['itemDuedateEnd'] . ' 23:59:59') . "'";
        } elseif (isset($filterParams['itemDuedateStart'])) {
            $qry_invc .= " AND tmInvoice.inv_due_date >= '" . $this->_db->escape($filterParams['itemDuedateStart'] . ' 00:00:00') . "'";
        } elseif (isset($filterParams['itemDuedateEnd'])) {
            $qry_invc .= " AND tmInvoice.inv_due_date <= '" . $this->_db->escape($filterParams['itemDuedateEnd'] . ' 23:59:59') . "'";
        }

        if (isset($filterParams['createDateFrom']) && isset($filterParams['createDateTo'])) {
            $qry_invc .= " AND tmInvoice.invoice_date BETWEEN '" . $this->_db->escape($filterParams['createDateFrom'] . ' 00:00:00') . "' 
                        AND '" . $this->_db->escape($filterParams['createDateTo'] . ' 23:59:59') . "'";
        } elseif (isset($filterParams['createDateFrom'])) {
            $qry_invc .= " AND tmInvoice.invoice_date >= '" . $this->_db->escape($filterParams['createDateFrom'] . ' 00:00:00') . "'";
        } elseif (isset($filterParams['createDateTo'])) {
            $qry_invc .= " AND tmInvoice.invoice_date <= '" . $this->_db->escape($filterParams['createDateTo'] . ' 23:59:59') . "'";
        }

        if (isset($filterParams['paymentDateFrom']) && isset($filterParams['paymentDateTo'])) {
            $qry_invc .= " AND tmInvoice.paid_date BETWEEN '" . $this->_db->escape($filterParams['paymentDateFrom'] . ' 00:00:00') . "' 
                        AND '" . $this->_db->escape($filterParams['paymentDateTo'] . ' 23:59:59') . "'";
        } elseif (isset($filterParams['paymentDateFrom'])) {
            $qry_invc .= " AND tmInvoice.paid_date >= '" . $this->_db->escape($filterParams['paymentDateFrom'] . ' 00:00:00') . "'";
        } elseif (isset($filterParams['paymentDateTo'])) {
            $qry_invc .= " AND tmInvoice.paid_date <= '" . $this->_db->escape($filterParams['paymentDateTo'] . ' 23:59:59') . "'";
        }

        // Base query for data
        $qry_invc1 = "SELECT DISTINCT tsv.job_summmeryId AS jobId, tsv.order_id AS orderId, tsv.po_number AS poNumber, 
        tc.iClientId AS clientId, tc.vAddress1 AS companyAddress, tc.vEmailAddress AS companyEmail, 
        tc.vPhone AS companyPhone, tc.vCodeRights AS company_code, tu.iUserId AS freelanceId, 
        concat(tu.vFirstName, ' ', tu.vLastName) AS freelanceName, tu.vEmailAddress AS freelanceEmail, 
        tu.vAddress1 AS freelanceAddress, tu.vProfilePic AS freelancePic, tu.iMobile AS freelancePhone, 
        tu.freelance_currency, tsv.job_code AS jobCode, tmInvoice.invoice_number, tmInvoice.invoice_id, 
        tmInvoice.invoice_status, tmInvoice.Invoice_cost, tmInvoice.paid_amount, tmInvoice.invoice_date, 
        tmInvoice.paid_date, tmInvoice.created_date, tmInvoice.is_approved, tmInvoice.reminder_sent, 
        tmInvoice.is_excel_download, tmInvoice.currency_rate, tmInvoice.job_id as jobInvoiceIds, 
        tmInvoice.custom_invoice_no, tmInvoice.resourceInvoiceFileName, 
        LPAD(tmInvoice.invoice_number, 6, '0') AS org_invoice_number, tmInvoice.inv_due_date, 
        tmInvoice.vat2 as taxInNok, tmInvoice.Invoice_cost2 as priceInNok, tpy.vBankInfo as linguist_bankinfo, 
        tc.client_currency 
        FROM tms_invoice tmInvoice
        LEFT JOIN tms_users tu ON tu.iUserId = tmInvoice.freelance_id
        LEFT JOIN tms_client tc ON tc.iClientId = tmInvoice.customer_id
        LEFT JOIN tms_summmery_view tsv ON tsv.job_summmeryId = tmInvoice.job_id
        LEFT JOIN tms_payment tpy ON tpy.iUserId = tu.iUserId AND tpy.iType = 1 
        WHERE tmInvoice.is_deleted != 1" . $qry_invc;

        // Execute query for data
        $data = $this->_db->rawQuery($qry_invc1 . " ORDER BY " . $orderColumn . " " . $orderDir . " LIMIT $start, $length");

        // Execute queries for totals
        $totalSumQuery = "SELECT SUM(DISTINCT tmInvoice.Invoice_cost) AS totalPrice FROM tms_invoice tmInvoice
        LEFT JOIN tms_users tu ON tu.iUserId = tmInvoice.freelance_id
        LEFT JOIN tms_client tc ON tc.iClientId = tmInvoice.customer_id
        LEFT JOIN tms_summmery_view tsv ON tsv.job_summmeryId = tmInvoice.job_id
        LEFT JOIN tms_payment tpy ON tpy.iUserId = tu.iUserId AND tpy.iType = 1
        WHERE tmInvoice.is_deleted != 1" . $qry_invc;

        $totalSumResult = $this->_db->rawQuery($totalSumQuery);
        $totalPrice = $totalSumResult[0]['totalPrice'] ?? 0;

        $totalRecordsQuery = "SELECT COUNT(DISTINCT tmInvoice.invoice_id) AS count FROM tms_invoice tmInvoice
        LEFT JOIN tms_users tu ON tu.iUserId = tmInvoice.freelance_id
        LEFT JOIN tms_client tc ON tc.iClientId = tmInvoice.customer_id
        LEFT JOIN tms_summmery_view tsv ON tsv.job_summmeryId = tmInvoice.job_id
        LEFT JOIN tms_payment tpy ON tpy.iUserId = tu.iUserId AND tpy.iType = 1
        WHERE tmInvoice.is_deleted != 1" . $qry_invc;

        $totalRecordsResult = $this->_db->rawQuery($totalRecordsQuery);
        $totalRecords = $totalRecordsResult[0]['count'] ?? 0;

        $filteredRecordsQuery = "SELECT COUNT(DISTINCT tmInvoice.invoice_id) AS count FROM tms_invoice tmInvoice
        LEFT JOIN tms_users tu ON tu.iUserId = tmInvoice.freelance_id
        LEFT JOIN tms_client tc ON tc.iClientId = tmInvoice.customer_id
        LEFT JOIN tms_summmery_view tsv ON tsv.job_summmeryId = tmInvoice.job_id
        LEFT JOIN tms_payment tpy ON tpy.iUserId = tu.iUserId AND tpy.iType = 1
        WHERE tmInvoice.is_deleted != 1" . $qry_invc;

        $filteredRecordsResult = $this->_db->rawQuery($filteredRecordsQuery);
        $totalFilteredRecords = $filteredRecordsResult[0]['count'] ?? 0;

        if (!isset($post['filterParams'])) {
            $response = [
                "draw" => intval($post['draw']),
                "recordsTotal" => 0,
                "recordsFiltered" => 0,
                "data" => [],
                "totalPrice" => 0
            ];
        } else {
            $response = [
                "draw" => intval($post['draw']),
                "recordsTotal" => $totalRecords,
                "recordsFiltered" => $totalFilteredRecords,
                "data" => $data,
                "totalPrice" => $totalPrice
            ];
        }

        // Return the response
        return $response;
    }
    public function checkFIleExist($data)
    {
        $isFileExist = false;
        if(isset($data['filepathName'])){
            $path = '../../uploads/invoice/'.$data['fileName'];
            if ( file_exists($path) ) {
                $isFileExist = true;
            }
        }
        if ($isFileExist) {
            $result['isFileExist'] = $isFileExist;
            $result['status'] = 200;
            $result['msg'] = "File exist";
        } else {
            $result['isFileExist'] = $isFileExist;
            $result['status'] = 422;
            $result['msg'] = "Not exist";
        }
        return $result;
    }

    public function getClientInvoiceApprovedScoopTemp($id)
    {
        //$qry = "SELECT its.itemId, its.heads_up, gen.order_no AS orderNumber, gen.due_date AS DueDate, gen.order_id AS orderId, cust.created_date AS orderDate, cust.client AS customer, gen.project_name AS projectName, c.vUserName AS contactName, c.iClientId, stus.status_name AS clientStatus, c.vlogo AS clientlogo, c.tPoInfo AS ponumber, gen.company_code AS companyCode, gen.project_price, gen.expected_start_date, cust.contact AS contactPerson, its.item_number, its.po_number AS itemPonumber, its.start_date AS itemStartdate, its.due_date AS itemDuedate, its.upcomingDate, its.source_lang AS itemsSourceLang, its.target_lang AS itemsTargetLang, its.price AS scoop_price, its.subPm AS scoop_subPm_id, its.attached_workflow, gen.project_status AS projectStatus, gen.project_type AS projectType, c.project_branch, plang.source_lang AS sourceLanguage, plang.target_lang AS targetLanguage, its.total_price AS totalAmount, its.item_name AS scoopName, its.item_email_subject AS itemEmailSubject, inc.vUserName AS accountname, tu.vUserName AS pm_name, CONCAT(tu.vFirstName, ' ', tu.vLastName) AS pm_fullName, CONCAT( sub_tu.vFirstName, ' ', sub_tu.vLastName ) AS sub_pm_name, CONCAT( sub_scp_tu.vFirstName, ' ', sub_scp_tu.vLastName ) AS sub_scoopPm_name, CONCAT( gen_Qa.vFirstName, ' ', gen_Qa.vLastName ) AS gen_Qa_fullName, CONCAT( sub_gen_Qa.vFirstName, ' ', sub_gen_Qa.vLastName ) AS gen_sub_Qa_fullName, CONCAT( scp_Qa.vFirstName, ' ', scp_Qa.vLastName ) AS scp_Qa_fullName, CONCAT( sub_scp_Qa.vFirstName, ' ', sub_scp_Qa.vLastName ) AS scp_sub_Qa_fullName, cust.project_coordinator AS project_coordinator_id, cust.project_manager AS project_manager_id, cust.QA_specialist AS qa_specialist_id, cust.sub_pm AS sub_pm_id, ps.project_status_name AS projectstatus_name, ps.status_color AS projectstatus_color, tis.item_status_name AS itemStatus, tis.item_status_id AS itemStatusId, c.client_currency, cp.price_currency, cp2.price_currency AS price_currency2, GROUP_CONCAT(DISTINCT(jsv.resources)) AS linguistId, GROUP_CONCAT( DISTINCT( CONCAT( jsv.vFirstName, ' ', jsv.vLastName ) ) ) AS linguistName FROM tms_items AS its LEFT JOIN tms_general AS gen ON its.order_id = gen.order_id LEFT JOIN tms_customer AS cust ON its.order_id = cust.order_id LEFT JOIN tms_proj_language AS plang ON its.order_id = plang.order_id LEFT JOIN tms_client AS c ON cust.client = c.iClientId LEFT JOIN tms_user_status AS stus ON c.vStatus = stus.status_id LEFT JOIN tms_client_indirect AS inc ON inc.iClientId = cust.indirect_customer LEFT JOIN tms_users AS tu ON tu.iUserId = cust.project_manager LEFT JOIN tms_users AS sub_tu ON sub_tu.iUserId = cust.sub_pm LEFT JOIN tms_users AS sub_scp_tu ON sub_scp_tu.iUserId = its.subPm LEFT JOIN tms_users AS gen_Qa ON gen_Qa.iUserId = cust.QA_specialist LEFT JOIN tms_users AS sub_gen_Qa ON sub_gen_Qa.iUserId = cust.sub_qa LEFT JOIN tms_users AS scp_Qa ON scp_Qa.iUserId = its.qaSpecialist LEFT JOIN tms_users AS sub_scp_Qa ON sub_scp_Qa.iUserId = its.subQa LEFT JOIN tms_project_status AS ps ON ps.pr_status_id = gen.project_status LEFT JOIN tms_customer_price_list AS cp ON its.project_pricelist = cp.price_list_id LEFT JOIN tms_item_status AS tis ON its.item_status = tis.item_status_id LEFT JOIN( SELECT resource_id, price_currency FROM tms_customer_price_list WHERE price_id = 1 GROUP BY resource_id ) AS cp2 ON cp2.resource_id = cust.client LEFT JOIN( SELECT tu.iUserId AS resources, tu.vFirstName, tu.vLastName, tu.vUserName, tsv.order_id, tsv.item_id, tsv.job_summmeryId FROM tms_summmery_view AS tsv LEFT JOIN tms_users AS tu ON tu.iUserId = tsv.resource ) AS jsv ON ( its.order_id = jsv.order_id AND its.item_number = jsv.item_id ) WHERE its.order_id != 0 AND tis.item_status_id = '5' GROUP BY its.itemId ORDER BY `its`.`itemId` DESC";
        $qry = "SELECT its.itemId, its.heads_up, gen.order_no AS orderNumber, gen.due_date AS DueDate, gen.order_id AS orderId, cust.created_date AS orderDate, cust.client AS customer, gen.project_name AS projectName, c.vUserName AS contactName, c.iClientId, stus.status_name AS clientStatus, c.vlogo AS clientlogo, c.tPoInfo AS ponumber, gen.company_code AS companyCode, gen.project_price, gen.expected_start_date, cust.contact AS contactPerson, its.item_number, its.po_number AS itemPonumber, its.start_date AS itemStartdate, its.due_date AS itemDuedate, its.upcomingDate, its.source_lang AS itemsSourceLang, its.target_lang AS itemsTargetLang, its.price AS scoop_price, its.subPm AS scoop_subPm_id, its.attached_workflow, gen.project_status AS projectStatus, gen.project_type AS projectType, c.project_branch, its.total_price AS totalAmount, its.item_name AS scoopName, its.item_email_subject AS itemEmailSubject, inc.vUserName AS accountname, tu.vUserName AS pm_name, ps.project_status_name AS projectstatus_name, ps.status_color AS projectstatus_color, tis.item_status_name AS itemStatus, tis.item_status_id AS itemStatusId, c.client_currency, cp.price_currency, cp2.price_currency AS price_currency2 FROM tms_items AS its LEFT JOIN tms_general AS gen ON its.order_id = gen.order_id LEFT JOIN tms_customer AS cust ON its.order_id = cust.order_id LEFT JOIN tms_client AS c ON cust.client = c.iClientId LEFT JOIN tms_user_status AS stus ON c.vStatus = stus.status_id LEFT JOIN tms_client_indirect AS inc ON inc.iClientId = cust.indirect_customer LEFT JOIN tms_users AS tu ON tu.iUserId = cust.project_manager LEFT JOIN tms_project_status AS ps ON ps.pr_status_id = gen.project_status LEFT JOIN tms_customer_price_list AS cp ON its.project_pricelist = cp.price_list_id LEFT JOIN tms_item_status AS tis ON its.item_status = tis.item_status_id LEFT JOIN( SELECT resource_id, price_currency FROM tms_customer_price_list WHERE price_id = 1 GROUP BY resource_id ) AS cp2 ON cp2.resource_id = cust.client WHERE its.order_id != 0 AND tis.item_status_id = '5' GROUP BY its.itemId ORDER BY `its`.`itemId` DESC";
        $data = $this->_db->rawQuery($qry);
        $arr = [];

        // Process the results
        foreach ($data as $row) {
            $clientId = $row['iClientId'];
            // Initialize the array for this client if it doesn't exist
            if (!isset($arr[$clientId])) {
                $arr[$clientId] = [
                    'clientData' => [],    // To hold the individual row data
                    'totalPrice' => 0      // To accumulate the total price
                ];
            }
            // Add the current row data to the client's data
            $arr[$clientId]['clientData'][] = $row;
            // Accumulate the total price
            $arr[$clientId]['totalPrice'] += $row['totalAmount']; // Adjust according to your total price field
        }

        return $arr;
    }

    /* Get All client invoice */
    public function getclientInvoiceList($post)
    {   
        $searchValue = $post['search'] ?? ''; 
        $orderColumnIndex = $post['order'][0]['column'] ?? 1; 
        $orderDir = $post['order'][0]['dir'] ?? 'asc'; 
        $start = $post['start'] ?? 0; 
        $length = $post['length'] ?? 100; 
        // Define the columns array corresponding to DataTables columns
        $columns = [
            0 => 'invoice_id',
            //1 => 'invoice_number',
            1 => 'custom_invoice_number',
            2 => 'tc.vUserName',
            3 => 'accounting_tripletex',
            4 => 'Invoice_cost',
            5 => 'client_currency',
            6 => 'invoice_date',
            7 => 'invoice_due_date',
            8 => 'paid_date',
            9 => 'invoice_status',
            //10 => 'action',
        ];
        // Determine the column to sort by based on DataTables order index
        //if(isset($post['displayGroupBy']) && $post['displayGroupBy'] == true ){
        if ($post && isset($post['activeTab']) && $post['activeTab'] == 'group-outstanding' ) {
            //$orderColumn = ' tmInvoice.invoice_due_date ';  
            //$orderDir =  'ASC';
            // use case if date is 00
            $orderColumn = " CASE WHEN tmInvoice.invoice_due_date = '0000-00-00 00:00:00' THEN 1 ELSE 0 END, DATE(tmInvoice.invoice_due_date) $orderDir ";
            $orderDir =  ' ';
        }else{
            $orderColumn = $orderColumnIndex>0 ? $columns[$orderColumnIndex] : ' tmInvoice.invoice_id';
            $orderDir = strtolower($orderDir) === 'desc' ? 'DESC' : 'ASC';
        }

        $whereCond = " WHERE 
        tmInvoice.invoice_type = 'Save' 
        AND tmInvoice.is_deleted != 1 ";

        if ($post && isset($post['activeTab'])) {
            switch ($post['activeTab']) {
                case 'Open':
                    $whereCond .= " AND (tmInvoice.invoice_status = 'Open' 
                                        OR tmInvoice.invoice_status = 'Outstanding' 
                                        OR tmInvoice.invoice_status = 'Partly Paid') ";
                    break;
                case 'group-outstanding':
                    $whereCond .= " AND (tmInvoice.invoice_status = 'Open' 
                                        OR tmInvoice.invoice_status = 'Outstanding' 
                                        OR tmInvoice.invoice_status = 'Partly Paid') ";
                    break;    
                case 'Partly Paid':
                    $whereCond .= " AND (tmInvoice.invoice_status = 'Partly Paid') ";
                    break;
                case 'Completed':
                    $whereCond .= " AND (tmInvoice.invoice_status = 'Complete' 
                                        OR tmInvoice.invoice_status = 'Completed' 
                                        OR tmInvoice.invoice_status = 'Paid') ";
                    break;
                case 'Cancelled':
                    $whereCond .= " AND (tmInvoice.invoice_status = 'Cancel' 
                                        OR tmInvoice.invoice_status = 'Irrecoverable') ";
                    break;
                case 'Not-exported':
                    $whereCond .= " AND tmInvoice.is_excel_download != 1 ";
                    break;
                case 'Overdue':
                    $whereCond .= " AND tmInvoice.invoice_status NOT IN ('Paid', 'Complete', 'Completed', 'Cancel', 'Irrecoverable') ";
                    $whereCond .= " AND date(tmInvoice.invoice_due_date) < CURDATE() ";
                    break;
                default:
                    break;
            }
        }
        // search
        // Assuming $searchValue can contain a date in dd.mm.yyyy format
        if (!empty($searchValue)) {
            //$searchValueConverted = convertDateFormat($searchValue);
            $searchValueConverted = self::convertDateFormat($searchValue);
            $searchV = str_replace('.', '', $searchValue);
            $priceVal = str_replace(',', '.', $searchV);

            $creditNo = '';
            if($post && isset($post['activeTab']) && $post['activeTab'] == 'Credited'){
                $creditNo = " OR tcn.credit_note_no LIKE '%" . $searchValue . "%' ";
            }
            $statusValue = ($searchValue =='Paid' ) ? 'Completed' : $searchValue ;
            
            $whereCond .= " AND ( tmInvoice.invoice_status LIKE '%" . $statusValue . "%'
                        OR tc.vUserName LIKE '%" . $searchValue . "%'
                        OR tmInvoice.invoice_number LIKE '%" . $searchValue . "%'
                        OR tmInvoice.custom_invoice_number LIKE '%" . $searchValue . "%'
                        OR tc.client_currency LIKE '%" . $searchValue . "%'
                        OR tc.accounting_tripletex LIKE '%" . $searchValue . "%'
                        OR tmInvoice.Invoice_cost LIKE '%" . $priceVal . "%'
                        OR tmInvoice.paid_amount LIKE '%" . $priceVal . "%'
                        OR tmInvoice.created_date LIKE '%" . $searchValueConverted . "%'
                        OR tmInvoice.paid_date LIKE '%" . $searchValueConverted . "%'
                        OR tmInvoice.invoice_due_date LIKE '%" . $searchValueConverted . "%'
                        $creditNo
                        )";
        }
        
        $orderLimit = " ORDER BY " . $orderColumn . " " . $orderDir . " LIMIT $start, $length ";
        //echo $userId;exit;
        // Base query
        $selectFld = "SELECT 
            tmInvoice.invoice_id, 
            tc.iClientId AS clientId, 
            tc.vUserName AS clientCompanyName, 
            tc.vAddress1 AS companyAddress, 
            tc.vEmailAddress AS companyEmail, 
            tc.vPhone AS companyPhone, 
            tc.vCodeRights AS company_code, 
            tc.client_currency, 
            tc.invoice_no_of_days, 
            tu.iUserId AS freelanceId, 
            CONCAT(tu.vFirstName, ' ', tu.vLastName) AS freelanceName, 
            tu.vEmailAddress AS freelanceEmail, 
            tu.vAddress1 AS freelanceAddress, 
            tu.vProfilePic AS freelancePic, 
            tu.iMobile AS freelancePhone, 
            tmInvoice.invoice_number, 
            tmInvoice.custom_invoice_number, 
            tmInvoice.invoice_status, 
            tmInvoice.Invoice_cost, 
            tmInvoice.paid_amount, 
            tmInvoice.scoop_id, 
            tmInvoice.is_excel_download, 
            tmInvoice.paid_date,  
            tmInvoice.invoice_date, 
            tmInvoice.created_date, 
            tmInvoice.is_credit_note, 
            tmInvoice.is_credit_notes_email_sent, 
            tmInvoice.invoice_due_date, 
            tcn.credit_note_no, 
            tcn.created_date AS credit_note_create_date, 
            tu.vSignUpload, 
            tc.accounting_tripletex, 
            tcp.total_partial_paid AS invoice_partial_paid_total, 
            tcn.id AS credit_note_id, (tmInvoice.invoice_cost / IFNULL(NULLIF(tmInvoice.currency_rate, 0), 1)) AS invoice_price_euro";

        $jonLeftTable = " 
        LEFT JOIN tms_users tu ON tu.iUserId = tmInvoice.freelance_id
        LEFT JOIN tms_client tc ON tc.iClientId = tmInvoice.customer_id
        LEFT JOIN 
        (SELECT invoice_id, SUM(invoice_partial_paid_amount) AS total_partial_paid 
        FROM tms_invoice_client_payments 
        WHERE is_deleted = 0 
        GROUP BY invoice_id) tcp ON tcp.invoice_id = tmInvoice.invoice_id
        ";

        if ($post && isset($post['activeTab']) && $post['activeTab'] == 'Credited') {
            $jonTable = "FROM tms_invoice_credit_notes tcn
            LEFT JOIN tms_invoice_client tmInvoice ON tcn.invoice_id = tmInvoice.invoice_id " . $jonLeftTable;
        } else {
            $jonTable = "FROM tms_invoice_client tmInvoice " . $jonLeftTable . " 
            LEFT JOIN tms_invoice_credit_notes tcn ON tcn.invoice_id = tmInvoice.invoice_id";
        }

        $baseQry = " $selectFld $jonTable  $whereCond $orderLimit " ;
        $data = $this->_db->rawQueryNew($baseQry);

        // if multiple currency eixst then display total in EUR else just total 
        $is_multiple_currency = false;
        $temp_currency_arr = [];
        $currencyGroupbyQry = "SELECT tmInvoice.invoice_id, tc.client_currency 
                            $jonTable $whereCond 
                            GROUP BY tc.client_currency";
        $currGrpData = $this->_db->rawQueryNew($currencyGroupbyQry);
        if ($currGrpData) {
            foreach ($currGrpData as $row) {
                $currencyVal = !empty($row['client_currency']) 
                            ? explode(',', $row['client_currency'])[0] 
                            : 'EUR';
                $temp_currency_arr[$currencyVal] = true; // Use an associative array for unique values
            }
        }
        $is_multiple_currency = count($temp_currency_arr) > 1;


        if ($post && isset($post['activeTab']) && $post['activeTab'] == 'group-outstanding' ) {
            $grpQry = " SELECT DATE(tmInvoice.invoice_due_date) AS order_day, SUM(Invoice_cost) AS total_invoice_cost, SUM(Invoice_cost / COALESCE(NULLIF(currency_rate, 0), 1)) AS total_invoice_cost_eur $jonTable $whereCond  GROUP BY DATE(tmInvoice.invoice_due_date) " ;
            $groupByDate = $this->_db->rawQueryNew($grpQry);
            $totalCostsByDate = [];
            foreach ($groupByDate as $row) {
                $paidDate = $row['order_day'];
                if ($paidDate == '0000-00-00 00:00:00' || $paidDate == '0000-00-00' || $paidDate == '') {
                    $paidDate = 'unpaid';
                }
                $totalCostsByDate[$paidDate] = $is_multiple_currency == true ? $row['total_invoice_cost_eur'] : $row['total_invoice_cost'];
                //$totalCostsByDate[$row['order_day']] = $row['total_invoice_cost'];
            }
        }

        foreach ($data as $key => $value) {
            $data[$key]['companyName'] = '';
            if ($post && isset($post['activeTab']) && $post['activeTab'] != 'Credited') {
                $data[$key]['is_credit_note'] = '';
                $data[$key]['credit_note_id'] = '';
            }

            $data[$key]['invoice_number'] = !empty($value['custom_invoice_number']) ? $value['custom_invoice_number'] : $value['invoice_number'];
            $data[$key]['client_currency'] = !empty($value['client_currency']) ? explode(',', $value['client_currency'])[0] : 'EUR';
            $data[$key]['invoice_status'] = ($value['invoice_status'] == 'Open') ? 'Outstanding' : $value['invoice_status'];
            if (in_array($value['invoice_status'], ['Complete', 'Completed', 'Paid'])) {
                $data[$key]['invoice_status'] = 'Paid';
            }

            
            $data[$key]['group_total_invoice_cost_eur'] = 0;
            if ($post && isset($post['activeTab']) && $post['activeTab'] == 'group-outstanding' ) {
                $paidDate = $value['invoice_due_date'];
                if ($paidDate == '0000-00-00 00:00:00' || $paidDate == '0000-00-00') {
                    $createdDate = 'unpaid';
                }else{
                    $createdDate = date('Y-m-d', strtotime($value['invoice_due_date'])); 
                }
                //print_r($createdDate);
                $data[$key]['group_total_invoice_cost_eur'] = isset($totalCostsByDate[$createdDate]) ? $totalCostsByDate[$createdDate] : 0;
            }
            
        }

        $constQry = "select count(*) as total $jonTable $whereCond ";
        $countQry = $this->_db->rawQueryNew($constQry);
        $recordsTotal = $countQry[0]['total'];

        $constQry = "select SUM(tmInvoice.Invoice_cost) as priceTotal, SUM(Invoice_cost / COALESCE(NULLIF(currency_rate, 0), 1)) AS total_price_euro $jonTable $whereCond ";
        $priceRecord = $this->_db->rawQueryNew($constQry);
        $priceTotal = $priceRecord[0]['priceTotal'];
        $priceTotalEur = $priceRecord[0]['total_price_euro'];

        $creditdata = [];
        $retData = $data;
        
        // if($post && isset($post['activeTab']) && $post['activeTab'] == 'Credited'){
        //     $data = [];
        //     $creditdata = self::getAllInvoiceCreditNote();
        //     $recordsTotal = count($creditdata); 
        //     $retData = array_merge($data, $creditdata);
        // }
        
        $totalFilteredRecords = $recordsTotal ?? 0;
        $response = [
            "draw" => intval($post['draw']),
            "recordsTotal" => $recordsTotal,
            "recordsFiltered" => $totalFilteredRecords,
            "data" => $retData,
            "totalPrice" => $priceTotal ? $priceTotal : 0 ,
            "totalPriceEur" => $priceTotalEur ? $priceTotalEur : 0 ,
            "is_multiple_currency" => $is_multiple_currency ,
        ];
        return $response;
    }
    public function getclientInvoiceListCount()
    {   
        
        // Define the base query part
        $jonTable = "FROM tms_invoice_client tmInvoice
        LEFT JOIN tms_users tu ON tu.iUserId = tmInvoice.freelance_id
        LEFT JOIN tms_client tc ON tc.iClientId = tmInvoice.customer_id
        LEFT JOIN tms_invoice_credit_notes tcn ON tcn.invoice_id = tmInvoice.invoice_id
        LEFT JOIN (
            SELECT invoice_id, SUM(invoice_partial_paid_amount) AS total_partial_paid 
            FROM tms_invoice_client_payments 
            WHERE is_deleted = 0 
            GROUP BY invoice_id
        ) tcp ON tcp.invoice_id = tmInvoice.invoice_id";

        // Define the base `WHERE` conditions
        $whereCond = "WHERE tmInvoice.invoice_type = 'Save' AND tmInvoice.is_deleted != 1";

        // Prepare the individual status conditions
        $statusConditions = [
        'outstanding' => "(tmInvoice.invoice_status IN ('Open', 'Outstanding', 'Partly Paid'))",
        'partpaid' => "(tmInvoice.invoice_status = 'Partly Paid')",
        'paid' => "(tmInvoice.invoice_status IN ('Complete', 'Completed', 'Paid'))",
        'cancelled' => "(tmInvoice.invoice_status IN ('Cancel', 'Irrecoverable'))",
        'notExported' => "(tmInvoice.is_excel_download != 1)",
        'overdue' => "(tmInvoice.invoice_status NOT IN ('Paid', 'Complete', 'Completed', 'Cancel', 'Irrecoverable') 
                    AND DATE(tmInvoice.invoice_due_date) < CURDATE())"
        ];
        // Initialize an array to store results
        $data = [];
        // Query to count all invoices
        $cntQry = "SELECT 
                COUNT(*) AS total,
                SUM(CASE WHEN {$statusConditions['outstanding']} THEN 1 ELSE 0 END) AS outstanding,
                SUM(CASE WHEN {$statusConditions['partpaid']} THEN 1 ELSE 0 END) AS partpaid,
                SUM(CASE WHEN {$statusConditions['paid']} THEN 1 ELSE 0 END) AS paid,
                SUM(CASE WHEN {$statusConditions['cancelled']} THEN 1 ELSE 0 END) AS cancelled,
                SUM(CASE WHEN {$statusConditions['notExported']} THEN 1 ELSE 0 END) AS notExported,
                SUM(CASE WHEN {$statusConditions['overdue']} THEN 1 ELSE 0 END) AS overdue
            $jonTable $whereCond";

        // Execute the query
        $countQry = $this->_db->rawQueryNew($cntQry);

        // Assign values to the $data array
        if ($countQry) {
                $data['outstanding'] = $countQry[0]['outstanding'];
                $data['partpaid'] = $countQry[0]['partpaid'];
                $data['paid'] = $countQry[0]['paid'];
                $data['cancelled'] = $countQry[0]['cancelled'];
                $data['notExported'] = $countQry[0]['notExported'];
                $data['overdue'] = $countQry[0]['overdue'];
            } else {
                $data['outstanding'] = 0;
                $data['partpaid'] = 0;
                $data['paid'] = 0;
                $data['cancelled'] = 0;
                $data['notExported'] = 0;
                $data['overdue'] = 0;
        }

        // Query to count all invoices
        $cntQryAll = "SELECT COUNT(*) AS total $jonTable $whereCond";
        $countQryAll = $this->_db->rawQueryNew($cntQryAll);
        $data['allinvoice'] = $countQryAll[0]['total'];

        // Query to count credited invoices
        $creditdata = self::getAllInvoiceCreditNote();
        $data['credited'] = count($creditdata);

        return $data;

    }

    public function getclientInvoiceListExport($post)
    { 
        $data = [];

        $whereCond = " WHERE 
        tmInvoice.invoice_type = 'Save' 
        AND tmInvoice.is_deleted != 1 ";

        if ($post && isset($post['activeTab'])) {
            switch ($post['activeTab']) {
                case 'Open':
                    $whereCond .= " AND (tmInvoice.invoice_status = 'Open' 
                                        OR tmInvoice.invoice_status = 'Outstanding' 
                                        OR tmInvoice.invoice_status = 'Partly Paid') ";
                    break;
                case 'Partly Paid':
                    $whereCond .= " AND (tmInvoice.invoice_status = 'Partly Paid') ";
                    break;
                case 'Completed':
                    $whereCond .= " AND (tmInvoice.invoice_status = 'Complete' 
                                        OR tmInvoice.invoice_status = 'Completed' 
                                        OR tmInvoice.invoice_status = 'Paid') ";
                    break;
                case 'Cancelled':
                    $whereCond .= " AND (tmInvoice.invoice_status = 'Cancel' 
                                        OR tmInvoice.invoice_status = 'Irrecoverable') ";
                    break;
                case 'Not-exported':
                    $whereCond .= " AND tmInvoice.is_excel_download != 1 ";
                    break;
                case 'Overdue':
                    $whereCond .= " AND tmInvoice.invoice_status NOT IN ('Paid', 'Complete', 'Completed', 'Cancel', 'Irrecoverable') ";
                    $whereCond .= " AND date(tmInvoice.invoice_due_date) < CURDATE() ";
                    break;
                default:
                    break;
            }
        }
        
        $orderBy = " ORDER BY tmInvoice.invoice_id ASC " ;
        //echo $userId;exit;
        // Base query
        $selectFld = "SELECT 
            tmInvoice.invoice_id, 
            tc.iClientId AS clientId, 
            tc.vUserName AS clientCompanyName, 
            tc.vAddress1 AS companyAddress, 
            tc.vEmailAddress AS companyEmail, 
            tc.vPhone AS companyPhone, 
            tc.vCodeRights AS company_code, 
            tc.client_currency, 
            tc.invoice_no_of_days, 
            tu.iUserId AS freelanceId, 
            CONCAT(tu.vFirstName, ' ', tu.vLastName) AS freelanceName, 
            tu.vEmailAddress AS freelanceEmail, 
            tu.vAddress1 AS freelanceAddress, 
            tu.vProfilePic AS freelancePic, 
            tu.iMobile AS freelancePhone, 
            tmInvoice.invoice_number, 
            tmInvoice.custom_invoice_number, 
            tmInvoice.invoice_status, 
            tmInvoice.Invoice_cost, 
            tmInvoice.paid_amount, 
            tmInvoice.scoop_id, 
            tmInvoice.is_excel_download, 
            tmInvoice.paid_date,  
            tmInvoice.invoice_date, 
            tmInvoice.created_date, 
            tmInvoice.is_credit_note, 
            tmInvoice.is_credit_notes_email_sent, 
            tmInvoice.invoice_due_date, 
            tcn.credit_note_no, 
            tcn.created_date AS credit_note_create_date, 
            tu.vSignUpload, 
            tc.accounting_tripletex, 
            tcp.total_partial_paid AS invoice_partial_paid_total, 
            tcn.id AS credit_note_id";

        $jonLeftTable = " 
        LEFT JOIN tms_users tu ON tu.iUserId = tmInvoice.freelance_id
        LEFT JOIN tms_client tc ON tc.iClientId = tmInvoice.customer_id
        LEFT JOIN 
        (SELECT invoice_id, SUM(invoice_partial_paid_amount) AS total_partial_paid 
        FROM tms_invoice_client_payments 
        WHERE is_deleted = 0 
        GROUP BY invoice_id) tcp ON tcp.invoice_id = tmInvoice.invoice_id
        ";

        if ($post && isset($post['activeTab']) && $post['activeTab'] == 'Credited') {
            $jonTable = "FROM tms_invoice_credit_notes tcn
            LEFT JOIN tms_invoice_client tmInvoice ON tcn.invoice_id = tmInvoice.invoice_id " . $jonLeftTable;
        } else {
            $jonTable = "FROM tms_invoice_client tmInvoice " . $jonLeftTable . " 
            LEFT JOIN tms_invoice_credit_notes tcn ON tcn.invoice_id = tmInvoice.invoice_id";
        }

        $baseQry = " $selectFld $jonTable  $whereCond $orderBy " ;
        $data = $this->_db->rawQueryNew($baseQry);

        foreach ($data as $key => $value) {
            $data[$key]['companyName'] = '';
            if ($post && isset($post['activeTab']) && $post['activeTab'] != 'Credited') {
                $data[$key]['is_credit_note'] = '';
                $data[$key]['credit_note_id'] = '';
            }

            $data[$key]['invoice_number'] = !empty($value['custom_invoice_number']) ? $value['custom_invoice_number'] : $value['invoice_number'];
            $data[$key]['client_currency'] = !empty($value['client_currency']) ? explode(',', $value['client_currency'])[0] : 'EUR';
            $data[$key]['invoice_status'] = ($value['invoice_status'] == 'Open') ? 'Outstanding' : $value['invoice_status'];
            if (in_array($value['invoice_status'], ['Complete', 'Completed', 'Paid'])) {
                $data[$key]['invoice_status'] = 'Paid';
            }
            
        }


        $response = [
            "data" => $data,
            "status" => 200,
        ];
        return $response;

    }

    public function convertDateFormat($date)
    {
        $dateParts = explode('.', $date);
        if (count($dateParts) === 3) {
            return $dateParts[2] . '-' . $dateParts[1] . '-' . $dateParts[0];
        }
        return $date; // Return the original date if format is incorrect
    }


}