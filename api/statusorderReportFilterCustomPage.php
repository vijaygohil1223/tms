<?php

require __DIR__ . '/includes/config.php';

try {
//Define your host here.
$HostName = DB_SERVER;
//Define your database name here.
$DatabaseName = DB_DATABASE;
//Define your database username here.
$HostUser = DB_USERNAME;
//Define your database password here.
$HostPass = DB_PASSWORD;
// Creating connection.
$dbConn = new MySQLi($HostName, $HostUser, $HostPass, $DatabaseName);

$post = json_decode(file_get_contents('php://input'), true);
function statusorderReportFilterCustomPage($post, $dbConn){

    // Get search, order, pagination parameters from the request
    $searchValue = $post['search'] ?? ''; // Search value
    $orderColumnIndex = $post['order'][0]['column'] ?? 1; // Index of the column to sort
    $orderDir = $post['order'][0]['dir'] ?? 'asc'; // Order direction (asc or desc)
    $start = $post['start'] ?? 0; // Starting point for pagination
    $length = $post['length'] ?? 20; // Number of records to fetch
    $filterParams = $post['filterParams'] ?? '';
    // Define the columns array corresponding to DataTables columns
    $columns = [
        // 0 => 'invoice_id',
        1 => 'orderNumber',
        2 => 'scoopName',
        3 => 'emailSubject',
        4 => 'contactName',
        5 => 'indirectAccountName',
        6 => 'scoop_status_name',
        7 => 'po_number',
        8 => 'scoopCreateDate',
        9 => 'scoop_due_date',
        10 => 'totalAmount',
        11 => 'total_job_price',
        // 12=>
        // 13=>
    ];

    // Determine the column to sort by based on DataTables order index
    $orderColumn = $columns[$orderColumnIndex] ?? 'its.itemId';

    // Ensure the order direction is valid
    $orderDir = strtolower($orderDir) === 'desc' ? 'DESC' : 'ASC';
    
    function customNumberFormat($input) {
        $decimalSeparator = isset($_COOKIE['DecimalSeparator']) ? $_COOKIE['DecimalSeparator'] : ',';
            $numStr = (string)$input;
            $number = str_replace('.', $decimalSeparator, $numStr);
            $number = str_replace(',', '.', $numStr); 
        
            return $number;
        }


    $searchValueNum = customNumberFormat($searchValue);
    // $formattedSearchValue = $searchValue;
    // Base query
    $qry_invc = '';
    // Apply search functionality
    if (!empty($searchValue)) {
        $decimalSeparator = '.';
        $qry_invc .= " AND (CONCAT(gen.order_no, '-', LPAD(its.item_number, 3, '0')) LIKE '%" . $searchValue . "%' 
                    OR its.item_name LIKE '%" . $searchValue . "%'
                    OR its.item_email_subject LIKE '%" . $searchValue . "%'
                    OR c.vUserName LIKE '%" . $searchValue . "%'
                    OR inc.vUserName LIKE '%" . $searchValue . "%'
                    OR scs.item_status_name LIKE '%" . $searchValue . "%'
                    OR its.po_number LIKE '%" . $searchValue . "%'
                    OR DATE_FORMAT(its.created_date, '%d.%m.%Y | %H:%i') LIKE '%" . $searchValue . "%'
                    OR DATE_FORMAT(its.due_date, '%d.%m.%Y | %H:%i') LIKE '%" . $searchValue . "%'
                    OR FORMAT(its.total_amount, 2) LIKE '%" . $searchValueNum . "%'
                    OR FORMAT(COALESCE(tsv.total_job_price, 0), 2) LIKE '%" . $searchValueNum . "%'
                    OR FORMAT(its.total_amount - COALESCE(tsv.total_job_price, 0), 2) LIKE '%" . $searchValueNum . "%'
                    OR IFNULL(SUBSTRING_INDEX(c.client_currency, ',', 1), 'EUR') LIKE '%" . $searchValue . "%'
                    
                    )";

    }

    if (isset($filterParams['pm_name'])) {
        $pmId = $filterParams['pm_name'];
        $qry_invc .= " AND (cust.project_manager = '" . $pmId . "' OR cust.sub_pm = '" . $pmId . "' OR its.manager = '" . $pmId . "' OR its.subPm = '" . $pmId . "')";
    }

    if (isset($filterParams['pm_name_exclude'])) {
        $pmIdExclude = $filterParams['pm_name_exclude'];
        $qry_invc .= " AND (cust.project_manager != '" . $pmIdExclude . "' AND cust.sub_pm != '" . $pmIdExclude . "' AND its.manager != '" . $pmIdExclude . "' AND its.subPm != '" . $pmIdExclude . "')";
    }

    if (isset($filterParams['emailSubject'])) {
        $qry_invc .= " AND its.item_email_subject LIKE '%" . $filterParams['emailSubject'] . "%'";
    }

    if (isset($filterParams['itemPonumber'])) {
        $qry_invc .= " AND its.po_number = '" . $filterParams['itemPonumber'] . "'";
    }

    if (isset($filterParams['customer'])) {
        $qry_invc .= " AND cust.client = '" . $filterParams['customer'] . "'";
    }

    if (isset($filterParams['contactPerson'])) {
        $qry_invc .= " AND cust.contact = '" . $filterParams['contactPerson'] . "'";
    }

    if (isset($filterParams['indirect_customer'])) {
        $qry_invc .= " AND inc.iClientId = '" . $filterParams['indirect_customer'] . "'";
    }

    if (isset($filterParams['itemStatus'])) {
        $qry_invc .= " AND its.item_status IN ('" . implode("','", explode(",", $filterParams['itemStatus'])) . "')";
    }

    if (isset($filterParams['projectStatus'])) {
        $qry_invc .= " AND gen.project_status = '" . $filterParams['projectStatus'] . "'";
    }

    if (isset($filterParams['projectType'])) {
        $qry_invc .= " AND its.project_type LIKE '%" . $filterParams['projectType'] . "%'";
    }

    if (isset($filterParams['sourceLanguage'])) {
        $qry_invc .= " AND its.source_lang LIKE '%\"sourceLang\":\"" . $filterParams['sourceLanguage'] . "\"%'";
    }

    if (isset($filterParams['targetLanguage'])) {
        $qry_invc .= " AND its.target_lang LIKE '%\"sourceLang\":\"" . $filterParams['targetLanguage'] . "\"%'";
    }

    if (isset($filterParams['companyCode'])) {
        $qry_invc .= " AND gen.order_no LIKE '" . $filterParams['companyCode'] . "%'";
    }

    if (isset($filterParams['itemDuedateStart']) && isset($filterParams['itemDuedateEnd'])) {
        $Frm = $filterParams['itemDuedateStart'] . ' 00:00:00';
        $To = $filterParams['itemDuedateEnd'] . ' 00:00:00';
        $qry_invc .= " AND DATE(its.due_date) BETWEEN '" . $Frm . "' AND '" . $To . "'";
    } else if (isset($filterParams['itemDuedateStart'])) {
        $Frm = $filterParams['itemDuedateStart'] . ' 00:00:00';
        $qry_invc .= " AND its.due_date > '" . $Frm . "'";
    } else if (isset($filterParams['itemDuedateEnd'])) {
        $To = $filterParams['itemDuedateEnd'] . ' 00:00:00';
        $qry_invc .= " AND its.due_date < '" . $To . "'";
    }

    if (isset($filterParams['createDateFrom']) && isset($filterParams['createDateTo'])) {
        $Frm = $filterParams['createDateFrom'] . ' 00:00:00';
        $To = $filterParams['createDateTo'] . ' 00:00:00';
        $qry_invc .= " AND DATE(its.created_date) BETWEEN '" . $Frm . "' AND '" . $To . "'";
    } else if (isset($filterParams['createDateFrom'])) {
        $Frm = $filterParams['createDateFrom'] . ' 00:00:00';
        $qry_invc .= " AND its.created_date > '" . $Frm . "'";
    } else if (isset($filterParams['createDateTo'])) {
        $To = $filterParams['createDateTo'] . ' 00:00:00';
        $qry_invc .= " AND its.created_date < '" . $To . "'";
    }
    
    
    // Start building the base query
    $subQuery = "(SELECT order_id, item_id, SUM(total_price) AS total_job_price 
              FROM tms_summmery_view 
              GROUP BY order_id, item_id)";

    $querydata = "SELECT 
            gen.order_no AS orderNumber, 
            gen.due_date AS DueDate, 
            gen.order_id AS orderId, 
            cust.created_date AS orderDate, 
            cust.client AS customer, 
            gen.project_name AS projectName, 
            c.vUserName AS contactName, 
            its.total_amount AS totalAmount,
            (its.total_amount/its.base_currency_rate) AS totalAmountEUR,
            c.iClientId, 
            stus.status_name AS clientStatus, 
            gen.company_code AS companyCode, 
            cust.contact AS contactPerson, 
            cust.indirect_customer, 
            its.item_number, 
            its.item_status AS itemStatus, 
            scs.item_status_name as scoop_status_name, 
            its.po_number AS itemPonumber, 
            its.item_email_subject AS emailSubject, 
            its.project_type AS projectType, 
            DATE_FORMAT(its.due_date, '%d.%m.%Y') AS itemDuedate, 
            DATE_FORMAT(its.start_date, '%d.%m.%Y') AS itemCreatedDate, 
            its.created_date AS scoopCreateDate, 
            its.item_name AS scoopName, 
            inc.vUserName as indirectAccountName, 
            its.due_date AS scoop_due_date, 
            its.source_lang AS sourceLanguage, 
            its.target_lang AS targetLanguage, 
            gen.project_status AS projectStatus, 
            COALESCE(tsv.total_job_price, 0) AS total_job_price, 
            (COALESCE(tsv.total_job_price, 0)/its.base_currency_rate) AS total_job_priceEUR,
            its.itemId AS scoopId, 
            its.po_number,
            c.client_currency,
            its.q_date AS QuentityDate,
            tpt.project_name AS projectTypeName,
            concat(tu.vFirstName, ' ', tu.vLastName) AS pm_name, 
            c.accounting_tripletex 
        FROM 
            tms_items its
        LEFT JOIN 
            tms_general gen ON its.order_id = gen.order_id
        LEFT JOIN 
            tms_customer cust ON its.order_id = cust.order_id
        LEFT JOIN 
            tms_client c ON cust.client = c.iClientId
        LEFT JOIN 
            tms_user_status stus ON c.vStatus = stus.status_id
        LEFT JOIN 
            tms_client_indirect inc ON inc.iClientId = cust.indirect_customer
        LEFT JOIN 
            tms_users tu ON tu.iUserId = cust.project_manager
        LEFT JOIN 
            tms_project_type tpt ON its.project_type = tpt.pr_type_id
        LEFT JOIN 
            tms_project_status ps ON ps.pr_status_id = gen.project_status
        LEFT JOIN 
            tms_item_status scs ON scs.item_status_id = its.item_status
        LEFT JOIN 
            ($subQuery) tsv ON tsv.order_id = its.order_id AND tsv.item_id = its.item_number
        WHERE 1=1 " . $qry_invc. "
        GROUP BY its.itemId
        ORDER BY " . $orderColumn . " " . $orderDir;
    
    $querydata1 = $querydata . " LIMIT $start, $length";

    $data = $dbConn->query($querydata1);
    
    $results = array();
    while ($val = $data->fetch_assoc()) {
        $results[] = $val;    
    }

    $qry = "SELECT gen.order_no AS orderNumber,gen.order_id AS orderId, cust.created_date AS orderDate, cust.client AS customer,gen.project_name AS projectName, c.vUserName AS contactName,stus.status_name AS clientStatus,gen.company_code AS companyCode,cust.contact AS contactPerson,its.item_status AS itemStatus,gen.project_status AS projectStatus,gen.project_type AS projectType,its.source_lang AS sourceLanguage,its.target_lang AS targetLanguage, its.q_date AS QuentityDate ,SUM(its.total_amount) As TotalAmount FROM tms_items its LEFT JOIN tms_general gen ON its.order_id = gen.order_id LEFT JOIN tms_customer cust ON its.order_id = cust.order_id LEFT JOIN tms_client c ON cust.client = c.iClientId LEFT JOIN tms_user_status stus ON c.vStatus = stus.status_id LEFT JOIN tms_client_indirect inc ON inc.iClientId = cust.indirect_customer LEFT JOIN tms_users tu ON tu.iUserId = cust.project_manager LEFT JOIN tms_project_status ps ON ps.pr_status_id = gen.project_status group by its.q_date";
    $info1 = $dbConn->query($qry);
    $info = array();
    while ($val = $info1->fetch_assoc()) {
        $info[] = $val;    
    }
    
    $qry1 = "SELECT gen.order_no AS orderNumber,gen.project_type,gen.order_id AS orderId,tpt.project_name AS projectTypeName, cust.created_date AS orderDate, cust.client AS customer,gen.project_name AS projectName, c.vUserName AS contactName,stus.status_name AS clientStatus,gen.company_code AS companyCode,cust.contact AS contactPerson,its.item_status AS itemStatus,gen.project_status AS projectStatus,gen.project_type AS projectType,its.source_lang AS sourceLanguage,its.target_lang AS targetLanguage, its.q_date AS QuentityDate ,SUM(its.total_amount) As TotalAmount FROM tms_general AS gen LEFT JOIN tms_customer AS cust ON gen.order_id=cust.order_id LEFT JOIN tms_items AS its ON gen.order_id=its.order_id LEFT JOIN tms_client AS c ON cust.client = c.iClientId LEFT JOIN tms_user_status AS stus ON c.vStatus = stus.status_id LEFT JOIN tms_project_type AS tpt ON gen.project_type = tpt.pr_type_id group by gen.project_type";
    $Typeinfo1 = $dbConn->query($qry1);
    $Typeinfo = array();
    while ($val = $Typeinfo1->fetch_assoc()) {
        $Typeinfo[] = $val;    
    }

    $qry2 = "SELECT gen.order_no AS orderNumber,gen.order_id AS orderId,tpt.project_name AS projectTypeName, cust.created_date AS orderDate, cust.client AS customer,gen.project_name AS projectName, c.vUserName AS contactName,stus.status_name AS clientStatus,gen.company_code AS companyCode,cust.contact AS contactPerson,its.item_status AS itemStatus,gen.project_status AS projectStatus,gen.project_type AS projectType,its.source_lang AS sourceLanguage,its.target_lang AS targetLanguage, its.q_date AS QuentityDate ,SUM(its.total_amount) As TotalAmount FROM tms_general AS gen LEFT JOIN tms_customer AS cust ON gen.order_id=cust.order_id LEFT JOIN tms_items AS its ON gen.order_id=its.order_id LEFT JOIN tms_client AS c ON cust.client = c.iClientId LEFT JOIN tms_user_status AS stus ON c.vStatus = stus.status_id LEFT JOIN tms_project_type AS tpt ON gen.project_type = tpt.pr_type_id group by c.iClientId";
    $customerType1 = $dbConn->query($qry2);
    $customerType = array();
    while ($val = $customerType1->fetch_assoc()) {
        $customerType[] = $val;    
    } 		

    $qry3 = "SELECT gen.heads_up, gen.order_no AS orderNumber, gen.due_date AS DueDate, gen.order_id AS orderId, cust.created_date AS orderDate, cust.client AS customer, gen.project_name AS projectName, c.vUserName AS contactName, stus.status_name AS clientStatus, c.vlogo AS clientlogo, c.tPoInfo AS ponumber, gen.company_code AS companyCode, gen.project_price, gen.expected_start_date, cust.contact AS contactPerson,its.item_number, its.item_status AS itemStatus, its.po_number AS itemPonumber, its.start_date AS itemStartdate, its.due_date AS itemDuedate,its.source_lang AS itemsSourceLang, its.target_lang AS itemsTargetLang, gen.project_status AS projectStatus, gen.project_type AS projectType, its.total_amount AS totalAmount, inc.vUserName AS accountname, concat(tu.vFirstName, ' ', tu.vLastName) AS pm_name, cust.project_coordinator AS project_coordinator_id, cust.project_manager AS project_manager_id, cust.QA_specialist AS qa_specialist_id, ps.project_status_name AS projectstatus_name, ps.status_color AS projectstatus_color, its.q_date AS QuentityDate, SUM(its.total_amount) As TotalAmount FROM tms_items AS its LEFT JOIN tms_general AS gen ON its.order_id = gen.order_id LEFT JOIN tms_customer AS cust ON its.order_id = cust.order_id LEFT JOIN tms_client AS c ON cust.client = c.iClientId LEFT JOIN tms_user_status AS stus ON c.vStatus = stus.status_id LEFT JOIN tms_client_indirect AS inc ON inc.iClientId = cust.indirect_customer LEFT JOIN tms_users AS tu ON tu.iUserId = cust.project_manager LEFT JOIN tms_project_status AS ps ON ps.pr_status_id = gen.project_status group by its.q_date";
    $projectScoopInfo1 = $dbConn->query($qry3);
    $projectScoopInfo = array();
    while ($val = $projectScoopInfo1->fetch_assoc()) {
        $projectScoopInfo[] = $val;    
    } 	

    $totalAmount = "SELECT
        SUM(its.total_amount) AS totalPrice,
        SUM(its.total_amount / its.base_currency_rate) AS totalPriceEUR,
        SUM(COALESCE(tsv.total_job_price, 0)) AS jobExpenseReportTotal,
        SUM(COALESCE(tsv.total_job_price, 0) / its.base_currency_rate) AS jobExpenseReportTotalEUR,
        SUM(its.total_amount - COALESCE(tsv.total_job_price, 0)) AS totalDifference,
        SUM(
            (its.total_amount / its.base_currency_rate) - COALESCE(tsv.total_job_price, 0) / its.base_currency_rate
        ) AS totalDifferenceEUR
    FROM (
        SELECT DISTINCT its.*
        FROM tms_items its
        LEFT JOIN tms_general gen ON its.order_id = gen.order_id
        LEFT JOIN tms_customer cust ON its.order_id = cust.order_id
        LEFT JOIN tms_client c ON cust.client = c.iClientId
        LEFT JOIN tms_user_status stus ON c.vStatus = stus.status_id
        LEFT JOIN tms_client_indirect inc ON inc.iClientId = cust.indirect_customer
        LEFT JOIN tms_users tu ON tu.iUserId = cust.project_manager
        LEFT JOIN tms_project_type tpt ON its.project_type = tpt.pr_type_id
        LEFT JOIN tms_project_status ps ON ps.pr_status_id = gen.project_status
        LEFT JOIN (
            SELECT order_id, item_id, SUM(total_price) AS total_job_price
            FROM tms_summmery_view
            GROUP BY order_id, item_id
        ) tsv ON tsv.order_id = its.order_id AND tsv.item_id = its.item_number
        WHERE 1=1 $qry_invc
    ) its
    LEFT JOIN ($subQuery) tsv ON tsv.order_id = its.order_id AND tsv.item_id = its.item_number";

    $totalAmount__ = "SELECT 
    SUM(its.total_amount) AS totalPrice, 
    SUM(its.total_amount/its.base_currency_rate) AS totalPriceEUR,
    SUM(COALESCE(tsv.total_job_price, 0)) AS jobExpenseReportTotal,
    SUM(COALESCE(tsv.total_job_price, 0)/its.base_currency_rate) AS jobExpenseReportTotalEUR,
    SUM(its.total_amount - COALESCE(tsv.total_job_price, 0)) AS totalDifference,
    SUM((its.total_amount/its.base_currency_rate) - COALESCE(tsv.total_job_price, 0)/its.base_currency_rate) AS totalDifferenceEUR
    FROM 
        tms_items its
    LEFT JOIN 
        tms_general gen ON its.order_id = gen.order_id
    LEFT JOIN 
        tms_customer cust ON its.order_id = cust.order_id
    LEFT JOIN 
        tms_client c ON cust.client = c.iClientId
    LEFT JOIN 
        tms_user_status stus ON c.vStatus = stus.status_id
    LEFT JOIN 
        tms_client_indirect inc ON inc.iClientId = cust.indirect_customer
    LEFT JOIN 
        tms_users tu ON tu.iUserId = cust.project_manager
    LEFT JOIN 
        tms_project_type tpt ON its.project_type = tpt.pr_type_id
    LEFT JOIN 
        tms_project_status ps ON ps.pr_status_id = gen.project_status
    LEFT JOIN 
        tms_item_status scs ON scs.item_status_id = its.item_status
    LEFT JOIN 
        ($subQuery) tsv ON tsv.order_id = its.order_id AND tsv.item_id = its.item_number
    WHERE 1=1 " . $qry_invc;

    $getTotalRecordsQuery = $dbConn->query($totalAmount);
    
    $totalRecordsResult = [];
    while ($val = $getTotalRecordsQuery->fetch_assoc()) {
        $totalRecordsResult[] = $val;    
    }
    $totalRecords = $totalRecordsResult[0]['totalPriceEUR'] ?? 0;
    $jobExpenseReportTotal = $totalRecordsResult[0]['jobExpenseReportTotalEUR'] ?? 0;
    $totalDifference = $totalRecordsResult[0]['totalDifferenceEUR'] ?? 0;

    $alldataQuery = $dbConn->query($querydata);
    
    $alldata = array();
    while ($val = $alldataQuery->fetch_assoc()) {
        $alldata[] = $val;    
    }

    $results['data'] = $results;
    $results['alldata'] = $alldata;
    $results['totalAmount'] = $totalRecords;
    $results['jobExpenseReportTotal'] = $jobExpenseReportTotal;
    $results['totalDifference'] = $totalDifference;
    $results['info'] = $info;
    $results['Typeinfo'] = $Typeinfo;
    $results['customerType'] = $customerType;
    $results['projectScoopInfo'] = $projectScoopInfo;

    

    $totalRecordsQuery = "SELECT COUNT(DISTINCT its.itemId) AS count 
    FROM 
        tms_items its
    LEFT JOIN 
        tms_general gen ON its.order_id = gen.order_id
    LEFT JOIN 
        tms_customer cust ON its.order_id = cust.order_id
    LEFT JOIN 
        tms_client c ON cust.client = c.iClientId
    LEFT JOIN 
        tms_user_status stus ON c.vStatus = stus.status_id
    LEFT JOIN 
        tms_client_indirect inc ON inc.iClientId = cust.indirect_customer
    LEFT JOIN 
        tms_users tu ON tu.iUserId = cust.project_manager
    LEFT JOIN 
        tms_project_type tpt ON its.project_type = tpt.pr_type_id
    LEFT JOIN 
        tms_project_status ps ON ps.pr_status_id = gen.project_status
    LEFT JOIN 
        tms_item_status scs ON scs.item_status_id = its.item_status
    LEFT JOIN 
        ($subQuery) tsv ON tsv.order_id = its.order_id AND tsv.item_id = its.item_number
    WHERE 1=1 " . $qry_invc;

    $getTotalRecordsQuery = $dbConn->query($totalRecordsQuery);
    $totalRecordsResult = [];
    while ($val = $getTotalRecordsQuery->fetch_assoc()) {
        $totalRecordsResult[] = $val;    
    }

    $totalRecords = $totalRecordsResult[0]['count'] ?? 0;

    $getfilteredRecordsResult = $dbConn->query($totalRecordsQuery);
    $filteredRecordsResult = [];
    while ($val = $getfilteredRecordsResult->fetch_assoc()) {
        $filteredRecordsResult[] = $val;    
    }

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
            "data" => $results,
        ];
    }

    // Return the response
    return $response;


}

