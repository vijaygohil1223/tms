<?php



require_once 'users.class.php';

require_once 'client.class.php';

require_once 'tasktype.class.php';



class jobstatussearch {

	//price1 data manage

	    public function __construct() {

	        $this->_db = db::getInstance();

	    }



	    public function statusJobReportFind(){

    		$qry = "SELECT tmv.ItemLanguage,tmv.job_no AS jobNo,tmv.job_code AS jobCode,tmu.iUserId AS contactPerson,tmu.vUserName AS contactPersonName, tmv.resource AS resource, concat(tu.vFirstName, ' ', tu.vLastName) As resourceName,tc.vUserName AS customerName,tmv.company_code AS companyCode,tcu.client AS customer,tu.vResourceType AS serviceGroup,tg.project_type AS projectType,tmv.item_status AS jobStatus,ti.item_status AS itemStatus,tu.iFkUserTypeId AS orderTypes,tg.order_no AS orderNum,tmv.job_summmeryId AS jobId,tu.iFkUserTypeId AS ifkuserId, tmv.po_number AS poNumber, tmv.total_price as jobPrice FROM tms_items AS ti INNER JOIN tms_summmery_view AS tmv ON ti.order_id = tmv.order_id INNER JOIN tms_customer AS tcu ON ti.order_id = tcu.order_id INNER JOIN tms_client AS tc ON tcu.client = tc.iClientId INNER JOIN tms_general AS tg ON ti.order_id = tg.order_id INNER JOIN tms_users AS tu ON tmv.resource = tu.iUserId INNER JOIN tms_users AS tmu ON tmv.contact_person = tmu.iUserId group by tmv.job_summmeryId";

	    	$data = $this->_db->rawQuery($qry);

	    	return $data;

	    }

			   
		public function statusJobReportFilter($filterParams){ 

    		// $qry = "SELECT tmv.ItemLanguage,tmv.job_no AS jobNo,tmv.job_code AS jobCode,tmu.iUserId AS contactPerson,tmu.vUserName AS contactPersonName, tmv.resource AS resource, tu.vUserName As resourceName,tc.vUserName AS customerName,tmv.company_code AS companyCode,tcu.client AS customer,tu.vResourceType AS serviceGroup,tg.project_type AS projectType,tmv.item_status AS jobStatus,ti.item_status AS itemStatus,tu.iFkUserTypeId AS orderTypes,tg.order_no AS orderNum,tmv.job_summmeryId AS jobId,tu.iFkUserTypeId AS ifkuserId, tmv.po_number AS poNumber, tmv.total_price as jobPrice 
			// FROM tms_items AS ti 
			// INNER JOIN tms_summmery_view AS tmv ON ti.order_id = tmv.order_id 
			// INNER JOIN tms_customer AS tcu ON ti.order_id = tcu.order_id 
			// INNER JOIN tms_client AS tc ON tcu.client = tc.iClientId
			// INNER JOIN tms_general AS tg ON ti.order_id = tg.order_id 
			// INNER JOIN tms_users AS tu ON tmv.resource = tu.iUserId 
			// INNER JOIN tms_users AS tmu ON tmv.contact_person = tmu.iUserId 
			// group by tmv.job_summmeryId";
	    	//$data = $this->_db->rawQuery($qry);
			if(isset($filterParams['contactPerson'])){
				$this->_db->where('tmu.iUserId', $filterParams['contactPerson']);
			}
			if(isset($filterParams['resource'])){
				$this->_db->where('tmv.resource', $filterParams['resource']);
			}
			if(isset($filterParams['customer'])){
				$this->_db->where('tcu.client', $filterParams['customer']);
			}
			if(isset($filterParams['projectType'])){
				$this->_db->where('ti.project_type', $filterParams['projectType']);
			}	
			if(isset($filterParams['jobStatus'])){
				$this->_db->where('tmv.item_status', $filterParams['jobStatus']);
			}
			if(isset($filterParams['itemStatus'])){
				$this->_db->where('ti.item_status', $filterParams['itemStatus']);
			}
			if(isset($filterParams['orderTypes'])){
				$this->_db->where('tu.iFkUserTypeId', $filterParams['orderTypes']);
			}
			if(isset($filterParams['companyCode'])){
				//$this->_db->where('tc.vCodeRights', $filterParams['companyCode']);
				$this->_db->where('tg.order_no', ''.$filterParams['companyCode'].'%', 'LIKE');
			}			
			if(isset($filterParams['itemDuedateStart']) && isset($filterParams['itemDuedateEnd'])){
				$Frm = $filterParams['itemDuedateStart'].' '.'00:00:00';
				$To = $filterParams['itemDuedateEnd'].' '.'00:00:00';
				$this->_db->where('tmv.due_date', Array ($Frm,$To),'BETWEEN');
			}else if(isset($filterParams['itemDuedateStart'])){
				$Frm = $filterParams['itemDuedateStart'].' '.'00:00:00';
				$this->_db->where('tmv.due_date', $Frm, '>');
			}else if(isset($filterParams['itemDuedateEnd'])){
				$To = $filterParams['itemDuedateEnd'].' '.'00:00:00';
				$this->_db->where('tmv.due_date', $To, '<');
			}else{}

			if(isset($filterParams['createDateFrom']) && isset($filterParams['createDateTo'])){
				$Frm = $filterParams['createDateFrom'].' '.'00:00:00';
				$To = $filterParams['createDateTo'].' '.'00:00:00';
				$this->_db->where('tmv.created_date', Array ($Frm,$To),'BETWEEN');
			}else if(isset($filterParams['createDateFrom'])){
				$Frm = $filterParams['createDateFrom'].' '.'00:00:00';
				$this->_db->where('tmv.created_date', $Frm, '>');
			}else if(isset($filterParams['createDateTo'])){
				$To = $filterParams['createDateTo'].' '.'00:00:00';
				$this->_db->where('tmv.created_date', $Frm, '<');
			}else {}
			$this->_db->join('tms_summmery_view tmv', 'ti.order_id = tmv.order_id','INNER');
			$this->_db->join('tms_customer tcu', 'ti.order_id = tcu.order_id','INNER');
			$this->_db->join('tms_client tc', 'tcu.client = tc.iClientId','INNER');
			$this->_db->join('tms_general tg', 'ti.order_id = tg.order_id','INNER');
			$this->_db->join('tms_users tu', 'tmv.resource = tu.iUserId','INNER');
			$this->_db->join('tms_users tmu', 'tmv.contact_person = tmu.iUserId','INNER');
			$this->_db->groupBy("tmv.job_summmeryId");
			$this->_db->orderBy('tmv.due_date','DESC');
			$data = $this->_db->get('tms_items ti', null,'tmv.job_summmeryId, tmv.ItemLanguage, tmv.job_no AS jobNo,tmv.job_code AS jobCode,tmu.iUserId AS contactPerson,CONCAT(tmu.vFirstName, " ", tmu.vLastName) AS contactPersonName, tmv.resource AS resource, concat(tu.vFirstName, " ", tu.vLastName) As resourceName,tc.vUserName AS customerName,tmv.company_code AS companyCode,tcu.client AS customer,tu.vResourceType AS serviceGroup,tg.project_type AS projectType,tmv.item_status AS jobStatus,tmv.due_date AS job_due_date,ti.item_status AS itemStatus,tu.iFkUserTypeId AS orderTypes,tg.order_no AS orderNum,tmv.job_summmeryId AS jobId,tu.iFkUserTypeId AS ifkuserId, tmv.po_number AS poNumber, tmv.total_price as jobPrice');
			// echo $this->_db->getLastQuery();

	    	return $data;
		}

