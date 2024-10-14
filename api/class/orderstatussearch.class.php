<?php

require_once 'users.class.php';
require_once 'client.class.php';
require_once 'tasktype.class.php';

class orderstatussearch {
	//price1 data manage
	    public function __construct() {
	        $this->_db = db::getInstance();
	    }

		public function statusorderReportFind(){
			$qry = "SELECT gen.order_no AS orderNumber, gen.due_date AS DueDate, gen.order_id AS orderId, cust.created_date AS orderDate, cust.client AS customer, gen.project_name AS projectName, c.vUserName AS contactName, stus.status_name AS clientStatus, gen.company_code AS companyCode, cust.contact AS contactPerson, cust.indirect_customer,its.item_number, its.item_status AS itemStatus, its.po_number AS itemPonumber,its.item_email_subject as emailSubject, DATE_FORMAT(its.due_date,'%d.%m.%Y') AS itemDuedate,its.source_lang AS sourceLanguage, its.target_lang AS targetLanguage, gen.project_status AS projectStatus, gen.project_type AS projectType, plang.source_lang AS sourceLanguage, plang.target_lang AS targetLanguage, its.total_amount AS totalAmount, concat(tu.vFirstName, ' ', tu.vLastName) AS pm_name, (SELECT SUM(sv.total_price) FROM `tms_summmery_view` as sv WHERE sv.order_id = its.order_id AND sv.item_id = its.item_number) as jobTotalPrice FROM tms_items AS its LEFT JOIN tms_general AS gen ON its.order_id = gen.order_id LEFT JOIN tms_customer AS cust ON its.order_id = cust.order_id LEFT JOIN tms_proj_language AS plang ON its.order_id = plang.order_id LEFT JOIN tms_client AS c ON cust.client = c.iClientId LEFT JOIN tms_user_status AS stus ON c.vStatus = stus.status_id LEFT JOIN tms_client_indirect AS inc ON inc.iClientId = cust.indirect_customer LEFT JOIN tms_users AS tu ON tu.iUserId = cust.project_manager LEFT JOIN tms_project_status AS ps ON ps.pr_status_id = gen.project_status";
			$data = $this->_db->rawQuery($qry);

			$qry = "SELECT gen.order_no AS orderNumber,gen.order_id AS orderId, cust.created_date AS orderDate, cust.client AS customer,gen.project_name AS projectName, c.vUserName AS contactName,stus.status_name AS clientStatus,gen.company_code AS companyCode,cust.contact AS contactPerson,its.item_status AS itemStatus,gen.project_status AS projectStatus,gen.project_type AS projectType,its.source_lang AS sourceLanguage,its.target_lang AS targetLanguage, its.q_date AS QuentityDate ,SUM(its.total_amount) As TotalAmount FROM tms_general AS gen LEFT JOIN tms_customer AS cust ON gen.order_id=cust.order_id LEFT JOIN tms_items AS its ON gen.order_id=its.order_id  LEFT JOIN tms_client AS c ON cust.client = c.iClientId LEFT JOIN tms_user_status AS stus ON c.vStatus = stus.status_id group by its.q_date";
			$info = $this->_db->rawQuery($qry);

			$qry = "SELECT gen.order_no AS orderNumber,gen.project_type,gen.order_id AS orderId,tpt.project_name AS projectTypeName, cust.created_date AS orderDate, cust.client AS customer,gen.project_name AS projectName, c.vUserName AS contactName,stus.status_name AS clientStatus,gen.company_code AS companyCode,cust.contact AS contactPerson,its.item_status AS itemStatus,gen.project_status AS projectStatus,gen.project_type AS projectType,its.source_lang AS sourceLanguage,its.target_lang AS targetLanguage, its.q_date AS QuentityDate ,SUM(its.total_amount) As TotalAmount FROM tms_general AS gen LEFT JOIN tms_customer AS cust ON gen.order_id=cust.order_id LEFT JOIN tms_items AS its ON gen.order_id=its.order_id LEFT JOIN tms_client AS c ON cust.client = c.iClientId LEFT JOIN tms_user_status AS stus ON c.vStatus = stus.status_id LEFT JOIN tms_project_type AS tpt ON gen.project_type = tpt.pr_type_id group by gen.project_type";
			$Typeinfo = $this->_db->rawQuery($qry);

			$qry = "SELECT gen.order_no AS orderNumber,gen.order_id AS orderId,tpt.project_name AS projectTypeName, cust.created_date AS orderDate, cust.client AS customer,gen.project_name AS projectName, c.vUserName AS contactName,stus.status_name AS clientStatus,gen.company_code AS companyCode,cust.contact AS contactPerson,its.item_status AS itemStatus,gen.project_status AS projectStatus,gen.project_type AS projectType,its.source_lang AS sourceLanguage,its.target_lang AS targetLanguage, its.q_date AS QuentityDate ,SUM(its.total_amount) As TotalAmount FROM tms_general AS gen LEFT JOIN tms_customer AS cust ON gen.order_id=cust.order_id LEFT JOIN tms_items AS its ON gen.order_id=its.order_id LEFT JOIN tms_client AS c ON cust.client = c.iClientId LEFT JOIN tms_user_status AS stus ON c.vStatus = stus.status_id LEFT JOIN tms_project_type AS tpt ON gen.project_type = tpt.pr_type_id group by c.iClientId";
			$customerType = $this->_db->rawQuery($qry);	   		

			$qry = "SELECT gen.heads_up, gen.order_no AS orderNumber, gen.due_date AS DueDate, gen.order_id AS orderId, cust.created_date AS orderDate, cust.client AS customer, gen.project_name AS projectName, c.vUserName AS contactName, stus.status_name AS clientStatus, c.vlogo AS clientlogo, c.tPoInfo AS ponumber, gen.company_code AS companyCode, gen.project_price, gen.expected_start_date, cust.contact AS contactPerson,its.item_number, its.item_status AS itemStatus, its.po_number AS itemPonumber, its.start_date AS itemStartdate, its.due_date AS itemDuedate,its.source_lang AS itemsSourceLang, its.target_lang AS itemsTargetLang, gen.project_status AS projectStatus, gen.project_type AS projectType, plang.source_lang AS sourceLanguage, plang.target_lang AS targetLanguage, its.total_amount AS totalAmount, inc.vUserName AS accountname, concat(tu.vFirstName, ' ', tu.vLastName) AS pm_name, cust.project_coordinator AS project_coordinator_id, cust.project_manager AS project_manager_id, cust.QA_specialist AS qa_specialist_id, ps.project_status_name AS projectstatus_name, ps.status_color AS projectstatus_color, its.q_date AS QuentityDate, SUM(its.total_amount) As TotalAmount FROM tms_items AS its LEFT JOIN tms_general AS gen ON its.order_id = gen.order_id LEFT JOIN tms_customer AS cust ON its.order_id = cust.order_id LEFT JOIN tms_proj_language AS plang ON its.order_id = plang.order_id LEFT JOIN tms_client AS c ON cust.client = c.iClientId LEFT JOIN tms_user_status AS stus ON c.vStatus = stus.status_id LEFT JOIN tms_client_indirect AS inc ON inc.iClientId = cust.indirect_customer LEFT JOIN tms_users AS tu ON tu.iUserId = cust.project_manager LEFT JOIN tms_project_status AS ps ON ps.pr_status_id = gen.project_status group by its.q_date";
			$projectScoopInfo = $this->_db->rawQuery($qry);
	
			$data['data'] = $data;
			$data['info'] = $info;
			$data['Typeinfo'] = $Typeinfo;
			$data['customerType'] = $customerType;
			$data['projectScoopInfo'] = $projectScoopInfo;
			return $data;
		}

