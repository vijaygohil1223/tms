
<?php

require_once 'value.class.php';

class pricelist {


    public function __construct() {
        $this->_db = db::getInstance();
        $this->_value = new value();
    }
    
    public function priceListSave($data)
    {
    	$data['created_date'] = date('Y-m-d H:i:s');
    	$data['modified_date'] = date('Y-m-d H:i:s');
    	$id = $this->_db->insert('tms_price_list', $data);
    	if ($id) {
	    	$return['status'] = 200;
	    	$return['id'] = $id;
    	} else {
    	    $return['status'] = 422;
    	    $return['msg'] = 'Not inserted.';
    	}
    	return $return;
    }
    public function PriceListDirectAllget($id)
    {
    	$this->_db->where('uType',$id);
    	$result = $this->_db->get('tms_price_list');
    	return $result;	
    }
    public function PriceListDirectEditgetone($id)
    {
    	$this->_db->where('client_id',$id);
    	$result = $this->_db->getone('tms_price_list');
    	return $result;
    }
    public function priceListUpdate($id,$data)
    {
    	//$data['created_date'] = date('Y-m-d H:i:s');
    	$data['modified_date'] = date('Y-m-d H:i:s');
    	$this->_db->where('client_id',$id);
    	$id = $this->_db->update('tms_price_list', $data);
    	//echo $this->_db->getLastQuery();exit;
    	if ($id) {
    		$return['status'] = 200;
    		$return['id'] = $id;
    	} else {
    		$return['status'] = 422;
    		$return['msg'] = 'Not Updated.';
    	}
    	return $return;
    }
    
    public function deletePricelist($id){
	    $this->_db->where('price_listId', $id);
	    $id = $this->_db->delete('tms_price_list');
	    if ($id) {
	           $return['status'] = 200;
	           $return['msg'] = 'Deleted Successfully.';
	    } else {
	           $return['status'] = 422;
	           $return['msg'] = 'Not Deleted.';
	    }
	    return $return;
    }
    
    public function PriceListExternalAllget($id)
    {
    	$this->_db->where('uType',$id);
    	$result = $this->_db->get('tms_price_list');
    	return $result;
    }
    public function PriceListExternalEditgetone($id)
    {
    	$this->_db->where('iuserId',$id);
    	$result = $this->_db->getone('tms_userprice_list');
    	return $result;
    }
    public function priceExternalListSave($data)
    {
    	$data['created_date'] = date('Y-m-d H:i:s');
    	$data['modified_date'] = date('Y-m-d H:i:s');
    	$id = $this->_db->insert('tms_userprice_list', $data);
    	if ($id) {
    		$return['status'] = 200;
    		$return['id'] = $id;
    	} else {
    		$return['status'] = 422;
    		$return['msg'] = 'Not inserted.';
    	}
    	return $return;
    }
    
    public function priceExternalListUpdate($id,$data)
    {
    	//$data['created_date'] = date('Y-m-d H:i:s');
    	$data['modified_date'] = date('Y-m-d H:i:s');
    	$this->_db->where('iuserId',$id);
    	$id = $this->_db->update('tms_userprice_list', $data);
    	if ($id) {
    		$return['status'] = 200;
    		$return['id'] = $id;
    	} else {
    		$return['status'] = 422;
    		$return['msg'] = 'Not Updated.';
    	}
    	return $return;
    }

	public function priceListCopyToOtherUser($data)
    {

		$data['externalUserClient'];
		$data['typeId'];
		if(isset($data['typeId']) && $data['typeId'] == 1){
			$typeId =1 ;
		}else{
			$typeId =2 ;
		}
		
		$this->_db->where('price_list_id',$data['price_list_id']);
    	$result = $this->_db->getone('tms_customer_price_list');

		$postData = $result;
		$postData['resource_id'] =  $data['externalUserClient'];
		$postData['price_id'] =  $typeId;
		$postData['created_date'] = date('Y-m-d H:i:s');
    	$postData['modified_date'] = date('Y-m-d H:i:s');
		
		unset($postData['price_list_id']);
    	$id = $this->_db->insert('tms_customer_price_list', $postData);
    	if ($id) {
	    	$return['status'] = 200;
	    	$return['id'] = $id;
    	} else {
    	    $return['status'] = 422;
    	    $return['msg'] = 'Not inserted.';
    	}
    	return $return;
    }
    
}