	    public function jobsearchStatusUpdate($id,$status){

	    	$data['item_status'] = $status;

	    	$data['updated_date'] = date('Y-m-d H:i:s');

	    	$this->_db->where('job_summmeryId',$id);

	    	$data = $this->_db->update('tms_summmery_view',$data);

	    	return $data;

	    }



	    public function jobsearchStatusDelete($id){

	    	$this->_db->where('job_summmeryId',$id);

	    	$data = $this->_db->delete('tms_summmery_view');

	    	return $data;

	    }

	    public function advanceSearchResource(){

    		$qry = "SELECT tmv.job_no AS jobNo,tmv.job_code AS jobCode,tmu.iUserId AS contactPerson,tmu.vUserName AS contactPersonName, tmv.resource AS resource, concat(tu.vFirstName, ' ', tu.vLastName) As resourceName,tu.freelancer As freelancerType,tc.vUserName AS customerName,tmv.company_code AS companyCode,tcu.client AS customer,tu.vResourceType AS serviceGroup,tg.project_type AS projectType,tmv.item_status AS jobStatus,ti.item_status AS itemStatus,tu.iFkUserTypeId AS orderTypes,tg.order_no AS orderNum,tmv.job_summmeryId AS jobId,tu.iFkUserTypeId AS ifkuserId, tmv.po_number AS poNumber,tupl.currancy_id As currency,tu.address1Detail AS userCountry ,tmv.due_date As JobDueDate,Rate.OverallRating FROM tms_items AS ti LEFT JOIN tms_summmery_view AS tmv ON ti.order_id = tmv.order_id LEFT JOIN tms_customer AS tcu ON ti.order_id = tcu.order_id LEFT JOIN tms_client AS tc ON tcu.client = tc.iClientId LEFT JOIN tms_general AS tg ON ti.order_id = tg.order_id LEFT JOIN tms_users AS tu ON tmv.resource = tu.iUserId LEFT JOIN tms_users AS tmu ON tmv.contact_person = tmu.iUserId LEFT JOIN tms_userprice_list As tupl ON tupl.iUserId = tu.iUserId LEFT OUTER JOIN (SELECT (((ceil(floor(sum(floor(language)))*5/sum(floor(language)+floor(specialist)+floor(technical)+floor(deadlines)+floor(flexibility))) + ceil(floor(sum(floor(specialist)))*5/sum(floor(language)+floor(specialist)+floor(technical)+floor(deadlines)+floor(flexibility))) + ceil(floor(sum(floor(technical)))*5/sum(floor(language)+floor(specialist)+floor(technical)+floor(deadlines)+floor(flexibility))) + ceil(floor(sum(floor(deadlines)))*5/sum(floor(language)+floor(specialist)+floor(technical)+floor(deadlines)+floor(flexibility))) + ceil(floor(sum(floor(flexibility)))*5/sum(floor(language)+floor(specialist)+floor(technical)+floor(deadlines)+floor(flexibility))))*20)/5) As OverallRating ,iUserId FROM `tms_resource_assets` group by iUserId) As Rate ON Rate.iUserId = tu.iUserId group by tmv.job_summmeryId";

    		/*$qry = "SELECT tmv.job_no AS jobNo,tmv.job_code AS jobCode,tmu.iUserId AS contactPerson,tmu.vUserName AS contactPersonName, tmv.resource AS resource, tu.vUserName As resourceName,tu.freelancer As freelancerType,tc.vUserName AS customerName,tmv.company_code AS companyCode,tcu.client AS customer,tu.vResourceType AS serviceGroup,tg.project_type AS projectType,tmv.item_status AS jobStatus,ti.item_status AS itemStatus,tu.iFkUserTypeId AS orderTypes,tg.order_no AS orderNum,tmv.job_summmeryId AS jobId,tu.iFkUserTypeId AS ifkuserId, tmv.po_number AS poNumber,tupl.currancy_id As currency,tu.address1Detail AS userCountry ,tmv.due_date As JobDueDate,tra.language,tra.specialist ,tra.technical,tra.deadlines,tra.flexibility FROM tms_items AS ti LEFT JOIN tms_summmery_view AS tmv ON ti.order_id = tmv.order_id LEFT JOIN tms_customer AS tcu ON ti.order_id = tcu.order_id LEFT JOIN tms_client AS tc ON tcu.client = tc.iClientId LEFT JOIN tms_general AS tg ON ti.order_id = tg.order_id LEFT JOIN tms_users AS tu ON tmv.resource = tu.iUserId LEFT JOIN tms_users AS tmu ON tmv.contact_person = tmu.iUserId LEFT JOIN tms_userprice_list As tupl ON tupl.iUserId = tu.iUserId LEFT JOIN tms_resource_assets AS tra ON tra.iUserId = tu.iUserId group by tmv.job_summmeryId"*/

	    	$data = $this->_db->rawQuery($qry);

	    	return $data;

	    }

