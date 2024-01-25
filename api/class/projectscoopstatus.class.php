<?php

class projectscoopstatus {

    public function __construct() {
        $this->_db = db::getInstance();
    }

    public function save($data) {
        //echo '<pre>'; print_r($data); echo '</pre>';exit;
        $this->_db->where('item_status_name',$data['item_status_name']);
        $match = $this->_db->getOne('tms_item_status');

        
        if($match){
                $return['status'] = 422;
                $return['msg'] = 'Status already exists.'; 
        }else{
            $this->_db->where('is_default',1);
            $isDefault = $this->_db->getOne('tms_item_status');

            if($isDefault && $data['is_default'] == 1){
                $return['status'] = 422;
                $return['msg'] = 'Default status already assign.Please remove it first';
            }else{
                $data['created_date'] = date('Y-m-d H:i:s');
                $data['modified_date'] = date('Y-m-d H:i:s');
                
                $id = $this->_db->insert('tms_item_status', $data);
                if ($id) {
                    $return['status'] = 200;
                    $return['msg'] = 'Insert Successfully.';
                } else {
                    $return['status'] = 422;
                    $return['msg'] = 'Not inserted.';
                }
            }
        }    
        return $return;
    }
    
    public function getAll() {
        $results = $this->_db->get('tms_item_status');
        return $results;
    }
    
    public function getTypeById($id) {
        $this->_db->where('item_status_id', $id);
        $result = $this->_db->getOne('tms_item_status');
        return $result;
    }
    
    public function update($id, $data) {
        $this->_db->where('item_status_name',$data['item_status_name']);
        $match = $this->_db->getOne('tms_item_status');
        if($match && $match['item_status_id'] !=$id){
                $return['status'] = 422;
                $return['msg'] = 'Status already exists.'; 
        }else{
            $this->_db->where("is_default != $id ");
            $this->_db->where('is_default',1);
            $isDefault = $this->_db->getOne('tms_item_status');
            if($isDefault && $data['is_default'] == 1){
                $return['status'] = 422;
                $return['msg'] = 'Default status already assign.Please remove it first';
            }else{
                $data['modified_date'] = date('Y-m-d H:i:s');
                $this->_db->where('item_status_id', $id);
                $id = $this->_db->update('tms_item_status', $data);
                if ($id) {
                    $return['status'] = 200;
                    $return['msg'] = 'Updated Successfully.';
                } else {
                    $return['status'] = 422;
                    $return['msg'] = 'Not Updated.';
                }
            }
        }    
        return $return;
    }

    public function delete($id) {
        $this->_db->where('project_status', $id);
        $ifIdUsedInGeneral = $this->_db->getOne('tms_general');
        if($ifIdUsedInGeneral){
            $return['status'] = 422;
            $return['msg'] = 'This record is already in use.';
        }else{
            $this->_db->where('item_status_id', $id);
            $defaultStatusNeverDel = $this->_db->getOne('tms_item_status');
            
            if($defaultStatusNeverDel['default_added'] == 1){
                $return['status'] = 422;
                $return['msg'] = 'You can not delete this record.';
            }else{
                $this->_db->where('item_status_id', $id);
                $id = $this->_db->delete('tms_item_status');
                if ($id) {
                    $return['status'] = 200;
                    $return['msg'] = 'Deleted Successfully.';
                } else {
                    $return['status'] = 422;
                    $return['msg'] = 'Not inserted.';
                }
            }

        }
        return $return;
    }

}
