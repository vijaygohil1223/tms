<?php
require_once 'users.class.php';
require_once 'client.class.php';
require_once 'functions.class.php';
require_once 'mpdf.class.php';

class Freelance_invoice
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

    public function getInvoiceNumber()
    {
        $invoiceData = self::get('tms_invoice');
        return $invoiceData;
    }

    public function getFreelanceInvoicePartPayments($id)
    {
        $this->_db->where('invoice_id', $id);
        $data = $this->_db->get('tms_invoice_payments');
        return $data;
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
            //$this->_db->join('tms_payment tp', 'tp.iClientId=tcu.client', 'LEFT');
            $this->_db->join('tms_payment tp', 'tp.iUserId = tu.iUserId AND tp.iType = 1', 'LEFT');
            $this->_db->join('tms_tax tx', 'tp.tax_rate = tx.tax_id', 'LEFT');
            $this->_db->join('tms_items ti', 'ti.order_id=tsv.order_id AND ti.item_number = tsv.item_id ', 'LEFT');
            $data = $this->_db->getOne('tms_summmery_view tsv', 'tsv.job_summmeryId AS jobId,tsv.item_id AS item_number, tsv.order_id AS orderId, tsv.po_number AS poNumber, tci.iClientId AS clientId, tci.vAddress1 AS companyAddress, tci.vEmailAddress  AS companyEmail, tci.vPhone AS companyPhone,tci.address1Detail AS clientAddresDetail,tci.vLogo AS clientLogo, tci.vCenterid AS client_business_center , tu.iUserId AS freelanceId, concat(tu.vFirstName, " ", tu.vLastName) AS freelanceName, tu.vEmailAddress AS freelanceEmail, tu.vAddress1 AS freelanceAddress,tu.address1Detail AS freelanceAddressDetail, tu.vProfilePic AS freelancePic, tu.iMobile AS freelancePhone, tu.freelance_currency, tu.second_currency as freelance_second_currency, tg.company_code, tsv.job_code AS jobCode, tsv.price AS jobPrice, tsv.total_price as price_per_job,tp.vPaymentInfo as clientVatinfo, tp.tax_rate as tax_rate_id, tx.tax_percentage, ti.item_name, ti.po_number as scoop_poNumber ');

            //echo $this->_db->getLastQuery();
            //exit;

            $companyName = self::getAll('abbrivation', substr($data['company_code'], 0, -2), 'tms_centers');

            $data['companyName'] = $companyName[0]['name'];

            //payment due date number of day
            $data['number_of_days'] = $paymentDue[0]['number_of_days'];

            //invoiceNumber Count
            $data['invoiceCount'] = count(self::get('tms_invoice'));

            //echo '<pre>'; print_r($data); echo '</pre>';exit;

            if (isset($data['orderId'])) {
                //$info = self::getAll('order_id',$data['orderId'],'tms_items');
                // $this->_db->where('item_number',$data['item_number']);
                // $this->_db->where('order_id',$data['orderId']);
                // $info = $this->_db->getOne('tms_items');
                // $data['item'] = [];
                // if($info){
                //     if($info['price']){
                //         foreach (json_decode($info['price']) as $field => $val) {
                //             $data['item'][] = (array) $val;
                //         }
                //     }
                // }
                if ($data['jobPrice']) {
                    foreach (json_decode($data['jobPrice']) as $field => $val) {
                        $data['item'][] = (array) $val;
                    }
                }
            }
            $infoD[$k] = $data;
        }
        return $infoD;
    }

    //invoice and draft save
    public function saveInvoice($data)
    {

        $fileName = isset($data['resourceInvoiceFileName']) ? $data['resourceInvoiceFileName'] : '';
        $path = '../../uploads/invoice/';

        if (isset($data['resourceInvoiceFile']) && $data['resourceInvoiceFile'] != '') {
            $pdf_content = explode("base64,", $data['resourceInvoiceFile']);
            $bin = base64_decode($pdf_content[1], true);
            if (file_exists($path . $fileName)) {
                //mkdir ($dir, 0755);
                $fileName = time() . '-' . $data['resourceInvoiceFileName'];
            }
            $pdfFile = $path . $fileName;
            if (file_put_contents($pdfFile, $bin)) {
                // file uploaded
            }
            // if (strpos($bin, '%PDF') !== 0) {
            //     throw new Exception('Missing the PDF file ');
            // }
        }

        $invoiceAlreadyAdded = false;
        try {
            if (!empty($data['job_id'])) {
                $invoiceRecords = $this->_db->get('tms_invoice');
                if (is_array($invoiceRecords)) {
                    foreach ($invoiceRecords as $k => $v) {
                        $jobIds = json_decode($v['job_id'], true);
                        if (is_array($jobIds)) {
                            foreach ($jobIds as $ke => $val) {
                                $existedJobId = $val['id'];
                                $postedJobIds = json_decode($data['job_id'], true);
                                if (is_array($postedJobIds)) {
                                    foreach ($postedJobIds as $k1 => $v1) {
                                        $postedJobId = $v1['id'];
                                        if ($postedJobId == $existedJobId) {
                                            $invoiceAlreadyAdded = true;
                                            break 3; // Exit all loops once a match is found
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        } catch (Exception $e) {
            // 
        }

        // if($data['job_id']){
        //     $invoiceRecords = $this->_db->get('tms_invoice');
        //     foreach ($invoiceRecords as $k => $v) {
        //         foreach (json_decode($v['job_id'],true) as $ke => $val) {
        //             $existedJobId = $val['id'];
        //             foreach (json_decode($data['job_id'],true) as $k1 => $v1) {
        //                 $postedJobId = $v1['id'];
        //                 if($postedJobId == $existedJobId){
        //                     $invoiceAlreadyAdded = true;
        //                 }
        //             }
        //         }
        //     }
        // }

        if (isset($data['job'])) {
            $jobData = $data['job'];
            unset($data['job']);
        }
        if (!$invoiceAlreadyAdded) {
            if ($fileName)
                $data['resourceInvoiceFileName'] = $fileName;
            if (isset($data['resourceInvoiceFile']))
                unset($data['resourceInvoiceFile']);
            $data['created_date'] = date('Y-m-d');
            $data['modified_date'] = date('Y-m-d');
            $data['value_date'] = date('Y-m-d');
            $data['invoice_date'] = (isset($data['invoice_date'])) ? $data['invoice_date'] : date('Y-m-d');
            $data['currency_rate'] = (isset($data['currency_rate'])) ? $data['currency_rate'] : 1;
            $id = $this->_db->insert('tms_invoice', $data);
            if ($id && $jobData) {
                foreach ($jobData as $item) {
                    $jbupData['updated_date'] = date('Y-m-d H:i:s');
                    if ($item['value'])
                        $jbupData['total_price'] = $item['value'];
                    if (isset($data['invoice_type']) && $data['invoice_type'] == 'save')
                        $jbupData['item_status'] = 'Invoiced';
                    $this->_db->where('job_summmeryId', $item['id']);
                    $scpstsId = $this->_db->update('tms_summmery_view', $jbupData);
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
            $result['msg'] = "Invoice already added for this job";
            return $result;
        }

    }

    //display invoice
    public function viewAllInvoice($type, $userId)
    {
        $this->_db->join('tms_users tu', 'tu.iUserId=tmInvoice.freelance_id', 'LEFT');
        $this->_db->join('tms_client tc', 'tc.iClientId=tmInvoice.customer_id', 'LEFT');
        $this->_db->join('tms_summmery_view tsv', 'tsv.job_summmeryId=tmInvoice.job_id', 'LEFT');
        $this->_db->orderBy('tmInvoice.invoice_id', 'asc');
        $this->_db->where('tmInvoice.invoice_type', $type);
        $this->_db->where('tu.iUserId', $userId);
        $this->_db->where('tmInvoice.is_deleted', ' != 1');
        $data = $this->_db->get('tms_invoice tmInvoice', null, 'tsv.job_summmeryId AS jobId, tsv.order_id AS orderId, tsv.po_number AS poNumber, tc.iClientId AS clientId, tc.vAddress1 AS companyAddress, tc.vEmailAddress  AS companyEmail, tc.vPhone AS companyPhone, tc.vCodeRights AS company_code, tu.iUserId AS freelanceId, concat(tu.vFirstName, " ", tu.vLastName) AS freelanceName, tu.vEmailAddress AS freelanceEmail, tu.vAddress1 AS freelanceAddress, tu.vProfilePic AS freelancePic, tu.iMobile AS freelancePhone, tsv.job_code AS jobCode, tmInvoice.invoice_number, tmInvoice.invoice_id, tmInvoice.invoice_status, tmInvoice.Invoice_cost, tmInvoice.paid_amount');
        foreach ($data as $key => $value) {
            $companyName = self::getAll('abbrivation', substr($value['company_code'], 0, -2), 'tms_centers');
            $data[$key]['companyName'] = isset($companyName[0]['name']) ? $companyName[0]['name'] : '';
        }

        return $data;
    }
    public function viewAllInvoice1($type)
    {
        $this->_db->join('tms_users tu', 'tu.iUserId=tmInvoice.freelance_id', 'LEFT');
        $this->_db->join('tms_client tc', 'tc.iClientId=tmInvoice.customer_id', 'LEFT');
        $this->_db->join('tms_summmery_view tsv', 'tsv.job_summmeryId=tmInvoice.job_id', 'LEFT');
        $this->_db->join('tms_payment tpy', 'tpy.iUserId=tu.iUserId AND tpy.iType = 1  ', 'LEFT');
        $this->_db->orderBy('tmInvoice.invoice_id', 'asc');
        $this->_db->where('tmInvoice.invoice_type', $type);
        $this->_db->where('tmInvoice.is_deleted', ' != 1');
        $this->_db->groupBy('tmInvoice.invoice_id');
        $data = $this->_db->get('tms_invoice tmInvoice', null, 'tsv.job_summmeryId AS jobId, tsv.order_id AS orderId, tsv.po_number AS poNumber, tc.iClientId AS clientId, tc.vAddress1 AS companyAddress, tc.vEmailAddress  AS companyEmail, tc.vPhone AS companyPhone, tc.vCodeRights AS company_code, tu.iUserId AS freelanceId, concat(tu.vFirstName, " ", tu.vLastName) AS freelanceName, tu.vEmailAddress AS freelanceEmail, tu.vAddress1 AS freelanceAddress, tu.vProfilePic AS freelancePic, tu.iMobile AS freelancePhone, tu.freelance_currency, tsv.job_code AS jobCode, tmInvoice.invoice_number, tmInvoice.invoice_id, tmInvoice.invoice_status, tmInvoice.Invoice_cost, tmInvoice.paid_amount,tmInvoice.invoice_date,tmInvoice.paid_date, tmInvoice.created_date,tmInvoice.is_approved,tmInvoice.reminder_sent,tmInvoice.is_excel_download, tmInvoice.currency_rate, tmInvoice.job_id as jobInvoiceIds, tmInvoice.custom_invoice_no, tmInvoice.resourceInvoiceFileName, CAST(tmInvoice.invoice_number AS CHAR) AS org_invoice_number, tmInvoice.inv_due_date, tmInvoice.vat2 as taxInNok, tmInvoice.Invoice_cost2 as priceInNok, tpy.vBankInfo as linguist_bankinfo ');
        foreach ($data as $key => $value) {
            $companyName = self::getAll('abbrivation', substr($value['company_code'], 0, -2), 'tms_centers');
            $data[$key]['companyName'] = isset($companyName[0]['name']) ? $companyName[0]['name'] : '';
            //$data[$key]['org_invoice_number'] = "".(string)$value['org_invoice_number']."";
        }
        
        return $data;
    }

    //display one invoice
    public function invoiceViewOne($id)
    {
        $id1 = self::getAll('invoice_id', $id, 'tms_invoice');
        $paymentDue = self::getAll('invoice_due_id', 1, 'tms_invoice_due_period');

        foreach (json_decode($id1[0]['job_id']) as $k => $v) {

            $this->_db->where('job_summmeryId', $v->id);
            $this->_db->join('tms_users tu', 'tu.iUserId=tsv.resource', 'LEFT');
            //$this->_db->join('tms_general tg','tg.order_id = tsv.order_id', 'INNER');
            $this->_db->join('tms_customer tcu', 'tcu.order_id = tsv.order_id', 'INNER');
            $this->_db->join('tms_client tci', 'tci.iClientId=tcu.client', 'LEFT');
            $this->_db->join('tms_users tcm', 'tsv.contact_person=tcm.iUserId', 'LEFT');
            //$this->_db->join('tms_payment tp', 'tp.iClientId=tcu.client', 'LEFT');
            $this->_db->join('tms_payment tp', 'tp.iUserId = tu.iUserId AND tp.iType = 1', 'LEFT');
            $this->_db->join('tms_tax tx', 'tp.tax_rate = tx.tax_id', 'LEFT');
            //$this->_db->join('tms_payment tp', 'tp.iUserId=tu.iUserId', 'LEFT');
            $this->_db->join('tms_items ti', 'ti.order_id=tsv.order_id AND ti.item_number = tsv.item_id ', 'LEFT');
            $data = $this->_db->getOne('tms_summmery_view tsv', 'tsv.job_summmeryId AS jobId,tsv.item_id AS item_number, tsv.order_id AS orderId, tsv.po_number AS poNumber, tci.iClientId AS clientId, tci.vAddress1 AS companyAddress, tci.address1Detail AS companyAddressDtl, tci.vPhone AS companyPhone,tci.address1Detail AS clientAddresDetail,tci.vLogo AS clientLogo, tci.vCenterid as business_center_id ,tu.iUserId AS freelanceId, concat(tu.vFirstName, " ", tu.vLastName) AS freelanceName, tu.vEmailAddress AS freelanceEmail, tu.vAddress1 AS freelanceAddress, tu.address1Detail AS freelanceAddressDetail, tu.vProfilePic AS freelancePic, tu.iMobile AS freelancePhone, tu.freelance_currency , tu.second_currency as freelance_second_currency , tci.vCodeRights As company_code, tsv.job_code AS jobCode, tsv.price as jobPrice, tsv.contact_person AS projectManagerId, tcm.vEmailAddress as emailRemind1, tcm.vSecondaryEmailAddress as emailRemind2, tp.vPaymentInfo as clientVatinfo, tp.tax_rate as tax_rate_id, tx.tax_percentage, ti.item_name, ti.po_number as scoop_poNumber, tsv.total_price as price_per_job, tu.companyName ');
            //, tci.vEmailAddress  AS companyEmail

            // $data['companyName'] = '';
            // if($data && isset($data['company_code']) && $data['company_code']!=''){
            //     $companyName = self::getAll('abbrivation',substr($data['company_code'],0,-2),'tms_centers');
            //     $data['companyName'] = count($companyName) > 0 ? $companyName[0]['name'] : '';
            // }
            //$data['companyName'] = $companyName[0]['name'];

            //payment due date number of day
            $data['number_of_days'] = $paymentDue ? $paymentDue[0]['number_of_days'] : 30;

            //invoiceNumber Count
            $data['invoiceCount'] = count(self::get('tms_invoice'));
            if ($data && isset($data['item_number']) && isset($data['orderId'])) {
                $this->_db->where('item_number', $data['item_number']);
                $this->_db->where('order_id', $data['orderId']);
                $info = $this->_db->getOne('tms_items');
            }

            // if($info){
            //     if($info['price']){
            //         foreach (json_decode($info['price']) as $field => $val) {
            //             $data['item'][] = (array) $val;
            //         }
            //     }
            // }
            if (!empty($data) && !empty($data['jobPrice'])) {
                foreach (json_decode($data['jobPrice']) as $field => $val) {
                    $data['jobpriceList'][] = (array) $val;
                    $data['item'][] = (array) $val;
                }
                // check and add new code  
                // $decodedJobPrice = json_decode($data['jobPrice'], true); 
                // $data['jobpriceList'] = $data['item'] = array_values($decodedJobPrice);
            }
            $infoD[$k] = array_merge($data, $id1[0]);
        }
        return $infoD;
    }

    //update invoice
    public function invoiceUpdate($id)
    {
        $data['value_date'] = date('Y-m-d');
        $data['invoice_type'] = "save";
        $this->_db->where('invoice_id', $id);
        $id = $this->_db->update('tms_invoice', $data);
        return $id;
    }

    public function invoiceStatusChange($data, $id)
    {
        /* Insert Part paid invoice payment detail in database START */
        $partPaidAmount = array();
        if (isset($data['partPaid'])) {
            $partPaidAmount['invoice_id'] = $id;
            $partPaidAmount['invoice_partial_paid_amount'] = $data['partPaid'];
            //$partPaidAmount['created_date']                 = date('Y-m-d H:i:s');
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
                $partPaymentInsert = $this->_db->insert('tms_invoice_payments', $partPaidAmount);
            else
                $partPaymentInsert = 1;
        }
        /* Insert Part paid invoice payment detail in database END */

        unset($data['partPaid']);
        // Update data if invoice cost is < Payment Linguist in Job section
        if (isset($data['is_update'])) {
            $partPaymentInsert = 1;
            unset($data['is_update']);
        }
        if (isset($data['paid_amount']) && $data['paid_amount'] == ' ') {
            unset($data['paid_amount']);
        }
        $data['modified_date'] = date('Y-m-d H:i:s');
        if (isset($data['invoice_status']) && $data['invoice_status'] == 'Approved') {
            $data['is_approved'] = 1;
        }
        $this->_db->where('invoice_id', $id);
        $upID = $this->_db->update('tms_invoice', $data);

        // Update Job status When invoice status change to complete
        if ($upID && isset($data['invoice_status'])) {
            $this->_db->where('invoice_id', $id);
            $invoiceRecords = $this->_db->get('tms_invoice');
            if ($data['invoice_status'] == 'Complete' || $data['invoice_status'] == 'Completed') {
                foreach (json_decode($invoiceRecords[0]['job_id']) as $field => $val) {
                    $jbData['updated_date'] = date('Y-m-d H:i:s');
                    $jbData['item_status'] = 'Paid';
                    $this->_db->where('job_summmeryId', $val->id);
                    $jbStsId = $this->_db->update('tms_summmery_view', $jbData);
                }
            }
        }
        // only For changes status linguist
        if (!$upID) {
            // $this->_db->where('invoice_id', $id);
            // $status = $this->_db->get('tms_invoice');
            // if(count($status) > 0 ){
            //     if( $status[0]['invoice_status'] == $data['invoice_status'])
            //         $upID = $id;
            // }
            $upID = $id;
        }
        if ($upID && isset($partPaymentInsert)) {
            $request['status'] = 200;
            $request['msg'] = "Successfully updated";
        } else {
            $request['status'] = 401;
            $request['msg'] = "Not updated";
        }
        return $request;
    }
    public function invoiceStatusApproved($data, $id)
    {
        $data['modified_date'] = date('Y-m-d');
        $this->_db->where('invoice_id', $id);
        $insId = $this->_db->update('tms_invoice', $data);
        if ($insId && isset($data['is_approved'])) {
            $this->_db->where('invoice_id', $id);
            $invoiceRecords = $this->_db->get('tms_invoice');
            $status = $data['is_approved'] == 1 ? 'Invoice Accepted' : 'Approved';
            if ($invoiceRecords) {
                foreach (json_decode($invoiceRecords[0]['job_id']) as $field => $val) {
                    $jbData['updated_date'] = date('Y-m-d H:i:s');
                    $jbData['item_status'] = $status;
                    $this->_db->where('job_summmeryId', $val->id);
                    $jbStsId = $this->_db->update('tms_summmery_view', $jbData);
                }
            }
        }
        if ($insId) {
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

        $data = $this->_db->rawQuery("SELECT concat(tu.vFirstName, ' ', tu.vLastName) vUserName,tmInvoice.invoice_number AS InvoiceNo,tmInvoice.paid_date As Date,tmInvoice.Invoice_cost As Amount,tmInvoice.paid_amount,tmInvoice.freelance_id,tmInvoice.customer_id,tmInvoice.value_date,tmInvoice.invoice_type,tmInvoice.invoice_status,tmInvoice.is_approved,tmInvoice.reminder_sent,tmInvoice.created_date FROM tms_users AS tu INNER JOIN tms_invoice AS tmInvoice ON tu.iUserId = tmInvoice.freelance_id WHERE tu.iUserId = $id");
        return $data;
    }
    public function filterStatement($filterParams)
    {
        //echo '<pre>'; print_r($filterParams); echo '</pre>';
        $this->_db->where('invoice_due_id', '1');
        $invc_due_period = $this->_db->getOne('tms_invoice_due_period');
        $invc_due_period = isset($invc_due_period['number_of_days']) ? $invc_due_period['number_of_days'] : 30;

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
            if ($filterParams['invoiceStatus'] == 'Approved') {
                $this->_db->where('tmInvoice.is_approved', '1');
                $this->_db->where('tmInvoice.invoice_status', 'Open');
            } else if ($filterParams['invoiceStatus'] == 'Overdue') {
                //$this->_db->where('DATE(tmInvoice.created_date) + INTERVAL 30 DAY','CURDATE()',' > ');
                $this->_db->where('DATEDIFF(NOW(),tmInvoice.created_date)', $invc_due_period, ' > ');
            } else {
                $this->_db->where('tmInvoice.invoice_status', $filterParams['invoiceStatus']);
            }
        }
        if (isset($filterParams['invoiceNumber'])) {
            $this->_db->where('tmInvoice.invoice_number', $filterParams['invoiceNumber']);
        }
        $data = $this->_db->get('tms_invoice tmInvoice', null, ' concat(tu.vFirstName, " ", tu.vLastName) as vUserName,tmInvoice.invoice_number AS InvoiceNo,tmInvoice.paid_date As Date,tmInvoice.Invoice_cost As Amount,tmInvoice.paid_amount,tmInvoice.freelance_id,tmInvoice.customer_id,tmInvoice.value_date,tmInvoice.invoice_type,tmInvoice.invoice_status,tmInvoice.created_date,tmInvoice.is_approved, tmInvoice.currency_rate, tu.freelance_currency');
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
        $this->_db->where('tmInvoice.is_deleted', ' != 1');
        $data = $this->_db->get('tms_invoice tmInvoice', null, 'tsv.job_summmeryId AS jobId, tsv.order_id AS orderId, tsv.po_number AS poNumber, tc.iClientId AS clientId, tc.vAddress1 AS companyAddress, tc.vEmailAddress  AS companyEmail, tc.vPhone AS companyPhone, tc.vCodeRights AS company_code, tu.iUserId AS freelanceId, concat(tu.vFirstName, " ",tu.vLastName) AS freelanceName, tu.vEmailAddress AS freelanceEmail, tu.vAddress1 AS freelanceAddress, tu.vProfilePic AS freelancePic, tu.iMobile AS freelancePhone, tsv.job_code AS jobCode, tmInvoice.invoice_number, tmInvoice.custom_invoice_no, tmInvoice.invoice_id, tmInvoice.invoice_date, tmInvoice.paid_date, tmInvoice.created_date, tmInvoice.invoice_status, tmInvoice.is_approved, tmInvoice.Invoice_cost, tmInvoice.paid_amount, tmInvoice.inv_due_date');
        foreach ($data as $key => $value) {
            $companyName = self::getAll('abbrivation', substr($value['company_code'], 0, -2), 'tms_centers');
            $data[$key]['companyName'] = isset($companyName[0]['name']) ? $companyName[0]['name'] : '';
        }

        return $data;
    }


    // //getInvoicePartPayments
    public function getInvoicePartPayments($id)
    {
        $this->_db->where('invoice_id', $id);
        $data = $this->_db->get('tms_invoice_payments');
        return $data;
    }

    public function sendInvoiceMail($data)
    {

        $pdf_content = explode("base64,", $data['pdfData']);
        $bin = base64_decode($pdf_content[1], true);
        $pdfFileName = $data['invoiceno'] . '.pdf';
        // if (strpos($bin, '%PDF') !== 0) {
        //     throw new Exception('Missing the PDF file ');
        // }
        $path = '../../uploads/invoice/';
        // if ( !file_exists($dir) ) {
        //     mkdir ($dir, 0755);
        // }
        $pdfFile = $path . $data['invoiceno'] . '.pdf';

        // Start Email Config

        $Username = 'TMS';

        $to = isset($data['data']['vEmailAddress']) ? $data['data']['vEmailAddress'] : $data['emailRemind1'];
        //$from = $data['data']['vEmailAddress'];
        $cc = '';
        if ($data['emailRemind2']) {
            //$cc = [[ 'email' => $data['emailRemind2'] ]];
            $cc = $data['emailRemind2'];
        }
        $to_name = 'TMS';

        $attachments = '';
        $subject = ($data['outstanding_reminder'] == 1) ? "Invoice Outstanding" : 'Invoice';

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
        if (isset($data['data']['messageData']) && $data['data']['messageData'] != '') {
            $message = $data['data']['messageData'];
        } else {
            $msgText = 'Invoice outstanding';
            $message = "<p> " . $msgText . " </p>";
            $message .= "<p> Invoice No : " . $data['invoiceno'] . ", </p>";
            $message .= "<p> Linguist Name : " . $data['freelanceName'] . ", </p>";
            $message .= "<p> Linguist Email : " . $data['freelanceEmail'] . "</p>";
        }
        $body = "<div>" . $message . "</div>";

        $attachments = '';
        if (isset($data['file'])) {
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
            }
        }
        // print_r($attachments);
        // print_r($data);
        // exit;
        $send_fn = new functions();
        $mailResponse = $send_fn->send_email_smtp($to, $to_name, $cc, $bcc, $subject, $body, $attachments);

        if ($mailResponse['status'] == 200) {
            $upData['modified_date'] = date('Y-m-d');
            if (isset($data['outstanding_reminder']))
                $upData['reminder_sent'] = 1;
            if (isset($data['invoice_to_be_sent']))
                $upData['is_invoice_sent'] = 1;

            $this->_db->where('invoice_id', $data['invoice_id']);
            $this->_db->update('tms_invoice', $upData);

            $result['status'] = 200;
            $result['msg'] = 'Thank you for your email';
            $path = "../../uploads/attatchment/";
            $pdfFiles = glob($pdfFile);
            if ($pdfFiles) {
                unlink($pdfFile);
            }
            return $result;
        } else {
            $result['status'] = 422;
            $result['msg'] = 'Could not send mail!';
            return $result;
        }

    }

    // Save edited invoice
    public function saveEditedInvoice($data, $id)
    {
        $updata['value_date'] = date('Y-m-d H:i');
        $updata['Invoice_cost'] = $data['Invoice_cost'];
        $updata['Invoice_cost2'] = $data['Invoice_cost2'];
        $updata['job_total'] = $data['item_total'];
        $updata['custom_invoice_no'] = $data['custom_invoice_no'];
        $updata['invoice_type'] = 'save';
        $updata['vat'] = $data['vat'];
        $updata['vat2'] = $data['vat2'];
        if ($data['inv_due_date']) {
            $updata['inv_due_date'] = $data['inv_due_date'];
        }
        if (isset($data['invoice_date'])) {
            $updata['invoice_date'] = $data['invoice_date'];
        }

        if ($id) {
            $this->_db->where('invoice_id', $id);
            $up_id = $this->_db->update('tms_invoice', $updata);
            // if each job in linguist invoice is editable than update below table 
            // if($up_id){
            //     foreach($data['item'] as $item){
            //         $jobData['updated_date'] = date('Y-m-d H:i:s');
            //         $jobData['total_price'] = $item['value'];
            //         $this->_db->where('job_summmeryId', $item['id']);
            //         $scpstsId = $this->_db->update('tms_summmery_view', $jobData);
            //     }
            // }
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

    public function freelanceInvoiceExcelStatus($data)
    {
        $allUpdated = false;
        $i = 0;
        $len = count($data);
        $updata['value_date'] = date('Y-m-d H:i');
        $updata['is_excel_download'] = 1;
        foreach ($data as $item) {
            $this->_db->where('invoice_id', $item);
            $scpstsId = $this->_db->update('tms_invoice', $updata);
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

    public function freelanceInvoiceDueDate($data)
    {
       
        $result = [];
        if (isset($data['post_inv_due_date']) && strtotime($data['post_inv_due_date']) !== false) {
            //$updataData['inv_due_date'] = (isset($data['post_inv_due_date'])) ? $data['post_inv_due_date'] : date('Y-m-d');
            $updataData['inv_due_date'] = $data['post_inv_due_date'];
            
            // Determine which invoices to update
            if (isset($data['invoiceIds']) && is_array($data['invoiceIds']) && count($data['invoiceIds']) > 0) {
                $invoiceIds = $data['invoiceIds'];
            } else {
                $invoiceIds = [$data['invoice_id']];
            }
            
            $dueDateUpdate = 0;
            $result['is_dueDateSmall'] = 0;    
            // Update each invoice
            foreach ($invoiceIds as $invoiceId) {
                // $this->_db->where('invoice_id',$invoiceId);
                // $invoiceData = $this->_db->getOne('tms_invoice');
                // $invoiceDate = strtotime($invoiceData['invoice_date']);
                // $dueDate = strtotime($data['post_inv_due_date']);
                // if ($dueDate < $invoiceDate) {
                //     echo  "Due date is earlier than invaoice date";
                //     $result['is_dueDateSmall'] = 1;
                // }else{
                //     echo  "large";
                // }
                $this->_db->where('invoice_id', $invoiceId);
                $dueDateUpdate = $this->_db->update('tms_invoice', $updataData);
            }
            // Set result based on update status
            if ($dueDateUpdate > 0) {
                $result['status'] = 200;
                $result['msg'] = "Successfully Updated";
            } else {
                $result['status'] = 422;
                $result['msg'] = "Not updated";
            }

        }else {
            $result['status'] = 422;
            $result['msg'] = "Date format is not proper";
        }
        return $result;
    }

    public function deleteFreelancerInvoice($id)
    {
        $this->_db->where('invoice_id', $id);
        $getInvoiceData = $this->_db->getOne('tms_invoice', 'job_id');
        if (isset($getInvoiceData) && !empty($getInvoiceData)) {
            foreach (json_decode($getInvoiceData['job_id']) as $k => $itemId) {
                try {
                    $jbupData['updated_date'] = date('Y-m-d H:i:s');
                    $jbupData['item_status'] = 'Invoice Ready';
                    $this->_db->where('job_summmeryId', $itemId->id );
                    $scpstsId = $this->_db->update('tms_summmery_view', $jbupData);
                } catch (Exception $e) {
                }
            }

            // delete invoice
            $this->_db->where('invoice_id', $id);
            $delete = $this->_db->delete('tms_invoice');

            // delete invoice payment data
            $this->_db->where('invoice_id', $id);
            $paymentdelete = $this->_db->delete('tms_invoice_payments');

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

    public function invoiceListingFilter()
    {

        $searchValue = $_GET['search']['value'] ?? '';
        $orderColumn = $_GET['order'][0]['column'] ?? 1; // Adjust order index due to the checkbox column
        $orderDir = $_GET['order'][0]['dir'] ?? 'asc';
        $start = $_GET['start'] ?? 0;
        $length = $_GET['length'] ?? 50;

        // Define the columns
//$columns = ['id', 'id', 'name', 'age']; // Include 'id' twice to account for the checkbox column

        $qry_invc = " select iUserId  as id, vUserName as name, iFkUserTypeId as age, DATE_FORMAT(dtCreatedDate, '%Y-%m-%d') as create_date from tms_users ";
        $data = $this->_db->rawQuery($qry_invc);

        $qry2 = " SELECT COUNT(*) AS count FROM tms_users ";
        //$res_count = $this->_db->rawQuery($qry2);
        $totalRecords = 20;
        $totalFilteredRecords = 20;
        // Prepare the response
// $response = [
//     "draw" => intval($_GET['draw']),
//     "recordsTotal" => $totalRecords,
//     "recordsFiltered" => $totalFilteredRecords,
//     "data" => $data
// ];
// $data = [
//     ["id" => 1, "name" => "John Doe", "age" => 28],
//     ["id" => 2, "name" => "Jane Doe", "age" => 24],
//     ["id" => 3, "name" => "Sam Smith", "age" => 34]
// ];

        // Construct the response array
        $response = [
            "draw" => 1,
            "recordsTotal" => 20,
            "recordsFiltered" => 20,
            "data" => $data
        ];

        return $response;
    }

}