		public function searchExternalResource(){
			//$qry = "SELECT tmv.job_no AS jobNo,tmv.job_code AS jobCode,tmu.iUserId AS contactPerson,tmu.vUserName AS contactPersonName, tmv.resource AS resource, tu.vUserName As resourceName,tu.freelancer As freelancerType,tc.vUserName AS customerName,tmv.company_code AS companyCode,tcu.client AS customer,tu.vResourceType AS serviceGroup,tg.project_type AS projectType,tmv.item_status AS jobStatus,ti.item_status AS itemStatus,tu.iFkUserTypeId AS orderTypes,tg.order_no AS orderNum,tmv.job_summmeryId AS jobId,tu.iFkUserTypeId AS ifkuserId, tmv.po_number AS poNumber,tupl.currancy_id As currency,tu.address1Detail AS userCountry ,tmv.due_date As JobDueDate,Rate.OverallRating FROM tms_items AS ti LEFT JOIN tms_summmery_view AS tmv ON ti.order_id = tmv.order_id LEFT JOIN tms_customer AS tcu ON ti.order_id = tcu.order_id LEFT JOIN tms_client AS tc ON tcu.client = tc.iClientId LEFT JOIN tms_general AS tg ON ti.order_id = tg.order_id LEFT JOIN tms_users AS tu ON tmv.resource = tu.iUserId LEFT JOIN tms_users AS tmu ON tmv.contact_person = tmu.iUserId LEFT JOIN tms_userprice_list As tupl ON tupl.iUserId = tu.iUserId group by tmv.job_summmeryId";
			//$qry = "SELECT tu.iUserId, concat(tu.vFirstName, ' ', tu.vLastName) AS resourceName, tu.vFirstName, tu.vLastName, tu.freelancer As freelancerType, tu.companyName, tu.address1Detail AS userCountry, tu.freelance_currency, tcpl.resource_id, tcpl.specialization, tcpl.price_currency, tcpl.price_language, tcpl.price_basis FROM `tms_users` as tu LEFT JOIN tms_customer_price_list as tcpl ON tcpl.resource_id = tu.iUserId where tu.iFkUserTypeId =2";	
			//$qry = "SELECT tu.iUserId, concat(tu.vFirstName, ' ', tu.vLastName) AS resourceName, tu.vFirstName, tu.vLastName, tu.freelancer As freelancerType, tu.companyName, tu.address1Detail AS userCountry, tu.freelance_currency, tcpl.resource_id, tcpl.specialization, tcpl.price_currency, tcpl.price_language, tcpl.price_basis, tu.eUserStatus FROM `tms_users` as tu LEFT JOIN tms_customer_price_list as tcpl ON tcpl.resource_id = tu.iUserId AND tcpl.price_id = 2 where tu.iFkUserTypeId =2";	
			$qry = "SELECT tu.iUserId, CONCAT(tu.vFirstName, ' ', tu.vLastName) AS resourceName, tu.vFirstName, tu.vLastName, tu.freelancer AS freelancerType, tu.companyName, tu.address1Detail AS userCountry, tu.freelance_currency, tcpl.resource_id, tcpl.specialization, tcpl.price_currency, tcpl.price_language, tcpl.price_basis, tu.eUserStatus, tus.status_name as userStatus FROM `tms_users` AS tu LEFT JOIN tms_customer_price_list AS tcpl ON tcpl.resource_id = tu.iUserId AND tcpl.price_id = 2 LEFT JOIN tms_user_status AS tus ON tu.eUserStatus = tus.status_id WHERE tu.iFkUserTypeId = 2" ;
			$data = $this->_db->rawQuery($qry);

	    	return $data;

	    }

