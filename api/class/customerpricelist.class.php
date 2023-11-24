
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

}
