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
function statusinvoiceReportFilter($post, $dbConn){

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
        1 => 'invoice_number',
        2 => 'clientCompanyName',
        3 => 'accounting_tripletex',
        4 => 'Invoice_cost',
        5 => 'client_currency',
        6 => 'invoice_date',
        7 => 'invoice_due_date',
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

    // Assuming $searchValue can contain a date in dd.mm.yyyy format
    $searchValueConverted = convertDateFormat($searchValue);

    // Apply search functionality
    if (!empty($searchValue)) {
        $qry_invc .= " AND (tmInvoice.invoice_number LIKE '%" . $searchValue . "%' 
                    OR tc.vUserName LIKE '%" . $searchValue . "%'
                    OR tc.accounting_tripletex LIKE '%" . $searchValue . "%'
                    OR tc.client_currency LIKE '%" . $searchValue . "%'
                    OR tmInvoice.Invoice_cost LIKE '%" . $searchValue . "%'
                    OR DATE(tmInvoice.invoice_due_date) LIKE '%" . $searchValueConverted . "%'
                    OR DATE(tmInvoice.paid_date) LIKE '%" . $searchValueConverted . "%'
                    OR DATE(tmInvoice.invoice_date) LIKE '%" . $searchValueConverted . "%'
                    OR tmInvoice.invoice_status LIKE '%" . $searchValue . "%'
                    )";
    }
    
    if(isset($filterParams['customer'])){
        $qry_invc .= " AND tmInvoice.customer_id = '" . $filterParams['customer'] . "'";
    }
    if (isset($filterParams['invoiceStatus'])) {
       
        if (in_array($filterParams['invoiceStatus'], ["Outstanding", "Open"])){
            $qry_invc .= " AND tmInvoice.invoice_status IN ('Open', 'Partly Paid')";
           
        } else if (in_array($filterParams['invoiceStatus'], ["Complete", "Completed", "Paid"])) {
            $qry_invc .= " AND tmInvoice.invoice_status IN ('Paid', 'Complete', 'Completed')";
        } else {
            $qry_invc .= " AND tmInvoice.invoice_status = '" . $filterParams['invoiceStatus'] . "'";
        }
    }
    
    if (isset($filterParams['invoiceNumber'])) {
        $qry_invc .= " AND tmInvoice.invoice_number LIKE '%" . $filterParams['invoiceNumber'] . "%'";
    }
    
    if (isset($filterParams['InvoicePrice'])) {
        $qry_invc .= " AND tmInvoice.Invoice_cost LIKE '%" . $filterParams['InvoicePrice'] . "%'";
    }
    
    if (isset($filterParams['currency'])) {
        $qry_invc .= " AND tc.client_currency LIKE '%" . $filterParams['currency'] . "%'";
    }
    
    if (isset($filterParams['itemDuedateStart']) && isset($filterParams['itemDuedateEnd'])) {
        $qry_invc .= " AND tmInvoice.invoice_due_date BETWEEN '" . $filterParams['itemDuedateStart'] . " 00:00:00' AND '" . $filterParams['itemDuedateEnd'] . " 00:00:00'";
    } else if (isset($filterParams['itemDuedateStart'])) {
        $qry_invc .= " AND tmInvoice.invoice_due_date > '" . $filterParams['itemDuedateStart'] . " 00:00:00'";
    } else if (isset($filterParams['itemDuedateEnd'])) {
        $qry_invc .= " AND tmInvoice.invoice_due_date < '" . $filterParams['itemDuedateEnd'] . " 00:00:00'";
    }
    
    if (isset($filterParams['createDateFrom']) && isset($filterParams['createDateTo'])) {
        $qry_invc .= " AND tmInvoice.invoice_date BETWEEN '" . $filterParams['createDateFrom'] . " 00:00:00' AND '" . $filterParams['createDateTo'] . " 00:00:00'";
    } else if (isset($filterParams['createDateFrom'])) {
        $qry_invc .= " AND tmInvoice.invoice_date > '" . $filterParams['createDateFrom'] . " 00:00:00'";
    } else if (isset($filterParams['createDateTo'])) {
        $qry_invc .= " AND tmInvoice.invoice_date < '" . $filterParams['createDateTo'] . " 00:00:00'";
    }

    $querydata = "SELECT 
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
        tu.vSignUpload, 
        tc.accounting_tripletex
    FROM 
        tms_invoice_client tmInvoice
    LEFT JOIN 
        tms_users tu ON tu.iUserId = tmInvoice.freelance_id
    LEFT JOIN 
        tms_client tc ON tc.iClientId = tmInvoice.customer_id
    WHERE 
        tmInvoice.is_deleted != '1'" . $qry_invc . " ORDER BY " . $orderColumn . " " . $orderDir . " LIMIT $start, $length";
    $data = $dbConn->query($querydata);
    
    $results = array();
    while ($val = $data->fetch_assoc()) {
        $results[] = $val;    
    }

    // Execute queries for totals
    $totalSumQuery = "SELECT SUM(DISTINCT tmInvoice.Invoice_cost) AS totalPrice FROM tms_invoice_client tmInvoice
    LEFT JOIN 
        tms_users tu ON tu.iUserId = tmInvoice.freelance_id
    LEFT JOIN 
        tms_client tc ON tc.iClientId = tmInvoice.customer_id
    WHERE tmInvoice.is_deleted != 1" . $qry_invc;

    $getTotalSumResult = $dbConn->query($totalSumQuery);
    $totalSumResult = [];
    while ($val = $getTotalSumResult->fetch_assoc()) {
        $totalSumResult[] = $val;    
    }

    $totalPrice = $totalSumResult[0]['totalPrice'] ?? 0;

    $totalRecordsQuery = "SELECT COUNT(DISTINCT tmInvoice.invoice_id) AS count FROM tms_invoice_client tmInvoice
    LEFT JOIN 
        tms_users tu ON tu.iUserId = tmInvoice.freelance_id
    LEFT JOIN 
        tms_client tc ON tc.iClientId = tmInvoice.customer_id
    WHERE tmInvoice.is_deleted != 1" . $qry_invc;

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
            "totalPrice" => $totalPrice
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

$fResults = statusinvoiceReportFilter($post , $dbConn);
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