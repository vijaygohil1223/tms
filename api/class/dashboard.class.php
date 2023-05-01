<?php
class dashboard {

    public function __construct() {
        $this->_db = db::getInstance();
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
        $qry = "SELECT its.itemId, its.heads_up, gen.order_no AS orderNumber, gen.due_date AS DueDate, gen.order_id AS orderId, cust.created_date AS orderDate, cust.client AS customer, gen.project_name AS projectName, c.vUserName AS contactName, c.iClientId, stus.status_name AS clientStatus, c.vlogo AS clientlogo, c.tPoInfo AS ponumber, gen.company_code AS companyCode, gen.project_price, gen.expected_start_date, cust.contact AS contactPerson, its.item_number, its.po_number AS itemPonumber, its.start_date AS itemStartdate, its.due_date AS itemDuedate, its.upcomingDate, its.source_lang AS itemsSourceLang, its.target_lang AS itemsTargetLang, its.price AS scoop_price, gen.project_status AS projectStatus, gen.project_type AS projectType, c.project_branch, plang.source_lang AS sourceLanguage, plang.target_lang AS targetLanguage, its.total_amount AS totalAmount, inc.vUserName AS accountname, tu.vUserName AS pm_name, CONCAT(tu.vFirstName, ' ', tu.vLastName) AS pm_fullName, sub_tu.vUserName AS sub_pm_name, cust.project_coordinator AS project_coordinator_id, cust.project_manager AS project_manager_id, cust.QA_specialist AS qa_specialist_id, cust.sub_pm AS sub_pm_id, ps.project_status_name AS projectstatus_name, ps.status_color AS projectstatus_color, tis.item_status_name AS itemStatus, tis.item_status_id AS itemStatusId, c.client_currency, cp.price_currency, cp2.price_currency AS price_currency2, GROUP_CONCAT(DISTINCT(jsv.resources)) AS linguistId, GROUP_CONCAT(DISTINCT(jsv.vUserName)) AS linguistName, COUNT(td.id) as comment_status, COUNT(td.id) as comment_id FROM tms_items AS its LEFT JOIN tms_general AS gen ON its.order_id = gen.order_id LEFT JOIN tms_customer AS cust ON its.order_id = cust.order_id LEFT JOIN tms_proj_language AS plang ON its.order_id = plang.order_id LEFT JOIN tms_client AS c ON cust.client = c.iClientId LEFT JOIN tms_user_status AS stus ON c.vStatus = stus.status_id LEFT JOIN tms_client_indirect AS inc ON inc.iClientId = cust.indirect_customer LEFT JOIN tms_users AS tu ON tu.iUserId = cust.project_manager LEFT JOIN tms_users AS sub_tu ON sub_tu.iUserId = cust.sub_pm LEFT JOIN tms_project_status AS ps ON ps.pr_status_id = gen.project_status LEFT JOIN tms_customer_price_list AS cp ON its.project_pricelist = cp.price_list_id LEFT JOIN tms_item_status AS tis ON its.item_status = tis.item_status_id LEFT JOIN ( SELECT resource_id, price_currency FROM tms_customer_price_list WHERE price_id = 1 GROUP BY resource_id ) AS cp2 ON cp2.resource_id = cust.client LEFT JOIN ( SELECT tu.iUserId AS resources, tu.vUserName, tsv.order_id, tsv.item_id, tsv.job_summmeryId FROM tms_summmery_view AS tsv LEFT JOIN tms_users AS tu ON tu.iUserId = tsv.resource ) AS jsv ON ( its.order_id = jsv.order_id AND its.item_number = jsv.item_id ) LEFT JOIN tms_discussion AS td ON ( td.order_id = its.order_id AND ( NOT FIND_IN_SET('1', td.read_id)) ) WHERE its.order_id != 0 GROUP BY its.itemId ";
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

    public function searchProjectHeader($id) {
        //$qry = "SELECT its.itemId, its.heads_up, gen.order_no AS orderNumber, gen.due_date AS DueDate, gen.order_id AS orderId, cust.created_date AS orderDate, cust.client AS customer, gen.project_name AS projectName, c.vUserName AS contactName, c.iClientId, stus.status_name AS clientStatus, c.vlogo AS clientlogo, c.tPoInfo AS ponumber, gen.company_code AS companyCode, gen.project_price, gen.expected_start_date, cust.contact AS contactPerson, its.item_number, its.po_number AS itemPonumber, its.start_date AS itemStartdate, its.due_date AS itemDuedate, its.upcomingDate, its.source_lang AS itemsSourceLang, its.target_lang AS itemsTargetLang, its.price AS scoop_price, gen.project_status AS projectStatus, gen.project_type AS projectType, c.project_branch, plang.source_lang AS sourceLanguage, plang.target_lang AS targetLanguage, its.total_amount AS totalAmount, inc.vUserName AS accountname, tu.vUserName AS pm_name, CONCAT(tu.vFirstName, ' ', tu.vLastName) AS pm_fullName, sub_tu.vUserName AS sub_pm_name, cust.project_coordinator AS project_coordinator_id, cust.project_manager AS project_manager_id, cust.QA_specialist AS qa_specialist_id, cust.sub_pm AS sub_pm_id, ps.project_status_name AS projectstatus_name, ps.status_color AS projectstatus_color, tis.item_status_name AS itemStatus, tis.item_status_id AS itemStatusId, c.client_currency, cp.price_currency, cp2.price_currency AS price_currency2, GROUP_CONCAT(DISTINCT(jsv.resources)) AS linguistId, GROUP_CONCAT(DISTINCT(jsv.vUserName)) AS linguistName, COUNT(td.id) as comment_status, COUNT(td.id) as comment_id FROM tms_items AS its LEFT JOIN tms_general AS gen ON its.order_id = gen.order_id LEFT JOIN tms_customer AS cust ON its.order_id = cust.order_id LEFT JOIN tms_proj_language AS plang ON its.order_id = plang.order_id LEFT JOIN tms_client AS c ON cust.client = c.iClientId LEFT JOIN tms_user_status AS stus ON c.vStatus = stus.status_id LEFT JOIN tms_client_indirect AS inc ON inc.iClientId = cust.indirect_customer LEFT JOIN tms_users AS tu ON tu.iUserId = cust.project_manager LEFT JOIN tms_users AS sub_tu ON sub_tu.iUserId = cust.sub_pm LEFT JOIN tms_project_status AS ps ON ps.pr_status_id = gen.project_status LEFT JOIN tms_customer_price_list AS cp ON its.project_pricelist = cp.price_list_id LEFT JOIN tms_item_status AS tis ON its.item_status = tis.item_status_id LEFT JOIN ( SELECT resource_id, price_currency FROM tms_customer_price_list WHERE price_id = 1 GROUP BY resource_id ) AS cp2 ON cp2.resource_id = cust.client LEFT JOIN ( SELECT tu.iUserId AS resources, tu.vUserName, tsv.order_id, tsv.item_id, tsv.job_summmeryId FROM tms_summmery_view AS tsv LEFT JOIN tms_users AS tu ON tu.iUserId = tsv.resource ) AS jsv ON ( its.order_id = jsv.order_id AND its.item_number = jsv.item_id ) LEFT JOIN tms_discussion AS td ON ( td.order_id = its.order_id AND ( NOT FIND_IN_SET('1', td.read_id)) ) WHERE its.order_id != 0 GROUP BY its.itemId ";
        $qry = "SELECT its.itemId, its.heads_up, gen.order_no AS orderNumber, gen.due_date AS DueDate, gen.order_id AS orderId, gen.project_name AS projectName, gen.company_code AS companyCode, its.item_number, its.po_number AS itemPonumber FROM tms_items AS its LEFT JOIN tms_general AS gen ON its.order_id = gen.order_id WHERE its.order_id != 0 ";
        $data['scoopData'] = $this->_db->rawQuery($qry);

        //$qry2 = "select tcus.client As Client , tcus.indirect_customer As indirectClient ,tsv.*,ti.item_status as scoopitem_status, ti.source_lang AS item_source_lang, ti.target_lang AS item_target_lang, ti.due_date AS item_due_date, tmp.name AS job_type_name, tcus.project_coordinator as project_coordinator_id, tcus.project_manager as project_manager_id, tcus.QA_specialist as qa_specialist_id,tpc.iUserId AS job_manager_id FROM tms_summmery_view AS tsv INNER JOIN tms_general AS tg ON tsv.order_id = tg.order_id INNER JOIN tms_customer As tcus ON tsv.order_id = tcus.order_id INNER JOIN tms_items AS ti ON tsv.order_id = ti.order_id LEFT JOIN tms_users tpc ON tpc.iUserId = tsv.contact_person LEFT JOIN tms_master_price AS tmp ON ti.project_type = tmp.master_price_id WHERE ti.item_number = tsv.item_id";
        $qry2 = "SELECT tsv.*, ti.item_status AS scoopitem_status, ti.source_lang AS item_source_lang, ti.target_lang AS item_target_lang, ti.due_date AS item_due_date FROM tms_summmery_view AS tsv INNER JOIN tms_general AS tg ON tsv.order_id = tg.order_id INNER JOIN tms_customer AS tcus ON tsv.order_id = tcus.order_id INNER JOIN tms_items AS ti ON tsv.order_id = ti.order_id WHERE ti.item_number = tsv.item_id";
        $data['jobData'] = $this->_db->rawQuery($qry2);


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

}