		public function searchExternalResourceFilter($searchParams){
			
			$where = ' tu.iFkUserTypeId = 2 ';
			if($searchParams){
				if(isset($searchParams['resourceName'])){
					$resource = $searchParams['resourceName'];
					$where .= " AND CONCAT(tu.vFirstName, ' ', tu.vLastName) LIKE '%$resource%'";
				}
				if(isset($searchParams['source_lang'])){
					$sourceLang = $searchParams['source_lang'];
					$where .= " AND tcpl.price_language LIKE '%\"languagePrice\":\" > $sourceLang\"%'";
				}
				if(isset($searchParams['target_lang'])){
					$target_lang = $searchParams['target_lang'];
					$where .= " AND tcpl.price_language LIKE '%\"languagePrice\":\" > $target_lang\"%'";
				}
				
			}
			//print_r($searchParams);
			
			//$qry = "SELECT tmv.job_no AS jobNo,tmv.job_code AS jobCode,tmu.iUserId AS contactPerson,tmu.vUserName AS contactPersonName, tmv.resource AS resource, tu.vUserName As resourceName,tu.freelancer As freelancerType,tc.vUserName AS customerName,tmv.company_code AS companyCode,tcu.client AS customer,tu.vResourceType AS serviceGroup,tg.project_type AS projectType,tmv.item_status AS jobStatus,ti.item_status AS itemStatus,tu.iFkUserTypeId AS orderTypes,tg.order_no AS orderNum,tmv.job_summmeryId AS jobId,tu.iFkUserTypeId AS ifkuserId, tmv.po_number AS poNumber,tupl.currancy_id As currency,tu.address1Detail AS userCountry ,tmv.due_date As JobDueDate,Rate.OverallRating FROM tms_items AS ti LEFT JOIN tms_summmery_view AS tmv ON ti.order_id = tmv.order_id LEFT JOIN tms_customer AS tcu ON ti.order_id = tcu.order_id LEFT JOIN tms_client AS tc ON tcu.client = tc.iClientId LEFT JOIN tms_general AS tg ON ti.order_id = tg.order_id LEFT JOIN tms_users AS tu ON tmv.resource = tu.iUserId LEFT JOIN tms_users AS tmu ON tmv.contact_person = tmu.iUserId LEFT JOIN tms_userprice_list As tupl ON tupl.iUserId = tu.iUserId group by tmv.job_summmeryId";
			$qry = "SELECT tu.iUserId, concat(tu.vFirstName, ' ', tu.vLastName) AS resourceName, tu.vFirstName, tu.vLastName, tu.freelancer As freelancerType, tu.companyName, tu.address1Detail AS userCountry, tu.freelance_currency, tcpl.resource_id, tcpl.specialization, tcpl.price_currency, tcpl.price_language, tcpl.price_basis FROM `tms_users` as tu LEFT JOIN tms_customer_price_list as tcpl ON tcpl.resource_id = tu.iUserId AND tcpl.price_id = 2 where $where GROUP BY tu.iUserId ";	
			echo $qry;
			exit;
			$data = $this->_db->rawQuery($qry);
			echo $this->_db->getLastQuery();
			//print_r($data);
			exit;

	    	return $data;

	    }

