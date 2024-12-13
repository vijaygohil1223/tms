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
            $data['companyName'] = "";
            if(isset($data['company_code'])){
                $companyName = self::getAll('abbrivation', substr($data['company_code'], 0, -2), 'tms_centers');

                $data['companyName'] = $companyName[0]['name'];
            }
           

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
    
    public function calculateDueDate($inputDate, $daysAfter = 60) {
        $noOfDays = $daysAfter ? (int)$daysAfter : 60;
        $startDate = new DateTime($inputDate);
        $startDate->modify("+$noOfDays days");
    
        if ((int)$startDate->format('d') <= 5) {
            $startDate->setDate((int)$startDate->format('Y'), (int)$startDate->format('m'), 5);
        } elseif ((int)$startDate->format('d') <= 20) {
            $startDate->setDate((int)$startDate->format('Y'), (int)$startDate->format('m'), 20);
        } else {
            $startDate->modify('first day of next month');
            $startDate->setDate((int)$startDate->format('Y'), (int)$startDate->format('m'), 5);
        }
    
        return $startDate;
    }
    

    //invoice and draft save
    public function saveInvoice($data)
    {
        $checkDueDate = self::calculateDueDate(date("Y-m-d"), 60 );
        $alreadyInvoiceDueDate = $checkDueDate->format('Y-m-d');
       
        $this->_db->where('is_deleted', 0);
        $this->_db->where('inv_due_date', $alreadyInvoiceDueDate);
        $this->_db->where('freelance_id', $data['freelance_id']);
        $invData = $this->_db->get('tms_invoice');
        
        $isDueDateMatched = !empty($invData);

        if(!$isDueDateMatched){

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
                
                $linguistId =  $data['freelance_id'];
                $data['currency_rate'] = 1;
                try{
                    $qry = "SELECT tu.iUserId, tcu.current_curency_rate FROM tms_users tu LEFT JOIN tms_currency tcu ON SUBSTRING_INDEX(tcu.currency_code, ',', 1) = SUBSTRING_INDEX(tu.freelance_currency, ',', 1) WHERE tu.iUserId = $linguistId ";
                    $getOne = $this->_db->rawQuery($qry);
                    $data['currency_rate'] = !empty($getOne) && isset($getOne[0]['current_curency_rate']) && $getOne[0]['current_curency_rate'] != '' ? $getOne[0]['current_curency_rate'] : 1;
                }catch (Exception $e) {
                    // 
                }
                //$data['currency_rate'] = (isset($data['currency_rate'])) ? $data['currency_rate'] : 1;
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
                        $jobDetail = $this->_db->getOne('tms_summmery_view');
                        try{
                            //insert value in tms_invoice_jobs
                            $iJobdata['invc_Id'] =  $id;
                            $iJobdata['invc_job_id'] = $item['id'];
                            $iJobdata['job_price'] =  $jobDetail['total_price'];
                            $iJobdata['created_date'] = date('Y-m-d');
                            $iJobdata['updated_date'] = date('Y-m-d');
                            $this->_db->insert('tms_invoice_jobs', $iJobdata);
                        } catch (Exception $e) {
                        }
                    
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
            
        }else{
            $result['status'] = 422;
            $result['msg'] = "Invoice exist with same due date.";
            return $result;
        }

    }

    public function invoicejobsSaveTemporary() {
        // Fetch all invoice data from tms_invoice table
        $this->_db->where('is_deleted ', 0);
        $invData = $this->_db->get('tms_invoice');
        
        foreach ($invData as $value) {
            // Ensure job_id is in array format to handle multiple job IDs
            $jobIds = json_decode($value['job_id'], true);
            if (is_array($jobIds)) {
                foreach ($jobIds as $job) {
                    // Check if 'id' key exists in each job entry to avoid undefined index errors
                    if (isset($job['id'])) {
                        $this->_db->where('job_summmeryId ', $job['id']);
                        $jobPrice = $this->_db->getOne('tms_summmery_view');
                        $iJobdata = [
                            'invc_Id' => $value['invoice_id'],
                            'invc_job_id' => $job['id'],
                            'job_price' => $jobPrice['total_price'],
                            'created_date' => date('Y-m-d'),
                            'updated_date' => date('Y-m-d')
                        ];
    
                        // Insert job data into tms_invoice_jobs table
                        $this->_db->insert('tms_invoice_jobs', $iJobdata);
                    }
                }
            }
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
        $data = $this->_db->get('tms_invoice tmInvoice', null, 'tsv.job_summmeryId AS jobId, tsv.order_id AS orderId, tsv.po_number AS poNumber, tc.iClientId AS clientId, tc.vAddress1 AS companyAddress, tc.vEmailAddress  AS companyEmail, tc.vPhone AS companyPhone, tc.vCodeRights AS company_code, tu.iUserId AS freelanceId, concat(tu.vFirstName, " ", tu.vLastName) AS freelanceName, tu.vEmailAddress AS freelanceEmail, tu.vAddress1 AS freelanceAddress, tu.vProfilePic AS freelancePic, tu.iMobile AS freelancePhone, tu.freelance_currency, tsv.job_code AS jobCode, tmInvoice.invoice_number, tmInvoice.invoice_id, tmInvoice.invoice_status, tmInvoice.Invoice_cost, tmInvoice.paid_amount,tmInvoice.invoice_date,tmInvoice.paid_date, tmInvoice.created_date,tmInvoice.is_approved,tmInvoice.reminder_sent,tmInvoice.is_excel_download, tmInvoice.currency_rate, tmInvoice.job_id as jobInvoiceIds, tmInvoice.custom_invoice_no, tmInvoice.resourceInvoiceFileName, CAST(tmInvoice.invoice_number AS CHAR) AS org_invoice_number, tmInvoice.inv_due_date, tmInvoice.vat2 as taxInNok, tmInvoice.Invoice_cost2 as priceInNok, tpy.vBankInfo as linguist_bankinfo, (tmInvoice.Invoice_cost/tmInvoice.currency_rate) AS Invoice_costEUR ');
        foreach ($data as $key => $value) {
            $companyName = self::getAll('abbrivation', substr($value['company_code'], 0, -2), 'tms_centers');
            $data[$key]['companyName'] = isset($companyName[0]['name']) ? $companyName[0]['name'] : '';
            //$data[$key]['org_invoice_number'] = "".(string)$value['org_invoice_number']."";
        }
        
        return $data;
    }

    public function getLinguistInvoiceList($post)
    {   
        $searchValue = $post['search'] ?? ''; 
        $orderColumnIndex = $post['order'][0]['column'] ?? 1; 
        $orderDir = $post['order'][0]['dir'] ?? 'asc'; 
        $start = $post['start'] ?? 0; 
        $length = $post['length'] ?? 100; 
        // Define the columns array corresponding to DataTables columns
        $columns = [
            0 => 'invoice_id',
            1 => 'invoice_number',
            //1 => 'custom_invoice_no',
            2 => ' concat(tu.vFirstName, " ", tu.vLastName) ',
            3 => 'Invoice_cost',
            4 => 'tu.freelance_currency',
            5 => 'custom_invoice_no',
            6 => 'invoice_date',
            7 => 'inv_due_date',
            8 => 'paid_date',
            //9 => 'invoice_status',
            9 => 'invoice_status_name',
            10 => 'invoice_id',
        ];
        // Determine the column to sort by based on DataTables order index
        //if(isset($post['displayGroupBy']) && $post['displayGroupBy'] == true ){
        if ($post && isset($post['activeTab']) && $post['activeTab'] == 'Approved' ) {
            $orderColumn = " CASE WHEN tmInvoice.inv_due_date = '0000-00-00 00:00:00' THEN 1 ELSE 0 END, DATE(tmInvoice.inv_due_date) $orderDir ";
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
                    $whereCond .= " AND (tmInvoice.invoice_status = 'Open' AND tmInvoice.is_approved != '1'  ) ";
                    break;
                case 'Approved':
                    $whereCond .= " AND (tmInvoice.invoice_status = 'Approved' AND tmInvoice.is_approved = 1) 
                        AND tmInvoice.invoice_status NOT IN ('Complete','Completed','Partly Paid','Paid') ";
                    break;
                case 'Completed':
                    $whereCond .= " AND (tmInvoice.invoice_status = 'Complete' 
                                        OR tmInvoice.invoice_status = 'Completed' 
                                        OR tmInvoice.invoice_status = 'Paid') ";
                    break;
                case 'Cancelled':
                    $whereCond .= " AND (tmInvoice.invoice_status = 'Cancel' ) ";
                    break;
                case 'Not-exported':
                    $whereCond .= " AND tmInvoice.is_excel_download != 1 ";
                    break;
                case 'Overdue':
                    $whereCond .= " AND tmInvoice.invoice_status NOT IN ('Paid', 'Complete', 'Completed') ";
                    $whereCond .= " AND date(tmInvoice.inv_due_date) < CURDATE() ";
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

            
            $invoiceStatus = '';
            $searchValueStr = strtolower($searchValue);
            if($searchValueStr == 'paid'){
                $invoiceStatus = " ( tmInvoice.invoice_status LIKE 'Complete' OR tmInvoice.invoice_status LIKE 'Completed' OR tmInvoice.invoice_status LIKE 'Paid') ";
            }
            if($searchValueStr == 'waiting on approval'){
                $invoiceStatus = " invoice_status LIKE 'Open' AND is_approved LIKE 0 ";
            }
            if($searchValueStr == 'outstanding'){
                $invoiceStatus = " invoice_status LIKE 'Open' AND is_approved LIKE 1 ";
            }
            $invoiceStatusCond = $invoiceStatus !='' ? ' OR '. $invoiceStatus : '';
            
            $whereCond .= " AND ( 
                        tmInvoice.invoice_number LIKE '%" . $searchValue . "%'
                        OR tu.freelance_currency LIKE '%" . $searchValue . "%'
                        OR tmInvoice.Invoice_cost LIKE '%" . $priceVal . "%'
                        OR tmInvoice.paid_amount LIKE '%" . $priceVal . "%'
                        OR tmInvoice.created_date LIKE '%" . $searchValueConverted . "%'
                        OR tmInvoice.paid_date LIKE '%" . $searchValueConverted . "%'
                        OR tmInvoice.inv_due_date LIKE '%" . $searchValueConverted . "%'
                        OR CONCAT(tu.vFirstName, ' ', tu.vLastName) LIKE '%" . $searchValue . "%'
                         $invoiceStatusCond
                        )";
                        
        }
        
        $orderLimit = " ORDER BY " . $orderColumn . " " . $orderDir . " LIMIT $start, $length ";
        //echo $userId;exit;
        // Base query
        $selectFld = "SELECT 
            tsv.job_summmeryId AS jobId, 
            tsv.order_id AS orderId, 
            tsv.po_number AS poNumber, 
            tc.iClientId AS clientId, 
            tc.vAddress1 AS companyAddress, 
            tc.vEmailAddress  AS companyEmail,
            tc.vPhone AS companyPhone, tc.vCodeRights AS company_code, 
            tu.iUserId AS freelanceId, 
            concat(tu.vFirstName, ' ', tu.vLastName) AS freelanceName, 
            tu.vEmailAddress AS freelanceEmail, tu.vAddress1 AS freelanceAddress, 
            tu.vProfilePic AS freelancePic, tu.iMobile AS freelancePhone, 
            tu.freelance_currency, tsv.job_code AS jobCode, 
            tmInvoice.invoice_number,
            tmInvoice.invoice_id, 
            tmInvoice.invoice_status, 
            tmInvoice.Invoice_cost, 
            tmInvoice.paid_amount,
            tmInvoice.invoice_date,
            tmInvoice.paid_date, 
            tmInvoice.created_date,
            tmInvoice.is_approved,
            tmInvoice.reminder_sent,
            tmInvoice.is_excel_download, 
            tmInvoice.is_payment_requested_email, 
            tmInvoice.currency_rate, 
            tmInvoice.job_id as jobInvoiceIds, 
            tmInvoice.custom_invoice_no, 
            tmInvoice.resourceInvoiceFileName, 
            CAST(tmInvoice.invoice_number AS CHAR) AS org_invoice_number, 
            tmInvoice.inv_due_date, 
            tmInvoice.vat2 as taxInNok, 
            tmInvoice.Invoice_cost2 as priceInNok, 
            tpy.vBankInfo as linguist_bankinfo, 
            (tmInvoice.Invoice_cost/tmInvoice.currency_rate) AS Invoice_costEUR ,
            CASE
                WHEN tmInvoice.invoice_status = 'Open' AND tmInvoice.is_approved = 1 THEN 'Outstanding'
                WHEN tmInvoice.invoice_status = 'Open' AND tmInvoice.is_approved = 0 THEN 'Waiting on approval'
                WHEN tmInvoice.invoice_status IN ('Complete', 'Completed', 'Paid') THEN 'Paid'
                ELSE tmInvoice.invoice_status
            END AS invoice_status_name
            ";

        $jonLeftTable = " 
        LEFT JOIN tms_users tu ON tu.iUserId = tmInvoice.freelance_id
        LEFT JOIN tms_client tc ON tc.iClientId = tmInvoice.customer_id
        LEFT JOIN tms_summmery_view tsv ON tsv.job_summmeryId=tmInvoice.job_id
        LEFT JOIN tms_payment tpy ON tpy.iUserId=tu.iUserId AND tpy.iType = 1
        ";

        $jonTable = " FROM tms_invoice tmInvoice " . $jonLeftTable . "  ";
        
        $gropbyField = ' tmInvoice.invoice_id ';
        
        $baseQry = " $selectFld $jonTable  $whereCond GROUP BY $gropbyField $orderLimit " ;
        $data = $this->_db->rawQueryNew($baseQry);

        // if multiple currency eixst then display total in EUR else just total 
        $is_multiple_currency = false;
        $temp_currency_arr = [];
        $currencyGroupbyQry = "SELECT tmInvoice.invoice_id, tu.freelance_currency 
                            $jonTable $whereCond 
                            GROUP BY $gropbyField, tu.freelance_currency ";
        $currGrpData = $this->_db->rawQueryNew($currencyGroupbyQry);
        if ($currGrpData) {
            foreach ($currGrpData as $row) {
                $currencyVal = !empty($row['freelance_currency']) 
                            ? explode(',', $row['freelance_currency'])[0] 
                            : 'EUR';
                $temp_currency_arr[$currencyVal] = true; // Use an associative array for unique values
            }
        }
        $is_multiple_currency = count($temp_currency_arr) > 1;

        if ($post && isset($post['activeTab']) && $post['activeTab'] == 'Approved' ) {
            // $grpQry = " SELECT tmInvoice.invoice_id, DATE(tmInvoice.inv_due_date) AS order_day, SUM(Invoice_cost) AS total_invoice_cost, SUM(Invoice_cost / COALESCE(NULLIF(currency_rate, 0), 1)) AS total_invoice_cost_eur $jonTable $whereCond  GROUP BY $gropbyField, DATE(tmInvoice.inv_due_date) " ;
            $select_1 = "SELECT invoice_id, DATE(tmInvoice.inv_due_date) AS order_day, Invoice_cost , currency_rate ";
            $grpQry = "SELECT  invoice_id, order_day, SUM(Invoice_cost) AS total_invoice_cost, SUM(Invoice_cost / COALESCE(NULLIF(currency_rate, 0), 1)) AS total_invoice_cost_eur  FROM ($select_1 $jonTable $whereCond GROUP BY $gropbyField ) AS subquery GROUP BY order_day " ;
            
            $groupByDate = $this->_db->rawQueryNew($grpQry);
            $totalCostsByDate = [];
            foreach ($groupByDate as $row) {
                $paidDate = $row['order_day'];
                if ($paidDate == '0000-00-00 00:00:00' || $paidDate == '0000-00-00' || $paidDate == '') {
                    $paidDate = 'unpaid';
                }
                //$totalCostsByDate[$paidDate] = $row['total_invoice_cost_eur'];
                $totalCostsByDate[$paidDate] = $is_multiple_currency == true ? $row['total_invoice_cost_eur'] : $row['total_invoice_cost'];
            }
        }

        foreach ($data as $key => $value) {
            $data[$key]['companyName'] = '';
            
            $data[$key]['invoice_number'] = !empty($value['custom_invoice_no']) ? $value['custom_invoice_no'] : $value['invoice_number'];
            $data[$key]['freelance_currency'] = !empty($value['freelance_currency']) ? explode(',', $value['freelance_currency'])[0] : 'EUR';
            
            if ($value['invoice_status'] == 'Open') {
                if ($value['is_approved'] == 1) {
                    $data[$key]['invoice_status'] = 'Outstanding';
                } else {
                    $data[$key]['invoice_status'] = 'Waiting on approval';
                }
            } elseif (in_array($value['invoice_status'], ['Complete', 'Completed', 'Paid'])) {
                $data[$key]['invoice_status'] = 'Paid';
            }
            
            $data[$key]['group_total_invoice_cost_eur'] = 0;
            if ($post && isset($post['activeTab']) && $post['activeTab'] == 'Approved' ) {
                $paidDate = $value['inv_due_date'];
                if ($paidDate == '0000-00-00 00:00:00' || $paidDate == '0000-00-00') {
                    $createdDate = 'unpaid';
                }else{
                    $createdDate = date('Y-m-d', strtotime($value['inv_due_date'])); 
                }
                //print_r($createdDate);
                $data[$key]['group_total_invoice_cost_eur'] = isset($totalCostsByDate[$createdDate]) ? $totalCostsByDate[$createdDate] : 0;
            }

            $data[$key]['linguist_account_holder'] = '';
            $data[$key]['linguist_iban'] = '';
            $data[$key]['linguist_bic_swift'] = '';
            if (!empty($value['linguist_bankinfo'])) {
                $tempBankInfo = json_decode($value['linguist_bankinfo']);
                $data[$key]['linguist_account_holder'] = $tempBankInfo->holder_name ?? '';
                $data[$key]['linguist_iban'] = $tempBankInfo->iban ?? '';
                $data[$key]['linguist_bic_swift'] = $tempBankInfo->bic ?? '';
            }
            
        }

        $constQry = "select invoice_id, count(*) as total FROM (select invoice_id $jonTable $whereCond GROUP BY $gropbyField ) as subquery ";
        $countQry = $this->_db->rawQueryNew($constQry);
        $recordsTotal = $countQry[0]['total'];

        //$constQry = "select SUM(tmInvoice.Invoice_cost) as priceTotal, SUM(Invoice_cost / COALESCE(NULLIF(currency_rate, 0), 1)) AS total_price_euro $jonTable $whereCond GROUP BY $gropbyField ";
        $selectSumField = " SELECT Invoice_cost as priceTotal, currency_rate  ";
        $constQry = " SELECT SUM(priceTotal) as priceTotal, SUM(priceTotal / COALESCE(NULLIF(currency_rate, 0), 1)) AS total_price_euro  FROM ($selectSumField $jonTable $whereCond GROUP BY $gropbyField ) AS subquery " ;
        $priceRecord = $this->_db->rawQueryNew($constQry);
        $priceTotal = $priceRecord[0]['priceTotal'];
        $priceTotalEur = $priceRecord[0]['total_price_euro'];

        $retData = $data;
        
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

    public function getLinguistInvoiceListCount()
    {   
        
        // Define the base query part
        $jonTable = "FROM tms_invoice tmInvoice
        LEFT JOIN tms_users tu ON tu.iUserId = tmInvoice.freelance_id
        LEFT JOIN tms_client tc ON tc.iClientId = tmInvoice.customer_id
        LEFT JOIN tms_summmery_view tsv ON tsv.job_summmeryId=tmInvoice.job_id
        LEFT JOIN tms_payment tpy ON tpy.iUserId=tu.iUserId AND tpy.iType = 1 ";

        // Define the base `WHERE` conditions
        $whereCond = "WHERE tmInvoice.invoice_type = 'Save' AND tmInvoice.is_deleted != 1";

        // Prepare the individual status conditions
        $statusConditions = [
        //'outstanding' => "(tmInvoice.invoice_status IN ('Open', 'Outstanding', 'Partly Paid'))",
        'outstanding' => "(invoice_status = 'Approved' AND is_approved = 1) AND invoice_status NOT IN ('Complete','Completed','Partly Paid','Paid') ",
        'waitingApproval' => "(invoice_status = 'Open' AND is_approved != 1)",
        'paid' => "(invoice_status IN ('Complete', 'Completed', 'Paid'))",
        'cancelled' => "(invoice_status IN ('Cancel' ))",
        'notExported' => "(is_excel_download != 1)",
        'overdue' => "(invoice_status NOT IN ('Paid', 'Complete', 'Completed', 'Cancel') 
                    AND DATE(inv_due_date) < CURDATE())"
        ];
        // Initialize an array to store results
        $data = [];
        // Query to count all invoices
        $cntQry = "SELECT 
                COUNT(invoice_id) AS allinvoice,
                SUM(CASE WHEN {$statusConditions['outstanding']} THEN 1 ELSE 0 END) AS outstanding,
                SUM(CASE WHEN {$statusConditions['paid']} THEN 1 ELSE 0 END) AS paid,
                SUM(CASE WHEN {$statusConditions['waitingApproval']} THEN 1 ELSE 0 END) AS waitingApproval,
                SUM(CASE WHEN {$statusConditions['cancelled']} THEN 1 ELSE 0 END) AS cancelled,
                SUM(CASE WHEN {$statusConditions['notExported']} THEN 1 ELSE 0 END) AS notExported,
                SUM(CASE WHEN {$statusConditions['overdue']} THEN 1 ELSE 0 END) AS overdue
            FROM (SELECT tmInvoice.invoice_id, invoice_status, is_approved,is_excel_download, inv_due_date  $jonTable $whereCond GROUP BY tmInvoice.invoice_id) as subquery ";

        // Execute the query
        $countQry = $this->_db->rawQueryNew($cntQry);

        // Assign values to the $data array
        if ($countQry) {
                $data['outstanding'] = $countQry[0]['outstanding'];
                $data['waitingApproval'] = $countQry[0]['waitingApproval'];
                $data['paid'] = $countQry[0]['paid'];
                $data['cancelled'] = $countQry[0]['cancelled'];
                $data['notExported'] = $countQry[0]['notExported'];
                $data['overdue'] = $countQry[0]['overdue'];
                $data['allinvoice'] = $countQry[0]['allinvoice'];
            } else {
                $data['outstanding'] = 0;
                $data['paid'] = 0;
                $data['cancelled'] = 0;
                $data['notExported'] = 0;
                $data['overdue'] = 0;
                $data['waitingApproval'] = 0;
                $data['allinvoice'] = 0;
                
                
        }
        // Query to count all invoices
        // $cntQryAll = "SELECT COUNT(*) AS total $jonTable $whereCond";
        // $countQryAll = $this->_db->rawQueryNew($cntQryAll);
        // $data['allinvoice'] = $countQryAll[0]['total'];

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
        $data = $this->_db->get('tms_invoice tmInvoice', null, 'tsv.job_summmeryId AS jobId, tsv.order_id AS orderId, tsv.po_number AS poNumber, tc.iClientId AS clientId, tc.vAddress1 AS companyAddress, tc.vEmailAddress  AS companyEmail, tc.vPhone AS companyPhone, tc.vCodeRights AS company_code, tu.iUserId AS freelanceId, concat(tu.vFirstName, " ",tu.vLastName) AS freelanceName, tu.vEmailAddress AS freelanceEmail, tu.vAddress1 AS freelanceAddress, tu.vProfilePic AS freelancePic, tu.iMobile AS freelancePhone, tsv.job_code AS jobCode, tmInvoice.invoice_number, tmInvoice.custom_invoice_no, tmInvoice.invoice_id, tmInvoice.invoice_date, tmInvoice.paid_date, tmInvoice.created_date, tmInvoice.invoice_status, tmInvoice.is_approved, tmInvoice.Invoice_cost, tmInvoice.paid_amount, tmInvoice.inv_due_date, tu.freelance_currency');
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

    public function convertDateFormat($date)
    {
        $dateParts = explode('.', $date);
        if (count($dateParts) === 3) {
            return $dateParts[2] . '-' . $dateParts[1] . '-' . $dateParts[0];
        }
        return $date; // Return the original date if format is incorrect
    }

    // If the linguist sends an email requesting payment. update flag 1
    public function linguistInvoiceRequestUpdate($post)
    {
        $response = [
            "status" => 200,
            "is_update" => 0,
            "msg" => 'Invoice marked as payment requested successfully.',
            'data' => []
        ];
        if (empty($post['id'])) {
            $response['status'] = 400;  
            $response['msg'] = 'Id does not exist';
            return $response;
        }
        try {
            $this->_db->where('invoice_id', $post['id'] );
            $currentStatus = $this->_db->getOne('tms_invoice', 'is_payment_requested_email');
            
            $upData['is_payment_requested_email'] = isset($currentStatus['is_payment_requested_email']) && $currentStatus['is_payment_requested_email'] == 0 ? 1 : 0;
            $upData['modified_date'] = date('Y-m-d H:i:s');
            $this->_db->where('invoice_id', $post['id']);
            $upSuccess = $this->_db->update('tms_invoice', $upData);
            if($upSuccess){
                $response['is_update'] = 1;    
            }
            $this->_db->where('invoice_id', $post['id'] );
            $data = $this->_db->getOne('tms_invoice', 'is_payment_requested_email');
            $response['data'] = $data;    
            
        } catch (Exception $e) {
            $response['status'] = 422;
            $response['msg'] = 'Something went wrong';
            $response['error_message'] = $e->getMessage();
        }
        return $response;

    }

}