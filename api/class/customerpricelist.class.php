
<?php

require_once 'value.class.php';

class Customerpricelist {

    public function __construct() {
        $this->_db = db::getInstance();
        $this->_value = new value();
    }
    
    public function customerpriceSave($data) {
        $data['created_date'] = date('Y/m/d H:i:s');
        $data['modified_date'] = date('Y/m/d H:i:s');
        $id = $this->_db->insert('tms_customer_price_list', $data);
        if($id) {
            $result['status'] = 200;
            $result['msg'] = "Inserted Successfully";
            $result['id'] = $id;

        } else {
            $result['status'] = 401;
            $result['msg'] = "Not Inserted";
        }
        $this->_db->where('price_list_id', $id);
        $result['LastIsertedData'] = $this->_db->getOne('tms_customer_price_list');
        return $result;
    }

    public function customerpriceGetOne($id) {
        $this->_db->where('price_list_id', $id);
        $data = $this->_db->getOne('tms_customer_price_list');
        return $data;
    }

    public function customerpriceUpdate($id, $data) {
        $getLastUpdatedId = $id;
        $data['created_date'] = date('Y/m/d H:i:s');
        $data['modified_date'] = date('Y/m/d H:i:s');
        $this->_db->where('price_list_id', $id);
        $id = $this->_db->update('tms_customer_price_list', $data);
        if($id) {
            $result['status'] = 200;
            $result['msg'] = "Inserted Successfully";
        } else {
            $result['status'] = 401;
            $result['msg'] = "Not Inserted";
        }
        $this->_db->where('price_list_id',$getLastUpdatedId);
        $result['LastIsertedData'] = $this->_db->getOne('tms_customer_price_list');
        return $result;
    }

    public function customerpriceAll($id) {
        $this->_db->where('price_id', $id);
        $this->_db->orderBy ("price_name", "asc");
        $data = $this->_db->get('tms_customer_price_list');
        return $data;
    }

    public function checkUserAbsent($id, $date) {
        // Validate that the $date parameter is provided and not null
        if (empty($date)) {
            echo "Date parameter is missing.";
            return; // Stop further execution if date is not provided
        }
    
        // Retrieve user availability data
        $this->_db->where('iUserId', $id);
        $data = $this->_db->getOne('tms_users');
        $dataArray = json_decode($data['is_available'], true);
    
        $isAbsent = false; // Assume the user is absent by default
    
        if (is_array($dataArray)) {
            // Iterate through the array
            foreach ($dataArray as $item) {
                // echo "dateFrom value: ";
                // print_r($item['dateFrom']);  
    
                // echo "dateTo value: ";
                // print_r($item['dateTo']); 
    
                // Ensure dateFrom and dateTo are strings
                if (isset($item['dateFrom']) && is_string($item['dateFrom']) && isset($item['dateTo']) && is_string($item['dateTo'])) {
                    // Convert the check date to Y-m-d format
                    $checkDateObj = DateTime::createFromFormat('d.m.Y', $date['newValue']);
                    $dateFromObj = DateTime::createFromFormat('Y-m-d', $item['dateFrom']);
                    $dateToObj = DateTime::createFromFormat('Y-m-d', $item['dateTo']);
    
                    // Check if the date conversion was successful
                    if ($checkDateObj && $dateFromObj && $dateToObj) {
                        $checkDate = $checkDateObj->format('Y-m-d');
                        $dateFrom = $dateFromObj->format('Y-m-d');
                        $dateTo = $dateToObj->format('Y-m-d');
    
                        // Check if the date is between dateFrom and dateTo
                        if ($checkDate >= $dateFrom && $checkDate <= $dateTo) {
                            $isAbsent = true; // User is present, so set to true
                        }
                    }
                }
            }
        }
    
        // Output the final status
        if ($isAbsent) {
            $return['status'] = 200;
            $return['message'] = $data['vFirstName'] . " " . $data['vLastName'] . " resource is absent on ". $date['newValue'];
            return $return;
        }
    }
    
    
    
    
    public function customerpriceListCopy($id) {
        $data = self::customerpriceGetOne($id);
        unset($data['price_list_id']);
        $data['price_name'] = $data['price_name'].'- Copy';
        return self::customerpriceSave($data);
    }

    public function deleteExtrnlorClntPricelist($type, $id) {
        if($type == 1){
            $this->_db->where('project_pricelist', $id);
            $item = $this->_db->getOne('tms_items', 'itemId');
            $num_rows = $this->_db->count;
            if($type==1 && $num_rows > 0){
                $return ['is_priceUsed'] = 1;
    			$return ['status'] = 200;
    			$return ['msg'] = 'You can not delete this record.';
                return $return;
            }
        }
        $this->_db->where ( 'price_list_id', $id );
		$id = $this->_db->delete ( 'tms_customer_price_list' );
		if ($id) {
			$return ['status'] = 200;
			$return ['msg'] = 'Successfully deleted.';
		} else {
			$return ['status'] = 422;
			$return ['msg'] = 'Not deleted.';
		}
		return $return;
	}

    public function customerpriceByClient($id) {
        $this->_db->where('price_id', 1);
        $this->_db->where('resource_id', $id);
        $data = $this->_db->get('tms_customer_price_list');
        return $data;
    }

}
