<?php
class dashboard {

    public function __construct() {
        $this->_db = db::getInstance();
        $this->_conn = new mysqli(DB_SERVER, DB_USERNAME, DB_PASSWORD, DB_DATABASE);
    }

    public function OrderGet() {
        //$qry = "SELECT gen.heads_up,gen.order_no AS orderNumber,gen.due_date AS DueDate,gen.order_id AS orderId, cust.created_date AS orderDate, cust.client AS customer,gen.project_name AS projectName, c.vUserName AS contactName,stus.status_name AS clientStatus,c.vlogo AS clientlogo,c.tPoInfo AS ponumber,gen.company_code AS companyCode,gen.project_price,gen.expected_start_date,cust.contact AS contactPerson,its.item_status AS itemStatus,gen.project_status AS projectStatus,gen.project_type AS projectType,plang.source_lang AS sourceLanguage,plang.target_lang AS targetLanguage,its.total_amount AS totalAmount,inc.vUserName as accountname,tu.vUserName as pm_name ,ps.project_status_name as projectstatus_name ,ps.status_color as projectstatus_color FROM tms_general AS gen LEFT JOIN tms_customer AS cust ON gen.order_id=cust.order_id LEFT JOIN tms_items AS its ON gen.order_id=its.order_id LEFT JOIN tms_proj_language As plang ON gen.order_id = plang.order_id LEFT JOIN tms_client AS c ON cust.client = c.iClientId LEFT JOIN tms_user_status AS stus ON c.vStatus = stus.status_id LEFT JOIN tms_client_indirect as inc ON inc.iClientId = cust.indirect_customer LEFT JOIN tms_users as tu ON tu.iUserId = cust.project_manager LEFT JOIN tms_project_status as ps ON ps.pr_status_id = gen.project_status group by gen.order_no";
        $qry = "SELECT gen.heads_up, gen.order_no AS orderNumber, gen.due_date AS DueDate, gen.order_id AS orderId, cust.created_date AS orderDate, cust.client AS customer, gen.project_name AS projectName, c.vUserName AS contactName, stus.status_name AS clientStatus, c.vlogo AS clientlogo, c.tPoInfo AS ponumber, gen.company_code AS companyCode, gen.project_price, gen.expected_start_date, cust.contact AS contactPerson, its.item_status AS itemStatus, its.po_number AS itemPonumber, its.start_date AS itemStartdate, its.due_date AS itemDuedate,its.source_lang AS itemsSourceLang, its.target_lang AS itemsTargetLang, gen.project_status AS projectStatus, gen.project_type AS projectType, plang.source_lang AS sourceLanguage, plang.target_lang AS targetLanguage, its.total_amount AS totalAmount, inc.vUserName AS accountname, tu.vUserName AS pm_name, ps.project_status_name AS projectstatus_name, ps.status_color AS projectstatus_color FROM tms_items AS its LEFT JOIN tms_general AS gen ON its.order_id = gen.order_id LEFT JOIN tms_customer AS cust ON its.order_id = cust.order_id LEFT JOIN tms_proj_language AS plang ON its.order_id = plang.order_id LEFT JOIN tms_client AS c ON cust.client = c.iClientId LEFT JOIN tms_user_status AS stus ON c.vStatus = stus.status_id LEFT JOIN tms_client_indirect AS inc ON inc.iClientId = cust.indirect_customer LEFT JOIN tms_users AS tu ON tu.iUserId = cust.project_manager LEFT JOIN tms_project_status AS ps ON ps.pr_status_id = gen.project_status ";
        $data = $this->_db->rawQuery($qry);

        foreach($data AS $key=>$value) {
            $data[$key]['items'] = [];
            if ($value['orderId']) {
                $qry1 = "SELECT itemId,order_id, source_lang,target_lang FROM tms_items where order_id = " . $value['orderId'];
                $itemsdata = $this->_db->rawQuery($qry1);
                /*foreach($itemsdata AS $key1=>$fdata) {
                $ddata = $fdata;
                array_push($data[$key], $ddata);
                }*/
                $data[$key]['items'] = $itemsdata;
            }
        }
        return $data;
    }
    
    // public function ProjectsOrderGet($id) {
    //     $qry = "SELECT gen.heads_up,gen.order_no AS orderNumber,gen.due_date AS DueDate,gen.order_id AS orderId, cust.created_date AS orderDate, cust.client AS customer,gen.project_name AS projectName, c.vUserName AS contactName,stus.status_name AS clientStatus,c.vlogo AS clientlogo,c.tPoInfo AS ponumber,gen.company_code AS companyCode,gen.project_price,gen.expected_start_date,cust.contact AS contactPerson,its.item_status AS itemStatus,gen.project_status AS projectStatus,gen.project_type AS projectType,plang.source_lang AS sourceLanguage,plang.target_lang AS targetLanguage,its.total_amount AS totalAmount,inc.vUserName as accountname,tu.vUserName as pm_name ,ps.project_status_name as projectstatus_name ,ps.status_color as projectstatus_color, count(td.order_id) as comment_id FROM tms_general AS gen LEFT JOIN tms_customer AS cust ON gen.order_id=cust.order_id LEFT JOIN tms_items AS its ON gen.order_id=its.order_id LEFT JOIN tms_proj_language As plang ON gen.order_id = plang.order_id LEFT JOIN tms_client AS c ON cust.client = c.iClientId LEFT JOIN tms_user_status AS stus ON c.vStatus = stus.status_id LEFT JOIN tms_client_indirect as inc ON inc.iClientId = cust.indirect_customer LEFT JOIN tms_users as tu ON tu.iUserId = cust.project_manager LEFT JOIN tms_project_status as ps ON ps.pr_status_id = gen.project_status LEFT JOIN tms_discussion AS td ON td.order_id = gen.order_id group by gen.order_no";
    //     $data = $this->_db->rawQuery($qry);
    //     foreach($data AS $key=>$value) {
    //         $qry1 = "SELECT itemId,order_id, source_lang,target_lang FROM tms_items where order_id = ".$value['orderId']  ;
    //         $itemsdata = $this->_db->rawQuery($qry1);
    //         /*foreach($itemsdata AS $key1=>$fdata) {
    //             $ddata = $fdata;
    //             array_push($data[$key], $ddata);
    //         }*/
    //         $data[$key]['items'] = $itemsdata;

    //         $qry2 = "SELECT count(id) as comment_status FROM tms_discussion where order_id = ".$value['orderId']. " AND NOT FIND_IN_SET(".$id.",read_id)"  ;
    //         $commentdata = $this->_db->rawQuery($qry2);
    //         $data[$key]['comment'] = $commentdata;
            
    //     }

    //     return $data;
    // }

    public function ProjectsOrderGet($id) {
        //$qry = "SELECT gen.heads_up, gen.order_no AS orderNumber, gen.due_date AS DueDate, gen.order_id AS orderId, cust.created_date AS orderDate, cust.client AS customer, gen.project_name AS projectName, c.vUserName AS contactName, stus.status_name AS clientStatus, c.vlogo AS clientlogo, c.tPoInfo AS ponumber, gen.company_code AS companyCode, gen.project_price, gen.expected_start_date, cust.contact AS contactPerson,its.item_number, its.item_status AS itemStatus, its.po_number AS itemPonumber, its.start_date AS itemStartdate, its.due_date AS itemDuedate,its.source_lang AS itemsSourceLang, its.target_lang AS itemsTargetLang, its.itemId,  its.price as scoop_price, gen.project_status AS projectStatus, gen.project_type AS projectType, c.project_branch, plang.source_lang AS sourceLanguage, plang.target_lang AS targetLanguage, its.total_amount AS totalAmount, inc.vUserName AS accountname, tu.vUserName AS pm_name, cust.project_coordinator AS project_coordinator_id, cust.project_manager AS project_manager_id, cust.QA_specialist AS qa_specialist_id, ps.project_status_name AS projectstatus_name, ps.status_color AS projectstatus_color FROM tms_items AS its LEFT JOIN tms_general AS gen ON its.order_id = gen.order_id LEFT JOIN tms_customer AS cust ON its.order_id = cust.order_id LEFT JOIN tms_proj_language AS plang ON its.order_id = plang.order_id LEFT JOIN tms_client AS c ON cust.client = c.iClientId LEFT JOIN tms_user_status AS stus ON c.vStatus = stus.status_id LEFT JOIN tms_client_indirect AS inc ON inc.iClientId = cust.indirect_customer LEFT JOIN tms_users AS tu ON tu.iUserId = cust.project_manager LEFT JOIN tms_project_status AS ps ON ps.pr_status_id = gen.project_status";
        //$qry = "SELECT its.itemId, gen.heads_up, gen.order_no AS orderNumber, gen.due_date AS DueDate, gen.order_id AS orderId, cust.created_date AS orderDate, cust.client AS customer, gen.project_name AS projectName, c.vUserName AS contactName, stus.status_name AS clientStatus, c.vlogo AS clientlogo, c.tPoInfo AS ponumber, gen.company_code AS companyCode, gen.project_price, gen.expected_start_date, cust.contact AS contactPerson, its.item_number, its.item_status AS itemStatus, its.po_number AS itemPonumber, its.start_date AS itemStartdate, its.due_date AS itemDuedate, its.source_lang AS itemsSourceLang, its.target_lang AS itemsTargetLang, its.price AS scoop_price, gen.project_status AS projectStatus, gen.project_type AS projectType, c.project_branch, plang.source_lang AS sourceLanguage, plang.target_lang AS targetLanguage, its.total_amount AS totalAmount, inc.vUserName AS accountname, tu.vUserName AS pm_name, sub_tu.vUserName AS sub_pm_name, cust.project_coordinator AS project_coordinator_id, cust.project_manager AS project_manager_id, cust.QA_specialist AS qa_specialist_id, cust.sub_pm AS sub_pm_id, ps.project_status_name AS projectstatus_name, ps.status_color AS projectstatus_color FROM tms_items AS its LEFT JOIN tms_general AS gen ON its.order_id = gen.order_id LEFT JOIN tms_customer AS cust ON its.order_id = cust.order_id LEFT JOIN tms_proj_language AS plang ON its.order_id = plang.order_id LEFT JOIN tms_client AS c ON cust.client = c.iClientId LEFT JOIN tms_user_status AS stus ON c.vStatus = stus.status_id LEFT JOIN tms_client_indirect AS inc ON inc.iClientId = cust.indirect_customer LEFT JOIN tms_users AS tu ON tu.iUserId = cust.project_manager LEFT JOIN tms_users AS sub_tu ON sub_tu.iUserId = cust.sub_pm LEFT JOIN tms_project_status AS ps ON ps.pr_status_id = gen.project_status";
        //$qry = "SELECT its.itemId, its.heads_up, gen.order_no AS orderNumber, gen.due_date AS DueDate, gen.order_id AS orderId, cust.created_date AS orderDate, cust.client AS customer, gen.project_name AS projectName, c.vUserName AS contactName,  c.iClientId, stus.status_name AS clientStatus, c.vlogo AS clientlogo, c.tPoInfo AS ponumber, gen.company_code AS companyCode, gen.project_price, gen.expected_start_date, cust.contact AS contactPerson, its.item_number, its.po_number AS itemPonumber, its.start_date AS itemStartdate, its.due_date AS itemDuedate, its.upcomingDate, its.source_lang AS itemsSourceLang, its.target_lang AS itemsTargetLang, its.price AS scoop_price, gen.project_status AS projectStatus, gen.project_type AS projectType, c.project_branch, plang.source_lang AS sourceLanguage, plang.target_lang AS targetLanguage, its.total_amount AS totalAmount, inc.vUserName AS accountname, tu.vUserName AS pm_name, CONCAT(tu.vFirstName, ' ', tu.vLastName) as pm_fullName, sub_tu.vUserName AS sub_pm_name, cust.project_coordinator AS project_coordinator_id, cust.project_manager AS project_manager_id, cust.QA_specialist AS qa_specialist_id, cust.sub_pm AS sub_pm_id, ps.project_status_name AS projectstatus_name, ps.status_color AS projectstatus_color, tis.item_status_name AS itemStatus, tis.item_status_id AS itemStatusId, c.client_currency, cp.price_currency, cp2.price_currency AS price_currency2 FROM tms_items AS its LEFT JOIN tms_general AS gen ON its.order_id = gen.order_id LEFT JOIN tms_customer AS cust ON its.order_id = cust.order_id LEFT JOIN tms_proj_language AS plang ON its.order_id = plang.order_id LEFT JOIN tms_client AS c ON cust.client = c.iClientId LEFT JOIN tms_user_status AS stus ON c.vStatus = stus.status_id LEFT JOIN tms_client_indirect AS inc ON inc.iClientId = cust.indirect_customer LEFT JOIN tms_users AS tu ON tu.iUserId = cust.project_manager LEFT JOIN tms_users AS sub_tu ON sub_tu.iUserId = cust.sub_pm LEFT JOIN tms_project_status AS ps ON ps.pr_status_id = gen.project_status LEFT JOIN tms_customer_price_list AS cp ON its.project_pricelist = cp.price_list_id LEFT JOIN tms_item_status AS tis ON its.item_status = tis.item_status_id LEFT JOIN ( SELECT resource_id, price_currency FROM tms_customer_price_list WHERE price_id = 1 GROUP BY resource_id ) AS cp2 ON cp2.resource_id = cust.client WHERE its.order_id !=0 ";
        //$qry = "SELECT its.itemId, its.heads_up, gen.order_no AS orderNumber, gen.due_date AS DueDate, gen.order_id AS orderId, cust.created_date AS orderDate, cust.client AS customer, gen.project_name AS projectName, c.vUserName AS contactName, c.iClientId, stus.status_name AS clientStatus, c.vlogo AS clientlogo, c.tPoInfo AS ponumber, gen.company_code AS companyCode, gen.project_price, gen.expected_start_date, cust.contact AS contactPerson, its.item_number, its.po_number AS itemPonumber, its.start_date AS itemStartdate, its.due_date AS itemDuedate, its.upcomingDate, its.source_lang AS itemsSourceLang, its.target_lang AS itemsTargetLang, its.price AS scoop_price, gen.project_status AS projectStatus, gen.project_type AS projectType, c.project_branch, plang.source_lang AS sourceLanguage, plang.target_lang AS targetLanguage, its.total_price AS totalAmount, inc.vUserName AS accountname, tu.vUserName AS pm_name, CONCAT(tu.vFirstName, ' ', tu.vLastName) AS pm_fullName, sub_tu.vUserName AS sub_pm_name, cust.project_coordinator AS project_coordinator_id, cust.project_manager AS project_manager_id, cust.QA_specialist AS qa_specialist_id, cust.sub_pm AS sub_pm_id, ps.project_status_name AS projectstatus_name, ps.status_color AS projectstatus_color, tis.item_status_name AS itemStatus, tis.item_status_id AS itemStatusId, c.client_currency, cp.price_currency, cp2.price_currency AS price_currency2, GROUP_CONCAT(DISTINCT(jsv.resources)) AS linguistId, GROUP_CONCAT(DISTINCT(jsv.vUserName)) AS linguistName, COUNT(td.id) as comment_status, COUNT(td.id) as comment_id FROM tms_items AS its LEFT JOIN tms_general AS gen ON its.order_id = gen.order_id LEFT JOIN tms_customer AS cust ON its.order_id = cust.order_id LEFT JOIN tms_proj_language AS plang ON its.order_id = plang.order_id LEFT JOIN tms_client AS c ON cust.client = c.iClientId LEFT JOIN tms_user_status AS stus ON c.vStatus = stus.status_id LEFT JOIN tms_client_indirect AS inc ON inc.iClientId = cust.indirect_customer LEFT JOIN tms_users AS tu ON tu.iUserId = cust.project_manager LEFT JOIN tms_users AS sub_tu ON sub_tu.iUserId = cust.sub_pm LEFT JOIN tms_project_status AS ps ON ps.pr_status_id = gen.project_status LEFT JOIN tms_customer_price_list AS cp ON its.project_pricelist = cp.price_list_id LEFT JOIN tms_item_status AS tis ON its.item_status = tis.item_status_id LEFT JOIN ( SELECT resource_id, price_currency FROM tms_customer_price_list WHERE price_id = 1 GROUP BY resource_id ) AS cp2 ON cp2.resource_id = cust.client LEFT JOIN ( SELECT tu.iUserId AS resources, tu.vUserName, tsv.order_id, tsv.item_id, tsv.job_summmeryId FROM tms_summmery_view AS tsv LEFT JOIN tms_users AS tu ON tu.iUserId = tsv.resource ) AS jsv ON ( its.order_id = jsv.order_id AND its.item_number = jsv.item_id ) LEFT JOIN tms_discussion AS td ON ( td.order_id = its.order_id AND ( NOT FIND_IN_SET('1', td.read_id)) ) WHERE its.order_id != 0 GROUP BY its.itemId ";
        //$qry = "SELECT its.itemId, its.heads_up, gen.order_no AS orderNumber, gen.due_date AS DueDate, gen.order_id AS orderId, cust.created_date AS orderDate, cust.client AS customer, gen.project_name AS projectName, c.vUserName AS contactName, c.iClientId, stus.status_name AS clientStatus, c.vlogo AS clientlogo, c.tPoInfo AS ponumber, gen.company_code AS companyCode, gen.project_price, gen.expected_start_date, cust.contact AS contactPerson, its.item_number, its.po_number AS itemPonumber, its.start_date AS itemStartdate, its.due_date AS itemDuedate, its.upcomingDate, its.source_lang AS itemsSourceLang, its.target_lang AS itemsTargetLang, its.price AS scoop_price, its.subPm AS scoop_subPm_id, gen.project_status AS projectStatus, gen.project_type AS projectType, c.project_branch, plang.source_lang AS sourceLanguage, plang.target_lang AS targetLanguage, its.total_price AS totalAmount, inc.vUserName AS accountname, tu.vUserName AS pm_name, CONCAT(tu.vFirstName, ' ', tu.vLastName) AS pm_fullName, CONCAT( sub_tu.vFirstName, ' ', sub_tu.vLastName ) AS sub_pm_name, CONCAT( sub_scp_tu.vFirstName, ' ', sub_scp_tu.vLastName ) AS sub_scoopPm_name, cust.project_coordinator AS project_coordinator_id, cust.project_manager AS project_manager_id, cust.QA_specialist AS qa_specialist_id, cust.sub_pm AS sub_pm_id, ps.project_status_name AS projectstatus_name, ps.status_color AS projectstatus_color, tis.item_status_name AS itemStatus, tis.item_status_id AS itemStatusId, c.client_currency, cp.price_currency, cp2.price_currency AS price_currency2, GROUP_CONCAT(DISTINCT(jsv.resources)) AS linguistId, GROUP_CONCAT(DISTINCT(CONCAT(jsv.vFirstName, ' ', jsv.vLastName))) AS linguistName, COUNT(td.id) AS comment_status, COUNT(td.id) AS comment_id FROM tms_items AS its LEFT JOIN tms_general AS gen ON its.order_id = gen.order_id LEFT JOIN tms_customer AS cust ON its.order_id = cust.order_id LEFT JOIN tms_proj_language AS plang ON its.order_id = plang.order_id LEFT JOIN tms_client AS c ON cust.client = c.iClientId LEFT JOIN tms_user_status AS stus ON c.vStatus = stus.status_id LEFT JOIN tms_client_indirect AS inc ON inc.iClientId = cust.indirect_customer LEFT JOIN tms_users AS tu ON tu.iUserId = cust.project_manager LEFT JOIN tms_users AS sub_tu ON sub_tu.iUserId = cust.sub_pm LEFT JOIN tms_users AS sub_scp_tu ON sub_scp_tu.iUserId = its.subPm LEFT JOIN tms_project_status AS ps ON ps.pr_status_id = gen.project_status LEFT JOIN tms_customer_price_list AS cp ON its.project_pricelist = cp.price_list_id LEFT JOIN tms_item_status AS tis ON its.item_status = tis.item_status_id LEFT JOIN( SELECT resource_id, price_currency FROM tms_customer_price_list WHERE price_id = 1 GROUP BY resource_id ) AS cp2 ON cp2.resource_id = cust.client LEFT JOIN( SELECT tu.iUserId AS resources, tu.vFirstName, tu.vLastName, tu.vUserName, tsv.order_id, tsv.item_id, tsv.job_summmeryId FROM tms_summmery_view AS tsv LEFT JOIN tms_users AS tu ON tu.iUserId = tsv.resource ) AS jsv ON ( its.order_id = jsv.order_id AND its.item_number = jsv.item_id ) LEFT JOIN tms_discussion AS td ON ( td.order_id = its.order_id AND (NOT FIND_IN_SET('1', td.read_id)) ) WHERE its.order_id != 0 GROUP BY its.itemId ORDER BY `linguistName` DESC"; 
        $qry = "SELECT its.itemId, its.heads_up, gen.order_no AS orderNumber, gen.due_date AS DueDate, gen.order_id AS orderId, cust.created_date AS orderDate, cust.client AS customer, gen.project_name AS projectName, c.vUserName AS contactName, c.iClientId, stus.status_name AS clientStatus, c.vlogo AS clientlogo, c.tPoInfo AS ponumber, gen.company_code AS companyCode, gen.project_price, gen.expected_start_date, cust.contact AS contactPerson, its.item_number, its.po_number AS itemPonumber, its.start_date AS itemStartdate, its.due_date AS itemDuedate, its.upcomingDate, its.source_lang AS itemsSourceLang, its.target_lang AS itemsTargetLang, its.price AS scoop_price, its.subPm AS scoop_subPm_id, its.attached_workflow, gen.project_status AS projectStatus, gen.project_type AS projectType, c.project_branch, plang.source_lang AS sourceLanguage, plang.target_lang AS targetLanguage, its.total_price AS totalAmount, its.item_name AS scoopName, its.item_email_subject AS itemEmailSubject, inc.vUserName AS accountname, tu.vUserName AS pm_name, CONCAT(tu.vFirstName, ' ', tu.vLastName) AS pm_fullName, CONCAT( sub_tu.vFirstName, ' ', sub_tu.vLastName ) AS sub_pm_name, CONCAT( sub_scp_tu.vFirstName, ' ', sub_scp_tu.vLastName ) AS sub_scoopPm_name, CONCAT(gen_Qa.vFirstName, ' ', gen_Qa.vLastName) AS gen_Qa_fullName, CONCAT(sub_gen_Qa.vFirstName, ' ', sub_gen_Qa.vLastName) AS gen_sub_Qa_fullName, CONCAT(scp_Qa.vFirstName, ' ', scp_Qa.vLastName) AS scp_Qa_fullName, CONCAT(sub_scp_Qa.vFirstName, ' ', sub_scp_Qa.vLastName) AS scp_sub_Qa_fullName, cust.project_coordinator AS project_coordinator_id, cust.project_manager AS project_manager_id, cust.QA_specialist AS qa_specialist_id, cust.sub_pm AS sub_pm_id, ps.project_status_name AS projectstatus_name, ps.status_color AS projectstatus_color, tis.item_status_name AS itemStatus, tis.item_status_id AS itemStatusId, c.client_currency, cp.price_currency, cp2.price_currency AS price_currency2, GROUP_CONCAT(DISTINCT(jsv.resources)) AS linguistId, GROUP_CONCAT( DISTINCT( CONCAT( jsv.vFirstName, ' ', jsv.vLastName ) ) ) AS linguistName, COUNT(td.id) AS comment_status, COUNT(td.id) AS comment_id FROM tms_items AS its LEFT JOIN tms_general AS gen ON its.order_id = gen.order_id LEFT JOIN tms_customer AS cust ON its.order_id = cust.order_id LEFT JOIN tms_proj_language AS plang ON its.order_id = plang.order_id LEFT JOIN tms_client AS c ON cust.client = c.iClientId LEFT JOIN tms_user_status AS stus ON c.vStatus = stus.status_id LEFT JOIN tms_client_indirect AS inc ON inc.iClientId = cust.indirect_customer LEFT JOIN tms_users AS tu ON tu.iUserId = cust.project_manager LEFT JOIN tms_users AS sub_tu ON sub_tu.iUserId = cust.sub_pm LEFT JOIN tms_users AS sub_scp_tu ON sub_scp_tu.iUserId = its.subPm LEFT JOIN tms_users AS gen_Qa ON gen_Qa.iUserId = cust.QA_specialist LEFT JOIN tms_users AS sub_gen_Qa ON sub_gen_Qa.iUserId = cust.sub_qa LEFT JOIN tms_users AS scp_Qa ON scp_Qa.iUserId = its.qaSpecialist LEFT JOIN tms_users AS sub_scp_Qa ON sub_scp_Qa.iUserId = its.subQa LEFT JOIN tms_project_status AS ps ON ps.pr_status_id = gen.project_status LEFT JOIN tms_customer_price_list AS cp ON its.project_pricelist = cp.price_list_id LEFT JOIN tms_item_status AS tis ON its.item_status = tis.item_status_id LEFT JOIN( SELECT resource_id, price_currency FROM tms_customer_price_list WHERE price_id = 1 GROUP BY resource_id ) AS cp2 ON cp2.resource_id = cust.client LEFT JOIN( SELECT tu.iUserId AS resources, tu.vFirstName, tu.vLastName, tu.vUserName, tsv.order_id, tsv.item_id, tsv.job_summmeryId FROM tms_summmery_view AS tsv LEFT JOIN tms_users AS tu ON tu.iUserId = tsv.resource ) AS jsv ON ( its.order_id = jsv.order_id AND its.item_number = jsv.item_id ) LEFT JOIN tms_discussion AS td ON ( td.order_id = its.order_id AND(NOT FIND_IN_SET('1', td.read_id)) ) WHERE its.order_id != 0 GROUP BY its.itemId ORDER BY `its`.`itemId` DESC";
        $data = $this->_db->rawQuery($qry);
        // foreach($data AS $key=>$value) {
        //     $qry1 = "SELECT count(id) as comment_id FROM tms_discussion where order_id = ".$value['orderId'];
        //     $comments = $this->_db->rawQuery($qry1);
        //     $data[$key]['comment_id'] = $comments;

        //     $qry2 = "SELECT count(id) as comment_status FROM tms_discussion where order_id = ".$value['orderId']. " AND NOT FIND_IN_SET(".$id.",read_id)";
        //     $commentdata = $this->_db->rawQuery($qry2);
        //     $data[$key]['comment'] = $commentdata;

        //     $qry3 = "SELECT tu.iUserId as resources, tu.vUserName FROM tms_summmery_view as tsv LEFT JOIN tms_users as tu ON tu.iUserId = tsv.resource where tsv.order_id = ".$value['orderId']. " AND tsv.item_id = ".$value['item_number'];
        //     $lngst = $this->_db->rawQuery($qry3);
        //     $data[$key]['linguist'] = $lngst;
        // }
        return $data;
    }