		public function jobStatusUpdateBulk($post){
			
			//B3299_PRF005 , B3310_PRF008
			//	23672-23672
			// B4307_PRF006
			//B4307_PRF006
			$jobIds = $post['jobIdChecked'];  // This is an array of job IDs
			$jobStatus = $post['jobStatus'];  // The status you're updating
			$updatedDate = date('Y-m-d H:i:s');  // Current date and time

			$data = [
				'item_status' => $jobStatus,
				'updated_date' => $updatedDate
			];

			$return = [
				'status' => 200,
				'is_update' => false,
				'is_alljobInvoiced' => false,
			];

			if (is_array($jobIds) && !empty($jobIds)) {
				$jobIds = array_map('intval', $jobIds);
			
				$this->_db->where('invc_job_id', $jobIds, 'IN');
				$this->_db->where('is_deleted', 0);
				$existingJobs = $this->_db->get('tms_invoice_jobs'); 

				if (count($existingJobs) > 0) {
					$existingJobIds = array_map(function($job) {
						return $job['invc_job_id'];
					}, $existingJobs);
					$jobIds = array_diff($jobIds, $existingJobIds);
				}
				if (!empty($jobIds)) {
					try {
						$this->_db->where('job_summmeryId', $jobIds, 'IN');
						$isUpdate = $this->_db->update('tms_summmery_view', $data);
						$return['is_update'] = true;
					} catch (Exception $e) {
						$return['status'] = 500;
					}
				} else {
					$return['is_alljobInvoiced'] = true;
				}
			}
			
			return $return;

	    }

