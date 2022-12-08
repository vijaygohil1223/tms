<?php
class specialized {

    public function __construct() {
        $this->_db = db::getInstance();
    }

    public function specializedGetAll() {
        $results = $this->_db->get('tms_specialization');
        return $results;
    }
    public function specializedOne($id){
        $this->_db->where('id',$id);
        $data = $this->_db->getone('tms_specialization');
        return $data;
    }        
    public function specializedUpdate($id, $data) {
        $this->_db->where('id',$data['id']);
        $match = $this->_db->getOne('tms_specialization');
        if($match['id'] != $id) {
                $return['status'] = 422;
                //$return['msg'] = 'Language  already exists.';
                $return['msg'] = 'Not inserted';
        } else {
            $data['updated_date'] = date('Y-m-d H:i:s');
            $this->_db->where('id', $id);
            $id = $this->_db->update('tms_specialization', $data);
            if ($id) {
                $return['status'] = 200;
                $return['msg'] = 'Updated Successfully';
            } else {
                $return['status'] = 422;
                $return['msg'] = 'Not Updated.';
            }
        } 
        return $return;
    }

    public function deleteSpecialized($id) {
        $this->_db->where('id', $id);
        $id = $this->_db->delete('tms_specialization');
        if ($id) {
            $return['status'] = 200;
            $return['msg'] = 'Deleted Successfully.';
        } else {
            $return['status'] = 422;
            $return['msg'] = 'Not Deleted.';
        }

        return $return;

    }
    public function specializedSave($data) {
        $this->_db->where('name',$data['name']);
        $match = $this->_db->getOne('tms_specialization');
        if($match) {
                $return['status'] = 422;
                $return['msg'] = 'specialization  already exists.';
        }else{
            $data['created_date'] = date('Y-m-d H:i:s');
            $data['updated_date'] = date('Y-m-d H:i:s');
            $id = $this->_db->insert('tms_specialization', $data);
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



}