    public function ProjectsOrderGetSearch($id, $data) {
        if (!empty($data)) {
            $query_data = " AND (its.item_status = '" . $data['searchValue'] . "'
                        )";
        }

        $qry = "SELECT its.itemId, its.heads_up, gen.order_no AS orderNumber, gen.due_date AS DueDate, gen.order_id AS orderId, cust.created_date AS orderDate, cust.client AS customer, gen.project_name AS projectName, c.vUserName AS contactName, c.iClientId, stus.status_name AS clientStatus, c.vlogo AS clientlogo, c.tPoInfo AS ponumber, gen.company_code AS companyCode, gen.project_price, gen.expected_start_date, cust.contact AS contactPerson, its.item_number, its.po_number AS itemPonumber, its.start_date AS itemStartdate, its.due_date AS itemDuedate, its.upcomingDate, its.source_lang AS itemsSourceLang, its.target_lang AS itemsTargetLang, its.price AS scoop_price, its.subPm AS scoop_subPm_id, its.attached_workflow, gen.project_status AS projectStatus, gen.project_type AS projectType, c.project_branch, plang.source_lang AS sourceLanguage, plang.target_lang AS targetLanguage, its.total_price AS totalAmount, its.item_name AS scoopName, its.item_email_subject AS itemEmailSubject, inc.vUserName AS accountname, tu.vUserName AS pm_name, CONCAT(tu.vFirstName, ' ', tu.vLastName) AS pm_fullName, CONCAT( sub_tu.vFirstName, ' ', sub_tu.vLastName ) AS sub_pm_name, CONCAT( sub_scp_tu.vFirstName, ' ', sub_scp_tu.vLastName ) AS sub_scoopPm_name, CONCAT(gen_Qa.vFirstName, ' ', gen_Qa.vLastName) AS gen_Qa_fullName, CONCAT(sub_gen_Qa.vFirstName, ' ', sub_gen_Qa.vLastName) AS gen_sub_Qa_fullName, CONCAT(scp_Qa.vFirstName, ' ', scp_Qa.vLastName) AS scp_Qa_fullName, CONCAT(sub_scp_Qa.vFirstName, ' ', sub_scp_Qa.vLastName) AS scp_sub_Qa_fullName, cust.project_coordinator AS project_coordinator_id, cust.project_manager AS project_manager_id, cust.QA_specialist AS qa_specialist_id, cust.sub_pm AS sub_pm_id, ps.project_status_name AS projectstatus_name, ps.status_color AS projectstatus_color, tis.item_status_name AS itemStatus, tis.item_status_id AS itemStatusId, c.client_currency, cp.price_currency, cp2.price_currency AS price_currency2, GROUP_CONCAT(DISTINCT(jsv.resources)) AS linguistId, GROUP_CONCAT( DISTINCT( CONCAT( jsv.vFirstName, ' ', jsv.vLastName ) ) ) AS linguistName, COUNT(td.id) AS comment_status, COUNT(td.id) AS comment_id FROM tms_items AS its LEFT JOIN tms_general AS gen ON its.order_id = gen.order_id LEFT JOIN tms_customer AS cust ON its.order_id = cust.order_id LEFT JOIN tms_proj_language AS plang ON its.order_id = plang.order_id LEFT JOIN tms_client AS c ON cust.client = c.iClientId LEFT JOIN tms_user_status AS stus ON c.vStatus = stus.status_id LEFT JOIN tms_client_indirect AS inc ON inc.iClientId = cust.indirect_customer LEFT JOIN tms_users AS tu ON tu.iUserId = cust.project_manager LEFT JOIN tms_users AS sub_tu ON sub_tu.iUserId = cust.sub_pm LEFT JOIN tms_users AS sub_scp_tu ON sub_scp_tu.iUserId = its.subPm LEFT JOIN tms_users AS gen_Qa ON gen_Qa.iUserId = cust.QA_specialist LEFT JOIN tms_users AS sub_gen_Qa ON sub_gen_Qa.iUserId = cust.sub_qa LEFT JOIN tms_users AS scp_Qa ON scp_Qa.iUserId = its.qaSpecialist LEFT JOIN tms_users AS sub_scp_Qa ON sub_scp_Qa.iUserId = its.subQa LEFT JOIN tms_project_status AS ps ON ps.pr_status_id = gen.project_status LEFT JOIN tms_customer_price_list AS cp ON its.project_pricelist = cp.price_list_id LEFT JOIN tms_item_status AS tis ON its.item_status = tis.item_status_id LEFT JOIN( SELECT resource_id, price_currency FROM tms_customer_price_list WHERE price_id = 1 GROUP BY resource_id ) AS cp2 ON cp2.resource_id = cust.client LEFT JOIN( SELECT tu.iUserId AS resources, tu.vFirstName, tu.vLastName, tu.vUserName, tsv.order_id, tsv.item_id, tsv.job_summmeryId FROM tms_summmery_view AS tsv LEFT JOIN tms_users AS tu ON tu.iUserId = tsv.resource ) AS jsv ON ( its.order_id = jsv.order_id AND its.item_number = jsv.item_id ) LEFT JOIN tms_discussion AS td ON ( td.order_id = its.order_id AND(NOT FIND_IN_SET('1', td.read_id)) ) WHERE its.order_id != 0". $query_data."GROUP BY its.itemId ORDER BY `its`.`itemId` DESC";
        $data = $this->_db->rawQuery($qry);
        return $data;
    }

    public function projectsOrderCount($id) {
        $data = [];
        // $qry = "SELECT tis.item_status_name, its.item_status ,COUNT(*) AS totalItems FROM tms_items as its LEFT JOIN tms_item_status as tis ON tis.item_status_id = its.item_status GROUP BY its.item_status";
        //$qry = "SELECT tis.item_status_name, its.item_status, COUNT(DISTINCT its.itemId) AS totalItems FROM tms_items AS its LEFT JOIN tms_general AS gen ON its.order_id = gen.order_id LEFT JOIN tms_customer AS cust ON its.order_id = cust.order_id LEFT JOIN tms_proj_language AS plang ON its.order_id = plang.order_id LEFT JOIN tms_client AS c ON cust.client = c.iClientId LEFT JOIN tms_user_status AS stus ON c.vStatus = stus.status_id LEFT JOIN tms_client_indirect AS inc ON inc.iClientId = cust.indirect_customer LEFT JOIN tms_users AS tu ON tu.iUserId = cust.project_manager LEFT JOIN tms_users AS sub_tu ON sub_tu.iUserId = cust.sub_pm LEFT JOIN tms_users AS sub_scp_tu ON sub_scp_tu.iUserId = its.subPm LEFT JOIN tms_users AS gen_Qa ON gen_Qa.iUserId = cust.QA_specialist LEFT JOIN tms_users AS sub_gen_Qa ON sub_gen_Qa.iUserId = cust.sub_qa LEFT JOIN tms_users AS scp_Qa ON scp_Qa.iUserId = its.qaSpecialist LEFT JOIN tms_users AS sub_scp_Qa ON sub_scp_Qa.iUserId = its.subQa LEFT JOIN tms_project_status AS ps ON ps.pr_status_id = gen.project_status LEFT JOIN tms_customer_price_list AS cp ON its.project_pricelist = cp.price_list_id LEFT JOIN tms_item_status AS tis ON its.item_status = tis.item_status_id LEFT JOIN (SELECT resource_id, price_currency FROM tms_customer_price_list WHERE price_id = 1 GROUP BY resource_id) AS cp2 ON cp2.resource_id = cust.client LEFT JOIN (SELECT tu.iUserId AS resources, tu.vFirstName, tu.vLastName, tu.vUserName, tsv.order_id, tsv.item_id, tsv.job_summmeryId FROM tms_summmery_view AS tsv LEFT JOIN tms_users AS tu ON tu.iUserId = tsv.resource) AS jsv ON (its.order_id = jsv.order_id AND its.item_number = jsv.item_id) LEFT JOIN tms_discussion AS td ON (td.order_id = its.order_id AND (NOT FIND_IN_SET('1', td.read_id))) WHERE its.order_id != 0 GROUP BY tis.item_status_name, its.item_status";
        $qry = "SELECT tis.item_status_name, its.item_status, COUNT(DISTINCT its.itemId) AS totalItems FROM tms_items AS its LEFT JOIN tms_general AS gen ON its.order_id = gen.order_id LEFT JOIN tms_item_status AS tis ON its.item_status = tis.item_status_id WHERE its.order_id != 0 GROUP BY tis.item_status_name, its.item_status";
        $data1 = $this->_db->rawQuery($qry);
        if($data1){
            $data['tabStatus'] = $data1;
        }
        // $qry = "SELECT COUNT(DISTINCT its.itemId) AS totalItems FROM tms_items AS its WHERE its.order_id != 0 AND its.item_status = 1 AND its.heads_up != 1 ";
        // $dataOn = $this->_db->rawQuery($qry);
        // if($dataOn){
        //     $data['assign'] = $dataOn[0]['totalItems'];
        // }
        // $qry = "SELECT COUNT(*) AS totalItems FROM tms_items AS its LEFT JOIN tms_general AS gen ON its.order_id = gen.order_id LEFT JOIN tms_customer AS cust ON its.order_id = cust.order_id LEFT JOIN tms_proj_language AS plang ON its.order_id = plang.order_id LEFT JOIN tms_client AS c ON cust.client = c.iClientId LEFT JOIN tms_user_status AS stus ON c.vStatus = stus.status_id LEFT JOIN tms_client_indirect AS inc ON inc.iClientId = cust.indirect_customer LEFT JOIN tms_users AS tu ON tu.iUserId = cust.project_manager LEFT JOIN tms_users AS sub_tu ON sub_tu.iUserId = cust.sub_pm LEFT JOIN tms_users AS sub_scp_tu ON sub_scp_tu.iUserId = its.subPm LEFT JOIN tms_users AS gen_Qa ON gen_Qa.iUserId = cust.QA_specialist LEFT JOIN tms_users AS sub_gen_Qa ON sub_gen_Qa.iUserId = cust.sub_qa LEFT JOIN tms_users AS scp_Qa ON scp_Qa.iUserId = its.qaSpecialist LEFT JOIN tms_users AS sub_scp_Qa ON sub_scp_Qa.iUserId = its.subQa LEFT JOIN tms_project_status AS ps ON ps.pr_status_id = gen.project_status LEFT JOIN tms_customer_price_list AS cp ON its.project_pricelist = cp.price_list_id LEFT JOIN tms_item_status AS tis ON its.item_status = tis.item_status_id LEFT JOIN (SELECT resource_id, price_currency FROM tms_customer_price_list WHERE price_id = 1 GROUP BY resource_id) AS cp2 ON cp2.resource_id = cust.client LEFT JOIN (SELECT tu.iUserId AS resources, tu.vFirstName, tu.vLastName, tu.vUserName, tsv.order_id, tsv.item_id, tsv.job_summmeryId FROM tms_summmery_view AS tsv LEFT JOIN tms_users AS tu ON tu.iUserId = tsv.resource) AS jsv ON (its.order_id = jsv.order_id AND its.item_number = jsv.item_id) LEFT JOIN tms_discussion AS td ON (td.order_id = its.order_id AND (NOT FIND_IN_SET('1', td.read_id))) WHERE its.item_status NOT IN (1,4,5,6,7,8,9,14)";
        //$qry = "SELECT COUNT(*) AS totalItems FROM ( SELECT its.itemId FROM tms_items AS its LEFT JOIN tms_general AS gen ON its.order_id = gen.order_id LEFT JOIN tms_customer AS cust ON its.order_id = cust.order_id LEFT JOIN tms_proj_language AS plang ON its.order_id = plang.order_id LEFT JOIN tms_client AS c ON cust.client = c.iClientId LEFT JOIN tms_user_status AS stus ON c.vStatus = stus.status_id LEFT JOIN tms_client_indirect AS inc ON inc.iClientId = cust.indirect_customer LEFT JOIN tms_users AS tu ON tu.iUserId = cust.project_manager LEFT JOIN tms_users AS sub_tu ON sub_tu.iUserId = cust.sub_pm LEFT JOIN tms_users AS sub_scp_tu ON sub_scp_tu.iUserId = its.subPm LEFT JOIN tms_users AS gen_Qa ON gen_Qa.iUserId = cust.QA_specialist LEFT JOIN tms_users AS sub_gen_Qa ON sub_gen_Qa.iUserId = cust.sub_qa LEFT JOIN tms_users AS scp_Qa ON scp_Qa.iUserId = its.qaSpecialist LEFT JOIN tms_users AS sub_scp_Qa ON sub_scp_Qa.iUserId = its.subQa LEFT JOIN tms_project_status AS ps ON ps.pr_status_id = gen.project_status LEFT JOIN tms_customer_price_list AS cp ON its.project_pricelist = cp.price_list_id LEFT JOIN tms_item_status AS tis ON its.item_status = tis.item_status_id LEFT JOIN ( SELECT resource_id, price_currency FROM tms_customer_price_list WHERE price_id = 1 GROUP BY resource_id ) AS cp2 ON cp2.resource_id = cust.client LEFT JOIN ( SELECT tu.iUserId AS resources, tu.vFirstName, tu.vLastName, tu.vUserName, tsv.order_id, tsv.item_id, tsv.job_summmeryId FROM tms_summmery_view AS tsv LEFT JOIN tms_users AS tu ON tu.iUserId = tsv.resource ) AS jsv ON (its.order_id = jsv.order_id AND its.item_number = jsv.item_id) LEFT JOIN tms_discussion AS td ON (td.order_id = its.order_id AND (NOT FIND_IN_SET('1', td.read_id))) WHERE its.order_id != 0 AND its.item_status NOT IN (1,4,5,6,7,8,9,14) GROUP BY its.itemId ) AS subquery";
        $qry = "SELECT COUNT(DISTINCT its.itemId) AS totalItems FROM tms_items AS its WHERE its.order_id != 0 AND its.item_status NOT IN (1, 4, 5, 6, 7, 8, 9, 14)";
        $dataOn = $this->_db->rawQuery($qry);
        if($dataOn){
            $data['ongoing'] = $dataOn[0]['totalItems'];
        }
        // $qry = "SELECT COUNT(*) AS totalItems FROM tms_items its LEFT JOIN tms_general AS gen ON its.order_id = gen.order_id LEFT JOIN tms_customer AS cust ON its.order_id = cust.order_id LEFT JOIN tms_proj_language AS plang ON its.order_id = plang.order_id LEFT JOIN tms_client AS c ON cust.client = c.iClientId LEFT JOIN tms_user_status AS stus ON c.vStatus = stus.status_id LEFT JOIN tms_client_indirect AS inc ON inc.iClientId = cust.indirect_customer LEFT JOIN tms_users AS tu ON tu.iUserId = cust.project_manager LEFT JOIN tms_users AS sub_tu ON sub_tu.iUserId = cust.sub_pm LEFT JOIN tms_users AS sub_scp_tu ON sub_scp_tu.iUserId = its.subPm LEFT JOIN tms_users AS gen_Qa ON gen_Qa.iUserId = cust.QA_specialist LEFT JOIN tms_users AS sub_gen_Qa ON sub_gen_Qa.iUserId = cust.sub_qa LEFT JOIN tms_users AS scp_Qa ON scp_Qa.iUserId = its.qaSpecialist LEFT JOIN tms_users AS sub_scp_Qa ON sub_scp_Qa.iUserId = its.subQa LEFT JOIN tms_project_status AS ps ON ps.pr_status_id = gen.project_status LEFT JOIN tms_customer_price_list AS cp ON its.project_pricelist = cp.price_list_id LEFT JOIN tms_item_status AS tis ON its.item_status = tis.item_status_id LEFT JOIN (SELECT resource_id, price_currency FROM tms_customer_price_list WHERE price_id = 1 GROUP BY resource_id) AS cp2 ON cp2.resource_id = cust.client LEFT JOIN (SELECT tu.iUserId AS resources, tu.vFirstName, tu.vLastName, tu.vUserName, tsv.order_id, tsv.item_id, tsv.job_summmeryId FROM tms_summmery_view AS tsv LEFT JOIN tms_users AS tu ON tu.iUserId = tsv.resource) AS jsv ON (its.order_id = jsv.order_id AND its.item_number = jsv.item_id) LEFT JOIN tms_discussion AS td ON (td.order_id = its.order_id AND (NOT FIND_IN_SET('1', td.read_id))) WHERE (cust.project_manager = $id || cust.project_coordinator = $id || cust.QA_specialist = $id || cust.project_coordinator = $id || cust.sub_pm = $id) AND its.item_status NOT IN (4,5,6,7,8,9) ";
        //$qry = "SELECT COUNT(*) AS totalItems FROM ( SELECT its.itemId FROM tms_items AS its LEFT JOIN tms_general AS gen ON its.order_id = gen.order_id LEFT JOIN tms_customer AS cust ON its.order_id = cust.order_id LEFT JOIN tms_proj_language AS plang ON its.order_id = plang.order_id LEFT JOIN tms_client AS c ON cust.client = c.iClientId LEFT JOIN tms_user_status AS stus ON c.vStatus = stus.status_id LEFT JOIN tms_client_indirect AS inc ON inc.iClientId = cust.indirect_customer LEFT JOIN tms_users AS tu ON tu.iUserId = cust.project_manager LEFT JOIN tms_users AS sub_tu ON sub_tu.iUserId = cust.sub_pm LEFT JOIN tms_users AS sub_scp_tu ON sub_scp_tu.iUserId = its.subPm LEFT JOIN tms_users AS gen_Qa ON gen_Qa.iUserId = cust.QA_specialist LEFT JOIN tms_users AS sub_gen_Qa ON sub_gen_Qa.iUserId = cust.sub_qa LEFT JOIN tms_users AS scp_Qa ON scp_Qa.iUserId = its.qaSpecialist LEFT JOIN tms_users AS sub_scp_Qa ON sub_scp_Qa.iUserId = its.subQa LEFT JOIN tms_project_status AS ps ON ps.pr_status_id = gen.project_status LEFT JOIN tms_customer_price_list AS cp ON its.project_pricelist = cp.price_list_id LEFT JOIN tms_item_status AS tis ON its.item_status = tis.item_status_id LEFT JOIN ( SELECT resource_id, price_currency FROM tms_customer_price_list WHERE price_id = 1 GROUP BY resource_id ) AS cp2 ON cp2.resource_id = cust.client LEFT JOIN ( SELECT tu.iUserId AS resources, tu.vFirstName, tu.vLastName, tu.vUserName, tsv.order_id, tsv.item_id, tsv.job_summmeryId FROM tms_summmery_view AS tsv LEFT JOIN tms_users AS tu ON tu.iUserId = tsv.resource ) AS jsv ON (its.order_id = jsv.order_id AND its.item_number = jsv.item_id) LEFT JOIN tms_discussion AS td ON (td.order_id = its.order_id AND (NOT FIND_IN_SET('1', td.read_id))) WHERE its.order_id != 0 AND (cust.project_manager = $id || cust.project_coordinator = $id || cust.QA_specialist = $id || cust.project_coordinator = $id || cust.sub_pm = $id || its.manager = $id || its.coordinator = $id || its.qaSpecialist = $id || its.subPm = $id || its.subPc = $id || its.subQa = $id) AND its.item_status NOT IN (4,5,6,7,8,9)  GROUP BY its.itemId ) AS subquery";
        $qry = "SELECT COUNT(*) AS totalItems FROM ( SELECT its.itemId FROM tms_items AS its LEFT JOIN tms_general AS gen ON its.order_id = gen.order_id LEFT JOIN tms_customer AS cust ON its.order_id = cust.order_id LEFT JOIN tms_users AS tu ON tu.iUserId = cust.project_manager LEFT JOIN tms_users AS sub_tu ON sub_tu.iUserId = cust.sub_pm LEFT JOIN tms_users AS sub_scp_tu ON sub_scp_tu.iUserId = its.subPm LEFT JOIN tms_users AS gen_Qa ON gen_Qa.iUserId = cust.QA_specialist LEFT JOIN tms_users AS sub_gen_Qa ON sub_gen_Qa.iUserId = cust.sub_qa LEFT JOIN tms_users AS scp_Qa ON scp_Qa.iUserId = its.qaSpecialist LEFT JOIN tms_users AS sub_scp_Qa ON sub_scp_Qa.iUserId = its.subQa WHERE its.order_id != 0 AND( cust.project_manager = $id || cust.project_coordinator = $id || cust.QA_specialist = $id || cust.project_coordinator = $id || cust.sub_pm = $id || its.manager = $id || its.coordinator = $id || its.qaSpecialist = $id || its.subPm = $id || its.subPc = $id || its.subQa = $id ) AND its.item_status NOT IN(4, 5, 6, 7, 8, 9) GROUP BY its.itemId ) AS subquery";
        $dataMyProj = $this->_db->rawQuery($qry);
        if($dataMyProj){
            $data['myProject'] = $dataMyProj[0]['totalItems'];
        }
        // $qry = "SELECT COUNT(*) AS totalItems FROM tms_items AS its LEFT JOIN tms_general AS gen ON its.order_id = gen.order_id LEFT JOIN tms_customer AS cust ON its.order_id = cust.order_id LEFT JOIN tms_proj_language AS plang ON its.order_id = plang.order_id LEFT JOIN tms_client AS c ON cust.client = c.iClientId LEFT JOIN tms_user_status AS stus ON c.vStatus = stus.status_id LEFT JOIN tms_client_indirect AS inc ON inc.iClientId = cust.indirect_customer LEFT JOIN tms_users AS tu ON tu.iUserId = cust.project_manager LEFT JOIN tms_users AS sub_tu ON sub_tu.iUserId = cust.sub_pm LEFT JOIN tms_users AS sub_scp_tu ON sub_scp_tu.iUserId = its.subPm LEFT JOIN tms_users AS gen_Qa ON gen_Qa.iUserId = cust.QA_specialist LEFT JOIN tms_users AS sub_gen_Qa ON sub_gen_Qa.iUserId = cust.sub_qa LEFT JOIN tms_users AS scp_Qa ON scp_Qa.iUserId = its.qaSpecialist LEFT JOIN tms_users AS sub_scp_Qa ON sub_scp_Qa.iUserId = its.subQa LEFT JOIN tms_project_status AS ps ON ps.pr_status_id = gen.project_status LEFT JOIN tms_customer_price_list AS cp ON its.project_pricelist = cp.price_list_id LEFT JOIN tms_item_status AS tis ON its.item_status = tis.item_status_id LEFT JOIN (SELECT resource_id, price_currency FROM tms_customer_price_list WHERE price_id = 1 GROUP BY resource_id) AS cp2 ON cp2.resource_id = cust.client LEFT JOIN (SELECT tu.iUserId AS resources, tu.vFirstName, tu.vLastName, tu.vUserName, tsv.order_id, tsv.item_id, tsv.job_summmeryId FROM tms_summmery_view AS tsv LEFT JOIN tms_users AS tu ON tu.iUserId = tsv.resource) AS jsv ON (its.order_id = jsv.order_id AND its.item_number = jsv.item_id) LEFT JOIN tms_discussion AS td ON (td.order_id = its.order_id AND (NOT FIND_IN_SET('1', td.read_id))) WHERE DATE(its.due_date) = CURDATE() AND its.item_status NOT IN (4, 5, 6, 8, 9) ";
        $qry = "SELECT COUNT(*) AS totalItems FROM ( SELECT its.itemId FROM tms_items AS its WHERE its.order_id != 0 AND DATE(its.due_date) = CURDATE() AND its.item_status NOT IN (4, 5, 6, 8, 9) GROUP BY its.itemId ) AS subquery";
        $data2 = $this->_db->rawQuery($qry);
        if($data2){
            $data['dueToday'] = $data2[0]['totalItems'];
        }
        // $qry = "SELECT COUNT(*) AS totalItems FROM tms_items AS its LEFT JOIN tms_general AS gen ON its.order_id = gen.order_id LEFT JOIN tms_customer AS cust ON its.order_id = cust.order_id LEFT JOIN tms_proj_language AS plang ON its.order_id = plang.order_id LEFT JOIN tms_client AS c ON cust.client = c.iClientId LEFT JOIN tms_user_status AS stus ON c.vStatus = stus.status_id LEFT JOIN tms_client_indirect AS inc ON inc.iClientId = cust.indirect_customer LEFT JOIN tms_users AS tu ON tu.iUserId = cust.project_manager LEFT JOIN tms_users AS sub_tu ON sub_tu.iUserId = cust.sub_pm LEFT JOIN tms_users AS sub_scp_tu ON sub_scp_tu.iUserId = its.subPm LEFT JOIN tms_users AS gen_Qa ON gen_Qa.iUserId = cust.QA_specialist LEFT JOIN tms_users AS sub_gen_Qa ON sub_gen_Qa.iUserId = cust.sub_qa LEFT JOIN tms_users AS scp_Qa ON scp_Qa.iUserId = its.qaSpecialist LEFT JOIN tms_users AS sub_scp_Qa ON sub_scp_Qa.iUserId = its.subQa LEFT JOIN tms_project_status AS ps ON ps.pr_status_id = gen.project_status LEFT JOIN tms_customer_price_list AS cp ON its.project_pricelist = cp.price_list_id LEFT JOIN tms_item_status AS tis ON its.item_status = tis.item_status_id LEFT JOIN (SELECT resource_id, price_currency FROM tms_customer_price_list WHERE price_id = 1 GROUP BY resource_id) AS cp2 ON cp2.resource_id = cust.client LEFT JOIN (SELECT tu.iUserId AS resources, tu.vFirstName, tu.vLastName, tu.vUserName, tsv.order_id, tsv.item_id, tsv.job_summmeryId FROM tms_summmery_view AS tsv LEFT JOIN tms_users AS tu ON tu.iUserId = tsv.resource) AS jsv ON (its.order_id = jsv.order_id AND its.item_number = jsv.item_id) LEFT JOIN tms_discussion AS td ON (td.order_id = its.order_id AND (NOT FIND_IN_SET('1', td.read_id))) WHERE DATE(its.due_date) = CURDATE() + INTERVAL 1 DAY AND its.item_status  NOT IN (4, 5, 6, 8, 9) ";
        //$qry = "SELECT COUNT(*) AS totalItems FROM ( SELECT its.itemId FROM tms_items AS its LEFT JOIN tms_general AS gen ON its.order_id = gen.order_id LEFT JOIN tms_customer AS cust ON its.order_id = cust.order_id LEFT JOIN tms_proj_language AS plang ON its.order_id = plang.order_id LEFT JOIN tms_client AS c ON cust.client = c.iClientId LEFT JOIN tms_user_status AS stus ON c.vStatus = stus.status_id LEFT JOIN tms_client_indirect AS inc ON inc.iClientId = cust.indirect_customer LEFT JOIN tms_users AS tu ON tu.iUserId = cust.project_manager LEFT JOIN tms_users AS sub_tu ON sub_tu.iUserId = cust.sub_pm LEFT JOIN tms_users AS sub_scp_tu ON sub_scp_tu.iUserId = its.subPm LEFT JOIN tms_users AS gen_Qa ON gen_Qa.iUserId = cust.QA_specialist LEFT JOIN tms_users AS sub_gen_Qa ON sub_gen_Qa.iUserId = cust.sub_qa LEFT JOIN tms_users AS scp_Qa ON scp_Qa.iUserId = its.qaSpecialist LEFT JOIN tms_users AS sub_scp_Qa ON sub_scp_Qa.iUserId = its.subQa LEFT JOIN tms_project_status AS ps ON ps.pr_status_id = gen.project_status LEFT JOIN tms_customer_price_list AS cp ON its.project_pricelist = cp.price_list_id LEFT JOIN tms_item_status AS tis ON its.item_status = tis.item_status_id LEFT JOIN ( SELECT resource_id, price_currency FROM tms_customer_price_list WHERE price_id = 1 GROUP BY resource_id ) AS cp2 ON cp2.resource_id = cust.client LEFT JOIN ( SELECT tu.iUserId AS resources, tu.vFirstName, tu.vLastName, tu.vUserName, tsv.order_id, tsv.item_id, tsv.job_summmeryId FROM tms_summmery_view AS tsv LEFT JOIN tms_users AS tu ON tu.iUserId = tsv.resource ) AS jsv ON (its.order_id = jsv.order_id AND its.item_number = jsv.item_id) LEFT JOIN tms_discussion AS td ON (td.order_id = its.order_id AND (NOT FIND_IN_SET('1', td.read_id))) WHERE its.order_id != 0 AND DATE(its.due_date) = CURDATE() + INTERVAL 1 DAY AND its.item_status  NOT IN (4, 5, 6, 8, 9) GROUP BY its.itemId ) AS subquery";
        $qry = "SELECT COUNT(DISTINCT its.itemId) AS totalItems FROM tms_items AS its LEFT JOIN tms_general AS gen ON its.order_id = gen.order_id WHERE its.order_id != 0 AND ( DATE(its.due_date) = CURDATE() + INTERVAL 1 DAY OR DATE(its.due_date) = ( CASE WHEN DAYOFWEEK(CURDATE() + INTERVAL 1 DAY) = 7 THEN CURDATE() + INTERVAL 3 DAY WHEN DAYOFWEEK(CURDATE() + INTERVAL 1 DAY) = 1 THEN CURDATE() + INTERVAL 2 DAY ELSE CURDATE() + INTERVAL 1 DAY END ) ) AND its.item_status NOT IN(4, 5, 6, 8, 9) ";
        $data3 = $this->_db->rawQuery($qry);
        if($data3){
            $data['dueTomorrow'] = $data3[0]['totalItems'];
        }
        // $qry = "SELECT COUNT(*) AS totalItems FROM tms_items as its WHERE DATE(its.due_date) < CURDATE() AND its.item_status NOT IN (4, 5, 6, 8, 9) ";
        // $dataOd = $this->_db->rawQuery($qry);
        // if($dataOd){
        //     $data['overDue'] = $dataOd[0]['totalItems'];
        // }
        // alternate 1
        $this->_db->where('its.order_id != 0 AND DATE(its.due_date) < CURDATE() AND its.item_status NOT IN (4, 5, 6, 8, 9)');
        $qry_init = $this->_db->get('tms_items as its');
        $data['overDue'] = (!empty($qry_init)) ? count($qry_init) : 0;
        // alternate 1

        // $qry = "SELECT COUNT(*) AS totalItems FROM tms_items AS its LEFT JOIN tms_general AS gen ON its.order_id = gen.order_id LEFT JOIN tms_customer AS cust ON its.order_id = cust.order_id LEFT JOIN tms_proj_language AS plang ON its.order_id = plang.order_id LEFT JOIN tms_client AS c ON cust.client = c.iClientId LEFT JOIN tms_user_status AS stus ON c.vStatus = stus.status_id LEFT JOIN tms_client_indirect AS inc ON inc.iClientId = cust.indirect_customer LEFT JOIN tms_users AS tu ON tu.iUserId = cust.project_manager LEFT JOIN tms_users AS sub_tu ON sub_tu.iUserId = cust.sub_pm LEFT JOIN tms_users AS sub_scp_tu ON sub_scp_tu.iUserId = its.subPm LEFT JOIN tms_users AS gen_Qa ON gen_Qa.iUserId = cust.QA_specialist LEFT JOIN tms_users AS sub_gen_Qa ON sub_gen_Qa.iUserId = cust.sub_qa LEFT JOIN tms_users AS scp_Qa ON scp_Qa.iUserId = its.qaSpecialist LEFT JOIN tms_users AS sub_scp_Qa ON sub_scp_Qa.iUserId = its.subQa LEFT JOIN tms_project_status AS ps ON ps.pr_status_id = gen.project_status LEFT JOIN tms_customer_price_list AS cp ON its.project_pricelist = cp.price_list_id LEFT JOIN tms_item_status AS tis ON its.item_status = tis.item_status_id LEFT JOIN (SELECT resource_id, price_currency FROM tms_customer_price_list WHERE price_id = 1 GROUP BY resource_id) AS cp2 ON cp2.resource_id = cust.client LEFT JOIN (SELECT tu.iUserId AS resources, tu.vFirstName, tu.vLastName, tu.vUserName, tsv.order_id, tsv.item_id, tsv.job_summmeryId FROM tms_summmery_view AS tsv LEFT JOIN tms_users AS tu ON tu.iUserId = tsv.resource) AS jsv ON (its.order_id = jsv.order_id AND its.item_number = jsv.item_id) LEFT JOIN tms_discussion AS td ON (td.order_id = its.order_id AND (NOT FIND_IN_SET('1', td.read_id))) WHERE DATE(its.due_date) > CURDATE() + INTERVAL 1 DAY AND item_status NOT IN (4, 5, 6, 8, 9) ";
        //$qry = "SELECT COUNT(*) AS totalItems FROM ( SELECT its.itemId FROM tms_items AS its WHERE its.order_id != 0 AND DATE(its.due_date) > CURDATE() + INTERVAL 1 DAY AND item_status NOT IN(4, 5, 6, 8, 9) GROUP BY its.itemId) AS subquery";
        $qry = "SELECT COUNT(*) AS totalItems FROM ( SELECT its.itemId FROM tms_items AS its WHERE its.order_id != 0 AND its.heads_up = 1 AND item_status NOT IN(4, 6, 8, 9) GROUP BY its.itemId) AS subquery";
        $dataUp = $this->_db->rawQuery($qry);
        if($dataUp){
            $data['upcomming'] = $dataUp[0]['totalItems'];
        }
        //$qry = "SELECT COUNT(*) AS totalItems FROM ( SELECT its.itemId FROM tms_items AS its LEFT JOIN tms_general AS gen ON its.order_id = gen.order_id LEFT JOIN tms_customer AS cust ON its.order_id = cust.order_id LEFT JOIN tms_proj_language AS plang ON its.order_id = plang.order_id LEFT JOIN tms_client AS c ON cust.client = c.iClientId LEFT JOIN tms_user_status AS stus ON c.vStatus = stus.status_id LEFT JOIN tms_client_indirect AS inc ON inc.iClientId = cust.indirect_customer LEFT JOIN tms_users AS tu ON tu.iUserId = cust.project_manager LEFT JOIN tms_users AS sub_tu ON sub_tu.iUserId = cust.sub_pm LEFT JOIN tms_users AS sub_scp_tu ON sub_scp_tu.iUserId = its.subPm LEFT JOIN tms_users AS gen_Qa ON gen_Qa.iUserId = cust.QA_specialist LEFT JOIN tms_users AS sub_gen_Qa ON sub_gen_Qa.iUserId = cust.sub_qa LEFT JOIN tms_users AS scp_Qa ON scp_Qa.iUserId = its.qaSpecialist LEFT JOIN tms_users AS sub_scp_Qa ON sub_scp_Qa.iUserId = its.subQa LEFT JOIN tms_project_status AS ps ON ps.pr_status_id = gen.project_status LEFT JOIN tms_customer_price_list AS cp ON its.project_pricelist = cp.price_list_id LEFT JOIN tms_item_status AS tis ON its.item_status = tis.item_status_id LEFT JOIN ( SELECT resource_id, price_currency FROM tms_customer_price_list WHERE price_id = 1 GROUP BY resource_id ) AS cp2 ON cp2.resource_id = cust.client LEFT JOIN ( SELECT tu.iUserId AS resources, tu.vFirstName, tu.vLastName, tu.vUserName, tsv.order_id, tsv.item_id, tsv.job_summmeryId FROM tms_summmery_view AS tsv LEFT JOIN tms_users AS tu ON tu.iUserId = tsv.resource ) AS jsv ON (its.order_id = jsv.order_id AND its.item_number = jsv.item_id) LEFT JOIN tms_discussion AS td ON (td.order_id = its.order_id AND (NOT FIND_IN_SET('1', td.read_id))) WHERE its.order_id != 0 AND po_number != '' AND PO_missing = '1'  GROUP BY its.itemId ) AS subquery ";
        $qry = "SELECT COUNT(*) AS totalItems FROM ( SELECT its.itemId FROM tms_items AS its LEFT JOIN tms_general AS gen ON its.order_id = gen.order_id WHERE its.order_id != 0 AND po_number != '' AND PO_missing = '1' GROUP BY its.itemId ) AS subquery ";
        $dataPoMiss = $this->_db->rawQuery($qry);
        if($dataPoMiss){
            $data['poMissing'] = $dataPoMiss[0]['totalItems'];
        }
        // $qry = "SELECT COUNT(*) AS totalItems FROM tms_items AS its LEFT JOIN tms_general AS gen ON its.order_id = gen.order_id LEFT JOIN tms_customer AS cust ON its.order_id = cust.order_id LEFT JOIN tms_proj_language AS plang ON its.order_id = plang.order_id LEFT JOIN tms_client AS c ON cust.client = c.iClientId LEFT JOIN tms_user_status AS stus ON c.vStatus = stus.status_id LEFT JOIN tms_client_indirect AS inc ON inc.iClientId = cust.indirect_customer LEFT JOIN tms_users AS tu ON tu.iUserId = cust.project_manager LEFT JOIN tms_users AS sub_tu ON sub_tu.iUserId = cust.sub_pm LEFT JOIN tms_users AS sub_scp_tu ON sub_scp_tu.iUserId = its.subPm LEFT JOIN tms_users AS gen_Qa ON gen_Qa.iUserId = cust.QA_specialist LEFT JOIN tms_users AS sub_gen_Qa ON sub_gen_Qa.iUserId = cust.sub_qa LEFT JOIN tms_users AS scp_Qa ON scp_Qa.iUserId = its.qaSpecialist LEFT JOIN tms_users AS sub_scp_Qa ON sub_scp_Qa.iUserId = its.subQa LEFT JOIN tms_project_status AS ps ON ps.pr_status_id = gen.project_status LEFT JOIN tms_customer_price_list AS cp ON its.project_pricelist = cp.price_list_id LEFT JOIN tms_item_status AS tis ON its.item_status = tis.item_status_id LEFT JOIN (SELECT resource_id, price_currency FROM tms_customer_price_list WHERE price_id = 1 GROUP BY resource_id) AS cp2 ON cp2.resource_id = cust.client LEFT JOIN (SELECT tu.iUserId AS resources, tu.vFirstName, tu.vLastName, tu.vUserName, tsv.order_id, tsv.item_id, tsv.job_summmeryId FROM tms_summmery_view AS tsv LEFT JOIN tms_users AS tu ON tu.iUserId = tsv.resource) AS jsv ON (its.order_id = jsv.order_id AND its.item_number = jsv.item_id) LEFT JOIN tms_discussion AS td ON (td.order_id = its.order_id AND (NOT FIND_IN_SET('1', td.read_id)))";
        //$qry = "SELECT COUNT(*) AS totalItems FROM ( SELECT its.itemId FROM tms_items AS its LEFT JOIN tms_general AS gen ON its.order_id = gen.order_id LEFT JOIN tms_customer AS cust ON its.order_id = cust.order_id LEFT JOIN tms_proj_language AS plang ON its.order_id = plang.order_id LEFT JOIN tms_client AS c ON cust.client = c.iClientId LEFT JOIN tms_user_status AS stus ON c.vStatus = stus.status_id LEFT JOIN tms_client_indirect AS inc ON inc.iClientId = cust.indirect_customer LEFT JOIN tms_users AS tu ON tu.iUserId = cust.project_manager LEFT JOIN tms_users AS sub_tu ON sub_tu.iUserId = cust.sub_pm LEFT JOIN tms_users AS sub_scp_tu ON sub_scp_tu.iUserId = its.subPm LEFT JOIN tms_users AS gen_Qa ON gen_Qa.iUserId = cust.QA_specialist LEFT JOIN tms_users AS sub_gen_Qa ON sub_gen_Qa.iUserId = cust.sub_qa LEFT JOIN tms_users AS scp_Qa ON scp_Qa.iUserId = its.qaSpecialist LEFT JOIN tms_users AS sub_scp_Qa ON sub_scp_Qa.iUserId = its.subQa LEFT JOIN tms_project_status AS ps ON ps.pr_status_id = gen.project_status LEFT JOIN tms_customer_price_list AS cp ON its.project_pricelist = cp.price_list_id LEFT JOIN tms_item_status AS tis ON its.item_status = tis.item_status_id LEFT JOIN ( SELECT resource_id, price_currency FROM tms_customer_price_list WHERE price_id = 1 GROUP BY resource_id ) AS cp2 ON cp2.resource_id = cust.client LEFT JOIN ( SELECT tu.iUserId AS resources, tu.vFirstName, tu.vLastName, tu.vUserName, tsv.order_id, tsv.item_id, tsv.job_summmeryId FROM tms_summmery_view AS tsv LEFT JOIN tms_users AS tu ON tu.iUserId = tsv.resource ) AS jsv ON (its.order_id = jsv.order_id AND its.item_number = jsv.item_id) LEFT JOIN tms_discussion AS td ON (td.order_id = its.order_id AND (NOT FIND_IN_SET('1', td.read_id))) WHERE its.order_id != 0 GROUP BY its.itemId ) AS subquery";
        //$qry = "SELECT COUNT(DISTINCT CONCAT(its.order_id, '_', its.item_number)) AS totalItems FROM `tms_items` its WHERE its.order_id != 0";
        $qry = "SELECT COUNT(*) AS totalItems FROM ( SELECT its.order_id, its.item_number FROM `tms_items` its WHERE its.order_id != 0 GROUP BY its.order_id, its.item_number ) AS groupedItems";
        $dataAll = $this->_db->rawQuery($qry);
        if($dataAll){
            $data['tabAll'] = $dataAll[0]['totalItems'];
        }
        return $data;
    }

    public function projectsOrderScoopGet($id) {
        
        $perPage = isset($_GET['perPage']) ? intval($_GET['perPage']) : 10;
        $currentPage = isset($_GET['page']) ? intval($_GET['page']) : 1;
        $offset = ($currentPage - 1) * $perPage;
        $whereCond = '';
        
        //$tabName = isset($_GET['tabName']) ? $_GET['tabName'] : '';
        $tabName = $_GET['tabName'] ?? '';
        if($tabName != ''){
            //$statusId = 1;
            if($tabName == 'tab-assigned'){
                $statusId = 1;
                //$whereCond = " AND its.item_status = 1 AND its.heads_up != 1   ";
            }
            if($tabName == 'tab-qa-ready'){
                $statusId = 10;
            }
            if($tabName == 'tab-qa-issue'){
                $statusId = 13;
            }
            if($tabName == 'tab-pm-ready'){
                $statusId = 12;
            }
            if($tabName == 'tab-to-be-delivered'){
                $statusId = 3;
            }
            if($tabName == 'tab-completed'){
                $statusId = 4;
            }
            if($tabName == 'tab-approved'){
                $statusId = 5;
            }
            if(isset($statusId)){
                $whereCond = " AND its.item_status = $statusId ";
            }
            if($tabName == 'tab-ongoing'){
                $whereCond = " AND its.item_status NOT IN (1,4,5,6,7,8,9,14) ";
            }
            //
            if($tabName == 'tab-due-today'){
                $whereCond = " AND DATE(its.due_date) = CURDATE() AND its.item_status NOT IN (4, 5, 6, 8, 9) ";
            }
            if($tabName == 'tab-due-tomorrow'){
                //$whereCond = " AND DATE(its.due_date) = CURDATE() + INTERVAL 1 DAY AND its.item_status NOT IN (4, 5, 6, 8, 9) ";
                $whereCond = " AND ( DATE(its.due_date) = CURDATE() + INTERVAL 1 DAY OR DATE(its.due_date) = ( CASE WHEN DAYOFWEEK(CURDATE() + INTERVAL 1 DAY) = 7 THEN CURDATE() + INTERVAL 3 DAY WHEN DAYOFWEEK(CURDATE() + INTERVAL 1 DAY) = 1 THEN CURDATE() + INTERVAL 2 DAY ELSE CURDATE() + INTERVAL 1 DAY END ) ) AND its.item_status NOT IN (4, 5, 6, 8, 9) ";
            }
            if($tabName == 'tab-all'){
                //$whereCond = " ";
            }
            if($tabName == 'tab-overdue'){
                $whereCond = " AND DATE(its.due_date) < CURDATE() AND its.item_status NOT IN (4, 5, 6, 8, 9)";
                // $whereCond = "DATE(its.due_date) < CURDATE() AND its.item_status NOT IN (4, 5, 6, 8, 9)";
            }
            if($tabName == 'tab-my-upcoming'){
                //$whereCond = " AND DATE(its.due_date) > CURDATE() + INTERVAL 1 DAY AND its.item_status NOT IN (4, 5, 6, 8, 9)";
                $whereCond = " AND its.heads_up = 1 AND its.item_status NOT IN (4, 6, 8, 9)";
            }
            if($tabName == 'tab-my-projects'){
                $whereCond = " AND (cust.project_manager = $id || cust.project_coordinator = $id || cust.QA_specialist = $id || cust.project_coordinator = $id || cust.sub_pm = $id || its.manager = $id || its.coordinator = $id || its.qaSpecialist = $id || its.subPm = $id || its.subPc = $id || its.subQa = $id) AND its.item_status NOT IN (4,5,6,7,8,9)  ";
                //$whereCond = " AND (its.project_manager_id = $id OR its.project_coordinator_id = $id OR its.qa_specialist_id = $id OR its.qa_specialist_id = $id OR its.sub_pm_id = $id  ) ";
            }
            if($tabName == 'tab-poMissing'){
                $whereCond = " AND po_number != '' AND PO_missing = '1'  ";
            }
            //$currentPage = 0;
        }

        $search = isset($_GET['search']) ? $_GET['search'] : '';
        if($search != ''){
            $sLang = "its.source_lang LIKE '%\"sourceLang\":\"$search\"%' ";
            $tLang = "its.target_lang LIKE '%\"sourceLang\":\"$search\"%' ";
            $clientName = " OR c.vUserName LIKE '%$search%' ";
            $attached_workflow = " OR its.attached_workflow LIKE '%$search%' ";
            $pOrderNo = $pOrderNo2 = '';
            if (strpos($search, '-') !== false) {
                // alternate 1
                // $parts = explode('-', $search);
                // $beforeHyphen = $parts[0];
                // $pOrderNo = " OR gen.order_no LIKE '$beforeHyphen%' ";
                
                // alternate 2
                $parts = explode('-', $search);
                //if (isset($parts[1]) && strlen($parts[1]) === 3) {
                if (isset($parts[1])) {
                        $parts[1] = ltrim($parts[1], '0');
                }else{
                    $pOrderNo2 = "OR gen.order_no  LIKE '%$search%' " ;
                }
                $combinedSearch = implode('-', $parts);
                $pOrderNo = "OR CONCAT(gen.order_no, '-', its.item_number) LIKE '%$combinedSearch%'";
            }else{
                $pOrderNo2 = "OR gen.order_no  LIKE '%$search%' " ;
            }
            $scoopName = "OR its.item_name  LIKE '%$search%' " ; 
            $scoopEmailSubject = "OR its.item_email_subject LIKE '%$search%' ";
            $find_project_m = "OR CONCAT(tu.vFirstName, ' ', tu.vLastName) LIKE '%$search%'";
            // QA
            $find_qa_spc = "OR CONCAT(gen_Qa.vFirstName, ' ', gen_Qa.vLastName) LIKE '%$search%'";
            $find_qa_sub = "OR CONCAT(sub_gen_Qa.vFirstName, ' ', sub_gen_Qa.vLastName) LIKE '%$search%'";
            $find_qa_scoop = "OR CONCAT(scp_Qa.vFirstName, ' ', scp_Qa.vLastName) LIKE '%$search%'";
            $find_qa_scoop_sub = "OR CONCAT(sub_scp_Qa.vFirstName, ' ', sub_scp_Qa.vLastName) LIKE '%$search%'";
            // project cordinator
            $find_cordinator = "OR CONCAT(P_cordintr.vFirstName, ' ', P_cordintr.vLastName) LIKE '%$search%'";
            $find_cordinator_sub = "OR CONCAT(P_cordintr_sub.vFirstName, ' ', P_cordintr_sub.vLastName) LIKE '%$search%'";
            $find_cordinator_scoop = "OR CONCAT(scoop_cordintr.vFirstName, ' ', scoop_cordintr.vLastName) LIKE '%$search%'";
            $find_cordinator_scoop_sub = "OR CONCAT(scoop_cordintr_sub.vFirstName, ' ', scoop_cordintr_sub.vLastName) LIKE '%$search%'";
            
            $find_job = "OR its.attached_workflow LIKE '%$search%' ";
            $find_linguist = "OR CONCAT( jsv.vFirstName, ' ', jsv.vLastName ) LIKE '%$search%'";
            $projectScoopName = "OR its.item_name LIKE '%$search%' ";
            
            $whereCond .= " AND ( its.po_number LIKE '%$search%' OR $sLang OR $tLang $clientName $attached_workflow $scoopName $scoopEmailSubject $pOrderNo $find_project_m $find_qa_spc $find_qa_sub $find_qa_scoop $find_qa_scoop_sub $find_cordinator $find_cordinator_sub $find_cordinator_scoop $find_cordinator_scoop_sub $find_job $find_linguist $pOrderNo2 $projectScoopName) ";
            $currentPage = 0;
        }
        
        //$sortBy = ' its.due_date DESC';
        // $sortBy = " STR_TO_DATE(its.due_date, '%Y-%m-%d %H:%i:%s') DESC";
        
        // alternate 1
        //$sortBy = "  CASE WHEN its.due_date IS NULL OR its.due_date = '0000-00-00 00:00:00' THEN 4 WHEN its.due_date = CURDATE() THEN 1 WHEN its.due_date > CURDATE() THEN 2 ELSE 3 END, CASE WHEN its.due_date = CURDATE() THEN its.due_date WHEN its.due_date > CURDATE() THEN its.due_date ELSE NULL END ASC, CASE WHEN its.due_date < CURDATE() THEN its.due_date ELSE NULL END DESC ";
        $sortBy = "
        CASE
          WHEN its.due_date IS NULL OR its.due_date = '0000-00-00 00:00:00' THEN 4
          WHEN DATE(its.due_date) = CURDATE() THEN 1
          WHEN DATE(its.due_date) > CURDATE() THEN 2 
          ELSE 3
        END,
        its.due_date ASC
        ";

        // alternate 2
        // $sortBy = "
        // CASE
        //     WHEN its.due_date IS NULL OR its.due_date = '0000-00-00 00:00:00' THEN 4
        //     WHEN DATE(its.due_date) = CURDATE() THEN 1
        //     WHEN DATE(its.due_date) > CURDATE() THEN 2
        //     ELSE 3
        // END,
        // CASE 
        //     WHEN DATE(its.due_date) = CURDATE() THEN its.due_date
        //     WHEN DATE(its.due_date) > CURDATE() THEN its.due_date
        //     ELSE NULL
        // END ASC,
        // CASE
        //     WHEN DATE(its.due_date) < CURDATE() THEN its.due_date
        //     ELSE NULL
        // END DESC";

        if(isset($_GET['sortBy']) && $_GET['sortBy']!=''){
            $sortBy = $_GET['sortBy'];
            if($_GET['sortBy'] == 'clientName')
                $sortBy = 'c.vUserName';
            if($_GET['sortBy'] == 'projectManager')
                $sortBy = 'tu.vFirstName';
            if($_GET['sortBy'] == 'qaSpecialist')
                $sortBy = 'gen_Qa.vFirstName';
            if($_GET['sortBy'] == 'linguist')
                $sortBy = 'jsv.vFirstName';
            if($_GET['sortBy'] == 'scoopStatus')
                $sortBy = 'tis.item_status_name';
            if($_GET['sortBy'] == 'deadline')
                $sortBy = "  STR_TO_DATE(its.due_date, '%Y-%m-%d %H:%i:%s') ";
            if($_GET['sortBy'] == 'projectNumber')
                $sortBy = "its.item_name";
            //$sortBy = 'DATE(its.due_date)';    
            
            $sortOrder = isset($_GET['sortOrder']) && $_GET['sortOrder'] != '' ? $_GET['sortOrder'] : 'ASC' ;
            $sortBy1 = $sortBy;
            $sortBy = " $sortBy $sortOrder  ";
        }

        //$qry = "SELECT its.itemId from tms_items as its LEFT JOIN tms_customer AS cust ON its.order_id = cust.order_id LEFT JOIN tms_client AS c ON cust.client = c.iClientId where its.order_id != 0  $whereCond  ";
        //$qry = "SELECT COUNT(*) AS totalCount FROM ( SELECT its.itemId FROM tms_items AS its LEFT JOIN tms_general AS gen ON its.order_id = gen.order_id LEFT JOIN tms_customer AS cust ON its.order_id = cust.order_id LEFT JOIN tms_proj_language AS plang ON its.order_id = plang.order_id LEFT JOIN tms_client AS c ON cust.client = c.iClientId LEFT JOIN tms_user_status AS stus ON c.vStatus = stus.status_id LEFT JOIN tms_client_indirect AS inc ON inc.iClientId = cust.indirect_customer LEFT JOIN tms_users AS tu ON tu.iUserId = cust.project_manager LEFT JOIN tms_users AS sub_tu ON sub_tu.iUserId = cust.sub_pm LEFT JOIN tms_users AS scoop_manager_tu ON scoop_manager_tu.iUserId = its.manager LEFT JOIN tms_users AS sub_scp_tu ON sub_scp_tu.iUserId = its.subPm LEFT JOIN tms_users AS gen_Qa ON gen_Qa.iUserId = cust.QA_specialist LEFT JOIN tms_users AS sub_gen_Qa ON sub_gen_Qa.iUserId = cust.sub_qa LEFT JOIN tms_users AS P_cordintr ON P_cordintr.iUserId = cust.project_coordinator LEFT JOIN tms_users AS P_cordintr_sub ON P_cordintr_sub.iUserId = cust.sub_pc LEFT JOIN tms_users AS scp_Qa ON scp_Qa.iUserId = its.qaSpecialist LEFT JOIN tms_users AS sub_scp_Qa ON sub_scp_Qa.iUserId = its.subQa LEFT JOIN tms_users AS scoop_cordintr ON scoop_cordintr.iUserId = its.coordinator LEFT JOIN tms_users AS scoop_cordintr_sub ON scoop_cordintr_sub.iUserId = its.subPc LEFT JOIN tms_project_status AS ps ON ps.pr_status_id = gen.project_status LEFT JOIN tms_customer_price_list AS cp ON its.project_pricelist = cp.price_list_id LEFT JOIN tms_item_status AS tis ON its.item_status = tis.item_status_id LEFT JOIN( SELECT resource_id, price_currency FROM tms_customer_price_list WHERE price_id = 1 GROUP BY resource_id ) AS cp2 ON cp2.resource_id = cust.client LEFT JOIN( SELECT tu.iUserId AS resources, tu.vFirstName, tu.vLastName, tu.vUserName, tsv.order_id, tsv.item_id, tsv.job_summmeryId FROM tms_summmery_view AS tsv LEFT JOIN tms_users AS tu ON tu.iUserId = tsv.resource ) AS jsv ON ( its.order_id = jsv.order_id AND its.item_number = jsv.item_id ) LEFT JOIN tms_discussion AS td ON ( td.order_id = its.order_id AND(NOT FIND_IN_SET('1', td.read_id)) ) WHERE its.order_id != 0 $whereCond GROUP BY its.itemId ) AS subquery";
        $qry = "SELECT COUNT(*) AS totalCount FROM ( SELECT its.itemId FROM tms_items AS its LEFT JOIN tms_general AS gen ON its.order_id = gen.order_id LEFT JOIN tms_customer AS cust ON its.order_id = cust.order_id LEFT JOIN tms_proj_language AS plang ON its.order_id = plang.order_id LEFT JOIN tms_client AS c ON cust.client = c.iClientId LEFT JOIN tms_user_status AS stus ON c.vStatus = stus.status_id LEFT JOIN tms_client_indirect AS inc ON inc.iClientId = cust.indirect_customer LEFT JOIN tms_users AS tu ON tu.iUserId = cust.project_manager LEFT JOIN tms_users AS sub_tu ON sub_tu.iUserId = cust.sub_pm LEFT JOIN tms_users AS scoop_manager_tu ON scoop_manager_tu.iUserId = its.manager LEFT JOIN tms_users AS sub_scp_tu ON sub_scp_tu.iUserId = its.subPm LEFT JOIN tms_users AS gen_Qa ON gen_Qa.iUserId = cust.QA_specialist LEFT JOIN tms_users AS sub_gen_Qa ON sub_gen_Qa.iUserId = cust.sub_qa LEFT JOIN tms_users AS P_cordintr ON P_cordintr.iUserId = cust.project_coordinator LEFT JOIN tms_users AS P_cordintr_sub ON P_cordintr_sub.iUserId = cust.sub_pc LEFT JOIN tms_users AS scp_Qa ON scp_Qa.iUserId = its.qaSpecialist LEFT JOIN tms_users AS sub_scp_Qa ON sub_scp_Qa.iUserId = its.subQa LEFT JOIN tms_users AS scoop_cordintr ON scoop_cordintr.iUserId = its.coordinator LEFT JOIN tms_users AS scoop_cordintr_sub ON scoop_cordintr_sub.iUserId = its.subPc LEFT JOIN tms_project_status AS ps ON ps.pr_status_id = gen.project_status LEFT JOIN tms_customer_price_list AS cp ON its.project_pricelist = cp.price_list_id LEFT JOIN tms_item_status AS tis ON its.item_status = tis.item_status_id LEFT JOIN( SELECT resource_id, price_currency FROM tms_customer_price_list WHERE price_id = 1 GROUP BY resource_id ) AS cp2 ON cp2.resource_id = cust.client LEFT JOIN( SELECT tu.iUserId AS resources, tu.vFirstName, tu.vLastName, tu.vUserName, tsv.order_id, tsv.item_id, tsv.job_summmeryId FROM tms_summmery_view AS tsv LEFT JOIN tms_users AS tu ON tu.iUserId = tsv.resource ) AS jsv ON ( its.order_id = jsv.order_id AND its.item_number = jsv.item_id ) LEFT JOIN tms_discussion AS td ON ( td.order_id = its.order_id AND(NOT FIND_IN_SET('1', td.read_id)) ) WHERE its.order_id != 0 $whereCond GROUP BY its.order_id, its.item_number ) AS subquery";
        $tCount = $this->_db->rawQueryNew($qry);
        $totalCount = $tCount && isset($tCount[0]['totalCount']) ? $tCount[0]['totalCount'] : 0 ;

        $totalPages = ceil($totalCount / $perPage);
        //$qry = "SELECT * from tms_languages $whereCond limit $perPage offset $offset ";


        //$qry = "SELECT its.itemId, its.heads_up, gen.order_no AS orderNumber, gen.due_date AS DueDate, gen.order_id AS orderId, cust.created_date AS orderDate, cust.client AS customer, gen.project_name AS projectName, c.vUserName AS contactName, c.iClientId, stus.status_name AS clientStatus, c.vlogo AS clientlogo, c.tPoInfo AS ponumber, gen.company_code AS companyCode, gen.project_price, gen.expected_start_date, cust.contact AS contactPerson, its.item_number, its.po_number AS itemPonumber, its.start_date AS itemStartdate, its.due_date AS itemDuedate, its.upcomingDate, its.source_lang AS itemsSourceLang, its.target_lang AS itemsTargetLang, its.price AS scoop_price, its.subPm AS scoop_subPm_id, its.attached_workflow, gen.project_status AS projectStatus, gen.project_type AS projectType, c.project_branch, plang.source_lang AS sourceLanguage, plang.target_lang AS targetLanguage, its.total_price AS totalAmount, its.item_name AS scoopName, its.item_email_subject AS itemEmailSubject, inc.vUserName AS accountname, tu.vUserName AS pm_name, CONCAT(tu.vFirstName, ' ', tu.vLastName) AS pm_fullName, CONCAT( sub_tu.vFirstName, ' ', sub_tu.vLastName ) AS sub_pm_name, CONCAT( scoop_manager_tu.vFirstName, ' ', scoop_manager_tu.vLastName ) AS scoopPm_name, CONCAT( sub_scp_tu.vFirstName, ' ', sub_scp_tu.vLastName ) AS sub_scoopPm_name, CONCAT( gen_Qa.vFirstName, ' ', gen_Qa.vLastName ) AS gen_Qa_fullName, CONCAT( sub_gen_Qa.vFirstName, ' ', sub_gen_Qa.vLastName ) AS gen_sub_Qa_fullName, CONCAT( scp_Qa.vFirstName, ' ', scp_Qa.vLastName ) AS scp_Qa_fullName, CONCAT( sub_scp_Qa.vFirstName, ' ', sub_scp_Qa.vLastName ) AS scp_sub_Qa_fullName, CONCAT( P_cordintr.vFirstName, ' ', P_cordintr.vLastName ) AS P_cordintr_fullName, CONCAT( P_cordintr_sub.vFirstName, ' ', P_cordintr_sub.vLastName ) AS P_cordintr_sub_fullName, cust.project_coordinator AS project_coordinator_id, cust.project_manager AS project_manager_id, cust.QA_specialist AS qa_specialist_id, cust.sub_pm AS sub_pm_id, ps.project_status_name AS projectstatus_name, ps.status_color AS projectstatus_color, tis.item_status_name AS itemStatus, tis.item_status_id AS itemStatusId, c.client_currency, cp.price_currency, cp2.price_currency AS price_currency2, GROUP_CONCAT(DISTINCT(jsv.resources)) AS linguistId, GROUP_CONCAT( DISTINCT( CONCAT( jsv.vFirstName, ' ', jsv.vLastName ) ) ) AS linguistName, COUNT(td.id) AS comment_status, COUNT(td.id) AS comment_id FROM tms_items AS its LEFT JOIN tms_general AS gen ON its.order_id = gen.order_id LEFT JOIN tms_customer AS cust ON its.order_id = cust.order_id LEFT JOIN tms_proj_language AS plang ON its.order_id = plang.order_id LEFT JOIN tms_client AS c ON cust.client = c.iClientId LEFT JOIN tms_user_status AS stus ON c.vStatus = stus.status_id LEFT JOIN tms_client_indirect AS inc ON inc.iClientId = cust.indirect_customer LEFT JOIN tms_users AS tu ON tu.iUserId = cust.project_manager LEFT JOIN tms_users AS sub_tu ON sub_tu.iUserId = cust.sub_pm LEFT JOIN tms_users AS scoop_manager_tu ON scoop_manager_tu.iUserId = its.manager LEFT JOIN tms_users AS sub_scp_tu ON sub_scp_tu.iUserId = its.subPm LEFT JOIN tms_users AS gen_Qa ON gen_Qa.iUserId = cust.QA_specialist LEFT JOIN tms_users AS sub_gen_Qa ON sub_gen_Qa.iUserId = cust.sub_qa LEFT JOIN tms_users AS P_cordintr ON P_cordintr.iUserId = cust.project_coordinator LEFT JOIN tms_users AS P_cordintr_sub ON P_cordintr_sub.iUserId = cust.sub_pc LEFT JOIN tms_users AS scp_Qa ON scp_Qa.iUserId = its.qaSpecialist LEFT JOIN tms_users AS sub_scp_Qa ON sub_scp_Qa.iUserId = its.subQa LEFT JOIN tms_users AS scoop_cordintr ON scoop_cordintr.iUserId = its.coordinator LEFT JOIN tms_users AS scoop_cordintr_sub ON scoop_cordintr_sub.iUserId = its.subPc LEFT JOIN tms_project_status AS ps ON ps.pr_status_id = gen.project_status LEFT JOIN tms_customer_price_list AS cp ON its.project_pricelist = cp.price_list_id LEFT JOIN tms_item_status AS tis ON its.item_status = tis.item_status_id LEFT JOIN( SELECT resource_id, price_currency FROM tms_customer_price_list WHERE price_id = 1 GROUP BY resource_id ) AS cp2 ON cp2.resource_id = cust.client LEFT JOIN( SELECT tu.iUserId AS resources, tu.vFirstName, tu.vLastName, tu.vUserName, tsv.order_id, tsv.item_id, tsv.job_summmeryId FROM tms_summmery_view AS tsv LEFT JOIN tms_users AS tu ON tu.iUserId = tsv.resource WHERE tsv.item_status != 'Cancelled' ) AS jsv ON ( its.order_id = jsv.order_id AND its.item_number = jsv.item_id ) LEFT JOIN tms_discussion AS td ON ( td.order_id = its.order_id AND(NOT FIND_IN_SET('1', td.read_id)) ) WHERE its.order_id != 0 $whereCond GROUP BY its.itemId ORDER BY $sortBy limit $perPage offset $offset ";
        $discssionjoin = "LEFT JOIN tms_discussion AS td2 ON ( td2.scoop_id = its.itemId AND td2.job_id = 0 )";
        $qry = "SELECT its.itemId, its.heads_up, gen.order_no AS orderNumber, gen.due_date AS DueDate, gen.order_id AS orderId, cust.created_date AS orderDate, cust.client AS customer, gen.project_name AS projectName, c.vUserName AS contactName, c.iClientId, stus.status_name AS clientStatus, c.vlogo AS clientlogo, c.tPoInfo AS ponumber, gen.company_code AS companyCode, gen.project_price, gen.expected_start_date, cust.contact AS contactPerson, its.item_number, its.po_number AS itemPonumber, its.start_date AS itemStartdate, its.due_date AS itemDuedate, its.upcomingDate, its.source_lang AS itemsSourceLang, its.target_lang AS itemsTargetLang, its.price AS scoop_price, its.subPm AS scoop_subPm_id, its.attached_workflow, gen.project_status AS projectStatus, gen.project_type AS projectType, c.project_branch, plang.source_lang AS sourceLanguage, plang.target_lang AS targetLanguage, its.total_price AS totalAmount, its.item_name AS scoopName, its.item_email_subject AS itemEmailSubject, inc.vUserName AS accountname, tu.vUserName AS pm_name, CONCAT(tu.vFirstName, ' ', tu.vLastName) AS pm_fullName, CONCAT( sub_tu.vFirstName, ' ', sub_tu.vLastName ) AS sub_pm_name, CONCAT( scoop_manager_tu.vFirstName, ' ', scoop_manager_tu.vLastName ) AS scoopPm_name, CONCAT( sub_scp_tu.vFirstName, ' ', sub_scp_tu.vLastName ) AS sub_scoopPm_name, CONCAT( gen_Qa.vFirstName, ' ', gen_Qa.vLastName ) AS gen_Qa_fullName, CONCAT( sub_gen_Qa.vFirstName, ' ', sub_gen_Qa.vLastName ) AS gen_sub_Qa_fullName, CONCAT( scp_Qa.vFirstName, ' ', scp_Qa.vLastName ) AS scp_Qa_fullName, CONCAT( sub_scp_Qa.vFirstName, ' ', sub_scp_Qa.vLastName ) AS scp_sub_Qa_fullName, CONCAT( P_cordintr.vFirstName, ' ', P_cordintr.vLastName ) AS P_cordintr_fullName, CONCAT( P_cordintr_sub.vFirstName, ' ', P_cordintr_sub.vLastName ) AS P_cordintr_sub_fullName, cust.project_coordinator AS project_coordinator_id, cust.project_manager AS project_manager_id, cust.QA_specialist AS qa_specialist_id, cust.sub_pm AS sub_pm_id, ps.project_status_name AS projectstatus_name, ps.status_color AS projectstatus_color, tis.item_status_name AS itemStatus, tis.item_status_id AS itemStatusId, c.client_currency, cp.price_currency, cp2.price_currency AS price_currency2, GROUP_CONCAT(DISTINCT(jsv.resources)) AS linguistId, GROUP_CONCAT( DISTINCT( CONCAT( jsv.vFirstName, ' ', jsv.vLastName ) ) ) AS linguistName, COUNT(td.id) AS comment_status, COUNT(td.id) AS comment_id, td2.id as discussion_id, its.is_urgent_scoop 
            FROM tms_items AS its LEFT JOIN tms_general AS gen ON its.order_id = gen.order_id 
            LEFT JOIN tms_customer AS cust ON its.order_id = cust.order_id 
            LEFT JOIN tms_proj_language AS plang ON its.order_id = plang.order_id 
            LEFT JOIN tms_client AS c ON cust.client = c.iClientId 
            LEFT JOIN tms_user_status AS stus ON c.vStatus = stus.status_id 
            LEFT JOIN tms_client_indirect AS inc ON inc.iClientId = cust.indirect_customer 
            LEFT JOIN tms_users AS tu ON tu.iUserId = cust.project_manager 
            LEFT JOIN tms_users AS sub_tu ON sub_tu.iUserId = cust.sub_pm 
            LEFT JOIN tms_users AS scoop_manager_tu ON scoop_manager_tu.iUserId = its.manager 
            LEFT JOIN tms_users AS sub_scp_tu ON sub_scp_tu.iUserId = its.subPm 
            LEFT JOIN tms_users AS gen_Qa ON gen_Qa.iUserId = cust.QA_specialist 
            LEFT JOIN tms_users AS sub_gen_Qa ON sub_gen_Qa.iUserId = cust.sub_qa 
            LEFT JOIN tms_users AS P_cordintr ON P_cordintr.iUserId = cust.project_coordinator 
            LEFT JOIN tms_users AS P_cordintr_sub ON P_cordintr_sub.iUserId = cust.sub_pc 
            LEFT JOIN tms_users AS scp_Qa ON scp_Qa.iUserId = its.qaSpecialist 
            LEFT JOIN tms_users AS sub_scp_Qa ON sub_scp_Qa.iUserId = its.subQa 
            LEFT JOIN tms_users AS scoop_cordintr ON scoop_cordintr.iUserId = its.coordinator 
            LEFT JOIN tms_users AS scoop_cordintr_sub ON scoop_cordintr_sub.iUserId = its.subPc 
            LEFT JOIN tms_project_status AS ps ON ps.pr_status_id = gen.project_status 
            LEFT JOIN tms_customer_price_list AS cp ON its.project_pricelist = cp.price_list_id 
            LEFT JOIN tms_item_status AS tis ON its.item_status = tis.item_status_id 
            LEFT JOIN( SELECT resource_id, price_currency FROM tms_customer_price_list WHERE price_id = 1 GROUP BY resource_id ) AS cp2 ON cp2.resource_id = cust.client 
            LEFT JOIN( SELECT tu.iUserId AS resources, tu.vFirstName, tu.vLastName, tu.vUserName, tsv.order_id, tsv.item_id, tsv.job_summmeryId FROM tms_summmery_view AS tsv 
            LEFT JOIN tms_users AS tu ON tu.iUserId = tsv.resource WHERE tsv.item_status != 'Cancelled' ) AS jsv ON ( its.order_id = jsv.order_id AND its.item_number = jsv.item_id ) 
            LEFT JOIN tms_discussion AS td ON ( td.scoop_id = its.itemId AND td.job_id=0 AND ( NOT FIND_IN_SET($id, td.read_id)) ) 
            $discssionjoin 
            WHERE its.order_id != 0 $whereCond GROUP BY its.itemId ORDER BY $sortBy limit $perPage offset $offset 
            ";

        $results = $this->_db->rawQueryNew($qry);

        // echo $this->_db->getLastQuery();
        // die();
        //If yoy want to remove frontend forloop 
        if ($results) {
            try{
                foreach ($results as &$val) {
                    $val['pm_fullName'] = $val['scoop_subPm_id'] ? $val['sub_scoopPm_name'] : ($val['scoopPm_name'] ? $val['scoopPm_name'] : ($val['sub_pm_id'] ? $val['sub_pm_name'] : $val['pm_fullName']));
                    $val['qa_fullName'] = $val['scp_sub_Qa_fullName'] ? $val['scp_sub_Qa_fullName'] : ($val['scp_Qa_fullName'] ? $val['scp_Qa_fullName'] : ($val['gen_sub_Qa_fullName'] ? $val['gen_sub_Qa_fullName'] : $val['gen_Qa_fullName']));
                    
                    $val['attached_workflow'] = explode('-', $val['attached_workflow']);
                    $val['attached_workflow'] = end($val['attached_workflow']);
                    
                    $newLangData = ['sourceLang' => '', 'dataNgSrc' => '', 'alt' => ' '];
                    $val['itemsSourceLang'] = $val['itemsSourceLang'] ? json_decode($val['itemsSourceLang'], true) : $newLangData;
                    $val['itemsTargetLang'] = $val['itemsTargetLang'] ? json_decode($val['itemsTargetLang'], true) : $newLangData;
                    
                    // ----linguist List----- / 
                    $val['jobLinguist'] = [];
                    if ($val['linguistName']) {
                        $linguistIds = explode(',', $val['linguistId']);
                        $linguistNames = explode(',', $val['linguistName']);
                        foreach ($linguistNames as $i => $ele) {
                            $val['jobLinguist'][] = ['resources' => $linguistIds[$i], 'vUserName' => $ele];
                        }
                    }
                    
                    if ($val['sub_pm_id'] !== 0 && $val['sub_pm_name'] !== null) {
                        $val['pm_name'] = $val['sub_pm_name'];
                    }
                    
                    $currenciesClnt = isset($val['client_currency']) ? explode(',', $val['client_currency'])[0] : null;
                    $val['price_currency'] = $currenciesClnt ? $currenciesClnt : 'EUR';
                    
                    // Comment read unRead
                    // $cmtcolor = 'gray';
                    // if ($val['comment_status'] > 0) {
                    //     $cmtcolor = '#d30c39';
                    // } else if ($val['comment_status'] === 0) {
                    //     if($val['discussion_id'] == null){
                    //         $cmtcolor = 'gray';
                    //     }else{
                    //         $cmtcolor = '#67bb0a';
                    //     }
                    // }
                    // $val['comment'] = $cmtcolor;
                    $cmtcolor = ($val['comment_status'] > 0) ? '#d30c39' : (($val['discussion_id'] === null) ? 'gray' : '#67bb0a');
                    $val['comment'] = $cmtcolor;

                    //$scope->projectsAllCount++;
                    $val['projectstatus_class'] = 'projectstatus_common';
                    $val['projectstatus_color'] = '#8d9296';
                    
                    // is_urgent_scoop - update value to 0 if invoiced or Paid 
                    $val['is_urgent_scoop'] = isset($val['itemStatusId']) && ( in_array($val['itemStatusId'], [4, 5, 6, 7, 8, 9]) ) ? 0 : $val['is_urgent_scoop'];

                }
            }catch (Exception $e) {
            
            }
        }
        
        $gropedData = [];
        if(isset($_GET['completedTabGrouped']) && $_GET['completedTabGrouped'] != ''){
            $gropedData = self::groupByClientAndDueDate($results, $_GET['completedTabGrouped'], $sortOrder = '');
            //$results = $gropedData;
        }
        
        // Prepare response
        $results = [
            'totalItems' => $totalCount,
            'totalPages' => $totalPages,
            'currentPage' => $currentPage,
            'data' => $results,
            'groupedData' => $gropedData
        ];

        return $results;
    }

    public function projectsOrderScoopGet____($id) {
        
        $perPage = isset($_GET['perPage']) ? intval($_GET['perPage']) : 10;
        $currentPage = isset($_GET['page']) ? intval($_GET['page']) : 1;
        $offset = ($currentPage - 1) * $perPage;
        $whereCond = '';
        
        //$tabName = isset($_GET['tabName']) ? $_GET['tabName'] : '';
        $tabName = $_GET['tabName'] ?? '';
        if($tabName != ''){
            //$statusId = 1;
            if($tabName == 'tab-assigned'){
                $statusId = 1;
                //$whereCond = " AND its.item_status = 1 AND its.heads_up != 1   ";
            }
            if($tabName == 'tab-qa-ready'){
                $statusId = 10;
            }
            if($tabName == 'tab-qa-issue'){
                $statusId = 13;
            }
            if($tabName == 'tab-pm-ready'){
                $statusId = 12;
            }
            if($tabName == 'tab-to-be-delivered'){
                $statusId = 3;
            }
            if($tabName == 'tab-completed'){
                $statusId = 4;
            }
            if($tabName == 'tab-approved'){
                $statusId = 5;
            }
            if(isset($statusId)){
                $whereCond = " AND its.item_status = $statusId ";
            }
            if($tabName == 'tab-ongoing'){
                $whereCond = " AND its.item_status NOT IN (1,4,5,6,7,8,9,14) ";
            }
            //
            if($tabName == 'tab-due-today'){
                $whereCond = " AND DATE(its.due_date) = CURDATE() AND its.item_status NOT IN (4, 5, 6, 8, 9) ";
            }
            if($tabName == 'tab-due-tomorrow'){
                //$whereCond = " AND DATE(its.due_date) = CURDATE() + INTERVAL 1 DAY AND its.item_status NOT IN (4, 5, 6, 8, 9) ";
                $whereCond = " AND ( DATE(its.due_date) = CURDATE() + INTERVAL 1 DAY OR DATE(its.due_date) = ( CASE WHEN DAYOFWEEK(CURDATE() + INTERVAL 1 DAY) = 7 THEN CURDATE() + INTERVAL 3 DAY WHEN DAYOFWEEK(CURDATE() + INTERVAL 1 DAY) = 1 THEN CURDATE() + INTERVAL 2 DAY ELSE CURDATE() + INTERVAL 1 DAY END ) ) AND its.item_status NOT IN (4, 5, 6, 8, 9) ";
            }
            if($tabName == 'tab-all'){
                //$whereCond = " ";
            }
            if($tabName == 'tab-overdue'){
                // $whereCond = " AND DATE(its.due_date) < CURDATE() AND its.item_status NOT IN (4, 5, 6, 8, 9)";
                $whereCond = "DATE(its.due_date) < CURDATE() AND its.item_status NOT IN (4, 5, 6, 8, 9)";
            }
            if($tabName == 'tab-my-upcoming'){
                //$whereCond = " AND DATE(its.due_date) > CURDATE() + INTERVAL 1 DAY AND its.item_status NOT IN (4, 5, 6, 8, 9)";
                $whereCond = " AND its.heads_up = 1 AND its.item_status NOT IN (4, 6, 8, 9)";
            }
            if($tabName == 'tab-my-projects'){
                $whereCond = " AND (cust.project_manager = $id || cust.project_coordinator = $id || cust.QA_specialist = $id || cust.project_coordinator = $id || cust.sub_pm = $id || its.manager = $id || its.coordinator = $id || its.qaSpecialist = $id || its.subPm = $id || its.subPc = $id || its.subQa = $id) AND its.item_status NOT IN (4,5,6,7,8,9)  ";
                //$whereCond = " AND (its.project_manager_id = $id OR its.project_coordinator_id = $id OR its.qa_specialist_id = $id OR its.qa_specialist_id = $id OR its.sub_pm_id = $id  ) ";
            }
            if($tabName == 'tab-poMissing'){
                $whereCond = " AND po_number != '' AND PO_missing = '1'  ";
            }
            //$currentPage = 0;
        }

        $search = isset($_GET['search']) ? $_GET['search'] : '';
        if($search != ''){
            $sLang = "its.source_lang LIKE '%\"sourceLang\":\"$search\"%' ";
            $tLang = "its.target_lang LIKE '%\"sourceLang\":\"$search\"%' ";
            $clientName = " OR c.vUserName LIKE '%$search%' ";
            $attached_workflow = " OR its.attached_workflow LIKE '%$search%' ";
            $pOrderNo = $pOrderNo2 = '';
            if (strpos($search, '-') !== false) {
                // alternate 1
                // $parts = explode('-', $search);
                // $beforeHyphen = $parts[0];
                // $pOrderNo = " OR gen.order_no LIKE '$beforeHyphen%' ";
                
                // alternate 2
                $parts = explode('-', $search);
                //if (isset($parts[1]) && strlen($parts[1]) === 3) {
                if (isset($parts[1])) {
                        $parts[1] = ltrim($parts[1], '0');
                }else{
                    $pOrderNo2 = "OR gen.order_no  LIKE '%$search%' " ;
                }
                $combinedSearch = implode('-', $parts);
                $pOrderNo = "OR CONCAT(gen.order_no, '-', its.item_number) LIKE '%$combinedSearch%'";
            }else{
                $pOrderNo2 = "OR gen.order_no  LIKE '%$search%' " ;
            }
            $scoopName = "OR its.item_name  LIKE '%$search%' " ; 
            $scoopEmailSubject = "OR its.item_email_subject LIKE '%$search%' ";
            $find_project_m = "OR CONCAT(tu.vFirstName, ' ', tu.vLastName) LIKE '%$search%'";
            // QA
            $find_qa_spc = "OR CONCAT(gen_Qa.vFirstName, ' ', gen_Qa.vLastName) LIKE '%$search%'";
            $find_qa_sub = "OR CONCAT(sub_gen_Qa.vFirstName, ' ', sub_gen_Qa.vLastName) LIKE '%$search%'";
            $find_qa_scoop = "OR CONCAT(scp_Qa.vFirstName, ' ', scp_Qa.vLastName) LIKE '%$search%'";
            $find_qa_scoop_sub = "OR CONCAT(sub_scp_Qa.vFirstName, ' ', sub_scp_Qa.vLastName) LIKE '%$search%'";
            // project cordinator
            $find_cordinator = "OR CONCAT(P_cordintr.vFirstName, ' ', P_cordintr.vLastName) LIKE '%$search%'";
            $find_cordinator_sub = "OR CONCAT(P_cordintr_sub.vFirstName, ' ', P_cordintr_sub.vLastName) LIKE '%$search%'";
            $find_cordinator_scoop = "OR CONCAT(scoop_cordintr.vFirstName, ' ', scoop_cordintr.vLastName) LIKE '%$search%'";
            $find_cordinator_scoop_sub = "OR CONCAT(scoop_cordintr_sub.vFirstName, ' ', scoop_cordintr_sub.vLastName) LIKE '%$search%'";
            
            $find_job = "OR its.attached_workflow LIKE '%$search%' ";
            $find_linguist = "OR CONCAT( jsv.vFirstName, ' ', jsv.vLastName ) LIKE '%$search%'";
            $projectScoopName = "OR its.item_name LIKE '%$search%' ";
            
            $whereCond .= " AND ( its.po_number LIKE '%$search%' OR $sLang OR $tLang $clientName $attached_workflow $scoopName $scoopEmailSubject $pOrderNo $find_project_m $find_qa_spc $find_qa_sub $find_qa_scoop $find_qa_scoop_sub $find_cordinator $find_cordinator_sub $find_cordinator_scoop $find_cordinator_scoop_sub $find_job $find_linguist $pOrderNo2 $projectScoopName) ";
            $currentPage = 0;
        }
        
        //$sortBy = ' its.due_date DESC';
        // $sortBy = " STR_TO_DATE(its.due_date, '%Y-%m-%d %H:%i:%s') DESC";
        
        // alternate 1
        //$sortBy = "  CASE WHEN its.due_date IS NULL OR its.due_date = '0000-00-00 00:00:00' THEN 4 WHEN its.due_date = CURDATE() THEN 1 WHEN its.due_date > CURDATE() THEN 2 ELSE 3 END, CASE WHEN its.due_date = CURDATE() THEN its.due_date WHEN its.due_date > CURDATE() THEN its.due_date ELSE NULL END ASC, CASE WHEN its.due_date < CURDATE() THEN its.due_date ELSE NULL END DESC ";
        $sortBy = "
        CASE
          WHEN its.due_date IS NULL OR its.due_date = '0000-00-00 00:00:00' THEN 4
          WHEN DATE(its.due_date) = CURDATE() THEN 1
          WHEN DATE(its.due_date) > CURDATE() THEN 2 
          ELSE 3
        END,
        its.due_date ASC
        ";

        // alternate 2
        // $sortBy = "
        // CASE
        //     WHEN its.due_date IS NULL OR its.due_date = '0000-00-00 00:00:00' THEN 4
        //     WHEN DATE(its.due_date) = CURDATE() THEN 1
        //     WHEN DATE(its.due_date) > CURDATE() THEN 2
        //     ELSE 3
        // END,
        // CASE 
        //     WHEN DATE(its.due_date) = CURDATE() THEN its.due_date
        //     WHEN DATE(its.due_date) > CURDATE() THEN its.due_date
        //     ELSE NULL
        // END ASC,
        // CASE
        //     WHEN DATE(its.due_date) < CURDATE() THEN its.due_date
        //     ELSE NULL
        // END DESC";

        if(isset($_GET['sortBy']) && $_GET['sortBy']!=''){
            $sortBy = $_GET['sortBy'];
            if($_GET['sortBy'] == 'clientName')
                $sortBy = 'c.vUserName';
            if($_GET['sortBy'] == 'projectManager')
                $sortBy = 'tu.vFirstName';
            if($_GET['sortBy'] == 'qaSpecialist')
                $sortBy = 'gen_Qa.vFirstName';
            if($_GET['sortBy'] == 'linguist')
                $sortBy = 'jsv.vFirstName';
            if($_GET['sortBy'] == 'scoopStatus')
                $sortBy = 'tis.item_status_name';
            if($_GET['sortBy'] == 'deadline')
                $sortBy = "  STR_TO_DATE(its.due_date, '%Y-%m-%d %H:%i:%s') ";
            if($_GET['sortBy'] == 'projectNumber')
                $sortBy = "its.item_name";
            //$sortBy = 'DATE(its.due_date)';    
            
            $sortOrder = isset($_GET['sortOrder']) && $_GET['sortOrder'] != '' ? $_GET['sortOrder'] : 'ASC' ;
            $sortBy1 = $sortBy;
            $sortBy = " $sortBy $sortOrder  ";
        }

        //$qry = "SELECT its.itemId from tms_items as its LEFT JOIN tms_customer AS cust ON its.order_id = cust.order_id LEFT JOIN tms_client AS c ON cust.client = c.iClientId where its.order_id != 0  $whereCond  ";
        if($tabName == 'tab-overdue'){
            // alternate 1
            // $this->_db->where('its.order_id != 0 AND DATE(its.due_date) < CURDATE() AND its.item_status NOT IN (4, 5, 6, 8, 9)');
            // $qry = $this->_db->get('tms_items as its');
            // $totalCount = (isset($qry) && !empty($qry)) ? count($qry) : 0;

            // alternate 2
            //$sql = "SELECT COUNT(*) AS totalCount FROM ( SELECT its.itemId FROM tms_items AS its LEFT JOIN tms_general AS gen ON its.order_id = gen.order_id LEFT JOIN tms_customer AS cust ON its.order_id = cust.order_id LEFT JOIN tms_proj_language AS plang ON its.order_id = plang.order_id LEFT JOIN tms_client AS c ON cust.client = c.iClientId LEFT JOIN tms_user_status AS stus ON c.vStatus = stus.status_id LEFT JOIN tms_client_indirect AS inc ON inc.iClientId = cust.indirect_customer LEFT JOIN tms_users AS tu ON tu.iUserId = cust.project_manager LEFT JOIN tms_users AS sub_tu ON sub_tu.iUserId = cust.sub_pm LEFT JOIN tms_users AS sub_scp_tu ON sub_scp_tu.iUserId = its.subPm LEFT JOIN tms_users AS gen_Qa ON gen_Qa.iUserId = cust.QA_specialist LEFT JOIN tms_users AS sub_gen_Qa ON sub_gen_Qa.iUserId = cust.sub_qa LEFT JOIN tms_users AS scp_Qa ON scp_Qa.iUserId = its.qaSpecialist LEFT JOIN tms_users AS sub_scp_Qa ON sub_scp_Qa.iUserId = its.subQa LEFT JOIN tms_project_status AS ps ON ps.pr_status_id = gen.project_status LEFT JOIN tms_customer_price_list AS cp ON its.project_pricelist = cp.price_list_id LEFT JOIN tms_item_status AS tis ON its.item_status = tis.item_status_id LEFT JOIN ( SELECT resource_id, price_currency FROM tms_customer_price_list WHERE price_id = 1 GROUP BY resource_id ) AS cp2 ON cp2.resource_id = cust.client LEFT JOIN ( SELECT tu.iUserId AS resources, tu.vFirstName, tu.vLastName, tu.vUserName, tsv.order_id, tsv.item_id, tsv.job_summmeryId FROM tms_summmery_view AS tsv LEFT JOIN tms_users AS tu ON tu.iUserId = tsv.resource ) AS jsv ON (its.order_id = jsv.order_id AND its.item_number = jsv.item_id) LEFT JOIN tms_discussion AS td ON (td.order_id = its.order_id AND (NOT FIND_IN_SET('1', td.read_id))) WHERE its.order_id != 0 AND DATE(its.due_date) < CURDATE() AND its.item_status NOT IN (4, 5, 6, 8, 9) GROUP BY its.itemId ) AS subquery";
            $sql = "SELECT COUNT(*) AS totalCount FROM ( SELECT its.itemId FROM tms_items AS its LEFT JOIN tms_general AS gen ON its.order_id = gen.order_id LEFT JOIN tms_customer AS cust ON its.order_id = cust.order_id LEFT JOIN tms_proj_language AS plang ON its.order_id = plang.order_id LEFT JOIN tms_client AS c ON cust.client = c.iClientId LEFT JOIN tms_user_status AS stus ON c.vStatus = stus.status_id LEFT JOIN tms_client_indirect AS inc ON inc.iClientId = cust.indirect_customer LEFT JOIN tms_users AS tu ON tu.iUserId = cust.project_manager LEFT JOIN tms_users AS sub_tu ON sub_tu.iUserId = cust.sub_pm LEFT JOIN tms_users AS sub_scp_tu ON sub_scp_tu.iUserId = its.subPm LEFT JOIN tms_users AS gen_Qa ON gen_Qa.iUserId = cust.QA_specialist LEFT JOIN tms_users AS sub_gen_Qa ON sub_gen_Qa.iUserId = cust.sub_qa LEFT JOIN tms_users AS scp_Qa ON scp_Qa.iUserId = its.qaSpecialist LEFT JOIN tms_users AS sub_scp_Qa ON sub_scp_Qa.iUserId = its.subQa LEFT JOIN tms_project_status AS ps ON ps.pr_status_id = gen.project_status LEFT JOIN tms_customer_price_list AS cp ON its.project_pricelist = cp.price_list_id LEFT JOIN tms_item_status AS tis ON its.item_status = tis.item_status_id LEFT JOIN ( SELECT resource_id, price_currency FROM tms_customer_price_list WHERE price_id = 1 GROUP BY resource_id ) AS cp2 ON cp2.resource_id = cust.client LEFT JOIN ( SELECT tu.iUserId AS resources, tu.vFirstName, tu.vLastName, tu.vUserName, tsv.order_id, tsv.item_id, tsv.job_summmeryId FROM tms_summmery_view AS tsv LEFT JOIN tms_users AS tu ON tu.iUserId = tsv.resource ) AS jsv ON (its.order_id = jsv.order_id AND its.item_number = jsv.item_id) LEFT JOIN tms_discussion AS td ON (td.order_id = its.order_id AND (NOT FIND_IN_SET('1', td.read_id))) WHERE its.order_id != 0 AND DATE(its.due_date) < CURDATE() AND its.item_status NOT IN (4, 5, 6, 8, 9) GROUP BY its.order_id, its.item_number ) AS subquery";
            $stmt = $this->_conn->prepare($sql);
            $stmt->execute();
            $get_query = $stmt->get_result();
            $tCount = $get_query->fetch_all(MYSQLI_ASSOC);
            $totalCount = ($tCount && isset($tCount[0]['totalCount'])) ? $tCount[0]['totalCount'] : 0 ;
        }else{
            //$qry = "SELECT COUNT(*) AS totalCount FROM ( SELECT its.itemId FROM tms_items AS its LEFT JOIN tms_general AS gen ON its.order_id = gen.order_id LEFT JOIN tms_customer AS cust ON its.order_id = cust.order_id LEFT JOIN tms_proj_language AS plang ON its.order_id = plang.order_id LEFT JOIN tms_client AS c ON cust.client = c.iClientId LEFT JOIN tms_user_status AS stus ON c.vStatus = stus.status_id LEFT JOIN tms_client_indirect AS inc ON inc.iClientId = cust.indirect_customer LEFT JOIN tms_users AS tu ON tu.iUserId = cust.project_manager LEFT JOIN tms_users AS sub_tu ON sub_tu.iUserId = cust.sub_pm LEFT JOIN tms_users AS scoop_manager_tu ON scoop_manager_tu.iUserId = its.manager LEFT JOIN tms_users AS sub_scp_tu ON sub_scp_tu.iUserId = its.subPm LEFT JOIN tms_users AS gen_Qa ON gen_Qa.iUserId = cust.QA_specialist LEFT JOIN tms_users AS sub_gen_Qa ON sub_gen_Qa.iUserId = cust.sub_qa LEFT JOIN tms_users AS P_cordintr ON P_cordintr.iUserId = cust.project_coordinator LEFT JOIN tms_users AS P_cordintr_sub ON P_cordintr_sub.iUserId = cust.sub_pc LEFT JOIN tms_users AS scp_Qa ON scp_Qa.iUserId = its.qaSpecialist LEFT JOIN tms_users AS sub_scp_Qa ON sub_scp_Qa.iUserId = its.subQa LEFT JOIN tms_users AS scoop_cordintr ON scoop_cordintr.iUserId = its.coordinator LEFT JOIN tms_users AS scoop_cordintr_sub ON scoop_cordintr_sub.iUserId = its.subPc LEFT JOIN tms_project_status AS ps ON ps.pr_status_id = gen.project_status LEFT JOIN tms_customer_price_list AS cp ON its.project_pricelist = cp.price_list_id LEFT JOIN tms_item_status AS tis ON its.item_status = tis.item_status_id LEFT JOIN( SELECT resource_id, price_currency FROM tms_customer_price_list WHERE price_id = 1 GROUP BY resource_id ) AS cp2 ON cp2.resource_id = cust.client LEFT JOIN( SELECT tu.iUserId AS resources, tu.vFirstName, tu.vLastName, tu.vUserName, tsv.order_id, tsv.item_id, tsv.job_summmeryId FROM tms_summmery_view AS tsv LEFT JOIN tms_users AS tu ON tu.iUserId = tsv.resource ) AS jsv ON ( its.order_id = jsv.order_id AND its.item_number = jsv.item_id ) LEFT JOIN tms_discussion AS td ON ( td.order_id = its.order_id AND(NOT FIND_IN_SET('1', td.read_id)) ) WHERE its.order_id != 0 $whereCond GROUP BY its.itemId ) AS subquery";
            $qry = "SELECT COUNT(*) AS totalCount FROM ( SELECT its.itemId FROM tms_items AS its LEFT JOIN tms_general AS gen ON its.order_id = gen.order_id LEFT JOIN tms_customer AS cust ON its.order_id = cust.order_id LEFT JOIN tms_proj_language AS plang ON its.order_id = plang.order_id LEFT JOIN tms_client AS c ON cust.client = c.iClientId LEFT JOIN tms_user_status AS stus ON c.vStatus = stus.status_id LEFT JOIN tms_client_indirect AS inc ON inc.iClientId = cust.indirect_customer LEFT JOIN tms_users AS tu ON tu.iUserId = cust.project_manager LEFT JOIN tms_users AS sub_tu ON sub_tu.iUserId = cust.sub_pm LEFT JOIN tms_users AS scoop_manager_tu ON scoop_manager_tu.iUserId = its.manager LEFT JOIN tms_users AS sub_scp_tu ON sub_scp_tu.iUserId = its.subPm LEFT JOIN tms_users AS gen_Qa ON gen_Qa.iUserId = cust.QA_specialist LEFT JOIN tms_users AS sub_gen_Qa ON sub_gen_Qa.iUserId = cust.sub_qa LEFT JOIN tms_users AS P_cordintr ON P_cordintr.iUserId = cust.project_coordinator LEFT JOIN tms_users AS P_cordintr_sub ON P_cordintr_sub.iUserId = cust.sub_pc LEFT JOIN tms_users AS scp_Qa ON scp_Qa.iUserId = its.qaSpecialist LEFT JOIN tms_users AS sub_scp_Qa ON sub_scp_Qa.iUserId = its.subQa LEFT JOIN tms_users AS scoop_cordintr ON scoop_cordintr.iUserId = its.coordinator LEFT JOIN tms_users AS scoop_cordintr_sub ON scoop_cordintr_sub.iUserId = its.subPc LEFT JOIN tms_project_status AS ps ON ps.pr_status_id = gen.project_status LEFT JOIN tms_customer_price_list AS cp ON its.project_pricelist = cp.price_list_id LEFT JOIN tms_item_status AS tis ON its.item_status = tis.item_status_id LEFT JOIN( SELECT resource_id, price_currency FROM tms_customer_price_list WHERE price_id = 1 GROUP BY resource_id ) AS cp2 ON cp2.resource_id = cust.client LEFT JOIN( SELECT tu.iUserId AS resources, tu.vFirstName, tu.vLastName, tu.vUserName, tsv.order_id, tsv.item_id, tsv.job_summmeryId FROM tms_summmery_view AS tsv LEFT JOIN tms_users AS tu ON tu.iUserId = tsv.resource ) AS jsv ON ( its.order_id = jsv.order_id AND its.item_number = jsv.item_id ) LEFT JOIN tms_discussion AS td ON ( td.order_id = its.order_id AND(NOT FIND_IN_SET('1', td.read_id)) ) WHERE its.order_id != 0 $whereCond GROUP BY its.order_id, its.item_number ) AS subquery";
            $tCount = $this->_db->rawQuery($qry);
            $totalCount = $tCount && isset($tCount[0]['totalCount']) ? $tCount[0]['totalCount'] : 0 ;
        }
        $totalPages = ceil($totalCount / $perPage);
        //$qry = "SELECT * from tms_languages $whereCond limit $perPage offset $offset ";

        if($tabName == 'tab-overdue'){
            // alternate 1
            $this->_db->groupby('its.itemId');
            if(isset($_GET['sortBy']) && $_GET['sortBy']!='' && $_GET['sortBy'] !== 'deadline'){
                $this->_db->orderby($sortBy1, $sortOrder);
            }else{
                $sortOrder2 = isset($_GET['sortOrder']) && $_GET['sortOrder'] != '' ? $_GET['sortOrder'] : 'DESC' ;
                $this->_db->orderby('its.due_date', $sortOrder2);
            }
            // $this->_db->where('its.order_id != 0 AND DATE(its.due_date) < CURDATE() AND its.item_status NOT IN (4, 5, 6, 8, 9)');
            $this->_db->where('its.order_id != 0');
            $this->_db->where($whereCond);
            $this->_db->join('tms_general AS gen','its.order_id = gen.order_id','LEFT');
            $this->_db->join('tms_customer AS cust','its.order_id = cust.order_id','LEFT');
            $this->_db->join('tms_proj_language AS plang','its.order_id = plang.order_id','LEFT');
            $this->_db->join('tms_client AS c','cust.client  = c.iClientId','LEFT');
            $this->_db->join('tms_user_status AS stus','c.vStatus = stus.status_id','LEFT');
            $this->_db->join('tms_client_indirect AS inc','inc.iClientId = cust.indirect_customer','LEFT');
            $this->_db->join('tms_users AS tu','tu.iUserId = cust.project_manager','LEFT');
            $this->_db->join('tms_users AS sub_tu','sub_tu.iUserId = cust.sub_pm','LEFT');
            $this->_db->join('tms_users AS scoop_manager_tu','scoop_manager_tu.iUserId = its.manager','LEFT');
            $this->_db->join('tms_users AS sub_scp_tu','sub_scp_tu.iUserId = its.subPm','LEFT');
            $this->_db->join('tms_users AS gen_Qa','gen_Qa.iUserId = cust.QA_specialist','LEFT');
            $this->_db->join('tms_users AS sub_gen_Qa','sub_gen_Qa.iUserId = cust.sub_qa','LEFT');
            $this->_db->join('tms_users AS scp_Qa','scp_Qa.iUserId = its.qaSpecialist','LEFT');
            $this->_db->join('tms_users AS sub_scp_Qa','sub_scp_Qa.iUserId = its.subQa','LEFT');
            $this->_db->join('tms_users AS sub_scp_Qa','sub_scp_Qa.iUserId = its.subQa','LEFT');
            $this->_db->join('tms_users AS P_cordintr','P_cordintr.iUserId = cust.project_coordinator','LEFT');
            $this->_db->join('tms_users AS P_cordintr_sub','P_cordintr_sub.iUserId = cust.sub_pc','LEFT');
            $this->_db->join('tms_users AS scoop_cordintr','scoop_cordintr.iUserId = its.coordinator','LEFT');
            $this->_db->join('tms_users AS scoop_cordintr_sub','scoop_cordintr_sub.iUserId = its.subPc','LEFT');
            $this->_db->join('tms_project_status AS ps','ps.pr_status_id = gen.project_status','LEFT');
            $this->_db->join('tms_customer_price_list AS cp','its.project_pricelist = cp.price_list_id','LEFT');
            $this->_db->join('tms_item_status AS tis','its.item_status = tis.item_status_id','LEFT');
            $this->_db->join('(SELECT resource_id, price_currency FROM tms_customer_price_list WHERE price_id = 1 GROUP BY resource_id) AS cp2','cp2.resource_id = cust.client','LEFT');
            $subquery = '(SELECT tu.iUserId AS resources, tu.vFirstName, tu.vLastName, tu.vUserName, tsv.order_id, tsv.item_id, tsv.job_summmeryId FROM tms_summmery_view AS tsv  LEFT JOIN tms_users AS tu ON tu.iUserId = tsv.resource ) AS jsv ';
            $this->_db->join($subquery, 'its.order_id = jsv.order_id AND its.item_number = jsv.item_id', 'LEFT');
            //$this->_db->join('(SELECT tu.iUserId AS resources, tu.vFirstName, tu.vLastName,tu.vUserName,tsv.order_id,tsv.item_id,tsv.job_summmeryId FROM tms_summmery_view AS tsv LEFT JOIN tms_users AS tu ON tu.iUserId = tsv.resource) AS jsv','its.order_id = jsv.order_id AND its.item_number = jsv.item_id','LEFT');
            //$this->_db->join('tms_discussion AS td','td.order_id = its.order_id AND(NOT FIND_IN_SET("1", td.read_id))','LEFT');
            $this->_db->join('tms_discussion AS td', 'td.scoop_id = its.itemId AND td.job_id=0 AND ( NOT FIND_IN_SET(' . $id . ', td.read_id))', 'LEFT');
            $results = $this->_db->get('tms_items as its',null , 'its.itemId, its.heads_up, gen.order_no AS orderNumber, gen.due_date AS DueDate, gen.order_id AS orderId, cust.created_date AS orderDate, cust.client AS customer, gen.project_name AS projectName, c.vUserName AS contactName, c.iClientId, stus.status_name AS clientStatus, c.vlogo AS clientlogo, c.tPoInfo AS ponumber, gen.company_code AS companyCode, gen.project_price, gen.expected_start_date, cust.contact AS contactPerson, its.item_number, its.po_number AS itemPonumber, its.start_date AS itemStartdate, its.due_date AS itemDuedate, its.upcomingDate, its.source_lang AS itemsSourceLang, its.target_lang AS itemsTargetLang, its.price AS scoop_price, its.subPm AS scoop_subPm_id, its.attached_workflow, gen.project_status AS projectStatus, gen.project_type AS projectType, c.project_branch, plang.source_lang AS sourceLanguage, plang.target_lang AS targetLanguage, its.total_price AS totalAmount, its.item_name AS scoopName, its.item_email_subject AS itemEmailSubject, inc.vUserName AS accountname, tu.vUserName AS pm_name, CONCAT(tu.vFirstName, " ", tu.vLastName) AS pm_fullName, CONCAT( sub_tu.vFirstName, " ", sub_tu.vLastName ) AS sub_pm_name, CONCAT( scoop_manager_tu.vFirstName, " ", scoop_manager_tu.vLastName ) AS scoopPm_name, CONCAT( sub_scp_tu.vFirstName, " ", sub_scp_tu.vLastName ) AS sub_scoopPm_name, CONCAT(gen_Qa.vFirstName, " ", gen_Qa.vLastName) AS gen_Qa_fullName, CONCAT(sub_gen_Qa.vFirstName, " ", sub_gen_Qa.vLastName) AS gen_sub_Qa_fullName, CONCAT(scp_Qa.vFirstName, " ", scp_Qa.vLastName) AS scp_Qa_fullName, CONCAT(sub_scp_Qa.vFirstName, " ", sub_scp_Qa.vLastName) AS scp_sub_Qa_fullName, cust.project_coordinator AS project_coordinator_id, cust.project_manager AS project_manager_id, cust.QA_specialist AS qa_specialist_id, cust.sub_pm AS sub_pm_id, ps.project_status_name AS projectstatus_name, ps.status_color AS projectstatus_color, tis.item_status_name AS itemStatus, tis.item_status_id AS itemStatusId, c.client_currency, cp.price_currency, cp2.price_currency AS price_currency2, GROUP_CONCAT(DISTINCT(jsv.resources)) AS linguistId, GROUP_CONCAT( DISTINCT( CONCAT( jsv.vFirstName, " ", jsv.vLastName ) ) ) AS linguistName, COUNT(td.id) AS comment_status, COUNT(td.id) AS comment_id');
        
            // alternate 2
            // if ($this->_conn->connect_error) {
            //     die("Connection failed: " . $this->_conn->connect_error);
            // }

            // alternate 3
            // $sql = "SELECT its.itemId, its.heads_up, gen.order_no AS orderNumber, gen.due_date AS DueDate, gen.order_id AS orderId, cust.created_date AS orderDate, cust.client AS customer, gen.project_name AS projectName, c.vUserName AS contactName, c.iClientId, stus.status_name AS clientStatus, c.vlogo AS clientlogo, c.tPoInfo AS ponumber, gen.company_code AS companyCode, gen.project_price, gen.expected_start_date, cust.contact AS contactPerson, its.item_number, its.po_number AS itemPonumber, its.start_date AS itemStartdate, its.due_date AS itemDuedate, its.upcomingDate, its.source_lang AS itemsSourceLang, its.target_lang AS itemsTargetLang, its.price AS scoop_price, its.subPm AS scoop_subPm_id, its.attached_workflow, gen.project_status AS projectStatus, gen.project_type AS projectType, c.project_branch, plang.source_lang AS sourceLanguage, plang.target_lang AS targetLanguage, its.total_price AS totalAmount, its.item_name AS scoopName, its.item_email_subject AS itemEmailSubject, inc.vUserName AS accountname, tu.vUserName AS pm_name, CONCAT(tu.vFirstName, ' ', tu.vLastName) AS pm_fullName, CONCAT( sub_tu.vFirstName, ' ', sub_tu.vLastName ) AS sub_pm_name, CONCAT( sub_scp_tu.vFirstName, ' ', sub_scp_tu.vLastName ) AS sub_scoopPm_name, CONCAT(gen_Qa.vFirstName, ' ', gen_Qa.vLastName) AS gen_Qa_fullName, CONCAT(sub_gen_Qa.vFirstName, ' ', sub_gen_Qa.vLastName) AS gen_sub_Qa_fullName, CONCAT(scp_Qa.vFirstName, ' ', scp_Qa.vLastName) AS scp_Qa_fullName, CONCAT(sub_scp_Qa.vFirstName, ' ', sub_scp_Qa.vLastName) AS scp_sub_Qa_fullName, cust.project_coordinator AS project_coordinator_id, cust.project_manager AS project_manager_id, cust.QA_specialist AS qa_specialist_id, cust.sub_pm AS sub_pm_id, ps.project_status_name AS projectstatus_name, ps.status_color AS projectstatus_color, tis.item_status_name AS itemStatus, tis.item_status_id AS itemStatusId, c.client_currency, cp.price_currency, cp2.price_currency AS price_currency2, GROUP_CONCAT(DISTINCT(jsv.resources)) AS linguistId, GROUP_CONCAT( DISTINCT( CONCAT( jsv.vFirstName, ' ', jsv.vLastName ) ) ) AS linguistName, COUNT(td.id) AS comment_status, COUNT(td.id) AS comment_id FROM tms_items AS its LEFT JOIN tms_general AS gen ON its.order_id = gen.order_id LEFT JOIN tms_customer AS cust ON its.order_id = cust.order_id LEFT JOIN tms_proj_language AS plang ON its.order_id = plang.order_id LEFT JOIN tms_client AS c ON cust.client = c.iClientId LEFT JOIN tms_user_status AS stus ON c.vStatus = stus.status_id LEFT JOIN tms_client_indirect AS inc ON inc.iClientId = cust.indirect_customer LEFT JOIN tms_users AS tu ON tu.iUserId = cust.project_manager LEFT JOIN tms_users AS sub_tu ON sub_tu.iUserId = cust.sub_pm LEFT JOIN tms_users AS sub_scp_tu ON sub_scp_tu.iUserId = its.subPm LEFT JOIN tms_users AS gen_Qa ON gen_Qa.iUserId = cust.QA_specialist LEFT JOIN tms_users AS sub_gen_Qa ON sub_gen_Qa.iUserId = cust.sub_qa LEFT JOIN tms_users AS scp_Qa ON scp_Qa.iUserId = its.qaSpecialist LEFT JOIN tms_users AS sub_scp_Qa ON sub_scp_Qa.iUserId = its.subQa LEFT JOIN tms_project_status AS ps ON ps.pr_status_id = gen.project_status LEFT JOIN tms_customer_price_list AS cp ON its.project_pricelist = cp.price_list_id LEFT JOIN tms_item_status AS tis ON its.item_status = tis.item_status_id LEFT JOIN( SELECT resource_id, price_currency FROM tms_customer_price_list WHERE price_id = 1 GROUP BY resource_id ) AS cp2 ON cp2.resource_id = cust.client LEFT JOIN( SELECT tu.iUserId AS resources, tu.vFirstName, tu.vLastName, tu.vUserName, tsv.order_id, tsv.item_id, tsv.job_summmeryId FROM tms_summmery_view AS tsv LEFT JOIN tms_users AS tu ON tu.iUserId = tsv.resource ) AS jsv ON ( its.order_id = jsv.order_id AND its.item_number = jsv.item_id ) LEFT JOIN tms_discussion AS td ON ( td.order_id = its.order_id AND(NOT FIND_IN_SET('1', td.read_id)) ) WHERE its.order_id != 0 $whereCond GROUP BY its.itemId ORDER BY $sortBy limit $perPage offset $offset ";
            // $stmt = $this->_conn->prepare($sql);
            // $stmt->execute();
            // $get_query = $stmt->get_result();
            // $results = $get_query->fetch_all(MYSQLI_ASSOC);

            // alternate 4
            // $results = [];
            // $sql = "SELECT its.itemId, its.heads_up, gen.order_no AS orderNumber, gen.due_date AS DueDate, gen.order_id AS orderId, cust.created_date AS orderDate, cust.client AS customer, gen.project_name AS projectName, c.vUserName AS contactName, c.iClientId, stus.status_name AS clientStatus, c.vlogo AS clientlogo, c.tPoInfo AS ponumber, gen.company_code AS companyCode, gen.project_price, gen.expected_start_date, cust.contact AS contactPerson, its.item_number, its.po_number AS itemPonumber, its.start_date AS itemStartdate, its.due_date AS itemDuedate, its.upcomingDate, its.source_lang AS itemsSourceLang, its.target_lang AS itemsTargetLang, its.price AS scoop_price, its.subPm AS scoop_subPm_id, its.attached_workflow, gen.project_status AS projectStatus, gen.project_type AS projectType, c.project_branch, plang.source_lang AS sourceLanguage, plang.target_lang AS targetLanguage, its.total_price AS totalAmount, its.item_name AS scoopName, its.item_email_subject AS itemEmailSubject, inc.vUserName AS accountname, tu.vUserName AS pm_name, CONCAT(tu.vFirstName, ' ', tu.vLastName) AS pm_fullName, CONCAT( sub_tu.vFirstName, ' ', sub_tu.vLastName ) AS sub_pm_name, CONCAT( sub_scp_tu.vFirstName, ' ', sub_scp_tu.vLastName ) AS sub_scoopPm_name, CONCAT(gen_Qa.vFirstName, ' ', gen_Qa.vLastName) AS gen_Qa_fullName, CONCAT(sub_gen_Qa.vFirstName, ' ', sub_gen_Qa.vLastName) AS gen_sub_Qa_fullName, CONCAT(scp_Qa.vFirstName, ' ', scp_Qa.vLastName) AS scp_Qa_fullName, CONCAT(sub_scp_Qa.vFirstName, ' ', sub_scp_Qa.vLastName) AS scp_sub_Qa_fullName, cust.project_coordinator AS project_coordinator_id, cust.project_manager AS project_manager_id, cust.QA_specialist AS qa_specialist_id, cust.sub_pm AS sub_pm_id, ps.project_status_name AS projectstatus_name, ps.status_color AS projectstatus_color, tis.item_status_name AS itemStatus, tis.item_status_id AS itemStatusId, c.client_currency, cp.price_currency, cp2.price_currency AS price_currency2, GROUP_CONCAT(DISTINCT(jsv.resources)) AS linguistId, GROUP_CONCAT( DISTINCT( CONCAT( jsv.vFirstName, ' ', jsv.vLastName ) ) ) AS linguistName, COUNT(td.id) AS comment_status, COUNT(td.id) AS comment_id FROM tms_items AS its LEFT JOIN tms_general AS gen ON its.order_id = gen.order_id LEFT JOIN tms_customer AS cust ON its.order_id = cust.order_id LEFT JOIN tms_proj_language AS plang ON its.order_id = plang.order_id LEFT JOIN tms_client AS c ON cust.client = c.iClientId LEFT JOIN tms_user_status AS stus ON c.vStatus = stus.status_id LEFT JOIN tms_client_indirect AS inc ON inc.iClientId = cust.indirect_customer LEFT JOIN tms_users AS tu ON tu.iUserId = cust.project_manager LEFT JOIN tms_users AS sub_tu ON sub_tu.iUserId = cust.sub_pm LEFT JOIN tms_users AS sub_scp_tu ON sub_scp_tu.iUserId = its.subPm LEFT JOIN tms_users AS gen_Qa ON gen_Qa.iUserId = cust.QA_specialist LEFT JOIN tms_users AS sub_gen_Qa ON sub_gen_Qa.iUserId = cust.sub_qa LEFT JOIN tms_users AS scp_Qa ON scp_Qa.iUserId = its.qaSpecialist LEFT JOIN tms_users AS sub_scp_Qa ON sub_scp_Qa.iUserId = its.subQa LEFT JOIN tms_project_status AS ps ON ps.pr_status_id = gen.project_status LEFT JOIN tms_customer_price_list AS cp ON its.project_pricelist = cp.price_list_id LEFT JOIN tms_item_status AS tis ON its.item_status = tis.item_status_id LEFT JOIN( SELECT resource_id, price_currency FROM tms_customer_price_list WHERE price_id = 1 GROUP BY resource_id ) AS cp2 ON cp2.resource_id = cust.client LEFT JOIN( SELECT tu.iUserId AS resources, tu.vFirstName, tu.vLastName, tu.vUserName, tsv.order_id, tsv.item_id, tsv.job_summmeryId FROM tms_summmery_view AS tsv LEFT JOIN tms_users AS tu ON tu.iUserId = tsv.resource ) AS jsv ON ( its.order_id = jsv.order_id AND its.item_number = jsv.item_id ) LEFT JOIN tms_discussion AS td ON ( td.order_id = its.order_id AND(NOT FIND_IN_SET('1', td.read_id)) ) WHERE its.order_id != 0 $whereCond GROUP BY its.itemId ORDER BY $sortBy limit $perPage offset $offset ";
            // $result = $this->_conn->query($sql);
            // if ($result->num_rows > 0) {
            //     while($row = $result->fetch_assoc()) {
            //         $results[] = $row;
            //     }
            // }
        }else{
            //$qry = "SELECT its.itemId, its.heads_up, gen.order_no AS orderNumber, gen.due_date AS DueDate, gen.order_id AS orderId, cust.created_date AS orderDate, cust.client AS customer, gen.project_name AS projectName, c.vUserName AS contactName, c.iClientId, stus.status_name AS clientStatus, c.vlogo AS clientlogo, c.tPoInfo AS ponumber, gen.company_code AS companyCode, gen.project_price, gen.expected_start_date, cust.contact AS contactPerson, its.item_number, its.po_number AS itemPonumber, its.start_date AS itemStartdate, its.due_date AS itemDuedate, its.upcomingDate, its.source_lang AS itemsSourceLang, its.target_lang AS itemsTargetLang, its.price AS scoop_price, its.subPm AS scoop_subPm_id, its.attached_workflow, gen.project_status AS projectStatus, gen.project_type AS projectType, c.project_branch, plang.source_lang AS sourceLanguage, plang.target_lang AS targetLanguage, its.total_price AS totalAmount, its.item_name AS scoopName, its.item_email_subject AS itemEmailSubject, inc.vUserName AS accountname, tu.vUserName AS pm_name, CONCAT(tu.vFirstName, ' ', tu.vLastName) AS pm_fullName, CONCAT( sub_tu.vFirstName, ' ', sub_tu.vLastName ) AS sub_pm_name, CONCAT( scoop_manager_tu.vFirstName, ' ', scoop_manager_tu.vLastName ) AS scoopPm_name, CONCAT( sub_scp_tu.vFirstName, ' ', sub_scp_tu.vLastName ) AS sub_scoopPm_name, CONCAT( gen_Qa.vFirstName, ' ', gen_Qa.vLastName ) AS gen_Qa_fullName, CONCAT( sub_gen_Qa.vFirstName, ' ', sub_gen_Qa.vLastName ) AS gen_sub_Qa_fullName, CONCAT( scp_Qa.vFirstName, ' ', scp_Qa.vLastName ) AS scp_Qa_fullName, CONCAT( sub_scp_Qa.vFirstName, ' ', sub_scp_Qa.vLastName ) AS scp_sub_Qa_fullName, CONCAT( P_cordintr.vFirstName, ' ', P_cordintr.vLastName ) AS P_cordintr_fullName, CONCAT( P_cordintr_sub.vFirstName, ' ', P_cordintr_sub.vLastName ) AS P_cordintr_sub_fullName, cust.project_coordinator AS project_coordinator_id, cust.project_manager AS project_manager_id, cust.QA_specialist AS qa_specialist_id, cust.sub_pm AS sub_pm_id, ps.project_status_name AS projectstatus_name, ps.status_color AS projectstatus_color, tis.item_status_name AS itemStatus, tis.item_status_id AS itemStatusId, c.client_currency, cp.price_currency, cp2.price_currency AS price_currency2, GROUP_CONCAT(DISTINCT(jsv.resources)) AS linguistId, GROUP_CONCAT( DISTINCT( CONCAT( jsv.vFirstName, ' ', jsv.vLastName ) ) ) AS linguistName, COUNT(td.id) AS comment_status, COUNT(td.id) AS comment_id FROM tms_items AS its LEFT JOIN tms_general AS gen ON its.order_id = gen.order_id LEFT JOIN tms_customer AS cust ON its.order_id = cust.order_id LEFT JOIN tms_proj_language AS plang ON its.order_id = plang.order_id LEFT JOIN tms_client AS c ON cust.client = c.iClientId LEFT JOIN tms_user_status AS stus ON c.vStatus = stus.status_id LEFT JOIN tms_client_indirect AS inc ON inc.iClientId = cust.indirect_customer LEFT JOIN tms_users AS tu ON tu.iUserId = cust.project_manager LEFT JOIN tms_users AS sub_tu ON sub_tu.iUserId = cust.sub_pm LEFT JOIN tms_users AS scoop_manager_tu ON scoop_manager_tu.iUserId = its.manager LEFT JOIN tms_users AS sub_scp_tu ON sub_scp_tu.iUserId = its.subPm LEFT JOIN tms_users AS gen_Qa ON gen_Qa.iUserId = cust.QA_specialist LEFT JOIN tms_users AS sub_gen_Qa ON sub_gen_Qa.iUserId = cust.sub_qa LEFT JOIN tms_users AS P_cordintr ON P_cordintr.iUserId = cust.project_coordinator LEFT JOIN tms_users AS P_cordintr_sub ON P_cordintr_sub.iUserId = cust.sub_pc LEFT JOIN tms_users AS scp_Qa ON scp_Qa.iUserId = its.qaSpecialist LEFT JOIN tms_users AS sub_scp_Qa ON sub_scp_Qa.iUserId = its.subQa LEFT JOIN tms_users AS scoop_cordintr ON scoop_cordintr.iUserId = its.coordinator LEFT JOIN tms_users AS scoop_cordintr_sub ON scoop_cordintr_sub.iUserId = its.subPc LEFT JOIN tms_project_status AS ps ON ps.pr_status_id = gen.project_status LEFT JOIN tms_customer_price_list AS cp ON its.project_pricelist = cp.price_list_id LEFT JOIN tms_item_status AS tis ON its.item_status = tis.item_status_id LEFT JOIN( SELECT resource_id, price_currency FROM tms_customer_price_list WHERE price_id = 1 GROUP BY resource_id ) AS cp2 ON cp2.resource_id = cust.client LEFT JOIN( SELECT tu.iUserId AS resources, tu.vFirstName, tu.vLastName, tu.vUserName, tsv.order_id, tsv.item_id, tsv.job_summmeryId FROM tms_summmery_view AS tsv LEFT JOIN tms_users AS tu ON tu.iUserId = tsv.resource WHERE tsv.item_status != 'Cancelled' ) AS jsv ON ( its.order_id = jsv.order_id AND its.item_number = jsv.item_id ) LEFT JOIN tms_discussion AS td ON ( td.order_id = its.order_id AND(NOT FIND_IN_SET('1', td.read_id)) ) WHERE its.order_id != 0 $whereCond GROUP BY its.itemId ORDER BY $sortBy limit $perPage offset $offset ";
            $qry = "SELECT its.itemId, its.heads_up, gen.order_no AS orderNumber, gen.due_date AS DueDate, gen.order_id AS orderId, cust.created_date AS orderDate, cust.client AS customer, gen.project_name AS projectName, c.vUserName AS contactName, c.iClientId, stus.status_name AS clientStatus, c.vlogo AS clientlogo, c.tPoInfo AS ponumber, gen.company_code AS companyCode, gen.project_price, gen.expected_start_date, cust.contact AS contactPerson, its.item_number, its.po_number AS itemPonumber, its.start_date AS itemStartdate, its.due_date AS itemDuedate, its.upcomingDate, its.source_lang AS itemsSourceLang, its.target_lang AS itemsTargetLang, its.price AS scoop_price, its.subPm AS scoop_subPm_id, its.attached_workflow, gen.project_status AS projectStatus, gen.project_type AS projectType, c.project_branch, plang.source_lang AS sourceLanguage, plang.target_lang AS targetLanguage, its.total_price AS totalAmount, its.item_name AS scoopName, its.item_email_subject AS itemEmailSubject, inc.vUserName AS accountname, tu.vUserName AS pm_name, CONCAT(tu.vFirstName, ' ', tu.vLastName) AS pm_fullName, CONCAT( sub_tu.vFirstName, ' ', sub_tu.vLastName ) AS sub_pm_name, CONCAT( scoop_manager_tu.vFirstName, ' ', scoop_manager_tu.vLastName ) AS scoopPm_name, CONCAT( sub_scp_tu.vFirstName, ' ', sub_scp_tu.vLastName ) AS sub_scoopPm_name, CONCAT( gen_Qa.vFirstName, ' ', gen_Qa.vLastName ) AS gen_Qa_fullName, CONCAT( sub_gen_Qa.vFirstName, ' ', sub_gen_Qa.vLastName ) AS gen_sub_Qa_fullName, CONCAT( scp_Qa.vFirstName, ' ', scp_Qa.vLastName ) AS scp_Qa_fullName, CONCAT( sub_scp_Qa.vFirstName, ' ', sub_scp_Qa.vLastName ) AS scp_sub_Qa_fullName, CONCAT( P_cordintr.vFirstName, ' ', P_cordintr.vLastName ) AS P_cordintr_fullName, CONCAT( P_cordintr_sub.vFirstName, ' ', P_cordintr_sub.vLastName ) AS P_cordintr_sub_fullName, cust.project_coordinator AS project_coordinator_id, cust.project_manager AS project_manager_id, cust.QA_specialist AS qa_specialist_id, cust.sub_pm AS sub_pm_id, ps.project_status_name AS projectstatus_name, ps.status_color AS projectstatus_color, tis.item_status_name AS itemStatus, tis.item_status_id AS itemStatusId, c.client_currency, cp.price_currency, cp2.price_currency AS price_currency2, GROUP_CONCAT(DISTINCT(jsv.resources)) AS linguistId, GROUP_CONCAT( DISTINCT( CONCAT( jsv.vFirstName, ' ', jsv.vLastName ) ) ) AS linguistName, COUNT(td.id) AS comment_status, COUNT(td.id) AS comment_id FROM tms_items AS its LEFT JOIN tms_general AS gen ON its.order_id = gen.order_id LEFT JOIN tms_customer AS cust ON its.order_id = cust.order_id LEFT JOIN tms_proj_language AS plang ON its.order_id = plang.order_id LEFT JOIN tms_client AS c ON cust.client = c.iClientId LEFT JOIN tms_user_status AS stus ON c.vStatus = stus.status_id LEFT JOIN tms_client_indirect AS inc ON inc.iClientId = cust.indirect_customer LEFT JOIN tms_users AS tu ON tu.iUserId = cust.project_manager LEFT JOIN tms_users AS sub_tu ON sub_tu.iUserId = cust.sub_pm LEFT JOIN tms_users AS scoop_manager_tu ON scoop_manager_tu.iUserId = its.manager LEFT JOIN tms_users AS sub_scp_tu ON sub_scp_tu.iUserId = its.subPm LEFT JOIN tms_users AS gen_Qa ON gen_Qa.iUserId = cust.QA_specialist LEFT JOIN tms_users AS sub_gen_Qa ON sub_gen_Qa.iUserId = cust.sub_qa LEFT JOIN tms_users AS P_cordintr ON P_cordintr.iUserId = cust.project_coordinator LEFT JOIN tms_users AS P_cordintr_sub ON P_cordintr_sub.iUserId = cust.sub_pc LEFT JOIN tms_users AS scp_Qa ON scp_Qa.iUserId = its.qaSpecialist LEFT JOIN tms_users AS sub_scp_Qa ON sub_scp_Qa.iUserId = its.subQa LEFT JOIN tms_users AS scoop_cordintr ON scoop_cordintr.iUserId = its.coordinator LEFT JOIN tms_users AS scoop_cordintr_sub ON scoop_cordintr_sub.iUserId = its.subPc LEFT JOIN tms_project_status AS ps ON ps.pr_status_id = gen.project_status LEFT JOIN tms_customer_price_list AS cp ON its.project_pricelist = cp.price_list_id LEFT JOIN tms_item_status AS tis ON its.item_status = tis.item_status_id LEFT JOIN( SELECT resource_id, price_currency FROM tms_customer_price_list WHERE price_id = 1 GROUP BY resource_id ) AS cp2 ON cp2.resource_id = cust.client LEFT JOIN( SELECT tu.iUserId AS resources, tu.vFirstName, tu.vLastName, tu.vUserName, tsv.order_id, tsv.item_id, tsv.job_summmeryId FROM tms_summmery_view AS tsv LEFT JOIN tms_users AS tu ON tu.iUserId = tsv.resource WHERE tsv.item_status != 'Cancelled' ) AS jsv ON ( its.order_id = jsv.order_id AND its.item_number = jsv.item_id ) LEFT JOIN tms_discussion AS td ON ( td.scoop_id = its.itemId AND td.job_id=0 AND ( NOT FIND_IN_SET($id, td.read_id)) ) WHERE its.order_id != 0 $whereCond GROUP BY its.itemId ORDER BY $sortBy limit $perPage offset $offset ";
            $results = $this->_db->rawQuery($qry);
        }
        // echo $this->_db->getLastQuery();
        // die();
        
        //If yoy want to remove frontend forloop 
        if ($results) {
            try{
                foreach ($results as &$val) {
                    $val['pm_fullName'] = $val['scoop_subPm_id'] ? $val['sub_scoopPm_name'] : ($val['scoopPm_name'] ? $val['scoopPm_name'] : ($val['sub_pm_id'] ? $val['sub_pm_name'] : $val['pm_fullName']));
                    $val['qa_fullName'] = $val['scp_sub_Qa_fullName'] ? $val['scp_sub_Qa_fullName'] : ($val['scp_Qa_fullName'] ? $val['scp_Qa_fullName'] : ($val['gen_sub_Qa_fullName'] ? $val['gen_sub_Qa_fullName'] : $val['gen_Qa_fullName']));
                    
                    $val['attached_workflow'] = explode('-', $val['attached_workflow']);
                    $val['attached_workflow'] = end($val['attached_workflow']);
                    
                    $newLangData = ['sourceLang' => '', 'dataNgSrc' => '', 'alt' => ' '];
                    $val['itemsSourceLang'] = $val['itemsSourceLang'] ? json_decode($val['itemsSourceLang'], true) : $newLangData;
                    $val['itemsTargetLang'] = $val['itemsTargetLang'] ? json_decode($val['itemsTargetLang'], true) : $newLangData;
                    
                    // ----linguist List----- / 
                    $val['jobLinguist'] = [];
                    if ($val['linguistName']) {
                        $linguistIds = explode(',', $val['linguistId']);
                        $linguistNames = explode(',', $val['linguistName']);
                        foreach ($linguistNames as $i => $ele) {
                            $val['jobLinguist'][] = ['resources' => $linguistIds[$i], 'vUserName' => $ele];
                        }
                    }
                    
                    if ($val['sub_pm_id'] !== 0 && $val['sub_pm_name'] !== null) {
                        $val['pm_name'] = $val['sub_pm_name'];
                    }
                    
                    $currenciesClnt = isset($val['client_currency']) ? explode(',', $val['client_currency'])[0] : null;
                    $val['price_currency'] = $currenciesClnt ? $currenciesClnt : 'EUR';
                    
                    // Comment read unRead
                    $cmtcolor = '#0190d8';
                    if ($val['comment_status'] > 0) {
                        $cmtcolor = '#d30c39';
                    } elseif ($val['comment_status'] == 0) {
                        $cmtcolor = '#67bb0a';
                    }
                    $val['comment'] = $cmtcolor;
            
                    //$scope->projectsAllCount++;
                    $val['projectstatus_class'] = 'projectstatus_common';
                    $val['projectstatus_color'] = '#8d9296';
                }
            }catch (Exception $e) {
            
            }
        }
        
        $gropedData = [];
        if(isset($_GET['completedTabGrouped']) && $_GET['completedTabGrouped'] != ''){
            $gropedData = self::groupByClientAndDueDate($results, $_GET['completedTabGrouped'], $sortOrder = '');
            //$results = $gropedData;
        }
        
        // Prepare response
        $results = [
            'totalItems' => $totalCount,
            'totalPages' => $totalPages,
            'currentPage' => $currentPage,
            'data' => $results,
            'groupedData' => $gropedData
        ];

        return $results;
    }

    public function searchProjectHeader($id) {
        //$qry = "SELECT its.itemId, its.heads_up, gen.order_no AS orderNumber, gen.due_date AS DueDate, gen.order_id AS orderId, cust.created_date AS orderDate, cust.client AS customer, gen.project_name AS projectName, c.vUserName AS contactName, c.iClientId, stus.status_name AS clientStatus, c.vlogo AS clientlogo, c.tPoInfo AS ponumber, gen.company_code AS companyCode, gen.project_price, gen.expected_start_date, cust.contact AS contactPerson, its.item_number, its.po_number AS itemPonumber, its.start_date AS itemStartdate, its.due_date AS itemDuedate, its.upcomingDate, its.source_lang AS itemsSourceLang, its.target_lang AS itemsTargetLang, its.price AS scoop_price, gen.project_status AS projectStatus, gen.project_type AS projectType, c.project_branch, plang.source_lang AS sourceLanguage, plang.target_lang AS targetLanguage, its.total_amount AS totalAmount, inc.vUserName AS accountname, tu.vUserName AS pm_name, CONCAT(tu.vFirstName, ' ', tu.vLastName) AS pm_fullName, sub_tu.vUserName AS sub_pm_name, cust.project_coordinator AS project_coordinator_id, cust.project_manager AS project_manager_id, cust.QA_specialist AS qa_specialist_id, cust.sub_pm AS sub_pm_id, ps.project_status_name AS projectstatus_name, ps.status_color AS projectstatus_color, tis.item_status_name AS itemStatus, tis.item_status_id AS itemStatusId, c.client_currency, cp.price_currency, cp2.price_currency AS price_currency2, GROUP_CONCAT(DISTINCT(jsv.resources)) AS linguistId, GROUP_CONCAT(DISTINCT(jsv.vUserName)) AS linguistName, COUNT(td.id) as comment_status, COUNT(td.id) as comment_id FROM tms_items AS its LEFT JOIN tms_general AS gen ON its.order_id = gen.order_id LEFT JOIN tms_customer AS cust ON its.order_id = cust.order_id LEFT JOIN tms_proj_language AS plang ON its.order_id = plang.order_id LEFT JOIN tms_client AS c ON cust.client = c.iClientId LEFT JOIN tms_user_status AS stus ON c.vStatus = stus.status_id LEFT JOIN tms_client_indirect AS inc ON inc.iClientId = cust.indirect_customer LEFT JOIN tms_users AS tu ON tu.iUserId = cust.project_manager LEFT JOIN tms_users AS sub_tu ON sub_tu.iUserId = cust.sub_pm LEFT JOIN tms_project_status AS ps ON ps.pr_status_id = gen.project_status LEFT JOIN tms_customer_price_list AS cp ON its.project_pricelist = cp.price_list_id LEFT JOIN tms_item_status AS tis ON its.item_status = tis.item_status_id LEFT JOIN ( SELECT resource_id, price_currency FROM tms_customer_price_list WHERE price_id = 1 GROUP BY resource_id ) AS cp2 ON cp2.resource_id = cust.client LEFT JOIN ( SELECT tu.iUserId AS resources, tu.vUserName, tsv.order_id, tsv.item_id, tsv.job_summmeryId FROM tms_summmery_view AS tsv LEFT JOIN tms_users AS tu ON tu.iUserId = tsv.resource ) AS jsv ON ( its.order_id = jsv.order_id AND its.item_number = jsv.item_id ) LEFT JOIN tms_discussion AS td ON ( td.order_id = its.order_id AND ( NOT FIND_IN_SET('1', td.read_id)) ) WHERE its.order_id != 0 GROUP BY its.itemId ";
        $qry = "SELECT its.itemId, its.heads_up, gen.order_no AS orderNumber, gen.due_date AS DueDate, gen.order_id AS orderId, gen.project_name AS projectName, gen.company_code AS companyCode, its.item_number, its.po_number AS itemPonumber FROM tms_items AS its LEFT JOIN tms_general AS gen ON its.order_id = gen.order_id WHERE its.order_id != 0 ";
        $data['scoopData'] = $this->_db->rawQuery($qry);

        //$qry2 = "select tcus.client As Client , tcus.indirect_customer As indirectClient ,tsv.*,ti.item_status as scoopitem_status, ti.source_lang AS item_source_lang, ti.target_lang AS item_target_lang, ti.due_date AS item_due_date, tmp.name AS job_type_name, tcus.project_coordinator as project_coordinator_id, tcus.project_manager as project_manager_id, tcus.QA_specialist as qa_specialist_id,tpc.iUserId AS job_manager_id FROM tms_summmery_view AS tsv INNER JOIN tms_general AS tg ON tsv.order_id = tg.order_id INNER JOIN tms_customer As tcus ON tsv.order_id = tcus.order_id INNER JOIN tms_items AS ti ON tsv.order_id = ti.order_id LEFT JOIN tms_users tpc ON tpc.iUserId = tsv.contact_person LEFT JOIN tms_master_price AS tmp ON ti.project_type = tmp.master_price_id WHERE ti.item_number = tsv.item_id";
        $qry2 = "SELECT tsv.*, ti.item_status AS scoopitem_status, ti.source_lang AS item_source_lang, ti.target_lang AS item_target_lang, ti.due_date AS item_due_date FROM tms_summmery_view AS tsv INNER JOIN tms_general AS tg ON tsv.order_id = tg.order_id INNER JOIN tms_customer AS tcus ON tsv.order_id = tcus.order_id INNER JOIN tms_items AS ti ON tsv.order_id = ti.order_id WHERE ti.item_number = tsv.item_id";
        $data['jobData'] = $this->_db->rawQuery($qry2);


        return $data;
    }

    public function globalSearchProjectHeader($data) {
        // Extract the search key
        $searchKey = isset($data['searchKey']) ? trim($data['searchKey']) : '';
    
        // Base query for tms_items with concatenation of orderNumber and item_number
        $qry = "SELECT  gen.order_no AS orderNumber, its.item_number, 
                its.itemId, its.heads_up, gen.order_no AS orderNumber, gen.due_date AS DueDate, gen.order_id AS orderId, gen.project_name AS projectName, gen.company_code AS companyCode, its.item_number, its.po_number AS itemPonumber,
                CONCAT(gen.order_no, '-', LPAD(its.item_number, 3, '0')) AS formattedOrderItem 
                FROM tms_items AS its 
                LEFT JOIN tms_general AS gen ON its.order_id = gen.order_id 
                WHERE its.order_id != 0";
    
        // If searchKey exists, add a search condition for the formatted order number
        if (!empty($searchKey)) {
            $qry .= " AND (CONCAT(gen.order_no, '-', LPAD(its.item_number, 3, '0')) LIKE '%$searchKey%' OR gen.order_no LIKE '%$searchKey%')";
        }
        
        $qry .= " LIMIT 10";
    
        // Execute the query
        $data['scoopData'] = $this->_db->rawQuery($qry);
    
       // Base query for tms_summmery_view with concatenation of orderNumber and item_number
       $qry2 = "SELECT tsv.*, ti.item_status AS scoopitem_status FROM tms_summmery_view AS tsv INNER JOIN tms_general AS tg ON tsv.order_id = tg.order_id INNER JOIN tms_customer AS tcus ON tsv.order_id = tcus.order_id INNER JOIN tms_items AS ti ON tsv.order_id = ti.order_id WHERE ti.item_number = tsv.item_id ";

        // If searchKey exists, add a search condition for the formatted order number in the second query
        if (!empty($searchKey)) {
        $qry2 .= " AND tsv.po_number LIKE '%$searchKey%'";
        }

        $qry2 .= " GROUP BY 
            tsv.job_summmeryId LIMIT 10";
        // print_r($qry2);exit;
    
        // Execute the second query
        $data['jobData'] = $this->_db->rawQuery($qry2);
    
        // Return the modified data
        return $data;
    }

    public function userActivityGet($data) {
        $info = array();
        foreach($data AS $key=>$value) {
            $this->_db->where('iUserId', $value);
            $info[$key] = $this->_db->getOne('tms_users');
        }
        return $info;
    }
    
    public function userActivityGetOne($id) {
        $this->_db->where('iUserId', $id);
        $data = $this->_db->get('tms_users');
        return $data;
    }
    
    public function  jobActivityGet($data) {
        $info = array();
        foreach($data AS $key=>$value) {
            $this->_db->where('job_summmeryId', $value);
            $info[$key] = $this->_db->getOne('tms_summmery_view');
        }
        return $info;
    }

    public function taskJobget($id) {
        $currentDate = date("Y-m-d");
        $this->_db->orderBy("tsv.due_date","asc");
        $this->_db->where("tsv.due_date",$currentDate,">=");
        $this->_db->where("tc.project_manager",$id);
        $this->_db->join('tms_customer tc','tsv.order_id = tc.order_id','INNER');
        return $data = $this->_db->get('tms_summmery_view tsv');
    }
    
    public function holidayGet($country) {
        $url = 'https://www.timeanddate.com/holidays/'.strtolower($country).'/';
        $cSession = curl_init();
        curl_setopt($cSession,CURLOPT_URL,$url);
         curl_setopt($cSession, CURLOPT_HTTPHEADER, ['Accept-Language: en']);
        curl_setopt($cSession,CURLOPT_RETURNTRANSFER,true);
        curl_setopt($cSession,CURLOPT_HEADER, false);
        $html=curl_exec($cSession);
        curl_close($cSession);

        $dom = new DOMDocument();
        # The @ before the method call suppresses any warnings that
        # loadHTML might throw because of invalid HTML in the page.
            @$dom->loadHTML($html);
            $holidays=array();
            $items = $dom->getElementsByTagName('tr');
            function tdrows($elements) {
                $str = "";
                foreach ($elements as $element) {
                    $str .= $element->nodeValue . ", ";
                }

                //This pplaces the items into an array
                $tempArray=explode(',',$str);
                //This gets rid of empty array elements
                unset($tempArray[4]);
                unset($tempArray[5]);
                return $tempArray;
            }

            foreach ($items as $key=>$node) {
                $holidays[]=tdrows($node->childNodes);
            }
        //The first and secone items in the array were the titles of the table and a blank row 
        //so we unset them
        unset($holidays[0]);
        unset($holidays[1]);
        //then reindex the array
        $holidays = array_values($holidays);
        return $holidays;
    }

    public function getCountry () {
        return $this->_db->get('tms_country');
    }
    public function groupByClientAndDueDate($data, $type, $orderByAscDes) {
        $grouped = [];
    
        try {
            if($type == 'clientId'){
                foreach ($data as $item) {
                    $clientId = $item['contactName'];
            
                    if (!isset($grouped[$clientId])) {
                        $grouped[$clientId] = [];
                    }
                    $grouped[$clientId][] = $item;
                }
    
                // Sorting each group by datetime
                foreach ($grouped as &$group) {
                    usort($group, function ($a, $b) use ($orderByAscDes) {
                        // Function to convert date to timestamp, handling null and invalid dates
                        $getTimestamp = function ($date) {
                            // Handle special cases
                            if (empty($date) || $date === '0000-00-00' || $date === null) {
                                return 0; // Treat invalid or null dates as the lowest
                            }
                            // Convert valid date to timestamp
                            return strtotime($date);
                        };
    
                        $datetimeA = $getTimestamp($a['itemDuedate']);
                        $datetimeB = $getTimestamp($b['itemDuedate']);
    
                        if ($orderByAscDes == 'ASC') {
                            return $datetimeA - $datetimeB; // Ascending order
                        } else {
                            return $datetimeB - $datetimeA; // Descending order
                        }
                    });
                }
    
            }
            if($type == 'projectDuedate'){
                foreach ($data as $item) {
                    // Extract year and month from due date
                    $date = new DateTime($item['itemDuedate']);
                    $yearMonth = $date->format('Y-m-d'); // adjust format as needed
            
                    if (!isset($grouped[$yearMonth])) {
                        $grouped[$yearMonth] = [];
                    }
                    $grouped[$yearMonth][] = $item;
                }
            }
        } catch (Exception $e) { }
    
        return $grouped;
    }
    
    public function getDashboardWidgetData(){
        $qry = "SELECT gen.order_no AS orderNumber, its.itemId, its.order_id as orderId, its.item_number, its.po_number as ponumber from tms_items its LEFT JOIN tms_general AS gen ON its.order_id = gen.order_id WHERE DATE(its.due_date) > CURDATE() or DATE(its.due_date) = ( case when DAYOFWEEK(CURDATE() + interval 1 day) = 7 then CURDATE() + interval 3 day when DAYOFWEEK(CURDATE() + interval 1 day) = 1 then CURDATE() + interval 2 day else CURDATE() + interval 1 day end ) and its.item_status not in (4, 5, 6, 8, 9)";
        return $this->_db->rawQuery($qry);
    }

    public function getDashboardOverdueWidgetData(){
        $qry = "SELECT tsv.job_summmeryId,tsv.order_id, tcus.client AS Client, tsv.po_number from tms_summmery_view as tsv left join tms_customer as tcus on tsv.order_id = tcus.order_id where DATE(tsv.due_date) > CURDATE() and tsv.item_status not in ('Delivered', 'Completed', 'Paid', 'Invoice Ready', 'Invoice Accepted', 'Invoiced', 'Cancelled')";
        return $this->_db->rawQuery($qry);
    }

}
