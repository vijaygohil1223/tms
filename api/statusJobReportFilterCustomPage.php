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
function statusJobReportFilter($post, $dbConn){

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
        // 1 => 'invoice_id',
        2 => 'orderNum',
        3 => 'jobStatus',
        4 => 'contactPersonName',
        5 => 'resourceName',
        6 => 'customerName',
        7 => 'client_account_name',
        8 => 'ItemLanguage',
        9 => 'jobPrice',
        10 => 'job_due_date',
    ];

    // Determine the column to sort by based on DataTables order index
    $orderColumn = $columns[$orderColumnIndex] ?? 'ti.itemId';

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

    // Assuming $searchValue can contain a date in dd.mm.yyyy format
    $searchValueConverted = convertDateFormat($searchValue);

    // Apply search functionality
    if (!empty($searchValue)) {
        $qry_invc .= " AND (concat(tg.order_no,'_',tmv.job_code,tmv.job_no) LIKE '%" . $searchValue . "%' 
                    OR tmv.item_status LIKE '%" . $searchValue . "%'
                    OR CONCAT(tmu.vFirstName, ' ', tmu.vLastName) LIKE '%" . $searchValue . "%'
                    OR CONCAT(tu.vFirstName, ' ', tu.vLastName) LIKE '%" . $searchValue . "%'
                    OR tc.vUserName LIKE '%" . $searchValue . "%'
                    OR tcia.vUserName LIKE '%" . $searchValue . "%'
                    OR tmv.ItemLanguage LIKE '%" . $searchValue . "%'
                    OR tmv.total_price LIKE '%" . $searchValue . "%'
                    OR tmv.due_date LIKE '%" . $searchValueConverted . "%'
                    )";
                    
    }

    if (isset($filterParams['contactPerson'])) {
        $qry_invc .= " AND tmu.iUserId = '" . $filterParams['contactPerson'] . "'";
    }
    
    if (isset($filterParams['resource'])) {
        $qry_invc .= " AND tmv.resource = '" . $filterParams['resource'] . "'";
    }
    
    if (isset($filterParams['customer'])) {
        $qry_invc .= " AND tcu.client = '" . $filterParams['customer'] . "'";
    }

    if (isset($filterParams['account'])) {
        $qry_invc .= " AND tcu.indirect_customer = '" . $filterParams['account'] . "'";
    }
    
    if (isset($filterParams['projectType'])) {
        $qry_invc .= " AND ti.project_type = '" . $filterParams['projectType'] . "'";
    }
    
    if (isset($filterParams['jobStatus'])) {
        $qry_invc .= " AND tmv.item_status = '" . $filterParams['jobStatus'] . "'";
    }
    
    if (isset($filterParams['itemStatus'])) {
        $qry_invc .= " AND ti.item_status = '" . $filterParams['itemStatus'] . "'";
    }
    
    if (isset($filterParams['orderTypes'])) {
        $qry_invc .= " AND tu.iFkUserTypeId = '" . $filterParams['orderTypes'] . "'";
    }
    
    if (isset($filterParams['companyCode'])) {
        $qry_invc .= " AND tg.order_no LIKE '" . $filterParams['companyCode'] . "%'";
    }
    
    if (isset($filterParams['itemDuedateStart']) && isset($filterParams['itemDuedateEnd'])) {
        $Frm = $filterParams['itemDuedateStart'] . ' 00:00:00';
        $To = $filterParams['itemDuedateEnd'] . ' 00:00:00';
        $qry_invc .= " AND tmv.due_date BETWEEN '" . $Frm . "' AND '" . $To . "'";
    } else if (isset($filterParams['itemDuedateStart'])) {
        $Frm = $filterParams['itemDuedateStart'] . ' 00:00:00';
        $qry_invc .= " AND tmv.due_date > '" . $Frm . "'";
    } else if (isset($filterParams['itemDuedateEnd'])) {
        $To = $filterParams['itemDuedateEnd'] . ' 00:00:00';
        $qry_invc .= " AND tmv.due_date < '" . $To . "'";
    }
    
    if (isset($filterParams['createDateFrom']) && isset($filterParams['createDateTo'])) {
        $Frm = $filterParams['createDateFrom'] . ' 00:00:00';
        $To = $filterParams['createDateTo'] . ' 00:00:00';
        $qry_invc .= " AND tmv.created_date BETWEEN '" . $Frm . "' AND '" . $To . "'";
    } else if (isset($filterParams['createDateFrom'])) {
        $Frm = $filterParams['createDateFrom'] . ' 00:00:00';
        $qry_invc .= " AND tmv.created_date > '" . $Frm . "'";
    } else if (isset($filterParams['createDateTo'])) {
        $To = $filterParams['createDateTo'] . ' 00:00:00';
        $qry_invc .= " AND tmv.created_date < '" . $To . "'";
    }

    $joinTables = " INNER JOIN 
        tms_summmery_view tmv ON ti.order_id = tmv.order_id
    INNER JOIN 
        tms_customer tcu ON ti.order_id = tcu.order_id
    INNER JOIN 
        tms_client tc ON tcu.client = tc.iClientId
    INNER JOIN 
        tms_client_indirect tcia ON tcia.iClientId = tcu.indirect_customer
    INNER JOIN 
        tms_general tg ON ti.order_id = tg.order_id
    INNER JOIN 
        tms_users tu ON tmv.resource = tu.iUserId
    INNER JOIN 
        tms_users tmu ON tmv.contact_person = tmu.iUserId ";
    $querydata = "SELECT DISTINCT
        tmv.job_summmeryId, 
        tmv.ItemLanguage, 
        tmv.job_no AS jobNo,
        tmv.job_code AS jobCode,
        tmu.iUserId AS contactPerson,
        CONCAT(tmu.vFirstName, ' ', tmu.vLastName) AS contactPersonName, 
        tmv.resource AS resource, 
        CONCAT(tu.vFirstName, ' ', tu.vLastName) AS resourceName,
        tc.vUserName AS customerName,
        tmv.company_code AS companyCode,
        tcu.client AS customer,
        tu.vResourceType AS serviceGroup,
        tg.project_type AS projectType,
        tmv.item_status AS jobStatus,
        tmv.due_date AS job_due_date,
        ti.item_status AS itemStatus,
        tu.iFkUserTypeId AS orderTypes,
        tg.order_no AS orderNum,
        tmv.job_summmeryId AS jobId,
        tu.iFkUserTypeId AS ifkuserId,
        tmv.po_number AS poNumber,
        tmv.total_price AS jobPrice,
        tcia.vUserName AS client_account_name
    FROM 
        tms_items ti
    $joinTables
    WHERE 
        1=1 " . $qry_invc . " 
    GROUP BY 
        tmv.job_summmeryId 
    ORDER BY " . $orderColumn . " " . $orderDir . " 
    LIMIT $start, $length";

    $data = $dbConn->query($querydata);
    
    $results = array();
    while ($val = $data->fetch_assoc()) {
        $results[] = $val;    
    }

    $totalRecordsQuery = "SELECT COUNT(DISTINCT tmv.job_summmeryId) AS count 
    FROM 
        tms_items ti
    $joinTables
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

$fResults = statusJobReportFilter($post , $dbConn);
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