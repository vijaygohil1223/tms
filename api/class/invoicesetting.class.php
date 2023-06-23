<?php

class invoicesetting {

    public function __construct() {
        $this->_db = db::getInstance();
    }

    public function save($data) {
        
        $this->_db->where('id',$data['id']);
        $match = $this->_db->getOne('tms_invoice_setting');

        if($match){
            $return['status'] = 422;
            $return['msg'] = 'Status already exists.'; 
        }else{
            $data['dtCreatedDate'] = date('Y-m-d H:i:s');
            $data['dtUpdatedDate'] = date('Y-m-d H:i:s');
            $id = $this->_db->insert('tms_invoice_setting', $data);
            if ($id) {
                $return['status'] = 200;
                $return['msg'] = 'Insert Successfully.';
            } else {
                $return['status'] = 422;
                $return['msg'] = 'Not inserted.';
            }
        }
        

        return $return;
    }

    public function update($id, $data) {
        // $this->_db->where('id',$data['id']);
        // $match = $this->_db->getOne('tms_invoice_setting');
        // if($match && $match['id'] != $id){
        //     $return['status'] = 422;
        //     $return['msg'] = 'Name of resource status already exists.'; 
        // }
        $data['dtUpdatedDate'] = date('Y-m-d H:i:s');
        $this->_db->where('id', $id);
        $id = $this->_db->update('tms_invoice_setting', $data);
        if ($id) {
            $return['status'] = 200;
            $return['msg'] = 'Insert Successfully.';
        } else {
            $return['status'] = 422;
            $return['msg'] = 'Not inserted.';
        }
        return $return;
    }

    public function getAll() {
        $results = $this->_db->get('tms_invoice_setting');
        return $results;
    }

    public function delete($id) {
        $this->_db->where('eUserStatus', $id);
        $ifIdUsedInUsers = $this->_db->getOne('tms_users');
        
        $this->_db->where('vStatus', $id);
        $ifIdUsedInClient = $this->_db->getOne('tms_client');
        if($ifIdUsedInUsers || $ifIdUsedInClient){
            $return['status'] = 404;
            $return['msg'] = 'This record is already in use.';
        }else{
            $this->_db->where('id', $id);
            $id = $this->_db->delete('tms_invoice_setting');
            if ($id) {
                $return['status'] = 200;
                $return['msg'] = 'Deleted Successfully.';
            } else {
                $return['status'] = 422;
                $return['msg'] = 'Not inserted.';
            }
        }
        

        return $return;
    }

    public function getTypeById($id) {
        $this->_db->where('id', $id);
        $result = $this->_db->getOne('tms_invoice_setting');
        return $result;
    }
    
    public function getStatusByField($id, $field_name = "") {
        $this->_db->where('id', $id);
        $data = $this->_db->get('tms_invoice_setting');
        if ($field_name == "") {
            return $data;
        } else {
            if($data) {
                $field_names = explode(',', $field_name);
                $return_data = "";
                foreach ($field_names as $field) {
                    $return_data.= $data[0][$field] . ' ';
                }
                return trim($return_data);    
            }       
        }
    }

    public function getActive() {
        $this->_db->where('is_active', 1);
        $this->_db->where('status_type', 1);
        $result = $this->_db->get('tms_invoice_setting');
        return $result;
    }
    public function getclientActive() {
        $this->_db->where('is_active', 1);
        $this->_db->where('status_type', 2);
        $result = $this->_db->get('tms_invoice_setting');
        return $result;
    }
}