		public function statusorderReportFilter($filterParams){

			if(isset($filterParams['pm_name'])){
				//$this->_db->where('tu.iUserId', $filterParams['pm_name']);
				$pmId = $filterParams['pm_name'];
				//$this->_db->where('its.manager', $pmId);
				$this->_db->where(" (cust.project_manager = $pmId OR cust.sub_pm = $pmId OR its.manager = $pmId OR its.subPm = $pmId ) ");
			}
			// exlude project maanger
			if(isset($filterParams['pm_name_exclude'])){
				$pmIdExclude = $filterParams['pm_name_exclude'];
				$this->_db->where(" (cust.project_manager != $pmIdExclude AND cust.sub_pm != $pmIdExclude AND its.manager != $pmIdExclude AND its.subPm != $pmIdExclude ) ");
			}
			if(isset($filterParams['emailSubject'])){
				//$this->_db->where('its.item_email_subject', $filterParams['emailSubject']);
				$this->_db->where('its.item_email_subject','%'.$filterParams['emailSubject'].'%', 'like');
			} 
			if(isset($filterParams['itemPonumber'])){
				$this->_db->where('its.po_number', $filterParams['itemPonumber']);
			}
			if(isset($filterParams['customer'])){
				$this->_db->where('cust.client', $filterParams['customer']);
			}
			if(isset($filterParams['contactPerson'])){
				$this->_db->where('cust.client', $filterParams['contactPerson']);
			}
			if(isset($filterParams['indirect_customer'])){
				$this->_db->where('inc.iClientId', $filterParams['indirect_customer']);
			}
			if(isset($filterParams['itemStatus'])){
				// $this->_db->where('its.item_status', $filterParams['itemStatus']);
				$this->_db->where('its.item_status', explode(",",$filterParams['itemStatus']),'IN');
			}
			if(isset($filterParams['projectStatus'])){
				$this->_db->where('gen.project_status', $filterParams['projectStatus']);
			}
			if(isset($filterParams['projectType'])){
				//$this->_db->where('gen.project_type', $filterParams['projectType']);
				$this->_db->where('its.project_type','%'.$filterParams['projectType'].'%', 'like');
			} 
			if(isset($filterParams['sourceLanguage'])){
				$this->_db->where('its.source_lang','%"sourceLang":"'.$filterParams['sourceLanguage'].'"%', 'like');
			}
			if(isset($filterParams['targetLanguage'])){
				$this->_db->where('its.target_lang','%"sourceLang":"'.$filterParams['targetLanguage'].'"%', 'like');
			} 
			if(isset($filterParams['companyCode'])){
				//$this->_db->where('c.vCodeRights', $filterParams['companyCode']);
				$this->_db->where('gen.order_no', ''.$filterParams['companyCode'].'%', 'LIKE');
			}
			if(isset($filterParams['itemDuedateStart']) && isset($filterParams['itemDuedateEnd'])){
				$Frm = $filterParams['itemDuedateStart'].' '.'00:00:00';
				//$To = $filterParams['endItemDuedate'].' '.'00:00:00';
				$To = $filterParams['itemDuedateEnd'].' '.'00:00:00';
				$this->_db->where(' DATE(its.due_date) ', Array ($Frm,$To),'BETWEEN');
			}else if(isset($filterParams['itemDuedateStart'])){
				$Frm = $filterParams['itemDuedateStart'].' '.'00:00:00';
				$this->_db->where('its.due_date', $Frm, '>');
			}else if(isset($filterParams['itemDuedateEnd'])){
				$To = $filterParams['itemDuedateEnd'].' '.'00:00:00';
				$this->_db->where('its.due_date', $To, '<');
			}else{}
			if(isset($filterParams['createDateFrom']) && isset($filterParams['createDateTo'])){
				$Frm = $filterParams['createDateFrom'].' '.'00:00:00';
				$To = $filterParams['createDateTo'].' '.'00:00:00';
				//$this->_db->where('DATE(its.start_date)', Array ($Frm,$To),'BETWEEN');
				$this->_db->where('DATE(its.created_date)', Array ($Frm,$To),'BETWEEN');
			}else if(isset($filterParams['createDateFrom'])){
				$Frm = $filterParams['createDateFrom'].' '.'00:00:00';
				$this->_db->where('its.created_date', $Frm, '>');
			}else if(isset($filterParams['createDateTo'])){
				$To = $filterParams['createDateTo'].' '.'00:00:00';
				$this->_db->where('its.created_date', $To, '<');
			}else{}

			
			// if(isset($filterParams['itemDuedateStart']) && isset($filterParams['itemDuedateEnd'])){
			// 	$Frm = $filterParams['itemDuedateStart'].' '.'00:00:00';
			// 	$To = $filterParams['endItemDuedate'].' '.'00:00:00';
			// 	$this->_db->where('its.due_date', Array ($Frm,$To),'BETWEEN');
			// }

			// $qry = "SELECT gen.order_no AS orderNumber, gen.due_date AS DueDate, gen.order_id AS orderId, cust.created_date AS orderDate, cust.client AS customer, gen.project_name AS projectName, c.vUserName AS contactName, stus.status_name AS clientStatus, gen.company_code AS companyCode, cust.contact AS contactPerson, cust.indirect_customer,its.item_number, its.item_status AS itemStatus, its.po_number AS itemPonumber,its.item_email_subject as emailSubject, DATE_FORMAT(its.due_date,'%d.%m.%Y') AS itemDuedate,its.source_lang AS sourceLanguage, its.target_lang AS targetLanguage, gen.project_status AS projectStatus, gen.project_type AS projectType, plang.source_lang AS sourceLanguage, plang.target_lang AS targetLanguage, its.total_amount AS totalAmount, tu.vUserName AS pm_name, (SELECT SUM(sv.total_price) FROM `tms_summmery_view` as sv WHERE sv.order_id = its.order_id AND sv.item_id = its.item_number) as jobTotalPrice FROM tms_items AS its LEFT JOIN tms_general AS gen ON its.order_id = gen.order_id LEFT JOIN tms_customer AS cust ON its.order_id = cust.order_id LEFT JOIN tms_proj_language AS plang ON its.order_id = plang.order_id LEFT JOIN tms_client AS c ON cust.client = c.iClientId LEFT JOIN tms_user_status AS stus ON c.vStatus = stus.status_id LEFT JOIN tms_client_indirect AS inc ON inc.iClientId = cust.indirect_customer LEFT JOIN tms_users AS tu ON tu.iUserId = cust.project_manager LEFT JOIN tms_project_status AS ps ON ps.pr_status_id = gen.project_status";
			// $data = $this->_db->rawQuery($qry);
			//$this->_db->groupBy('its.order_id');
			$this->_db->groupBy('its.itemId');
			$this->_db->join('tms_general gen', 'its.order_id = gen.order_id','LEFT');
			$this->_db->join('tms_customer cust', 'its.order_id = cust.order_id','LEFT');
			//$this->_db->join('tms_proj_language plang', 'its.order_id = plang.order_id','LEFT');
			$this->_db->join('tms_client c', 'cust.client = c.iClientId','LEFT');
			$this->_db->join('tms_user_status stus', 'c.vStatus = stus.status_id','LEFT');
			$this->_db->join('tms_client_indirect inc', 'inc.iClientId = cust.indirect_customer','LEFT');
			$this->_db->join('tms_users tu', 'tu.iUserId = cust.project_manager','LEFT');
			$this->_db->join('tms_project_type tpt', 'its.project_type = tpt.pr_type_id','LEFT');
			$this->_db->join('tms_project_status ps', 'ps.pr_status_id = gen.project_status','LEFT');
			$this->_db->join('tms_item_status scs', 'scs.item_status_id = its.item_status','LEFT');
			//$this->_db->join('tms_summmery_view tsv', 'tsv.order_id = its.order_id AND tsv.item_id = its.item_number','LEFT');
			$subQuery = "(SELECT order_id, item_id, SUM(total_price) AS total_job_price FROM tms_summmery_view GROUP BY order_id, item_id) tsv";

			$this->_db->join($subQuery, 'tsv.order_id = its.order_id AND tsv.item_id = its.item_number', 'LEFT');
			//$data = $this->_db->get('tms_items its', null,' gen.order_no AS orderNumber, gen.due_date AS DueDate, gen.order_id AS orderId, cust.created_date AS orderDate, cust.client AS customer, gen.project_name AS projectName, c.vUserName AS contactName, c.iClientId, stus.status_name AS clientStatus, gen.company_code AS companyCode, cust.contact AS contactPerson, cust.indirect_customer,its.item_number, its.item_status AS itemStatus, its.po_number AS itemPonumber,its.item_email_subject as emailSubject, its.project_type AS projectType, DATE_FORMAT(its.due_date, "%d.%m.%Y") AS itemDuedate,DATE_FORMAT(its.start_date, "%d.%m.%Y") AS itemCreatedDate, its.created_date AS scoopCreateDate, its.due_date as scoop_due_date, its.source_lang AS sourceLanguage, its.target_lang AS targetLanguage, gen.project_status AS projectStatus, tpt.project_name AS projectTypeName, its.q_date AS QuentityDate, its.total_amount AS totalAmount, its.item_name AS scoopName, concat(tu.vFirstName, " ", tu.vLastName) AS pm_name, inc.vUserName as indirectAccountName, c.client_currency, scs.item_status_name as scoop_status_name, c.accounting_tripletex, IFNULL(SUM(tsv.total_price), 0) AS total_job_price, its.itemId AS scoopId, its.po_number');
			$data = $this->_db->get('tms_items its', null,' gen.order_no AS orderNumber, gen.due_date AS DueDate, gen.order_id AS orderId, cust.created_date AS orderDate, cust.client AS customer, gen.project_name AS projectName, c.vUserName AS contactName, c.iClientId, stus.status_name AS clientStatus, gen.company_code AS companyCode, cust.contact AS contactPerson, cust.indirect_customer,its.item_number, its.item_status AS itemStatus, its.po_number AS itemPonumber,its.item_email_subject as emailSubject, its.project_type AS projectType, DATE_FORMAT(its.due_date, "%d.%m.%Y") AS itemDuedate,DATE_FORMAT(its.start_date, "%d.%m.%Y") AS itemCreatedDate, its.created_date AS scoopCreateDate, its.due_date as scoop_due_date, its.source_lang AS sourceLanguage, its.target_lang AS targetLanguage, gen.project_status AS projectStatus, tpt.project_name AS projectTypeName, its.q_date AS QuentityDate, its.total_amount AS totalAmount, its.item_name AS scoopName, concat(tu.vFirstName, " ", tu.vLastName) AS pm_name, inc.vUserName as indirectAccountName, c.client_currency, scs.item_status_name as scoop_status_name, c.accounting_tripletex, COALESCE(tsv.total_job_price, 0) AS total_job_price, its.itemId AS scoopId, its.po_number');
			
			// echo $this->_db->getLastQuery();
			// exit;
			//echo $this->_db->getLastQuery();
			
			//$qry = "SELECT gen.order_no AS orderNumber,gen.order_id AS orderId, cust.created_date AS orderDate, cust.client AS customer,gen.project_name AS projectName, c.vUserName AS contactName,stus.status_name AS clientStatus,gen.company_code AS companyCode,cust.contact AS contactPerson,its.item_status AS itemStatus,gen.project_status AS projectStatus,gen.project_type AS projectType,its.source_lang AS sourceLanguage,its.target_lang AS targetLanguage, its.q_date AS QuentityDate ,SUM(its.total_amount) As TotalAmount FROM tms_general AS gen LEFT JOIN tms_customer AS cust ON gen.order_id=cust.order_id LEFT JOIN tms_items AS its ON gen.order_id=its.order_id  LEFT JOIN tms_client AS c ON cust.client = c.iClientId LEFT JOIN tms_user_status AS stus ON c.vStatus = stus.status_id group by its.q_date";
			$qry = "SELECT gen.order_no AS orderNumber,gen.order_id AS orderId, cust.created_date AS orderDate, cust.client AS customer,gen.project_name AS projectName, c.vUserName AS contactName,stus.status_name AS clientStatus,gen.company_code AS companyCode,cust.contact AS contactPerson,its.item_status AS itemStatus,gen.project_status AS projectStatus,gen.project_type AS projectType,its.source_lang AS sourceLanguage,its.target_lang AS targetLanguage, its.q_date AS QuentityDate ,SUM(its.total_amount) As TotalAmount FROM tms_items its LEFT JOIN tms_general gen ON its.order_id = gen.order_id LEFT JOIN tms_customer cust ON its.order_id = cust.order_id LEFT JOIN tms_client c ON cust.client = c.iClientId LEFT JOIN tms_user_status stus ON c.vStatus = stus.status_id LEFT JOIN tms_client_indirect inc ON inc.iClientId = cust.indirect_customer LEFT JOIN tms_users tu ON tu.iUserId = cust.project_manager LEFT JOIN tms_project_status ps ON ps.pr_status_id = gen.project_status group by its.q_date";
			$info = $this->_db->rawQuery($qry);
			
			$qry = "SELECT gen.order_no AS orderNumber,gen.project_type,gen.order_id AS orderId,tpt.project_name AS projectTypeName, cust.created_date AS orderDate, cust.client AS customer,gen.project_name AS projectName, c.vUserName AS contactName,stus.status_name AS clientStatus,gen.company_code AS companyCode,cust.contact AS contactPerson,its.item_status AS itemStatus,gen.project_status AS projectStatus,gen.project_type AS projectType,its.source_lang AS sourceLanguage,its.target_lang AS targetLanguage, its.q_date AS QuentityDate ,SUM(its.total_amount) As TotalAmount FROM tms_general AS gen LEFT JOIN tms_customer AS cust ON gen.order_id=cust.order_id LEFT JOIN tms_items AS its ON gen.order_id=its.order_id LEFT JOIN tms_client AS c ON cust.client = c.iClientId LEFT JOIN tms_user_status AS stus ON c.vStatus = stus.status_id LEFT JOIN tms_project_type AS tpt ON gen.project_type = tpt.pr_type_id group by gen.project_type";
			$Typeinfo = $this->_db->rawQuery($qry);

			$qry = "SELECT gen.order_no AS orderNumber,gen.order_id AS orderId,tpt.project_name AS projectTypeName, cust.created_date AS orderDate, cust.client AS customer,gen.project_name AS projectName, c.vUserName AS contactName,stus.status_name AS clientStatus,gen.company_code AS companyCode,cust.contact AS contactPerson,its.item_status AS itemStatus,gen.project_status AS projectStatus,gen.project_type AS projectType,its.source_lang AS sourceLanguage,its.target_lang AS targetLanguage, its.q_date AS QuentityDate ,SUM(its.total_amount) As TotalAmount FROM tms_general AS gen LEFT JOIN tms_customer AS cust ON gen.order_id=cust.order_id LEFT JOIN tms_items AS its ON gen.order_id=its.order_id LEFT JOIN tms_client AS c ON cust.client = c.iClientId LEFT JOIN tms_user_status AS stus ON c.vStatus = stus.status_id LEFT JOIN tms_project_type AS tpt ON gen.project_type = tpt.pr_type_id group by c.iClientId";
			$customerType = $this->_db->rawQuery($qry);	   		

			$qry = "SELECT gen.heads_up, gen.order_no AS orderNumber, gen.due_date AS DueDate, gen.order_id AS orderId, cust.created_date AS orderDate, cust.client AS customer, gen.project_name AS projectName, c.vUserName AS contactName, stus.status_name AS clientStatus, c.vlogo AS clientlogo, c.tPoInfo AS ponumber, gen.company_code AS companyCode, gen.project_price, gen.expected_start_date, cust.contact AS contactPerson,its.item_number, its.item_status AS itemStatus, its.po_number AS itemPonumber, its.start_date AS itemStartdate, its.due_date AS itemDuedate,its.source_lang AS itemsSourceLang, its.target_lang AS itemsTargetLang, gen.project_status AS projectStatus, gen.project_type AS projectType, its.total_amount AS totalAmount, inc.vUserName AS accountname, concat(tu.vFirstName, ' ', tu.vLastName) AS pm_name, cust.project_coordinator AS project_coordinator_id, cust.project_manager AS project_manager_id, cust.QA_specialist AS qa_specialist_id, ps.project_status_name AS projectstatus_name, ps.status_color AS projectstatus_color, its.q_date AS QuentityDate, SUM(its.total_amount) As TotalAmount FROM tms_items AS its LEFT JOIN tms_general AS gen ON its.order_id = gen.order_id LEFT JOIN tms_customer AS cust ON its.order_id = cust.order_id LEFT JOIN tms_client AS c ON cust.client = c.iClientId LEFT JOIN tms_user_status AS stus ON c.vStatus = stus.status_id LEFT JOIN tms_client_indirect AS inc ON inc.iClientId = cust.indirect_customer LEFT JOIN tms_users AS tu ON tu.iUserId = cust.project_manager LEFT JOIN tms_project_status AS ps ON ps.pr_status_id = gen.project_status group by its.q_date";
			$projectScoopInfo = $this->_db->rawQuery($qry);
	
			$data['data'] = $data;
			$data['info'] = $info;
			$data['Typeinfo'] = $Typeinfo;
			$data['customerType'] = $customerType;
			$data['projectScoopInfo'] = $projectScoopInfo;
			return $data;
		}
		// Previos fun 24may22
		public function statusorderReportFind_(){
			$qry = "SELECT gen.order_no AS orderNumber,gen.order_id AS orderId, cust.created_date AS orderDate, cust.client AS customer,gen.project_name AS projectName, c.vUserName AS contactName,stus.status_name AS clientStatus,gen.company_code AS companyCode,cust.contact AS contactPerson,cust.indirect_customer,its.item_status AS itemStatus,gen.project_status AS projectStatus,gen.project_type AS projectType,its.source_lang AS sourceLanguage,its.target_lang AS targetLanguage,its.total_amount AS totalAmount, SUM(its.total_amount) AS projtotalAmount FROM tms_general AS gen LEFT JOIN tms_customer AS cust ON gen.order_id=cust.order_id LEFT JOIN tms_items AS its ON gen.order_id=its.order_id  LEFT JOIN tms_client AS c ON cust.client = c.iClientId LEFT JOIN tms_user_status AS stus ON c.vStatus = stus.status_id group by gen.order_no";
			$data = $this->_db->rawQuery($qry);

			$qry = "SELECT gen.order_no AS orderNumber,gen.order_id AS orderId, cust.created_date AS orderDate, cust.client AS customer,gen.project_name AS projectName, c.vUserName AS contactName,stus.status_name AS clientStatus,gen.company_code AS companyCode,cust.contact AS contactPerson,its.item_status AS itemStatus,gen.project_status AS projectStatus,gen.project_type AS projectType,its.source_lang AS sourceLanguage,its.target_lang AS targetLanguage, its.q_date AS QuentityDate ,SUM(its.total_amount) As TotalAmount FROM tms_general AS gen LEFT JOIN tms_customer AS cust ON gen.order_id=cust.order_id LEFT JOIN tms_items AS its ON gen.order_id=its.order_id  LEFT JOIN tms_client AS c ON cust.client = c.iClientId LEFT JOIN tms_user_status AS stus ON c.vStatus = stus.status_id group by its.q_date";
			$info = $this->_db->rawQuery($qry);

			$qry = "SELECT gen.order_no AS orderNumber,gen.project_type,gen.order_id AS orderId,tpt.project_name AS projectTypeName, cust.created_date AS orderDate, cust.client AS customer,gen.project_name AS projectName, c.vUserName AS contactName,stus.status_name AS clientStatus,gen.company_code AS companyCode,cust.contact AS contactPerson,its.item_status AS itemStatus,gen.project_status AS projectStatus,gen.project_type AS projectType,its.source_lang AS sourceLanguage,its.target_lang AS targetLanguage, its.q_date AS QuentityDate ,SUM(its.total_amount) As TotalAmount FROM tms_general AS gen LEFT JOIN tms_customer AS cust ON gen.order_id=cust.order_id LEFT JOIN tms_items AS its ON gen.order_id=its.order_id LEFT JOIN tms_client AS c ON cust.client = c.iClientId LEFT JOIN tms_user_status AS stus ON c.vStatus = stus.status_id LEFT JOIN tms_project_type AS tpt ON gen.project_type = tpt.pr_type_id group by gen.project_type";
			$Typeinfo = $this->_db->rawQuery($qry);

			$qry = "SELECT gen.order_no AS orderNumber,gen.order_id AS orderId,tpt.project_name AS projectTypeName, cust.created_date AS orderDate, cust.client AS customer,gen.project_name AS projectName, c.vUserName AS contactName,stus.status_name AS clientStatus,gen.company_code AS companyCode,cust.contact AS contactPerson,its.item_status AS itemStatus,gen.project_status AS projectStatus,gen.project_type AS projectType,its.source_lang AS sourceLanguage,its.target_lang AS targetLanguage, its.q_date AS QuentityDate ,SUM(its.total_amount) As TotalAmount FROM tms_general AS gen LEFT JOIN tms_customer AS cust ON gen.order_id=cust.order_id LEFT JOIN tms_items AS its ON gen.order_id=its.order_id LEFT JOIN tms_client AS c ON cust.client = c.iClientId LEFT JOIN tms_user_status AS stus ON c.vStatus = stus.status_id LEFT JOIN tms_project_type AS tpt ON gen.project_type = tpt.pr_type_id group by c.iClientId";
			$customerType = $this->_db->rawQuery($qry);	   		

			$qry = "SELECT gen.heads_up, gen.order_no AS orderNumber, gen.due_date AS DueDate, gen.order_id AS orderId, cust.created_date AS orderDate, cust.client AS customer, gen.project_name AS projectName, c.vUserName AS contactName, stus.status_name AS clientStatus, c.vlogo AS clientlogo, c.tPoInfo AS ponumber, gen.company_code AS companyCode, gen.project_price, gen.expected_start_date, cust.contact AS contactPerson,its.item_number, its.item_status AS itemStatus, its.po_number AS itemPonumber, its.start_date AS itemStartdate, its.due_date AS itemDuedate,its.source_lang AS itemsSourceLang, its.target_lang AS itemsTargetLang, gen.project_status AS projectStatus, gen.project_type AS projectType, plang.source_lang AS sourceLanguage, plang.target_lang AS targetLanguage, its.total_amount AS totalAmount, inc.vUserName AS accountname, concat(tu.vFirstName, ' ', tu.vLastName) AS pm_name, cust.project_coordinator AS project_coordinator_id, cust.project_manager AS project_manager_id, cust.QA_specialist AS qa_specialist_id, ps.project_status_name AS projectstatus_name, ps.status_color AS projectstatus_color, its.q_date AS QuentityDate, SUM(its.total_amount) As TotalAmount FROM tms_items AS its LEFT JOIN tms_general AS gen ON its.order_id = gen.order_id LEFT JOIN tms_customer AS cust ON its.order_id = cust.order_id LEFT JOIN tms_proj_language AS plang ON its.order_id = plang.order_id LEFT JOIN tms_client AS c ON cust.client = c.iClientId LEFT JOIN tms_user_status AS stus ON c.vStatus = stus.status_id LEFT JOIN tms_client_indirect AS inc ON inc.iClientId = cust.indirect_customer LEFT JOIN tms_users AS tu ON tu.iUserId = cust.project_manager LEFT JOIN tms_project_status AS ps ON ps.pr_status_id = gen.project_status group by its.q_date";
			$projectScoopInfo = $this->_db->rawQuery($qry);

			$data['data'] = $data;
			$data['info'] = $info;
			$data['Typeinfo'] = $Typeinfo;
			$data['customerType'] = $customerType;
			$data['projectScoopInfo'] = $projectScoopInfo;
			return $data;
		}