		public function jobReportCustomFilter($post){ 

    		$searchValue = $post['search'] ?? ''; // Search value
			$orderColumnIndex = $post['order'][0]['column'] ?? 1; // Index of the column to sort
			$orderDir = $post['order'][0]['dir'] ?? 'asc'; // Order direction (asc or desc)
			$start = $post['start'] ?? 0; // Starting point for pagination
			$length = $post['length'] ?? 20; // Number of records to fetch
			$filterParams = $post['filterParams'] ?? '';

			$columns = [
				// 0 => 'job_summmeryId',
				// 1 => 'job_summmeryId',
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
			$orderColumn = $columns[$orderColumnIndex] ?? 'tmv.job_summmeryId';

			// Ensure the order direction is valid
			$orderDir = strtolower($orderDir) === 'desc' ? 'DESC' : 'ASC';

			// Base query
			$where_cond = '';
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
				$where_cond .= " AND (concat(tg.order_no,'_',tmv.job_code,tmv.job_no) LIKE '%" . $searchValue . "%' 
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
				$where_cond .= " AND tmu.iUserId = '" . $filterParams['contactPerson'] . "'";
			}
			
			if (isset($filterParams['resource'])) {
				$where_cond .= " AND tmv.resource = '" . $filterParams['resource'] . "'";
			}
			
			if (isset($filterParams['customer'])) {
				$where_cond .= " AND tcu.client = '" . $filterParams['customer'] . "'";
			}

			if (isset($filterParams['account'])) {
				$where_cond .= " AND tcu.indirect_customer = '" . $filterParams['account'] . "'";
			}
			
			if (isset($filterParams['projectType'])) {
				$where_cond .= " AND ti.project_type = '" . $filterParams['projectType'] . "'";
			}
			
			if (isset($filterParams['jobStatus'])) {
				$where_cond .= " AND tmv.item_status = '" . $filterParams['jobStatus'] . "'";
			}
			
			if (isset($filterParams['itemStatus'])) {
				$where_cond .= " AND ti.item_status = '" . $filterParams['itemStatus'] . "'";
			}
			
			if (isset($filterParams['orderTypes'])) {
				$where_cond .= " AND tu.iFkUserTypeId = '" . $filterParams['orderTypes'] . "'";
			}

			if (isset($filterParams['currency'])) {
				$where_cond .= " AND tu.freelance_currency LIKE '" . $filterParams['currency'] . "%'";
			}
			
			if (isset($filterParams['companyCode'])) {
				$where_cond .= " AND tg.order_no LIKE '" . $filterParams['companyCode'] . "%'";
			}
			
			if (isset($filterParams['itemDuedateStart']) && isset($filterParams['itemDuedateEnd'])) {
				$Frm = $filterParams['itemDuedateStart'] . ' 00:00:00';
				$To = $filterParams['itemDuedateEnd'] . ' 00:00:00';
				$where_cond .= " AND tmv.due_date BETWEEN '" . $Frm . "' AND '" . $To . "'";
			} else if (isset($filterParams['itemDuedateStart'])) {
				$Frm = $filterParams['itemDuedateStart'] . ' 00:00:00';
				$where_cond .= " AND tmv.due_date > '" . $Frm . "'";
			} else if (isset($filterParams['itemDuedateEnd'])) {
				$To = $filterParams['itemDuedateEnd'] . ' 00:00:00';
				$where_cond .= " AND tmv.due_date < '" . $To . "'";
			}
			
			if (isset($filterParams['createDateFrom']) && isset($filterParams['createDateTo'])) {
				$Frm = $filterParams['createDateFrom'] . ' 00:00:00';
				$To = $filterParams['createDateTo'] . ' 00:00:00';
				$where_cond .= " AND tmv.created_date BETWEEN '" . $Frm . "' AND '" . $To . "'";
			} else if (isset($filterParams['createDateFrom'])) {
				$Frm = $filterParams['createDateFrom'] . ' 00:00:00';
				$where_cond .= " AND tmv.created_date > '" . $Frm . "'";
			} else if (isset($filterParams['createDateTo'])) {
				$To = $filterParams['createDateTo'] . ' 00:00:00';
				$where_cond .= " AND tmv.created_date < '" . $To . "'";
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
				1=1 " . $where_cond . " 
			GROUP BY 
				tmv.job_summmeryId 
			ORDER BY " . $orderColumn . " " . $orderDir . " 
			LIMIT $start, $length";

			$results = $this->_db->rawQueryNew($querydata);

			$totalRecordsQuery = "SELECT COUNT(DISTINCT tmv.job_summmeryId) AS count, SUM(tmv.total_price) AS totalPrice, SUM(tmv.total_price / COALESCE(NULLIF(user_base_currency_rate, 0), 1)) AS total_price_euro 
			FROM 
				tms_items ti
			$joinTables
			WHERE 1=1 " . $where_cond;
			$totalRecordsResult = $this->_db->rawQueryNew($totalRecordsQuery);

			$is_multiple_currency = false;
	        $temp_currency_arr = [];
			$currencyQry = "SELECT tu.freelance_currency 
			FROM 
				tms_items ti
			$joinTables
			WHERE 1=1 " . $where_cond . " GROUP BY tu.freelance_currency ";
			$currencyQryRes = $this->_db->rawQueryNew($currencyQry);
			if ($currencyQryRes) {
				foreach ($currencyQryRes as $row) {
					$currencyVal = !empty($row['freelance_currency']) 
								? explode(',', $row['freelance_currency'])[0] 
								: 'EUR';
					$temp_currency_arr[$currencyVal] = true; // Use an associative array for unique values
				}
			}
			$is_multiple_currency = count($temp_currency_arr) > 1;

			$totalRecords = $totalRecordsResult[0]['count'] ?? 0;
			$totalPrice = $totalRecordsResult[0]['totalPrice'] ?? 0;
			$totalPriceEuro = $totalRecordsResult[0]['total_price_euro'] ?? 0;

			$response = [
				"draw" => intval($post['draw']),
				"recordsTotal" => 0,
				"recordsFiltered" => 0,
				"data" => [],
				"totalPrice" => 0,
				"totalPriceEuro" => 0,
				"is_multiple_currency" => false
			];
			
			// If filterParams is set, modify the response with actual data
			if (isset($post['filterParams']) && !empty($post['filterParams'])) {
				$response["recordsTotal"] = $totalRecords;
				$response["recordsFiltered"] = $totalRecords;
				$response["data"] = $results;
				$response["totalPrice"] = $totalPrice;
				$response["totalPriceEuro"] = $totalPriceEuro;
				$response["is_multiple_currency"] = $is_multiple_currency;
			}

			return $response;

		}



}