function convertToUtf8($data) {
    if (is_array($data)) {
        foreach ($data as &$value) {
            $value = convertToUtf8($value);
        }
    } elseif (is_string($data)) {
        // Convert string to UTF-8
        $data = mb_convert_encoding($data, 'UTF-8', mb_detect_encoding($data, 'UTF-8, ISO-8859-1', true));
    }
    return $data;
}

$fResults = statusorderReportFilterCustomPage($post , $dbConn);
$fResults = convertToUtf8($fResults);

http_response_code(200);

 // Ensure the result is in the correct format
 if (!isset($fResults['data'])) {
    $fResults = [
        'draw' => 0,
        'recordsTotal' => 0,
        'recordsFiltered' => 0,
        'data' => []
    ];
}

// Convert the result to JSON format
$jsonResponse = json_encode($fResults);

// Check for JSON encoding errors
if ($jsonResponse === false) {
    $jsonResponse = json_encode(['error' => json_last_error_msg()]);
}

// Convert the result to JSON format
$jsonResponse = json_encode($fResults);

// Set the Content-Type header to application/json
header('Content-Type: application/json');

// Output the JSON response
echo $jsonResponse;
} catch (Exception $e) {
    // Handle other exceptions
    echo "Caught exception: " . $e->getMessage();
}