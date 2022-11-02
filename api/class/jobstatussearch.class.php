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

    		$qry = "SELECT tmv.ItemLanguage,tmv.job_no AS jobNo,tmv.job_code AS jobCode,tmu.iUserId AS contactPerson,tmu.vUserName AS contactPersonName, tmv.resource AS resource, tu.vUserName As resourceName,tc.vUserName AS customerName,tmv.company_code AS companyCode,tcu.client AS customer,tu.vResourceType AS serviceGroup,tg.project_type AS projectType,tmv.item_status AS jobStatus,ti.item_status AS itemStatus,tu.iFkUserTypeId AS orderTypes,tg.order_no AS orderNum,tmv.job_summmeryId AS jobId,tu.iFkUserTypeId AS ifkuserId, tmv.po_number AS poNumber, tmv.total_price as jobPrice FROM tms_items AS ti INNER JOIN tms_summmery_view AS tmv ON ti.order_id = tmv.order_id INNER JOIN tms_customer AS tcu ON ti.order_id = tcu.order_id INNER JOIN tms_client AS tc ON tcu.client = tc.iClientId INNER JOIN tms_general AS tg ON ti.order_id = tg.order_id INNER JOIN tms_users AS tu ON tmv.resource = tu.iUserId INNER JOIN tms_users AS tmu ON tmv.contact_person = tmu.iUserId group by tmv.job_summmeryId";

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
			}
			if(isset($filterParams['createDateFrom']) && isset($filterParams['createDateTo'])){
				$Frm = $filterParams['createDateFrom'].' '.'00:00:00';
				$To = $filterParams['createDateTo'].' '.'00:00:00';
				$this->_db->where('tmv.created_date', Array ($Frm,$To),'BETWEEN');
			}
			$this->_db->join('tms_summmery_view tmv', 'ti.order_id = tmv.order_id','INNER');
			$this->_db->join('tms_customer tcu', 'ti.order_id = tcu.order_id','INNER');
			$this->_db->join('tms_client tc', 'tcu.client = tc.iClientId','INNER');
			$this->_db->join('tms_general tg', 'ti.order_id = tg.order_id','INNER');
			$this->_db->join('tms_users tu', 'tmv.resource = tu.iUserId','INNER');
			$this->_db->join('tms_users tmu', 'tmv.contact_person = tmu.iUserId','INNER');
			$this->_db->groupBy("tmv.job_summmeryId");
			$data = $this->_db->get('tms_items ti', null,' tmv.ItemLanguage,tmv.job_no AS jobNo,tmv.job_code AS jobCode,tmu.iUserId AS contactPerson,tmu.vUserName AS contactPersonName, tmv.resource AS resource, tu.vUserName As resourceName,tc.vUserName AS customerName,tmv.company_code AS companyCode,tcu.client AS customer,tu.vResourceType AS serviceGroup,tg.project_type AS projectType,tmv.item_status AS jobStatus,ti.item_status AS itemStatus,tu.iFkUserTypeId AS orderTypes,tg.order_no AS orderNum,tmv.job_summmeryId AS jobId,tu.iFkUserTypeId AS ifkuserId, tmv.po_number AS poNumber, tmv.total_price as jobPrice');
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

    		$qry = "SELECT tmv.job_no AS jobNo,tmv.job_code AS jobCode,tmu.iUserId AS contactPerson,tmu.vUserName AS contactPersonName, tmv.resource AS resource, tu.vUserName As resourceName,tu.freelancer As freelancerType,tc.vUserName AS customerName,tmv.company_code AS companyCode,tcu.client AS customer,tu.vResourceType AS serviceGroup,tg.project_type AS projectType,tmv.item_status AS jobStatus,ti.item_status AS itemStatus,tu.iFkUserTypeId AS orderTypes,tg.order_no AS orderNum,tmv.job_summmeryId AS jobId,tu.iFkUserTypeId AS ifkuserId, tmv.po_number AS poNumber,tupl.currancy_id As currency,tu.address1Detail AS userCountry ,tmv.due_date As JobDueDate,Rate.OverallRating FROM tms_items AS ti LEFT JOIN tms_summmery_view AS tmv ON ti.order_id = tmv.order_id LEFT JOIN tms_customer AS tcu ON ti.order_id = tcu.order_id LEFT JOIN tms_client AS tc ON tcu.client = tc.iClientId LEFT JOIN tms_general AS tg ON ti.order_id = tg.order_id LEFT JOIN tms_users AS tu ON tmv.resource = tu.iUserId LEFT JOIN tms_users AS tmu ON tmv.contact_person = tmu.iUserId LEFT JOIN tms_userprice_list As tupl ON tupl.iUserId = tu.iUserId LEFT OUTER JOIN (SELECT (((ceil(floor(sum(floor(language)))*5/sum(floor(language)+floor(specialist)+floor(technical)+floor(deadlines)+floor(flexibility))) + ceil(floor(sum(floor(specialist)))*5/sum(floor(language)+floor(specialist)+floor(technical)+floor(deadlines)+floor(flexibility))) + ceil(floor(sum(floor(technical)))*5/sum(floor(language)+floor(specialist)+floor(technical)+floor(deadlines)+floor(flexibility))) + ceil(floor(sum(floor(deadlines)))*5/sum(floor(language)+floor(specialist)+floor(technical)+floor(deadlines)+floor(flexibility))) + ceil(floor(sum(floor(flexibility)))*5/sum(floor(language)+floor(specialist)+floor(technical)+floor(deadlines)+floor(flexibility))))*20)/5) As OverallRating ,iUserId FROM `tms_resource_assets` group by iUserId) As Rate ON Rate.iUserId = tu.iUserId group by tmv.job_summmeryId";

    		/*$qry = "SELECT tmv.job_no AS jobNo,tmv.job_code AS jobCode,tmu.iUserId AS contactPerson,tmu.vUserName AS contactPersonName, tmv.resource AS resource, tu.vUserName As resourceName,tu.freelancer As freelancerType,tc.vUserName AS customerName,tmv.company_code AS companyCode,tcu.client AS customer,tu.vResourceType AS serviceGroup,tg.project_type AS projectType,tmv.item_status AS jobStatus,ti.item_status AS itemStatus,tu.iFkUserTypeId AS orderTypes,tg.order_no AS orderNum,tmv.job_summmeryId AS jobId,tu.iFkUserTypeId AS ifkuserId, tmv.po_number AS poNumber,tupl.currancy_id As currency,tu.address1Detail AS userCountry ,tmv.due_date As JobDueDate,tra.language,tra.specialist ,tra.technical,tra.deadlines,tra.flexibility FROM tms_items AS ti LEFT JOIN tms_summmery_view AS tmv ON ti.order_id = tmv.order_id LEFT JOIN tms_customer AS tcu ON ti.order_id = tcu.order_id LEFT JOIN tms_client AS tc ON tcu.client = tc.iClientId LEFT JOIN tms_general AS tg ON ti.order_id = tg.order_id LEFT JOIN tms_users AS tu ON tmv.resource = tu.iUserId LEFT JOIN tms_users AS tmu ON tmv.contact_person = tmu.iUserId LEFT JOIN tms_userprice_list As tupl ON tupl.iUserId = tu.iUserId LEFT JOIN tms_resource_assets AS tra ON tra.iUserId = tu.iUserId group by tmv.job_summmeryId"*/

	    	$data = $this->_db->rawQuery($qry);

	    	return $data;

	    }

		public function searchExternalResource(){
			//$qry = "SELECT tmv.job_no AS jobNo,tmv.job_code AS jobCode,tmu.iUserId AS contactPerson,tmu.vUserName AS contactPersonName, tmv.resource AS resource, tu.vUserName As resourceName,tu.freelancer As freelancerType,tc.vUserName AS customerName,tmv.company_code AS companyCode,tcu.client AS customer,tu.vResourceType AS serviceGroup,tg.project_type AS projectType,tmv.item_status AS jobStatus,ti.item_status AS itemStatus,tu.iFkUserTypeId AS orderTypes,tg.order_no AS orderNum,tmv.job_summmeryId AS jobId,tu.iFkUserTypeId AS ifkuserId, tmv.po_number AS poNumber,tupl.currancy_id As currency,tu.address1Detail AS userCountry ,tmv.due_date As JobDueDate,Rate.OverallRating FROM tms_items AS ti LEFT JOIN tms_summmery_view AS tmv ON ti.order_id = tmv.order_id LEFT JOIN tms_customer AS tcu ON ti.order_id = tcu.order_id LEFT JOIN tms_client AS tc ON tcu.client = tc.iClientId LEFT JOIN tms_general AS tg ON ti.order_id = tg.order_id LEFT JOIN tms_users AS tu ON tmv.resource = tu.iUserId LEFT JOIN tms_users AS tmu ON tmv.contact_person = tmu.iUserId LEFT JOIN tms_userprice_list As tupl ON tupl.iUserId = tu.iUserId group by tmv.job_summmeryId";
			$qry = "SELECT tu.iUserId, tu.vUserName AS resourceName, tu.freelancer As freelancerType, tu.address1Detail AS userCountry, tcpl.resource_id, tcpl.specialization, tcpl.price_currency, tcpl.price_language, tcpl.price_basis FROM `tms_users` as tu LEFT JOIN tms_customer_price_list as tcpl ON tcpl.resource_id = tu.iUserId where tu.iFkUserTypeId =2";	

			$data = $this->_db->rawQuery($qry);

	    	return $data;

	    }



}