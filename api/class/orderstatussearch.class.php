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
			$qry = "SELECT gen.order_no AS orderNumber, gen.due_date AS DueDate, gen.order_id AS orderId, cust.created_date AS orderDate, cust.client AS customer, gen.project_name AS projectName, c.vUserName AS contactName, stus.status_name AS clientStatus, gen.company_code AS companyCode, cust.contact AS contactPerson, cust.indirect_customer,its.item_number, its.item_status AS itemStatus, its.po_number AS itemPonumber,its.item_email_subject as emailSubject, DATE_FORMAT(its.due_date,'%d.%m.%Y') AS itemDuedate,its.source_lang AS sourceLanguage, its.target_lang AS targetLanguage, gen.project_status AS projectStatus, gen.project_type AS projectType, plang.source_lang AS sourceLanguage, plang.target_lang AS targetLanguage, its.total_amount AS totalAmount, tu.vUserName AS pm_name, (SELECT SUM(sv.total_price) FROM `tms_summmery_view` as sv WHERE sv.order_id = its.order_id AND sv.item_id = its.item_number) as jobTotalPrice FROM tms_items AS its LEFT JOIN tms_general AS gen ON its.order_id = gen.order_id LEFT JOIN tms_customer AS cust ON its.order_id = cust.order_id LEFT JOIN tms_proj_language AS plang ON its.order_id = plang.order_id LEFT JOIN tms_client AS c ON cust.client = c.iClientId LEFT JOIN tms_user_status AS stus ON c.vStatus = stus.status_id LEFT JOIN tms_client_indirect AS inc ON inc.iClientId = cust.indirect_customer LEFT JOIN tms_users AS tu ON tu.iUserId = cust.project_manager LEFT JOIN tms_project_status AS ps ON ps.pr_status_id = gen.project_status";
			$data = $this->_db->rawQuery($qry);

			$qry = "SELECT gen.order_no AS orderNumber,gen.order_id AS orderId, cust.created_date AS orderDate, cust.client AS customer,gen.project_name AS projectName, c.vUserName AS contactName,stus.status_name AS clientStatus,gen.company_code AS companyCode,cust.contact AS contactPerson,its.item_status AS itemStatus,gen.project_status AS projectStatus,gen.project_type AS projectType,its.source_lang AS sourceLanguage,its.target_lang AS targetLanguage, its.q_date AS QuentityDate ,SUM(its.total_amount) As TotalAmount FROM tms_general AS gen LEFT JOIN tms_customer AS cust ON gen.order_id=cust.order_id LEFT JOIN tms_items AS its ON gen.order_id=its.order_id  LEFT JOIN tms_client AS c ON cust.client = c.iClientId LEFT JOIN tms_user_status AS stus ON c.vStatus = stus.status_id group by its.q_date";
			$info = $this->_db->rawQuery($qry);

			$qry = "SELECT gen.order_no AS orderNumber,gen.project_type,gen.order_id AS orderId,tpt.project_name AS projectTypeName, cust.created_date AS orderDate, cust.client AS customer,gen.project_name AS projectName, c.vUserName AS contactName,stus.status_name AS clientStatus,gen.company_code AS companyCode,cust.contact AS contactPerson,its.item_status AS itemStatus,gen.project_status AS projectStatus,gen.project_type AS projectType,its.source_lang AS sourceLanguage,its.target_lang AS targetLanguage, its.q_date AS QuentityDate ,SUM(its.total_amount) As TotalAmount FROM tms_general AS gen LEFT JOIN tms_customer AS cust ON gen.order_id=cust.order_id LEFT JOIN tms_items AS its ON gen.order_id=its.order_id LEFT JOIN tms_client AS c ON cust.client = c.iClientId LEFT JOIN tms_user_status AS stus ON c.vStatus = stus.status_id LEFT JOIN tms_project_type AS tpt ON gen.project_type = tpt.pr_type_id group by gen.project_type";
			$Typeinfo = $this->_db->rawQuery($qry);

			$qry = "SELECT gen.order_no AS orderNumber,gen.order_id AS orderId,tpt.project_name AS projectTypeName, cust.created_date AS orderDate, cust.client AS customer,gen.project_name AS projectName, c.vUserName AS contactName,stus.status_name AS clientStatus,gen.company_code AS companyCode,cust.contact AS contactPerson,its.item_status AS itemStatus,gen.project_status AS projectStatus,gen.project_type AS projectType,its.source_lang AS sourceLanguage,its.target_lang AS targetLanguage, its.q_date AS QuentityDate ,SUM(its.total_amount) As TotalAmount FROM tms_general AS gen LEFT JOIN tms_customer AS cust ON gen.order_id=cust.order_id LEFT JOIN tms_items AS its ON gen.order_id=its.order_id LEFT JOIN tms_client AS c ON cust.client = c.iClientId LEFT JOIN tms_user_status AS stus ON c.vStatus = stus.status_id LEFT JOIN tms_project_type AS tpt ON gen.project_type = tpt.pr_type_id group by c.iClientId";
			$customerType = $this->_db->rawQuery($qry);	   		

			$qry = "SELECT gen.heads_up, gen.order_no AS orderNumber, gen.due_date AS DueDate, gen.order_id AS orderId, cust.created_date AS orderDate, cust.client AS customer, gen.project_name AS projectName, c.vUserName AS contactName, stus.status_name AS clientStatus, c.vlogo AS clientlogo, c.tPoInfo AS ponumber, gen.company_code AS companyCode, gen.project_price, gen.expected_start_date, cust.contact AS contactPerson,its.item_number, its.item_status AS itemStatus, its.po_number AS itemPonumber, its.start_date AS itemStartdate, its.due_date AS itemDuedate,its.source_lang AS itemsSourceLang, its.target_lang AS itemsTargetLang, gen.project_status AS projectStatus, gen.project_type AS projectType, plang.source_lang AS sourceLanguage, plang.target_lang AS targetLanguage, its.total_amount AS totalAmount, inc.vUserName AS accountname, tu.vUserName AS pm_name, cust.project_coordinator AS project_coordinator_id, cust.project_manager AS project_manager_id, cust.QA_specialist AS qa_specialist_id, ps.project_status_name AS projectstatus_name, ps.status_color AS projectstatus_color, its.q_date AS QuentityDate, SUM(its.total_amount) As TotalAmount FROM tms_items AS its LEFT JOIN tms_general AS gen ON its.order_id = gen.order_id LEFT JOIN tms_customer AS cust ON its.order_id = cust.order_id LEFT JOIN tms_proj_language AS plang ON its.order_id = plang.order_id LEFT JOIN tms_client AS c ON cust.client = c.iClientId LEFT JOIN tms_user_status AS stus ON c.vStatus = stus.status_id LEFT JOIN tms_client_indirect AS inc ON inc.iClientId = cust.indirect_customer LEFT JOIN tms_users AS tu ON tu.iUserId = cust.project_manager LEFT JOIN tms_project_status AS ps ON ps.pr_status_id = gen.project_status group by its.q_date";
			$projectScoopInfo = $this->_db->rawQuery($qry);
	
			$data['data'] = $data;
			$data['info'] = $info;
			$data['Typeinfo'] = $Typeinfo;
			$data['customerType'] = $customerType;
			$data['projectScoopInfo'] = $projectScoopInfo;
			return $data;
		}

		public function statusorderReportFilter($filterParams){
			//print_r($filterParams);
			// if(isset($filterParams['companyCode'])){
			// 	$this->_db->where('its.companyCode', $filterParams['companyCode']);
			// }
			if(isset($filterParams['pm_name'])){
				$this->_db->where('tu.iUserId', $filterParams['pm_name']);
			}
			if(isset($filterParams['emailSubject'])){
				$this->_db->where('its.item_email_subject', $filterParams['emailSubject']);
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
				$this->_db->where('its.item_status', $filterParams['itemStatus']);
			}
			if(isset($filterParams['projectStatus'])){
				$this->_db->where('gen.project_status', $filterParams['projectStatus']);
			}
			if(isset($filterParams['projectType'])){
				$this->_db->where('gen.project_type', $filterParams['projectType']);
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
				$this->_db->where('its.due_date', Array ($Frm,$To),'BETWEEN');
			}
			if(isset($filterParams['createDateFrom']) && isset($filterParams['createDateTo'])){
				$Frm = $filterParams['createDateFrom'].' '.'00:00:00';
				$To = $filterParams['createDateTo'].' '.'00:00:00';
				$this->_db->where('its.start_date', Array ($Frm,$To),'BETWEEN');
			}
			// if(isset($filterParams['itemDuedateStart']) && isset($filterParams['itemDuedateEnd'])){
			// 	$Frm = $filterParams['itemDuedateStart'].' '.'00:00:00';
			// 	$To = $filterParams['endItemDuedate'].' '.'00:00:00';
			// 	$this->_db->where('its.due_date', Array ($Frm,$To),'BETWEEN');
			// }

			// $qry = "SELECT gen.order_no AS orderNumber, gen.due_date AS DueDate, gen.order_id AS orderId, cust.created_date AS orderDate, cust.client AS customer, gen.project_name AS projectName, c.vUserName AS contactName, stus.status_name AS clientStatus, gen.company_code AS companyCode, cust.contact AS contactPerson, cust.indirect_customer,its.item_number, its.item_status AS itemStatus, its.po_number AS itemPonumber,its.item_email_subject as emailSubject, DATE_FORMAT(its.due_date,'%d.%m.%Y') AS itemDuedate,its.source_lang AS sourceLanguage, its.target_lang AS targetLanguage, gen.project_status AS projectStatus, gen.project_type AS projectType, plang.source_lang AS sourceLanguage, plang.target_lang AS targetLanguage, its.total_amount AS totalAmount, tu.vUserName AS pm_name, (SELECT SUM(sv.total_price) FROM `tms_summmery_view` as sv WHERE sv.order_id = its.order_id AND sv.item_id = its.item_number) as jobTotalPrice FROM tms_items AS its LEFT JOIN tms_general AS gen ON its.order_id = gen.order_id LEFT JOIN tms_customer AS cust ON its.order_id = cust.order_id LEFT JOIN tms_proj_language AS plang ON its.order_id = plang.order_id LEFT JOIN tms_client AS c ON cust.client = c.iClientId LEFT JOIN tms_user_status AS stus ON c.vStatus = stus.status_id LEFT JOIN tms_client_indirect AS inc ON inc.iClientId = cust.indirect_customer LEFT JOIN tms_users AS tu ON tu.iUserId = cust.project_manager LEFT JOIN tms_project_status AS ps ON ps.pr_status_id = gen.project_status";
			// $data = $this->_db->rawQuery($qry);
			$this->_db->join('tms_general gen', 'its.order_id = gen.order_id','LEFT');
			$this->_db->join('tms_customer cust', 'its.order_id = cust.order_id','LEFT');
			$this->_db->join('tms_proj_language plang', 'its.order_id = plang.order_id','LEFT');
			$this->_db->join('tms_client c', 'cust.client = c.iClientId','LEFT');
			$this->_db->join('tms_user_status stus', 'c.vStatus = stus.status_id','LEFT');
			$this->_db->join('tms_client_indirect inc', 'inc.iClientId = cust.indirect_customer','LEFT');
			$this->_db->join('tms_users tu', 'tu.iUserId = cust.project_manager','LEFT');
			$this->_db->join('tms_project_type tpt', 'its.project_type = tpt.pr_type_id','LEFT');
			$this->_db->join('tms_project_status ps', 'ps.pr_status_id = gen.project_status','LEFT');
			$data = $this->_db->get('tms_items its', null,' gen.order_no AS orderNumber, gen.due_date AS DueDate, gen.order_id AS orderId, cust.created_date AS orderDate, cust.client AS customer, gen.project_name AS projectName, c.vUserName AS contactName, c.iClientId, stus.status_name AS clientStatus, gen.company_code AS companyCode, cust.contact AS contactPerson, cust.indirect_customer,its.item_number, its.item_status AS itemStatus, its.po_number AS itemPonumber,its.item_email_subject as emailSubject, its.project_type AS projectType, DATE_FORMAT(its.due_date, "%d.%m.%Y") AS itemDuedate,DATE_FORMAT(its.start_date, "%d.%m.%Y") AS itemCreatedDate,its.source_lang AS sourceLanguage, its.target_lang AS targetLanguage, gen.project_status AS projectStatus, tpt.project_name AS projectTypeName, plang.source_lang AS sourceLanguage, plang.target_lang AS targetLanguage, its.q_date AS QuentityDate, its.total_amount AS totalAmount, tu.vUserName AS pm_name');
			//echo $this->_db->getLastQuery(); exit;	
			//$qry = "SELECT gen.order_no AS orderNumber,gen.order_id AS orderId, cust.created_date AS orderDate, cust.client AS customer,gen.project_name AS projectName, c.vUserName AS contactName,stus.status_name AS clientStatus,gen.company_code AS companyCode,cust.contact AS contactPerson,its.item_status AS itemStatus,gen.project_status AS projectStatus,gen.project_type AS projectType,its.source_lang AS sourceLanguage,its.target_lang AS targetLanguage, its.q_date AS QuentityDate ,SUM(its.total_amount) As TotalAmount FROM tms_general AS gen LEFT JOIN tms_customer AS cust ON gen.order_id=cust.order_id LEFT JOIN tms_items AS its ON gen.order_id=its.order_id  LEFT JOIN tms_client AS c ON cust.client = c.iClientId LEFT JOIN tms_user_status AS stus ON c.vStatus = stus.status_id group by its.q_date";
			$qry = "SELECT gen.order_no AS orderNumber,gen.order_id AS orderId, cust.created_date AS orderDate, cust.client AS customer,gen.project_name AS projectName, c.vUserName AS contactName,stus.status_name AS clientStatus,gen.company_code AS companyCode,cust.contact AS contactPerson,its.item_status AS itemStatus,gen.project_status AS projectStatus,gen.project_type AS projectType,its.source_lang AS sourceLanguage,its.target_lang AS targetLanguage, its.q_date AS QuentityDate ,SUM(its.total_amount) As TotalAmount FROM tms_items its LEFT JOIN tms_general gen ON its.order_id = gen.order_id LEFT JOIN tms_customer cust ON its.order_id = cust.order_id LEFT JOIN tms_proj_language plang ON its.order_id = plang.order_id LEFT JOIN tms_client c ON cust.client = c.iClientId LEFT JOIN tms_user_status stus ON c.vStatus = stus.status_id LEFT JOIN tms_client_indirect inc ON inc.iClientId = cust.indirect_customer LEFT JOIN tms_users tu ON tu.iUserId = cust.project_manager LEFT JOIN tms_project_status ps ON ps.pr_status_id = gen.project_status group by its.q_date";
			$info = $this->_db->rawQuery($qry);
			
			$qry = "SELECT gen.order_no AS orderNumber,gen.project_type,gen.order_id AS orderId,tpt.project_name AS projectTypeName, cust.created_date AS orderDate, cust.client AS customer,gen.project_name AS projectName, c.vUserName AS contactName,stus.status_name AS clientStatus,gen.company_code AS companyCode,cust.contact AS contactPerson,its.item_status AS itemStatus,gen.project_status AS projectStatus,gen.project_type AS projectType,its.source_lang AS sourceLanguage,its.target_lang AS targetLanguage, its.q_date AS QuentityDate ,SUM(its.total_amount) As TotalAmount FROM tms_general AS gen LEFT JOIN tms_customer AS cust ON gen.order_id=cust.order_id LEFT JOIN tms_items AS its ON gen.order_id=its.order_id LEFT JOIN tms_client AS c ON cust.client = c.iClientId LEFT JOIN tms_user_status AS stus ON c.vStatus = stus.status_id LEFT JOIN tms_project_type AS tpt ON gen.project_type = tpt.pr_type_id group by gen.project_type";
			$Typeinfo = $this->_db->rawQuery($qry);

			$qry = "SELECT gen.order_no AS orderNumber,gen.order_id AS orderId,tpt.project_name AS projectTypeName, cust.created_date AS orderDate, cust.client AS customer,gen.project_name AS projectName, c.vUserName AS contactName,stus.status_name AS clientStatus,gen.company_code AS companyCode,cust.contact AS contactPerson,its.item_status AS itemStatus,gen.project_status AS projectStatus,gen.project_type AS projectType,its.source_lang AS sourceLanguage,its.target_lang AS targetLanguage, its.q_date AS QuentityDate ,SUM(its.total_amount) As TotalAmount FROM tms_general AS gen LEFT JOIN tms_customer AS cust ON gen.order_id=cust.order_id LEFT JOIN tms_items AS its ON gen.order_id=its.order_id LEFT JOIN tms_client AS c ON cust.client = c.iClientId LEFT JOIN tms_user_status AS stus ON c.vStatus = stus.status_id LEFT JOIN tms_project_type AS tpt ON gen.project_type = tpt.pr_type_id group by c.iClientId";
			$customerType = $this->_db->rawQuery($qry);	   		

			$qry = "SELECT gen.heads_up, gen.order_no AS orderNumber, gen.due_date AS DueDate, gen.order_id AS orderId, cust.created_date AS orderDate, cust.client AS customer, gen.project_name AS projectName, c.vUserName AS contactName, stus.status_name AS clientStatus, c.vlogo AS clientlogo, c.tPoInfo AS ponumber, gen.company_code AS companyCode, gen.project_price, gen.expected_start_date, cust.contact AS contactPerson,its.item_number, its.item_status AS itemStatus, its.po_number AS itemPonumber, its.start_date AS itemStartdate, its.due_date AS itemDuedate,its.source_lang AS itemsSourceLang, its.target_lang AS itemsTargetLang, gen.project_status AS projectStatus, gen.project_type AS projectType, plang.source_lang AS sourceLanguage, plang.target_lang AS targetLanguage, its.total_amount AS totalAmount, inc.vUserName AS accountname, tu.vUserName AS pm_name, cust.project_coordinator AS project_coordinator_id, cust.project_manager AS project_manager_id, cust.QA_specialist AS qa_specialist_id, ps.project_status_name AS projectstatus_name, ps.status_color AS projectstatus_color, its.q_date AS QuentityDate, SUM(its.total_amount) As TotalAmount FROM tms_items AS its LEFT JOIN tms_general AS gen ON its.order_id = gen.order_id LEFT JOIN tms_customer AS cust ON its.order_id = cust.order_id LEFT JOIN tms_proj_language AS plang ON its.order_id = plang.order_id LEFT JOIN tms_client AS c ON cust.client = c.iClientId LEFT JOIN tms_user_status AS stus ON c.vStatus = stus.status_id LEFT JOIN tms_client_indirect AS inc ON inc.iClientId = cust.indirect_customer LEFT JOIN tms_users AS tu ON tu.iUserId = cust.project_manager LEFT JOIN tms_project_status AS ps ON ps.pr_status_id = gen.project_status group by its.q_date";
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

			$qry = "SELECT gen.heads_up, gen.order_no AS orderNumber, gen.due_date AS DueDate, gen.order_id AS orderId, cust.created_date AS orderDate, cust.client AS customer, gen.project_name AS projectName, c.vUserName AS contactName, stus.status_name AS clientStatus, c.vlogo AS clientlogo, c.tPoInfo AS ponumber, gen.company_code AS companyCode, gen.project_price, gen.expected_start_date, cust.contact AS contactPerson,its.item_number, its.item_status AS itemStatus, its.po_number AS itemPonumber, its.start_date AS itemStartdate, its.due_date AS itemDuedate,its.source_lang AS itemsSourceLang, its.target_lang AS itemsTargetLang, gen.project_status AS projectStatus, gen.project_type AS projectType, plang.source_lang AS sourceLanguage, plang.target_lang AS targetLanguage, its.total_amount AS totalAmount, inc.vUserName AS accountname, tu.vUserName AS pm_name, cust.project_coordinator AS project_coordinator_id, cust.project_manager AS project_manager_id, cust.QA_specialist AS qa_specialist_id, ps.project_status_name AS projectstatus_name, ps.status_color AS projectstatus_color, its.q_date AS QuentityDate, SUM(its.total_amount) As TotalAmount FROM tms_items AS its LEFT JOIN tms_general AS gen ON its.order_id = gen.order_id LEFT JOIN tms_customer AS cust ON its.order_id = cust.order_id LEFT JOIN tms_proj_language AS plang ON its.order_id = plang.order_id LEFT JOIN tms_client AS c ON cust.client = c.iClientId LEFT JOIN tms_user_status AS stus ON c.vStatus = stus.status_id LEFT JOIN tms_client_indirect AS inc ON inc.iClientId = cust.indirect_customer LEFT JOIN tms_users AS tu ON tu.iUserId = cust.project_manager LEFT JOIN tms_project_status AS ps ON ps.pr_status_id = gen.project_status group by its.q_date";
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
			$qry = "SELECT gen.order_no AS orderNumber, gen.due_date AS DueDate, gen.order_id AS orderId, cust.created_date AS orderDate, cust.client AS customer, gen.project_name AS projectName, c.vUserName AS contactName, stus.status_name AS clientStatus, gen.company_code AS companyCode, cust.contact AS contactPerson, cust.indirect_customer,cust.project_manager as pm_id, cust.indirect_customer,cust.project_coordinator as cordinator_id, cust.indirect_customer, cust.QA_specialist as qa_id, gen.project_status AS projectStatus, gen.project_type AS projectType, tu.vUserName AS pm_name FROM tms_general AS gen LEFT JOIN tms_customer AS cust ON gen.order_id = cust.order_id LEFT JOIN tms_client AS c ON cust.client = c.iClientId LEFT JOIN tms_user_status AS stus ON c.vStatus = stus.status_id LEFT JOIN tms_client_indirect AS inc ON inc.iClientId = cust.indirect_customer LEFT JOIN tms_users AS tu ON tu.iUserId = cust.project_manager";
			$data = $this->_db->rawQuery($qry);
		
			$data['data'] = $data;
			return $data;
		}
		public function projectStatisticsLinguist($filterParams){
			$qry = "SELECT gen.order_no AS orderNumber, gen.due_date AS DueDate, gen.order_id AS orderId, cust.created_date AS orderDate, cust.client AS customer, gen.project_name AS projectName, c.vUserName AS contactName, stus.status_name AS clientStatus, gen.company_code AS companyCode, cust.contact AS contactPerson, cust.indirect_customer, cust.project_manager AS pm_id, cust.indirect_customer, cust.project_coordinator AS cordinator_id, cust.indirect_customer, cust.QA_specialist AS qa_id, gen.project_status AS projectStatus, gen.project_type AS projectType, tu.vUserName AS pm_name, tsv.resource as resource_id, tci.vUserName as accountName , CONCAT(tcc.vFirstName, ' ', tcc.vLastName) as contact_person FROM tms_general AS gen LEFT JOIN tms_customer AS cust ON gen.order_id = cust.order_id LEFT JOIN tms_client AS c ON cust.client = c.iClientId LEFT JOIN tms_user_status AS stus ON c.vStatus = stus.status_id LEFT JOIN tms_client_indirect AS inc ON inc.iClientId = cust.indirect_customer LEFT JOIN tms_users AS tu ON tu.iUserId = cust.project_manager LEFT JOIN tms_summmery_view AS tsv ON tsv.order_id = gen.order_id LEFT JOIN tms_client_indirect AS tci ON tci.iClientId = cust.indirect_customer  LEFT JOIN tms_client_contact AS tcc ON tcc.iContactId = cust.contact where tsv.resource =". $filterParams['resource_id'] ." GROUP BY gen.order_id";
			$data = $this->_db->rawQuery($qry);

			$data['data'] = $data;
			return $data;
		}
		
}