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

    function linguistInvoiceCustomPage($post, $dbConn)
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
            $qry_invc .= " AND (concat(tu.vFirstName, ' ', tu.vLastName) LIKE '%" . $searchValue . "%' 
                    OR tu.vFirstName LIKE '%" . $searchValue . "%'
                    OR tu.vLastName LIKE '%" . $searchValue . "%'
                    OR CAST(tmInvoice.invoice_number AS CHAR) LIKE '%" . $searchValue . "%'
                    OR tc.client_currency LIKE '%" . $searchValue . "%'
                    OR tmInvoice.Invoice_cost LIKE '%" . $searchValue . "%'
                    OR tmInvoice.invoice_number LIKE '%" . $searchValue . "%'
                    OR DATE(tmInvoice.inv_due_date) LIKE '%" . $searchValueConverted . "%'
                    OR DATE(tmInvoice.invoice_date) LIKE '%" . $searchValueConverted . "%'
                    OR tmInvoice.invoice_status LIKE '%" . $searchValueConverted . "%'
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
                        AND DATE(tmInvoice.inv_due_date) < '" . $today . "' 
                        AND tmInvoice.invoice_status NOT IN ('Paid', 'Complete', 'Completed')";
            } elseif ($filterParams['invoiceStatus'] === "Approved") {
                $qry_invc .= " AND (tmInvoice.is_approved = 1 OR tmInvoice.invoice_status = 'Approved') 
                        AND tmInvoice.invoice_status NOT IN ('Complete', 'Completed', 'Partly Paid', 'Paid')";
            } else {
                $qry_invc .= " AND tmInvoice.invoice_status = '" . $filterParams['invoiceStatus'] . "'";
            }
        }

        if (isset($filterParams['freelanceName'])) {
            $qry_invc .= " AND tu.iUserid = '" . $filterParams['freelanceName'] . "'";
        }

        if (isset($filterParams['itemDuedateStart']) && isset($filterParams['itemDuedateEnd'])) {
            $qry_invc .= " AND tmInvoice.inv_due_date BETWEEN '" . $filterParams['itemDuedateStart'] . ' 00:00:00' . "' 
                    AND '" . $filterParams['itemDuedateEnd'] . ' 23:59:59' . "'";
        } elseif (isset($filterParams['itemDuedateStart'])) {
            $qry_invc .= " AND tmInvoice.inv_due_date >= '" . $filterParams['itemDuedateStart'] . ' 00:00:00' . "'";
        } elseif (isset($filterParams['itemDuedateEnd'])) {
            $qry_invc .= " AND tmInvoice.inv_due_date <= '" . $filterParams['itemDuedateEnd'] . ' 23:59:59' . "'";
        }

        if (isset($filterParams['createDateFrom']) && isset($filterParams['createDateTo'])) {
            $qry_invc .= " AND tmInvoice.invoice_date BETWEEN '" . $filterParams['createDateFrom'] . ' 00:00:00' . "' 
                    AND '" . $filterParams['createDateTo'] . ' 23:59:59' . "'";
        } elseif (isset($filterParams['createDateFrom'])) {
            $qry_invc .= " AND tmInvoice.invoice_date >= '" . $filterParams['createDateFrom'] . ' 00:00:00' . "'";
        } elseif (isset($filterParams['createDateTo'])) {
            $qry_invc .= " AND tmInvoice.invoice_date <= '" . $filterParams['createDateTo'] . ' 23:59:59' . "'";
        }

        if (isset($filterParams['paymentDateFrom']) && isset($filterParams['paymentDateTo'])) {
            $qry_invc .= " AND tmInvoice.paid_date BETWEEN '" . $filterParams['paymentDateFrom'] . ' 00:00:00' . "' 
                    AND '" . $filterParams['paymentDateTo'] . ' 23:59:59' . "'";
        } elseif (isset($filterParams['paymentDateFrom'])) {
            $qry_invc .= " AND tmInvoice.paid_date >= '" . $filterParams['paymentDateFrom'] . ' 00:00:00' . "'";
        } elseif (isset($filterParams['paymentDateTo'])) {
            $qry_invc .= " AND tmInvoice.paid_date <= '" . $filterParams['paymentDateTo'] . ' 23:59:59' . "'";
        }


        // Base query for data
        $querydata = "SELECT DISTINCT tsv.job_summmeryId AS jobId, tsv.order_id AS orderId, tsv.po_number AS poNumber, 
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
    WHERE tmInvoice.is_deleted != 1" . $qry_invc . " ORDER BY " . $orderColumn . " " . $orderDir . " LIMIT $start, $length";

        $data = $dbConn->query($querydata);
        $results = array();
        while ($val = $data->fetch_assoc()) {
            $results[] = $val;
        }


        // Execute queries for totals
        $totalSumQuery = "SELECT SUM(DISTINCT tmInvoice.Invoice_cost) AS totalPrice FROM tms_invoice tmInvoice
    LEFT JOIN tms_users tu ON tu.iUserId = tmInvoice.freelance_id
    LEFT JOIN tms_client tc ON tc.iClientId = tmInvoice.customer_id
    LEFT JOIN tms_summmery_view tsv ON tsv.job_summmeryId = tmInvoice.job_id
    LEFT JOIN tms_payment tpy ON tpy.iUserId = tu.iUserId AND tpy.iType = 1
    WHERE tmInvoice.is_deleted != 1" . $qry_invc;

        $getTotalSumResult = $dbConn->query($totalSumQuery);
        $totalSumResult = [];
        while ($val = $getTotalSumResult->fetch_assoc()) {
            $totalSumResult[] = $val;
        }

        $totalPrice = $totalSumResult[0]['totalPrice'] ?? 0;

        $totalRecordsQuery = "SELECT COUNT(DISTINCT tmInvoice.invoice_id) AS count FROM tms_invoice tmInvoice
    LEFT JOIN tms_users tu ON tu.iUserId = tmInvoice.freelance_id
    LEFT JOIN tms_client tc ON tc.iClientId = tmInvoice.customer_id
    LEFT JOIN tms_summmery_view tsv ON tsv.job_summmeryId = tmInvoice.job_id
    LEFT JOIN tms_payment tpy ON tpy.iUserId = tu.iUserId AND tpy.iType = 1
    WHERE tmInvoice.is_deleted != 1" . $qry_invc;

        $getTotalRecordsQuery = $dbConn->query($totalRecordsQuery);
        $totalRecordsResult = [];
        while ($val = $getTotalRecordsQuery->fetch_assoc()) {
            $totalRecordsResult[] = $val;
        }

        $totalRecords = $totalRecordsResult[0]['count'] ?? 0;

        $filteredRecordsQuery = "SELECT COUNT(DISTINCT tmInvoice.invoice_id) AS count FROM tms_invoice tmInvoice
    LEFT JOIN tms_users tu ON tu.iUserId = tmInvoice.freelance_id
    LEFT JOIN tms_client tc ON tc.iClientId = tmInvoice.customer_id
    LEFT JOIN tms_summmery_view tsv ON tsv.job_summmeryId = tmInvoice.job_id
    LEFT JOIN tms_payment tpy ON tpy.iUserId = tu.iUserId AND tpy.iType = 1
    WHERE tmInvoice.is_deleted != 1" . $qry_invc;

        $getfilteredRecordsResult = $dbConn->query($filteredRecordsQuery);
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

    http_response_code(200);

    // Function to convert data to UTF-8 encoding
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

    // Fetch the results from your function
    $fResults = linguistInvoiceCustomPage($post, $dbConn);

    // Convert all data to UTF-8
    $fResults = convertToUtf8($fResults);

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

    // Set the Content-Type header to application/json
    header('Content-Type: application/json');

    // Output the JSON response
    echo $jsonResponse;
    exit;

} catch (Exception $e) {
    // Handle other exceptions
    echo "Caught exception: " . $e->getMessage();
}