		public function ordersearchProjectStatusUpdate($id,$status){
	    	$data['project_status'] = $status;
	    	$data['modified_date'] = date('Y-m-d H:i:s');
	    	$this->_db->where('order_id',$id);
	    	$data = $this->_db->update('tms_general',$data);
	    	return $data;
	    }

	    public function ordersearchItemStatusUpdate($id,$status){
	    	$data['item_status'] = $status;
	    	$data['updated_date'] = date('Y-m-d H:i:s');
	    	$this->_db->where('order_id',$id);
	    	$data = $this->_db->update('tms_items',$data);
	    	return $data;
	    }

		// Project statistics internal
		public function projectStatistics(){
			$qry = "SELECT gen.order_no AS orderNumber, gen.due_date AS DueDate, gen.order_id AS orderId, cust.created_date AS orderDate, cust.client AS customer, gen.project_name AS projectName, c.vUserName AS contactName, stus.status_name AS clientStatus, gen.company_code AS companyCode, cust.contact AS contactPerson, cust.indirect_customer,cust.project_manager as pm_id, cust.indirect_customer,cust.project_coordinator as cordinator_id, cust.indirect_customer, cust.QA_specialist as qa_id, gen.project_status AS projectStatus, gen.project_type AS projectType, concat(tu.vFirstName, ' ', tu.vLastName) AS pm_name FROM tms_general AS gen LEFT JOIN tms_customer AS cust ON gen.order_id = cust.order_id LEFT JOIN tms_client AS c ON cust.client = c.iClientId LEFT JOIN tms_user_status AS stus ON c.vStatus = stus.status_id LEFT JOIN tms_client_indirect AS inc ON inc.iClientId = cust.indirect_customer LEFT JOIN tms_users AS tu ON tu.iUserId = cust.project_manager";
			$data = $this->_db->rawQuery($qry);
		
			$data['data'] = $data;
			return $data;
		}
		public function projectStatisticsLinguist($filterParams){
			$qry = "SELECT gen.order_no AS orderNumber, gen.due_date AS DueDate, gen.order_id AS orderId, cust.created_date AS orderDate, cust.client AS customer, gen.project_name AS projectName, c.vUserName AS contactName, stus.status_name AS clientStatus, gen.company_code AS companyCode, cust.contact AS contactPerson, cust.indirect_customer, cust.project_manager AS pm_id, cust.indirect_customer, cust.project_coordinator AS cordinator_id, cust.indirect_customer, cust.QA_specialist AS qa_id, gen.project_status AS projectStatus, gen.project_type AS projectType, concat(tu.vFirstName, ' ', tu.vLastName) AS pm_name, tsv.resource as resource_id, tci.vUserName as accountName , CONCAT(tcc.vFirstName, ' ', tcc.vLastName) as contact_person FROM tms_general AS gen LEFT JOIN tms_customer AS cust ON gen.order_id = cust.order_id LEFT JOIN tms_client AS c ON cust.client = c.iClientId LEFT JOIN tms_user_status AS stus ON c.vStatus = stus.status_id LEFT JOIN tms_client_indirect AS inc ON inc.iClientId = cust.indirect_customer LEFT JOIN tms_users AS tu ON tu.iUserId = cust.project_manager LEFT JOIN tms_summmery_view AS tsv ON tsv.order_id = gen.order_id LEFT JOIN tms_client_indirect AS tci ON tci.iClientId = cust.indirect_customer  LEFT JOIN tms_client_contact AS tcc ON tcc.iContactId = cust.contact where tsv.resource =". $filterParams['resource_id'] ." GROUP BY gen.order_id";
			$data = $this->_db->rawQuery($qry);

			$data['data'] = $data;
			return $data;
		}
		
		public function ordersearchItemStatusBulkUpdate($data){
			$itemIdsString = implode(",", $data['scoop_array']);
			$update_date = date('Y-m-d H:i:s');
			$item_status = $data['scoop_status'];
			$sql = "UPDATE tms_items SET item_status = $item_status, updated_date = '$update_date' WHERE itemId IN ($itemIdsString)";
			$data = $this->_db->rawQuery($sql);
	    	return $data;
	    }

		public function ordersearchItemStatusBulkUpdate1($post){

			// Get search, order, pagination parameters from the request
			$searchValue = $post['search'] ?? ''; // Search value
			$filterParams = $post['filterParams'] ?? '';
			// Define the columns array corresponding to DataTables columns
			
			function customNumberFormat($input) {
				$decimalSeparator = isset($_COOKIE['DecimalSeparator']) ? $_COOKIE['DecimalSeparator'] : ',';
				$numStr = (string)$input;
				$number = str_replace('.', $decimalSeparator, $numStr);
				$number = str_replace(',', '.', $numStr); 
			
				return $number;
			}

			if($post && isset($post['is_all_selected'] ) && $post['is_all_selected']==1){
		
				$searchValueNum = customNumberFormat($searchValue);
				$qry_invc = '';
				// Apply search functionality
				if (!empty($searchValue)) {
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
					$text = "its.total_amount";
				}else{
					$text = "its.total_amount / its.base_currency_rate";
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
			
				$querydata1 = "SELECT 
						its.itemId AS scoopId
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
					GROUP BY its.itemId";
			
				$scoop_array = $this->_db->rawQuery($querydata1);
				$orderIds = array_column($scoop_array, 'scoopId');
				$itemIdsArray = array_unique($orderIds);  // Remove duplicate item IDs
				
				if (isset($post['unselected_ids'])) {
					if (is_string($post['unselected_ids'])) {
						// If it's a string, convert it to an array
						$unselectedIdsArray = explode(',', $post['unselected_ids']);
					} elseif (is_array($post['unselected_ids'])) {
						// If it's already an array, use it directly
						$unselectedIdsArray = $post['unselected_ids'];
					}
					
					// Exclude unselected_ids from the itemIdsArray
					$itemIdsArray = array_diff($itemIdsArray, $unselectedIdsArray);
				}

				//if invoice is created then can't change status
				$itemIdsList = implode(',', array_map('intval', $itemIdsArray)); // Ensure IDs are integers for safety
				$this->_db->where("invc_scoop_id IN ($itemIdsList)");
				$invoiceSoops = $this->_db->get('tms_invoice_scoops iscp');
				$invoiceScoopIds = array_column($invoiceSoops, 'invc_scoop_id'); // Get all invc_scoop_id values
				$itemIdsArray = array_diff($itemIdsArray, $invoiceScoopIds);

				// Convert back to a string
				$itemIdsString = implode(',', $itemIdsArray);
			}else{
				$updateIds = $post['checkIds'];
				$updateIdsArrSttring = implode(',', $updateIds);
				
				$update_date = date('Y-m-d H:i:s');
				$item_status = $post['scoop_status'];
				
				$updateSql = "
				UPDATE tms_items 
				SET item_status = $item_status, updated_date = '$update_date' 
				WHERE itemId IN ($updateIdsArrSttring) 
				AND itemId NOT IN (
					SELECT invc_scoop_id FROM tms_invoice_scoops
				) ";

				$response = $this->_db->rawQuery($updateSql);
				
				return $response;
			}
		
			// Update status only for the remaining selected items
			if (!empty($itemIdsString)) {
				$update_date = date('Y-m-d H:i:s');
				$item_status = $post['scoop_status'];
				
				$sql = "UPDATE tms_items SET item_status = $item_status, updated_date = '$update_date' 
						WHERE itemId IN ($itemIdsString)";
				// Execute update query
				$response = $this->_db->rawQuery($sql);
				return $response;
			} else {
				return 'No items to update';
			}
	    }
}