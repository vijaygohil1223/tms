<?php

require_once 'functions.class.php';
require_once 'mail_format.class.php';
require_once 'userstatus.class.php';

require_once 'awsFileupload.class.php';

class filemanager {

    protected $_db;
    protected $_useremail;
    protected $_username;
    protected $_userid;
    private $parentId;
    public $parents_data=array();
    public $treeArr_data=array();
    
    public $treeArr_data_count=array();
    
    public function __construct() {
        $this->_db = db::getInstance();
    }
    
    public function fileCustomeget($id, $field) {
        $this->_db->where($field,$id);
        return $this->_db->getOne('tms_filemanager');
    }

    public function filegetByjobId($id) {
        $this->_db->where('job_id',$id);
        return $this->_db->getOne('tms_filemanager');
    }

    public function filegetByfield($field,$id) {
        $this->_db->where($field,$id);
        return $this->_db->getOne('tms_filemanager');
    }

    public function filegetByfmanagerId($id) {
        $this->_db->where('fmanager_id',$id);
        return $this->_db->getOne('tms_filemanager');
    }

    public function filegetByparentId($id) {
        $this->_db->where('parent_id',$id);
        return $this->_db->get('tms_filemanager');
    }

    public function fileManagerGet(){
        $this->_db->where('parent_id',0);
        $data = $this->_db->get('tms_filemanager');
        return $data;
    }

    // folder structure tree view
    public function buildTree__(array $elements, $parentId = 0) {
        $branch = array();
        foreach ($elements as $element) {
            //if($element['parent_id'] == $parentId)
            if ($element['parent_id'] == $parentId) {
                $children = Self::buildTree($elements, $element['fmanager_id']);
                $element['countchild'] = count($children);
                if ($children) {
                    $element['countChild'] = count($children);
                    $element['categories'] = $children;
                    //$element['categoriesCount']++;
                    //$element['counts'] = count($children);
                }
                $branch[] = $element;
            }
        }
        return $branch;
    }

    public function buildTree(array $elements, $parentId = 0, $depth = 0, $maxDepth = 10) {
        if ($depth >= $maxDepth) {
            return [];
        }
    
        $branch = array();
    
        foreach ($elements as $element) {
            // Check if the element is a direct child of the current parent
            if ($element['parent_id'] == $parentId) {
                // Recursively get the children of this element
                $children = $this->buildTree($elements, $element['fmanager_id'], $depth + 1, $maxDepth);
                $element['countchild'] = count($children);
                
                // If this element has children, add them to the 'categories'
                if ($children) {
                    $element['categories'] = $children;
                }
    
                $branch[] = $element;
            }
        }
    
        return $branch;
    }
    
    

    // to get folder url from tree view flat array
    public function buildTreePath(array $elements, $parentId = 0) {
        $branch = array();

        foreach ($elements as $key => $element) {
            
            if ($element['parent_id'] == $parentId) {
                        $branch[] = $element;
                        //if(count($element['fmanager_id']) > 0) {
                        if($element['fmanager_id']) {
                            $branch = array_merge($branch,Self::buildTreePath($elements, $element['fmanager_id']));
                        }
            }
        }

        return $branch;
    }

    public function buildTreePathForFielsCount(array $elements, $parentId = 0) {
        $branch = array();

        foreach ($elements as $key => $element) {
            
            if ($element['parent_id'] == $parentId ) {
                // echo "<pre/>";
                // print_r($parentId);
                $branch[] = $element;
                //if(count($element['fmanager_id']) > 0) {
                if($element['fmanager_id']  ) {
                    $branch = array_merge($branch,Self::buildTreePathForFielsCount($elements, $element['fmanager_id']));
                }
            }
        }

        return $branch;
    }

    public function find_parents($input, $id, $empty_id, array $fparentArray) {
        
    //global $parents_data = [];

        if(is_array($input)) {

            foreach($input as $k => $val) {
                if($val['fmanager_id'] == $id  && $val['parent_id'] != 0) {
                    if($val['ext']==''){
                        array_push($this->parents_data, array('id'=>$val['fmanager_id'],'name'=>$val['name']) );
                    }
                        Self::find_parents($fparentArray, $val['parent_id'],$empty_id,$fparentArray );
                    
                }
            }
        }
        if($empty_id>0){
                return $this->parents_data;
        }else{
            $this->parents_data = [];
            return 0;
        }
    }

    public function folder_pathurl($mydata){
        $mydata_new = array();
        $folderurl = '';

        //$mydata = array_map("unserialize", array_unique(array_map("serialize", $mydata)));
             
        foreach ($mydata as $p_key => $row){
                $mydata_new[$p_key] = $row['id'];
            }
            array_multisort($mydata_new, SORT_ASC, $mydata);

            foreach ($mydata as $key => $row)
            {
                $folderurl .= $row['name'].'/';
            }
        return $folderurl;  
    }

    public function buildTreearraydata_new(array $elements, $parentId = 0, array $staticFullarray, $staticParentId) {
        $branch = array();
        //$arrAll2 = array();
        $folderurl ='';
        $arrAll2 = $this->treeArr_data;
        global $parents_data;

        //$arrAll2 = Self::buildTreePath($staticFullarray,$staticParentId);
        foreach ($elements as $key => $element) {
            //if($element['parent_id'] == $parentId)
            if ($element['parent_id'] == $parentId) {
                
                $mydata = Self::find_parents($arrAll2, $element['fmanager_id'], 1, $arrAll2);
                $folderurl = '';
                if($mydata){
                    $folderurl = Self::folder_pathurl($mydata);
                }
                $element['folderurl'] = $folderurl;
                Self::find_parents($arrAll2, $element['fmanager_id'] ,0 ,$arrAll2);
                $branch[] = $element;
                    //if(count($element['fmanager_id']) > 0) {
                        $branch = array_merge($branch,Self::buildTreearraydata_new($elements, $element['fmanager_id'],$staticFullarray, $staticParentId));
                    //}
            }
        }
        return $branch;
    }


    public function buildTreearraydata(array $elements, $parentId = 0) {
        $branch = array();
        foreach ($elements as $key => $element) {
            //if($element['parent_id'] == $parentId)
            if ($element['parent_id'] == $parentId) {
                $mydata = find_parents($arrAll2, $element['fmanager_id'], 1);
                $branch[] = $element;
                    //if(count($element['fmanager_id']) > 0) {
                        $branch = array_merge($branch,Self::buildTreearraydata($elements, $element['fmanager_id']));
                    //}
            }
        }
        return $branch;
    }


   public function filefolderGet($id,$root,$externalResourceUserId){
        $data = [];
        if($externalResourceUserId !='null'){
            $chkIfRoot = $this->_db->rawQuery("SELECT * FROM tms_filemanager where fmanager_id = $id AND is_ex_project_folder =1 AND is_default_folder =1");
            if($chkIfRoot){
                $chkAssignResource = $this->_db->rawQuery("SELECT * FROM tms_summmery_view where resource = $externalResourceUserId");
                
                        $chkAssignResource = $this->_db->rawQuery("SELECT * FROM tms_summmery_view where resource = $externalResourceUserId");
                        if($chkAssignResource){
                            $exUserPfolder = $this->_db->rawQuery("SELECT * FROM tms_filemanager where user_id = $externalResourceUserId");
                            $pId = $exUserPfolder[0]['fmanager_id'];
                            $exUserPfolder1 = $this->_db->rawQuery("SELECT * FROM tms_filemanager where parent_id = $pId AND is_ex_project_folder = 1");
                        $filemanagerWhereSql = 'WHERE parent_id = "'.$id.'" AND is_project_folder = 1 OR parent_id = "'.$exUserPfolder1[0]['fmanager_id'].'"';
                        foreach ($chkAssignResource as $key => $value) {
                            $orderId = $value['order_id'];
                            
                            $chkIsProjectFolder = $this->_db->rawQuery("SELECT * FROM tms_filemanager where order_id = $orderId AND is_project_folder = 1");
                            
                            if($chkIsProjectFolder){
                                foreach($chkIsProjectFolder as $chkIsProjectFolder_row){
                                    $filemanagerWhereSql .= ' OR fmanager_id = "'.$chkIsProjectFolder_row['fmanager_id'].'"';
                                }
                            }
                        }
                        
                        $filemanagerSql = "SELECT * FROM tms_filemanager " . $filemanagerWhereSql;
                        $data = $this->_db->rawQuery($filemanagerSql);
                       
                    }else{
                        // $this->_db->where('parent_id',$id);
                        // $data = $this->_db->get('tms_filemanager');

                    }
            }else{
                    $chkForProjectFolder = $this->_db->rawQuery("SELECT * FROM tms_filemanager where fmanager_id = $id AND  name= 'Projects'");
                    if($chkForProjectFolder){
                       $chkAssignResource = $this->_db->rawQuery("SELECT * FROM tms_summmery_view where resource = $externalResourceUserId");
                        foreach ($chkAssignResource as $key => $value) {
                            $orderId = $value['order_id'];
                            $filemanagerWhereSql = 'WHERE parent_id = "'.$id.'" AND order_id="'.$value['order_id'].'"';
                            
                            $chkIsProjectFolder = $this->_db->rawQuery("SELECT * FROM tms_filemanager where order_id = $orderId AND is_project_folder = 1");
                            
                            if($chkIsProjectFolder){
                                foreach($chkIsProjectFolder as $chkIsProjectFolder_row){
                                    $filemanagerWhereSql .= ' OR fmanager_id = "'.$chkIsProjectFolder_row['fmanager_id'].'"';
                                }
                            }
                        }
                        
                        $filemanagerSql = "SELECT * FROM tms_filemanager " . $filemanagerWhereSql;
                        $data = $this->_db->rawQuery($filemanagerSql);
                    }else{
                        if($id > 0){
                            $this->_db->where('parent_id',$id);
                            $data = $this->_db->get('tms_filemanager');
                        }
                        
                    }
            }
            
        }else{
            if($id > 0){
                $this->_db->where('parent_id',$id);
                $data = $this->_db->get('tms_filemanager');    
                //$dataArr = $this->_db->get('tms_filemanager');    
                $escaped_id = $this->_db->escape($id);
                // Define the SQL query with the recursive CTE
                $sql = "
                WITH RECURSIVE FileTree AS (
                    SELECT
                        *,
                        1 AS depth
                    FROM tms_filemanager
                    WHERE parent_id = $escaped_id
                
                    UNION ALL
                
                    SELECT
                        t.*,
                        ft.depth + 1 AS depth
                    FROM tms_filemanager t
                    INNER JOIN FileTree ft ON t.parent_id = ft.fmanager_id
                    WHERE ft.depth < 10
                )
                SELECT *
                FROM FileTree
                ORDER BY fmanager_id DESC
                ";
                
                if (defined('STATIC_SERVER_NAME') && STATIC_SERVER_NAME && STATIC_SERVER_NAME == 'kanhasoft') {
                    $dataArr = $this->_db->get('tms_filemanager');
                }else{
                    $dataArr = $this->_db->rawQueryNew($sql);    
                } 
                
                $i = 0;
                foreach($data as $data1){
                    $data[$i]['countchild'] = 0;
                    $data[$i]['categories'] = [];
                    if($data1['ext'] == ''){
                        $data[$i]['categories'] = self::buildTree($dataArr,$data[$i]['fmanager_id']);
                    } 
                    $i++;
                }
            }
        }
        return $data;
    }
    
    public function higherfolderGet($id,$exteruserId){
        $this->_db->where('fmanager_id',$id);
        $info = $this->_db->getOne('tms_filemanager');

        $this->_db->where('fmanager_id',$info['parent_id']);
        $fname = $this->_db->getOne('tms_filemanager');
        
        $dataArr = $this->_db->get('tms_filemanager');
        if($exteruserId == 'null'){
            $this->_db->where('parent_id',$info['parent_id']);
            $dat = $this->_db->get('tms_filemanager');
            $data['info'] = $info;
            $data['data'] = $dat;
            $data['fname'] = $fname['name'];
            $i = 0;
            foreach($data['data'] as $data1){
                $data['data'][$i]['categories'] = [];
                $data['data'][$i]['countchild'] = 0;
                if($data1['ext'] == ''){
                    $data['data'][$i]['categories'] = self::buildTree($dataArr,$data['data'][$i]['fmanager_id']);
                } 
                $i++;
            }
            return $data;
        }else{
            $chkIfRoot = $this->_db->rawQuery("SELECT * FROM tms_filemanager where fmanager_id = $id AND is_ex_project_folder =1 AND is_default_folder =1");
            if($chkIfRoot){
               $chkAssignResource = $this->_db->rawQuery("SELECT * FROM tms_summmery_view where resource = $exteruserId");
                $filemanagerWhereSql = 'WHERE parent_id = "'.$id.'"';
                foreach ($chkAssignResource as $key => $value) {
                    $orderId = $value['order_id'];
                    
                    $chkIsProjectFolder = $this->_db->rawQuery("SELECT * FROM tms_filemanager where order_id = $orderId AND is_project_folder = 1");
                    
                    if($chkIsProjectFolder){
                        foreach($chkIsProjectFolder as $chkIsProjectFolder_row){
                            $filemanagerWhereSql .= ' OR fmanager_id = "'.$chkIsProjectFolder_row['fmanager_id'].'"';
                        }
                    }
                }
                
                $filemanagerSql = "SELECT * FROM tms_filemanager " . $filemanagerWhereSql;
                $dat = $this->_db->rawQuery($filemanagerSql);
                if($dat){
                    $data['data'] = $dat;
                }else{
                    $this->_db->where('parent_id',$info['parent_id']);
                    $dat = $this->_db->get('tms_filemanager');
                    $data['data'] = $dat;
                }
                $data['info'] = $info;
                $data['fname'] = $fname['name'];
                $i = 0;
                foreach($data['data'] as $data1){
                    $data['data'][$i]['categories'] = [];
                    $data['data'][$i]['countchild'] = 0;
                    if($data1['ext'] == ''){
                        $data['data'][$i]['categories'] = self::buildTree($dataArr,$data['data'][$i]['fmanager_id']);
                    } 
                    $i++;
                }
        
                return $data;
            }else{  
                $chkIfRoot = $this->_db->rawQuery("SELECT * FROM tms_filemanager where fmanager_id = $id  AND is_ex_project_folder =1");
                    if($chkIfRoot){
                        $chkAssignResource = $this->_db->rawQuery("SELECT * FROM tms_summmery_view where resource = $exteruserId");
                        $exUserPfolder = $this->_db->rawQuery("SELECT * FROM tms_filemanager where user_id = $exteruserId");
                        $pId = $exUserPfolder[0]['fmanager_id'];
                        $exUserPfolder1 = $this->_db->rawQuery("SELECT * FROM tms_filemanager where parent_id = $pId AND is_ex_project_folder = 1");
                    $filemanagerWhereSql = 'WHERE parent_id = "'.$id.'" AND is_project_folder = 1 OR parent_id = "'.$exUserPfolder1[0]['fmanager_id'].'"';
                    foreach ($chkAssignResource as $key => $value) {
                        $orderId = $value['order_id'];
                        
                        $chkIsProjectFolder = $this->_db->rawQuery("SELECT * FROM tms_filemanager where order_id = $orderId AND is_project_folder = 1");
                        
                        if($chkIsProjectFolder){
                            foreach($chkIsProjectFolder as $chkIsProjectFolder_row){
                                $filemanagerWhereSql .= ' OR fmanager_id = "'.$chkIsProjectFolder_row['fmanager_id'].'"';
                            }
                        }
                    }
                    
                    $filemanagerSql = "SELECT * FROM tms_filemanager " . $filemanagerWhereSql;
                    $dat = $this->_db->rawQuery($filemanagerSql);
                    $data['info'] = $info;
                    $data['data'] = $dat;
                    $data['fname'] = $fname['name'];
                    $i = 0;
                    foreach($data['data'] as $data1){
                        $data['data'][$i]['categories'] = [];
                        $data['data'][$i]['countchild'] = 0;
                        if($data1['ext'] == ''){
                            $data['data'][$i]['categories'] = self::buildTree($dataArr,$data['data'][$i]['fmanager_id']);
                        } 
                        $i++;
                    }
        
                    return $data;
                }else{
                    
                        $Pfolder = $this->_db->rawQuery("SELECT * FROM tms_filemanager where fmanager_id = $id && name='Projects' && is_default_folder = 1");
                        
                        if($Pfolder){
                                $getUserFid = $this->_db->rawQuery("SELECT * FROM tms_filemanager where user_id = $exteruserId");
                                if($getUserFid){
                                    $this->_db->where('parent_id',$getUserFid[0]['fmanager_id']);
                                    $dat = $this->_db->get('tms_filemanager');
                                    $data['info'] = $info;
                                    $data['data'] = $dat;
                                    $data['fname'] = $fname['name'];

                                    $i = 0;
                                    foreach($data['data'] as $data1){
                                        $data['data'][$i]['categories'] = [];
                                        $data['data'][$i]['countchild'] = 0;
                
                                        if($data1['ext'] == ''){
                                            $data['data'][$i]['categories'] = self::buildTree($dataArr,$data['data'][$i]['fmanager_id']);
                                        } 
                                        $i++;
                                    }
                                    return $data;
                                }else{
                                    $this->_db->where('parent_id',$info['parent_id']);
                                    $dat = $this->_db->get('tms_filemanager');
                                    $data['info'] = $info;
                                    $data['data'] = $dat;
                                    $data['fname'] = $fname['name'];
                                    $i = 0;
                                    foreach($data['data'] as $data1){
                                        $data['data'][$i]['categories'] = [];
                                        $data['data'][$i]['countchild'] = 0;
                                        if($data1['ext'] == ''){
                                            $data['data'][$i]['categories'] = self::buildTree($dataArr,$data['data'][$i]['fmanager_id']);
                                        } 
                                        $i++;
                                    }
                                    return $data;
                                }
                        }else{
                            $Pfolder = $this->_db->rawQuery("SELECT * FROM tms_filemanager where fmanager_id = $id && is_project_folder = 1");
                            if($Pfolder){
                                $chkAssignResource = $this->_db->rawQuery("SELECT * FROM tms_summmery_view where resource = $exteruserId");
                                    $exUserPfolder = $this->_db->rawQuery("SELECT * FROM tms_filemanager where user_id = $exteruserId");
                                    $pId = $exUserPfolder[0]['fmanager_id'];
                                    $exUserPfolder1 = $this->_db->rawQuery("SELECT * FROM tms_filemanager where parent_id = $pId AND is_ex_project_folder = 1");
                                $filemanagerWhereSql = 'WHERE parent_id = "'.$id.'" AND is_project_folder = 1 OR parent_id = "'.$exUserPfolder1[0]['fmanager_id'].'"';
                                foreach ($chkAssignResource as $key => $value) {
                                    $orderId = $value['order_id'];
                                    
                                    $chkIsProjectFolder = $this->_db->rawQuery("SELECT * FROM tms_filemanager where order_id = $orderId AND is_project_folder = 1");
                                    
                                    if($chkIsProjectFolder){
                                        foreach($chkIsProjectFolder as $chkIsProjectFolder_row){
                                            $filemanagerWhereSql .= ' OR fmanager_id = "'.$chkIsProjectFolder_row['fmanager_id'].'"';
                                        }
                                    }
                                }
                                
                                $filemanagerSql = "SELECT * FROM tms_filemanager " . $filemanagerWhereSql;
                                $dat = $this->_db->rawQuery($filemanagerSql);
                                $data['info'] = $info;
                                $data['data'] = $dat;
                                $data['fname'] = $fname['name'];

                                $i = 0;
                                foreach($data['data'] as $data1){
                                    $data['data'][$i]['categories'] = [];
                                    $data['data'][$i]['countchild'] = 0;
                                    if($data1['ext'] == ''){
                                        $data['data'][$i]['categories'] = self::buildTree($dataArr,$data['data'][$i]['fmanager_id']);
                                    } 
                                    $i++;
                                }
        
                                return $data;
                            }else{
                                $this->_db->where('parent_id',$info['parent_id']);
                                $dat = $this->_db->get('tms_filemanager');
                                $data['info'] = $info;
                                $data['data'] = $dat;
                                $data['fname'] = $fname['name'];

                                $i = 0;
                                foreach($data['data'] as $data1){
                                    $data['data'][$i]['categories'] = [];
                                    $data['data'][$i]['countchild'] = 0;
                                    if($data1['ext'] == ''){
                                        $data['data'][$i]['categories'] = self::buildTree($dataArr,$data['data'][$i]['fmanager_id']);
                                    } 
                                    $i++;
                                }
        
                                return $data;
                            }

                        }
                    
                }
            }
        }
    }
        
    public function fileManagerUpdate($id,$data){
        $path = "../../uploads/fileupload/";
        $images = glob($path.$data['image']);
        if(isset($images[0])) {
            $file = basename($images[0]);
            $ext = explode('.',$file);
            $extension = end($ext);
            $rename =  rename($images[0], $path.$data['name'].'.'.$extension);
            $data['name'] = $data['name'].'.'.$extension;
        }
        unset($data['image']);
        $data['created_date'] = date('Y-m-d H:i:s');
        $this->_db->where('fmanager_id',$id);
        $info =  $this->_db->update('tms_filemanager',$data);
        if ($info) {
            $return['status'] = 200;
            $return['msg'] = 'Successfully Rename.';
        } else {
            $return['status'] = 422;
            $return['msg'] = 'Not Rename.';
        } 
        return $return;
    }

    public function fileManagerPaste($id,$data){
        foreach ($data as $value) {
            $this->_db->where('fmanager_id',$value['id']);
            $info = $this->_db->getOne('tms_filemanager');
            unset($info['fmanager_id']);
            $fileName = "../../uploads/fileupload/".$info['name'];
            $ext = pathinfo($fileName, PATHINFO_EXTENSION);
            $fName = explode('.', strrev($info['name']), 2);
            $fileNameWithoutExt = strrev($fName[1]);
            
            $newFileName = "../../uploads/fileupload/".$fileNameWithoutExt.'_copy'.'.'.$ext;
            copy($fileName, $newFileName);
            $info['name'] = $fileNameWithoutExt.'_copy'.'.'.$ext;
            $info['parent_id'] = $value['parent'];
            $pastedData = $this->_db->insert('tms_filemanager',$info);
        }
    }

    public function filemanagerfolderDelete($id,$image){
        $awsFile = new awsFileupload();
        if($image){
            $info = self::filegetByfmanagerId($id);
            if(isset($info['name']) || isset($info['ext'])) {
                if(isset($info['is_s3bucket'] ) && $info['is_s3bucket'] ==1 ){
                    $deleteFromaws = $awsFile->awsFileDelete($info['name']); 
                }
            }
        }
        $path = "../../uploads/fileupload/";
        $images = glob($path.$image);
        if($images){
            try {
                if(isset($images[0])) {
                    unlink($path.$image);
                }
            } catch (Exception $e) {}
        }
        
        $this->_db->where('fmanager_id',$id);
        $data = $this->_db->delete('tms_filemanager');
        if($data) {
            $info = self::filegetByparentId($id);
            foreach($info AS $key => $value) {
                if(isset($value['name']) || isset($value['ext'])) {
                    if(isset($value['is_s3bucket'] ) && $value['is_s3bucket'] ==1 ){
                        $deleteFromaws = $awsFile->awsFileDelete($value['name']); 
                    }else{
                        $path = "../../uploads/fileupload/";
                        $images = glob($path.$value['name']);
                        if($images){
                            if(isset($images)) {
                                unlink($path.$value['name']);
                            }
                        }
                    }
                }
                $this->_db->where('parent_id',$value['parent_id']);
                $this->_db->delete('tms_filemanager');
            }    
            
        }
        return $data;
    }
    public function filemanagerfolderDeleteMultiple($id,$data){
        $path = "../../uploads/fileupload/";

        $awsFile = new awsFileupload();
        foreach ($data as $value) {
            $this->_db->where('fmanager_id',$value['id']);
            $info = $this->_db->getOne('tms_filemanager');
            if($info && count($info)>0){
                $filename = glob($path.$info['name']);
                if(isset($filename)) {
                    if(isset($info['is_s3bucket'] ) && $info['is_s3bucket'] ==1 ){
                        $deleteFromaws = $awsFile->awsFileDelete($info['name']); 
                    }else{
                        unlink($path.$info['name']);
                    }
                }
            }

            $this->_db->where('fmanager_id',$value['id']);
            $this->_db->delete('tms_filemanager');
        }
        $return['status'] = 200;
        $return['msg'] = 'Successfully Deleted';

        return $return;
        
    }

    public function fileparentNameGet($id) {
        $data = self::filegetByfmanagerId($id);
        return $data;    
    }

    public function Newfoldermake($id,$name,$role) {
        $data['updated_date'] = date('Y-m-d H:i:s');
        $data['created_date'] = date('Y-m-d H:i:s');
        $data['name'] = $name;
        $data['role_id'] = $role;
        $data['parent_id'] = $id;
        $info =  $this->_db->insert('tms_filemanager',$data);
    }

    public function fileAdd($data) {
        // start - previous code
        /*$data['name'] = self::uploadimage($data);
        $checkext = explode('.', $data['name']);
        $data['ext'] = end($checkext);
        
        $data['updated_date'] = date('Y-m-d H:i:s');
        $data['created_date'] = date('Y-m-d H:i:s');        
        unset($data['filename']);
        unset($data['filetype']);
        $info =  $this->_db->insert('tms_filemanager',$data);*/
        //end previos code

        $num=0;
        if(count($data)>0){
            foreach($data as $key => $val){
                $data[$num]['is_s3bucket'] = 1;  
                $data[$num]['updated_date'] = date('Y-m-d H:i:s');
                $data[$num]['created_date'] = date('Y-m-d H:i:s');  
                $info =  $this->_db->insert('tms_filemanager',$data[$num]);
                $num++;
            }
        }
        if ($info) {
            $return['status'] = 200;
            $return['msg'] = 'Successfully created.';
        } else {
            $return['status'] = 422;
            $return['msg'] = 'Not created folder.';
        } 
        return $return;
    }
    public function fileAddScoop($data) {
        $num=0;
        if(count($data)>0){
            foreach($data as $key => $val){
                //$data['name'] = self::uploadimage($data);
                //$newData = self::uploadimage_new2($data[$num]);
                $data[$num]['is_s3bucket'] = 1;  
                $data[$num]['updated_date'] = date('Y-m-d H:i:s');
                $data[$num]['created_date'] = date('Y-m-d H:i:s');  
                $fileUpld =  $this->_db->insert('tms_filemanager',$data[$num]);
                $num++;
            }
        }    
        if ($fileUpld) {
            $return['status'] = 200;
            $return['msg'] = 'Successfully created.';
        } else {
            $return['status'] = 422;
            $return['msg'] = 'Not created folder.';
        } 
        return $return;
    }
    
    public function uploadimage_new2($data) {
        $my_newdata =$data; 
        $result = explode(',', $data['name']);
        $finalstring = base64_decode($result[1]);
        $ex = str_replace(' ','_',$data['filename']);
        
        $img = $data['name'];
        $img = str_replace('data:'.$data['filetype'].';base64,', '', $img);
        $img = str_replace(' ', '+', $img);
        $data = base64_decode($img);
        $filename = rand(0,1000).'_'.$ex;
        
        $output_file = UPLOADS_ROOT . "fileupload/" . $filename;
        $ifp = fopen($output_file, "wb");
        $ifw = fwrite($ifp, $finalstring);
        fclose($ifp);

        // data to insert
        $info = false;
        if($ifw){
            $data_ins['name'] = $filename;
            $checkext = explode('.', $filename);
            $data_ins['ext'] = end($checkext);
            
            $data_ins['role_id'] = $my_newdata['role_id'];
            $data_ins['parent_id'] = $my_newdata['parent_id'];
            $data_ins['size'] = $my_newdata['size'];
            $data_ins['f_id'] = $my_newdata['f_id'];
            $data_ins['updated_date'] = date('Y-m-d H:i:s');
            $data_ins['created_date'] = date('Y-m-d H:i:s');        
            unset($data_ins['filename']);
            unset($data_ins['filetype']);
            
            $info =  $this->_db->insert('tms_filemanager',$data_ins);
            
        }    
        // end data
        return $info;
        //return $filename;
    }


    public function filefrontget($id) {
        $this->_db->where('order_id',$id);
        $this->_db->where('parent_id',0);
        $data = $this->_db->getOne('tms_filemanager');
        return $data;
    }

    public function filefrontroot($id,$root) {
        $this->_db->where('order_id',$id);
        $this->_db->where('name','$'.$root);
        $data = $this->_db->getOne('tms_filemanager');
        return $data;   
    }

    public function jobfilefrontroot($orderid,$jobid,$root) {
        if(isset($root)) {
            if($root == 'source') {
                $root = '_in';
            } else if($root == 'target') {
                $root = '_out';
            } else {
                $root = ' ';
            }
        }
        $data = $this->_db->rawQuery("SELECT * FROM tms_filemanager t1 INNER JOIN tms_filemanager t2 ON t1.fmanager_id = t2.parent_id WHERE t1.order_id = '".$orderid."' AND t1.job_id = '".$jobid."' AND t2.name = '".$root."'");
        return $data;
    }

    public function jobfileuserfrontroot($jobid,$root) {
        if(isset($root)) {
            if($root == 'source') {
                $root = '_in';
            } else if($root == 'target') {
                $root = '_out';
            } else {
                $root = ' ';
            }
        }
        $data = $this->_db->rawQuery("SELECT * FROM tms_filemanager t1 INNER JOIN tms_filemanager t2 ON t1.fmanager_id = t2.parent_id WHERE  t1.job_id = '".$jobid."' AND t2.name = '".$root."'");
        return $data;
    }

    public function jobfileuserrootSt($stid,$root) {
        $data = self::filegetByjobId($stid);
        return $data;
    }

    public function Clientfilefront($client,$status) {
        if($status == 'direct') {
            $this->_db->where('client_id',$client);
            $this->_db->where('parent_id',0);
            $data = $this->_db->getOne('tms_filemanager');    
        } else {
            $id = self::fileCustomeget('Indirect client', 'name');
            $this->_db->where('in_client_id',$client);
            $this->_db->where('parent_id',$id['fmanager_id']);
            $data = $this->_db->getOne('tms_filemanager');
            if(!$data){
                $this->_db->where('in_client_id',$client);
                $this->_db->where('parent_id',0);
                $data = $this->_db->getOne('tms_filemanager');
            }
            //echo '<pre>'; print_r($data); echo '</pre>';exit;
        }
        return $data;
    }

    public function Itemfilefront($orderId,$itemId) {
        $this->_db->where('order_id', $orderId);
        $this->_db->where('item_id', $itemId);
        $data = $this->_db->getOne('tms_filemanager');
        return $data;
    }

    public function Userfilefront($user) {
        $this->_db->where('user_id',$user);
        $this->_db->where('parent_id',0);
        $data = $this->_db->getOne('tms_filemanager');
        return $data;
    }

    public function filefolderstget($id,$root) {
        $data = $this->_db->rawQuery("SELECT * FROM tms_filemanager AS t1 WHERE t1.parent_id = '".$id."' ");
        if($data) {
            $source = []; $target = [];
            foreach ($data as $key => $value) {
                if($value['name'] == '_in') {
                    $source = self::filegetByparentId($value['fmanager_id']);
                } else {
                    $target = self::filegetByparentId($value['fmanager_id']);
                }   
            }
            $info['source'] = count($source);
            $info['target'] = count($target);
        }
        return $info;
    }

    public function filemanagerApproveSend($aid,$rid) {
        //update approved status
        $info['appr_id'] = 1;
        $info['updated_date'] = date('Y-m-d H:i:s');
        $this->_db->where('job_summmeryId',$aid);
        $this->_db->update('tms_summmery_view',$info);
        $ajob = self::filegetByjobId($aid);
        if($ajob) {
            //find file in file manager
            if(isset($ajob['fmanager_id'])) {
                $a_out = self::filegetByparentId($ajob['fmanager_id']);
                if(isset($a_out[0]['fmanager_id'])) {
                    $data = self::filegetByparentId($a_out[0]['fmanager_id']);
                    $rjob = self::filegetByjobId($rid);
                    if($rjob) {
                        if(isset($rjob['fmanager_id'])) {
                            $r_out = self::filegetByparentId($rjob['fmanager_id']);
                            if(isset($r_out[1]['fmanager_id'])) {
                                $rOut = $r_out[1]['fmanager_id'];
                            }
                        }
                    }
                    foreach ($data as $key => $value) {
                        //copy same directory in file
                        $ext = explode('.',$value['name']);
                        $extension = end($ext);
                        $file = chop($value['name'],'.'.$extension);
                        $path = "../../uploads/fileupload/";
                        $fileName = $path.$value['name'];
                        $newfile = $path.$file.'_thumb.'.$extension;
                        $nfile = $file.'_thumb.'.$extension;
                        if (!copy($fileName, $newfile)) {
                            echo "failed to copy $file...\n";
                        }
                        //approved to send request
                        if($value) {
                            unset($value['fmanager_id']);
                            $value['parent_id'] = $rOut;
                            $value['name'] = $nfile;
                            $value['updated_date'] = date('Y-m-d H:i:s');
                            $value['created_date'] = date('Y-m-d H:i:s');
                            $info = $this->_db->insert('tms_filemanager',$value);
                        }
                        
                    }
                }
            }
        }
        return $info;
    }

    public function uploadimage($data) {
        $result = explode(',', $data['name']);
        $finalstring = base64_decode($result[1]);
        $ex = str_replace(' ','_',$data['filename']);
        
        $img = $data['name'];
        $img = str_replace('data:'.$data['filetype'].';base64,', '', $img);
        $img = str_replace(' ', '+', $img);
        $data = base64_decode($img);
        $filename = rand(0,1000).'_'.$ex;
        $output_file = UPLOADS_ROOT . "fileupload/" . $filename;
        $ifp = fopen($output_file, "wb");
        fwrite($ifp, $finalstring);
        fclose($ifp);
        return $filename;
    }

    public static function getBytesFromHexString($hexdata) {
        for ($count = 0; $count < strlen($hexdata); $count+=2)
            $bytes[] = chr(hexdec(substr($hexdata, $count, 2)));
        return implode($bytes);
    }

   public static function getImageMimeType($imagedata,$FileType='') {
        // $imagemimetypes = array(
        //     "jpeg" => "FFD8",
        //     "png" => "89504E470D0A1A0A",
        //     "gif" => "474946",
        //     "bmp" => "424D",
        //     "tiff" => "4949",
        //     "tiff" => "4D4D",
        //     "zip" => "630000000000",
        //     "doc" => "CFAD12FE",
        //     "docx" => "504B030414000600",
        //     "doc" => "D0CF11E0A1B11AE100",
        //     "pdf" => "255044462D312E",
        //     "text" => "EFBBBF",
        //     "xlsx" => "504B030414000600",
        //     "rar" => "526172211A0700"
        // );
        $imagemimetypes =
array(  
    array('jpeg',   'FFD8',                 'image/jpeg',                                                                   ),
    array('png',    '89504E470D0A1A0A',     'image/png',                                                                    ),
    array('gif',    '474946',               'image/gif',                                                                 ),
    array('bmp',    '424D',                 'image/bmp',                                                                             ),
    array('tiff',   '4949',                 'image/tiff',                                                                             ),
    array('zip',    '504B0304',             'application/zip',                                                                             ),
    array('pdf',    '255044462D312E',       'application/pdf',                                                                             ),
    array('text',   'EFBBBF',               'text/plain',                                                                   ),
    array('rar',    '526172211A0700',       '',                                                                             ),
    array('xlsx',   '504B030414000600',     'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet',            ),
    array('docx',   '504B0506',     'application/vnd.openxmlformats-officedocument.wordprocessingml.document',      ),
    array('pptx',   '504B030414000600',     'application/vnd.openxmlformats-officedocument.presentationml.presentation',    ),
);
        foreach ($imagemimetypes as $row) {
            $mime=$row[0];
            $hexbytes=$row[1];
            $bytes = self::getBytesFromHexString($hexbytes);
            if (substr($imagedata, 0, strlen($bytes)) == $bytes){
                if(empty($FileType)){
                    return $mime;
                }
                elseif($FileType == $row[2]){
                    return $mime;
                }
            }
        }

        return NULL;
    }
    public function isParent($id,$data) {
        $this->_db->where('fmanager_id',$id);
        $data = $this->_db->getOne('tms_filemanager');
        return $data;
    }
    public function getRootFolder($id,$data) {
        $split = explode('_',$id);
        $id = $split[0];
        
        $this->_db->where('fmanager_id',$id);
        $data = $this->_db->getOne('tms_filemanager');
        
        return $data;
    }
    public function checkRootFromFiles($id,$externalResourceUserId) {
        if($externalResourceUserId !='null'){
            $chkForProjectFolder = $this->_db->rawQuery("SELECT * FROM tms_filemanager where fmanager_id = $id AND  name= 'Projects'");
            if($chkForProjectFolder){
                $getResourceFileManager = $this->_db->rawQuery("SELECT * FROM tms_filemanager where user_id = $externalResourceUserId AND  parent_id= 0");    
                if($getResourceFileManager){
                    return $getResourceFileManager;
                }
            }else{
                return $return['status'] = 404;
            }
        }
    }

    public function checkDefaultFolderProjectExternal($id) {
        $chkForProjectFolder = $this->_db->rawQuery("SELECT * FROM tms_filemanager where fmanager_id = $id AND  name= 'Projects'");
        if($chkForProjectFolder){
           return $return['status'] = 200;
        }else{
            return $return['status'] = 404;
        }
    }

    public function filemanagerfolderDownload($id){
        $this->treeArr_data = array();
        $this->_db->where('parent_id',$id);
        $data = $this->_db->get('tms_filemanager');    
        $dataArr = $this->_db->get('tms_filemanager');    
        $i = 0;
        $data['countchild']=0;
        $data['childfile'] = [];   
        $this->treeArr_data = self::buildTreePath($dataArr,$id);
        $data = self::buildTreearraydata_new($dataArr,$id,$dataArr,$id);
                
        foreach($data as $data1){
            $data[$i]['countchild'] = 0;
            $data[$i]['childfile'] = [];
            if($data1['ext'] == ''){
                //$data[$i]['childfile'] = self::buildTreearraydata($dataArr,$data[$i]['fmanager_id']);
                //$data[$i]['childfile'] = self::buildTreearraydata_new($dataArr,$data[$i]['fmanager_id'],$dataArr,$data[$i]['fmanager_id']);
                //echo "<pre>";
                //print_r($data);
            }

            $i++;
        }
        return $data;
    }

    // temp remove
    public function buildTreeD2_(array $elements, $parentId = 0, $itemId=0) {
        $branch = array();
        foreach ($elements as $element) {
            //if($element['parent_id'] == $parentId)
            $this->_db->where('fmanager_id',$parentId);
            $fmanagerData = $this->_db->getOne('tms_filemanager');
            if ($element['fmanager_id'] == $parentId  ) {
            //if ($element['parent_id'] == $parentId || $element['fmanager_id'] == $parentId  ) {
                $this->_db->where('fmanager_id',$parentId);
                $fmanagerData = $this->_db->getOne('tms_filemanager');
                $parentId = $element['parent_id'];
                $children = Self::buildTree($elements, $parentId);
                $branch[] = $element;
                if($element['item_id'] == $itemId){
                    return $branch;
                }
            }
        }
        return $branch;
    }
    public function buildTreeD2(array $elements, $parentId = 0, $itemId = 0) {
        $branch = array();
        foreach ($elements as $element) {
            // Check if current element matches the parentId
            if ($element['fmanager_id'] == $parentId) {
                // Recursively build the tree for children elements
                $children = Self::buildTreeD2($elements, $element['parent_id'], $itemId);
                $element['children'] = $children; // Add children to the current element
                $branch[] = $element;
                
                // If the current element matches the itemId, return the branch
                if ($element['item_id'] == $itemId) {
                    return $branch;
                }
            }
        }
        return $branch;
    }
    

    public function filemanagerScoopPath($itemId, $parentId) {
        $scoopArray = array();
    
        // Fetch the fmanager data for the given itemId
        // $this->_db->where('item_id', $itemId);
        // $fmanagerIdTest = $this->_db->getOne('tms_filemanager');   
        $this->_db->where('fmanager_id',$itemId);
        $fmanagerData = $this->_db->getOne('tms_filemanager'); 
    
        // Fetch all data related to the parent and order it by fmanager_id
        $this->_db->orderBy('fmanager_id', 'DESC');
        $allData = $this->_db->get('tms_filemanager');
        
        // Build the tree structure if we have a matching fmanager record
        if ($fmanagerData) {
            $scoopArray = self::buildTreeD2($allData, $parentId, $itemId);
        }
    
        return $scoopArray;
    }
    
    // alternate
    public function filemanagerScoopPath_($itemId, $parentId){
        //print_r($parentId);
        $scoopArray = array();
        $this->_db->where('item_id',$itemId);
        $fmanagerIdTest = $this->_db->getOne('tms_filemanager');    

        $this->_db->where('fmanager_id',$itemId);
        $fmanagerData = $this->_db->getOne('tms_filemanager');
        
        $this->_db->orderBy('fmanager_id','DESC');
        $allData = $this->_db->get('tms_filemanager');
        //$dataArr = $this->_db->get('tms_filemanager');    
        if($fmanagerData){
            $scoopArray = self::buildTreeD2($allData, $parentId, $itemId);
            //array_push($scoopArray, $fmanagerData);
        }
        //print_r($scoopArray);
        return $scoopArray;
    }

    public function getFilestotal($id){
        $this->treeArr_data = array();
        $this->_db->where('item_id',$id);
        $fmanagerId = $this->_db->getOne('tms_filemanager');    

        $dataArr = $this->_db->get('tms_filemanager');    
        $data[0]['totalfile'] = 0;   
        if($fmanagerId){
            $this->treeArr_data = self::buildTreePath($dataArr,$fmanagerId['fmanager_id']);
            $data[0]['totalfile'] = $this->treeArr_data ? count($this->treeArr_data) : 0;   
        }
        return $data;
    }

    public function getScoopFilestotal___($id){
        $this->treeArr_data_count = array();
        $this->_db->where('item_id',$id);
        $fmanagerId = $this->_db->getOne('tms_filemanager');    

        $dataArr = $this->_db->get('tms_filemanager');    
        $data = [];   
        //$data[0]['totalfile'] = 0;   
        if($fmanagerId){
            $this->treeArr_data_count = self::buildTreePathForFielsCount($dataArr,$fmanagerId['fmanager_id']);
            $count = 0;
            if (is_array($this->treeArr_data_count)) {
                foreach ($this->treeArr_data_count as $item) {
                    if (isset($item['f_id']) && $item['f_id'] > 0) {
                        $count++;
                    }
                }
            }
            $data[0]['totalfile'] = $count;
            //$data[0]['totalfile'] = $this->treeArr_data_count ? count($this->treeArr_data_count) : 0;   
        }
        return $data;
    }
    public function getScoopFilesTotal($id) {
        $this->treeArr_data_count = array();
    
        // Fetch the initial fmanager record for the given item_id
        $this->_db->where('item_id', $id);
        $fmanagerId = $this->_db->getOne('tms_filemanager');
        
        $count = 0;
        
        if ($fmanagerId) {
            // Use a recursive SQL query to fetch all the related records (children)
            $sql = "WITH RECURSIVE file_hierarchy AS (
                        SELECT fmanager_id, parent_id, item_id, f_id
                        FROM tms_filemanager
                        WHERE fmanager_id = ?
                        
                        UNION ALL
    
                        SELECT fm.fmanager_id, fm.parent_id, fm.item_id, fm.f_id
                        FROM tms_filemanager fm
                        INNER JOIN file_hierarchy fh ON fm.parent_id = fh.fmanager_id
                    )
                    SELECT * FROM file_hierarchy";
            
            if (defined('STATIC_SERVER_NAME') && STATIC_SERVER_NAME && STATIC_SERVER_NAME == 'kanhasoft') {
                $dataArr = $this->_db->get('tms_filemanager');
                $data = []; 
                $this->treeArr_data_count = self::buildTreePathForFielsCount($dataArr,$fmanagerId['fmanager_id']);
                if (is_array($this->treeArr_data_count)) {
                    foreach ($this->treeArr_data_count as $item) {
                        if (isset($item['f_id']) && $item['f_id'] > 0) {
                            $count++;
                        }
                    }
                }

            }else{
                $dataArr = $this->_db->rawQuery($sql, array($fmanagerId['fmanager_id']));
                // Count the number of files (f_id)
                foreach ($dataArr as $item) {
                    if (isset($item['f_id']) && $item['f_id'] > 0) {
                        $count++;
                    }
                }
            }
    
            // Store the total count of files
            $data[0]['totalfile'] = $count;
        } else {
            $data[0]['totalfile'] = 0;
        }
    
        return $data;
    }
    

    public function getfolderByjobid($jonid) {
        $data = self::filegetByjobId($jonid);
        return $data;
    }

    public function formatSizeUnits($bytes) {
        if ($bytes >= 1073741824) {
            $bytes = number_format($bytes / 1073741824, 2) . ' GB';
        } elseif ($bytes >= 1048576) {
            $bytes = number_format($bytes / 1048576, 2) . ' MB';
        } elseif ($bytes >= 1024) {
            $bytes = number_format($bytes / 1024, 2) . ' KB';
        } elseif ($bytes > 1) {
            $bytes = $bytes . ' bytes';
        } elseif ($bytes == 1) {
            $bytes = $bytes . ' byte';
        } else {
            $bytes = '0 bytes';
        }
    
        return $bytes;
    }
    public function checkFileExist($output_dir, $fileNameToCheck, $extensionName){
        $newFileName = $fileNameToCheck;
        $fileCount = 1;
        while (file_exists($output_dir. $newFileName)) {
            $fileInfo = pathinfo($fileNameToCheck);
            $newFileName = $fileInfo['filename'] . " ($fileCount)." . $extensionName;
            $fileCount++;
        }
        return $newFileName;
    }
    public function sanitizeFileName($fileName) {
        // Extract the file extension
        $extension = pathinfo($fileName, PATHINFO_EXTENSION);
        
        // Remove the extension from the file name
        $fileNameWithoutExtension = pathinfo($fileName, PATHINFO_FILENAME);
        
        // Replace special characters with underscores
        $sanitizedFileName = preg_replace('/[^\w\-\.]/', '_', $fileNameWithoutExtension);
        
        // Concatenate the sanitized file name with the extension
        $sanitizedFileName = $sanitizedFileName . '.' . $extension;
        
        return $sanitizedFileName;
    }
    public function saveFileupload_____($data) {
        $output_dir = UPLOADS_ROOT."fileupload/";
        if (isset($_FILES["myfile"])) {
            $ret = array();
            $error = $_FILES["myfile"]["error"]; {
                if (!is_array($_FILES["myfile"]['name'])) //single file
                {
                    $originalFilename = $_FILES['myfile']['name'];
                    $defaultFileName = self::sanitizeFileName($_FILES['myfile']['name']);
                    
                    $extensionName = pathinfo($defaultFileName, PATHINFO_EXTENSION);
                    $fname = self::checkFileExist($output_dir, $defaultFileName, $extensionName);
                    $filename = $fname ? $fname : $defaultFileName;
                    //$ex = str_replace(' ', '_', $_FILES["myfile"]["name"]);
                    //$filename = rand(0, 1000) . '_' . $ex;
                    move_uploaded_file($_FILES["myfile"]["tmp_name"], $output_dir . $filename);
                    //echo "<br> Error: ".$_FILES["myfile"]["error"];
        
                    //$ret[$fileName]= $output_dir.$fileName;
                    $checkext = explode('.', $filename);
                    $ret['ext'] = strtolower(end($checkext));
                    $size = $_FILES['myfile']['size'];
                    $ret['size'] = self::formatSizeUnits($size);
                    $ret['name'] = $filename;
                    $ret['original_filename'] = $originalFilename;
                } else {
                    $fileCount = count($_FILES["myfile"]['name']);
                    for ($i = 0; $i < $fileCount; $i++) {
                        //$fileName = $_FILES["myfile"]["name"][$i];
                        //$ret[$fileName]= $output_dir.$fileName;
                        $defaultFileName = $_FILES['myfile']['name'][$i];
                        $extensionName = pathinfo($defaultFileName, PATHINFO_EXTENSION);
                        $fname = self::checkFileExist($output_dir, $defaultFileName, $extensionName);
                        $filename = $fname ? $fname : $defaultFileName;
                        //$ex = str_replace(' ', '_', $_FILES["myfile"]["name"][$i]);
                        //$filename = rand(0, 1000) . '_' . $ex;
        
                        move_uploaded_file($_FILES["myfile"]["tmp_name"][$i], $output_dir . $filename);
        
                        $checkext = explode('.', $filename);
        
                        $ret['ext'][$i] = strtolower(end($checkext));
                        $size = $_FILES['myfile']['size'][$i];
                        $ret['size'][$i] = self::formatSizeUnits($size);
                        $ret['name'][$i] = $filename;
                    }
                }
            }
            //echo json_encode($ret);
            $return = json_encode($ret);
        }else{
            $return = json_encode([]);
        }

        return $return;
        
    }

    public function saveFileupload($data) {
        $output_dir = UPLOADS_ROOT."fileupload/";
        $currentDate = date('Y-m-d');
        $year = date('Y');        // Format: YYYY
        $month = date('m');       // Format: MM
        $fullDate = date('Y-m-d'); // Format: YYYY-MM-DD
        $path______ = $year . '/' . $month . '/' . $fullDate . '/';
        $randomString = bin2hex(random_bytes(4));
        $awsFile = new awsFileupload();
                    
        if (isset($_FILES["myfile"])) {
            $ret = [];
            $error = $_FILES["myfile"]["error"]; {
                if (!is_array($_FILES["myfile"]['name'])) //single file
                {
                    $originalFilename = $_FILES['myfile']['name'];
                    $defaultFileName = self::sanitizeFileName($_FILES['myfile']['name']);
                    $extensionName = pathinfo($originalFilename, PATHINFO_EXTENSION);
                    $filename = $defaultFileName;
                    $filenameWithoutExtension = pathinfo($defaultFileName, PATHINFO_FILENAME);
                    //move_uploaded_file($_FILES["myfile"]["tmp_name"][$i], $output_dir . $filename);
                    $timestamp = time();
                    $filename = $filenameWithoutExtension.'_'.$timestamp.'.' .$extensionName;
                    
                    $fileTempName = $_FILES["myfile"]["tmp_name"];
                    //$originalFileName = basename( $_FILES['myfile']['name'] );
                    //$extension = pathinfo($originalFileName, PATHINFO_EXTENSION);
                    //$keyNameTimestamp = $currentDate . '/' . $filename . '.' . $extension;
                    // current date folder
                    $keyNameTimestamp = $currentDate . '/' . $filename ;
                    $keyName = $keyNameTimestamp;
                    
                    $awsResult = $awsFile->awsFileUpload($fileTempName, $keyName );

                    $checkext = explode('.', $filename);
                    //$ret['ext'] = strtolower(end($checkext));
                    $ret['ext'] = strtolower($extensionName);
                    $size = $_FILES['myfile']['size'];
                    $ret['size'] = self::formatSizeUnits($size);
                    $ret['name'] = $awsResult['file_url'];
                    //$ret['name'] = $filename;
                    $ret['original_filename'] = $originalFilename;
                    $ret['is_s3bucket'] = 1;
                } else {
                    $fileCount = count($_FILES["myfile"]['name']);
                    for ($i = 0; $i < $fileCount; $i++) {
                        //$fileName = $_FILES["myfile"]["name"][$i];
                        //$ret[$fileName]= $output_dir.$fileName;
                        $defaultFileName = $_FILES['myfile']['name'][$i];
                        $extensionName = pathinfo($defaultFileName, PATHINFO_EXTENSION);
                        $filenameWithoutExtension = pathinfo($defaultFileName, PATHINFO_FILENAME);
                        
                        //move_uploaded_file($_FILES["myfile"]["tmp_name"][$i], $output_dir . $filename);
                        $timestamp = time();
                        $filename = $filenameWithoutExtension.'_'.$timestamp.'.'.$extensionName;
                        $fileTempName = $_FILES["myfile"]["tmp_name"][$i];
                        //$originalFileName = basename( $_FILES['myfile']['name'][$i] );
                        $originalFileName = $defaultFileName;
                        //$extension = pathinfo($originalFileName, PATHINFO_EXTENSION);
                        //$keyNameTimestamp = $currentDate . '/' . $filename . '.' . $extension;
                        // current date folder
                        $keyNameTimestamp = $currentDate . '/' . $filename ;
                        $keyName = $keyNameTimestamp;
                        
                        $awsResult = $awsFile->awsFileUpload($fileTempName, $keyName );
        
                        $checkext = explode('.', $filename);
        
                        //$ret['ext'][$i] = strtolower(end($checkext));
                        $ret['ext'] = strtolower($extensionName);
                        $size = $_FILES['myfile']['size'][$i];
                        $ret['size'][$i] = self::formatSizeUnits($size);
                        //$ret['name'][$i] = $filename;
                        $ret['name'] = $awsResult['file_url'];
                        $ret['original_filename'] = $originalFileName;
                        $ret['is_s3bucket'] = 1;
                    }
                }
            }
            //echo json_encode($ret);
            $return = json_encode($ret);
        }else{
            $return = json_encode([]);
        }

        return $return;
        
    }

    public function saveFileuploadAWS($data) {
        $output_dir = UPLOADS_ROOT."fileupload/";
        //$currentDate = date('Y-m-d');
        $currentDate = date('Y/m'). '/' . date('Y-m-d');
        $awsFile = new awsFileupload();
                    
        if (isset($_FILES["myfile"])) {
            $ret = [];
            $error = $_FILES["myfile"]["error"]; {
                if (!is_array($_FILES["myfile"]['name'])) //single file
                {
                    $originalFilename = $_FILES['myfile']['name'];
                    $defaultFileName = self::sanitizeFileName($_FILES['myfile']['name']);
                    $extensionName = pathinfo($originalFilename, PATHINFO_EXTENSION);
                    $filename = $defaultFileName;
                    $filenameWithoutExtension = pathinfo($defaultFileName, PATHINFO_FILENAME);
                    //move_uploaded_file($_FILES["myfile"]["tmp_name"][$i], $output_dir . $filename);
                    $timestamp = time();
                    $filename = $filenameWithoutExtension.'_'.$timestamp.'.' .$extensionName;
                    
                    $fileTempName = $_FILES["myfile"]["tmp_name"];
                    //$originalFileName = basename( $_FILES['myfile']['name'] );
                    //$extension = pathinfo($originalFileName, PATHINFO_EXTENSION);
                    //$keyNameTimestamp = $currentDate . '/' . $filename . '.' . $extension;
                    // current date folder
                    $keyNameTimestamp = $currentDate . '/' . $filename ;
                    $keyName = $keyNameTimestamp;
                    
                    $awsResult = $awsFile->awsFileUpload($fileTempName, $keyName );

                    $checkext = explode('.', $filename);
                    //$ret['ext'] = strtolower(end($checkext));
                    $ret['ext'] = strtolower($extensionName);
                    $size = $_FILES['myfile']['size'];
                    $ret['size'] = self::formatSizeUnits($size);
                    $ret['name'] = $awsResult['file_url'];
                    //$ret['name'] = $filename;
                    $ret['original_filename'] = $originalFilename;
                    $ret['is_s3bucket'] = 1;
                } else {
                    $fileCount = count($_FILES["myfile"]['name']);
                    for ($i = 0; $i < $fileCount; $i++) {
                        //$fileName = $_FILES["myfile"]["name"][$i];
                        //$ret[$fileName]= $output_dir.$fileName;
                        $defaultFileName = $_FILES['myfile']['name'][$i];
                        $extensionName = pathinfo($defaultFileName, PATHINFO_EXTENSION);
                        $filenameWithoutExtension = pathinfo($defaultFileName, PATHINFO_FILENAME);
                        
                        //move_uploaded_file($_FILES["myfile"]["tmp_name"][$i], $output_dir . $filename);
                        $timestamp = time();
                        $filename = $filenameWithoutExtension.'_'.$timestamp.'.'.$extensionName;
                        $fileTempName = $_FILES["myfile"]["tmp_name"][$i];
                        //$originalFileName = basename( $_FILES['myfile']['name'][$i] );
                        $originalFileName = $defaultFileName;
                        //$extension = pathinfo($originalFileName, PATHINFO_EXTENSION);
                        //$keyNameTimestamp = $currentDate . '/' . $filename . '.' . $extension;
                        // current date folder
                        $keyNameTimestamp = $currentDate . '/' . $filename ;
                        $keyName = $keyNameTimestamp;
                        
                        $awsResult = $awsFile->awsFileUpload($fileTempName, $keyName );
        
                        $checkext = explode('.', $filename);
        
                        //$ret['ext'][$i] = strtolower(end($checkext));
                        $ret['ext'] = strtolower($extensionName);
                        $size = $_FILES['myfile']['size'][$i];
                        $ret['size'][$i] = self::formatSizeUnits($size);
                        //$ret['name'][$i] = $filename;
                        $ret['name'] = $awsResult['file_url'];
                        $ret['original_filename'] = $originalFileName;
                        $ret['is_s3bucket'] = 1;
                    }
                }
            }
            //echo json_encode($ret);
            $return = json_encode($ret);
        }else{
            $return = json_encode([]);
        }

        return $return;
        
    }

    public function saveFileuploadAWS_db($data) {
        $output_dir = UPLOADS_ROOT . "fileupload/";
        $currentDate = date('Y/m') . '/' . date('Y-m-d');
        $awsFile = new awsFileupload();
        $response = ['status' => 422, 'msg' => 'File not uploaded'];
        $insertedData = [];
        $originalFilename = '';
        if (isset($_FILES["myfile"])) {
            $isMultiple = is_array($_FILES["myfile"]['name']);
            $fileCount = $isMultiple ? count($_FILES["myfile"]['name']) : 1;
            $uploadedFiles = [];
    
            for ($i = 0; $i < $fileCount; $i++) {

                $originalFilename = $isMultiple ? $_FILES['myfile']['name'][$i] : $_FILES['myfile']['name'];
                $fileTempName = $isMultiple ? $_FILES['myfile']['tmp_name'][$i] : $_FILES['myfile']['tmp_name'];
                $fileSize = $isMultiple ? $_FILES['myfile']['size'][$i] : $_FILES['myfile']['size'];
                $error = $isMultiple ? $_FILES['myfile']['error'][$i] : $_FILES['myfile']['error'];
    
                if ($error !== UPLOAD_ERR_OK) {
                    $response['msg'] = "Error uploading file: $originalFilename";
                    continue;
                }
    
                // Generate sanitized file name with timestamp
                $defaultFileName = self::sanitizeFileName($originalFilename);
                $extensionName = strtolower(pathinfo($defaultFileName, PATHINFO_EXTENSION));
                $filenameWithoutExtension = pathinfo($defaultFileName, PATHINFO_FILENAME);
                $timestamp = time();
                $filename = $filenameWithoutExtension . '_' . $timestamp . '.' . $extensionName;
                $keyName = $currentDate . '/' . $filename;
    
                // Upload file to AWS
                $awsResult = $awsFile->awsFileUpload($fileTempName, $keyName);
                if (!$awsResult || !isset($awsResult['file_url'])) {
                    $response['msg'] = "Failed to upload file to AWS: $originalFilename";
                    continue;
                }
    
                // Format file size
                $formattedSize = self::formatSizeUnits($fileSize);
                
                $postData = $_POST;
                $insertData = [
                    'ext' => $extensionName,
                    'size' => $formattedSize,
                    'name' => $awsResult['file_url'],
                    'original_filename' => $originalFilename,
                    'is_s3bucket' => 1,
                    'role_id' => $postData['role_id'] ?? null,
                    'f_id' => $postData['f_id'] ?? null,
                    'f_scoop_id' => $postData['f_scoop_id'] ?? 0,
                    'parent_id' => $postData['parent_id'] ?? null,
                    'updated_date' => date('Y-m-d H:i:s'),
                    'created_date' => date('Y-m-d H:i:s')
                ];
    
                // Insert into database
                $insertId = $this->_db->insert('tms_filemanager', $insertData);
                if ($insertId) {
                    $this->_db->where('fmanager_id',$insertId);
                    $insertedData = $this->_db->getOne('tms_filemanager');
                    $insertedData['category'] = [];
                    $insertedData['countChild'] = 0;

                    $uploadedFiles[] = [
                        'status' => 200,
                        'ext' => $extensionName,
                        'size' => $formattedSize,
                        'name' => $awsResult['file_url'],
                        'original_filename' => $originalFilename
                    ];
                } else {
                    $response['msg'] = "Failed to save file data in DB: $originalFilename";
                }
            }
    
            // Prepare response
            if (!empty($uploadedFiles)) {
                $response = [
                    'status' => 200,
                    'msg' => 'Files uploaded successfully',
                    'original_filename' => $originalFilename,
                    'files' => $uploadedFiles,
                    'insertedData' => $insertedData
                ];
            }
        }
    
        return $response;
    }
    
    public function downloadSingleFile($fileData) {
        $basePath = realpath(DOCUMENT_ROOT . 'uploads/fileupload') . DIRECTORY_SEPARATOR;
    
        if (isset($_GET['filename'])) {
            $file = basename($_GET['filename']);
            $fileDownloadName = isset($_GET['fileDownloadName']) ? basename($_GET['fileDownloadName']) : $file;
            $isS3bucketUrl = isset($_GET['is_s3bucketUrl']) && $_GET['is_s3bucketUrl'] == 1;
            $fileBasePath = $isS3bucketUrl ? '' : $basePath;
            $filePath = $fileBasePath . $file;
    
            if ($isS3bucketUrl) {
                $awsFileName = $_GET['filename'];

                try {
                    // Open the file for reading
                    $handle = fopen($awsFileName, 'rb');
                    if ($handle === false) {
                        throw new Exception('Failed to open file for reading.');
                    }
                
                    // Get headers
                    $headers = get_headers($awsFileName, 1);
                    $contentType = isset($headers['Content-Type']) ? $headers['Content-Type'] : 'application/octet-stream';
                    $contentLength = isset($headers['Content-Length']) ? $headers['Content-Length'] : filesize($awsFileName);
                
                    // Clear output buffering
                    if (ob_get_level()) {
                        ob_end_clean();
                    }
                
                    // Set headers
                    header('Content-Description: File Transfer');
                    header('Content-Type: ' . $contentType);
                    header('Content-Disposition: attachment; filename="' . $fileDownloadName . '"');
                    header('Expires: 0');
                    header('Cache-Control: must-revalidate');
                    header('Pragma: public');
                    header('Content-Length: ' . $contentLength);
                
                    // Output the file directly to the browser
                    fpassthru($handle);
                    fclose($handle);
                    exit;
                
                } catch (Exception $e) {
                    if (ob_get_level()) {
                        ob_end_clean();
                    }
                    header('Content-Type: application/json');
                    http_response_code(500);
                    echo json_encode(['error' => $e->getMessage()]);
                    exit;
                }

            } else {
                // Handle local file download
                $realFilePath = realpath($filePath);
    
                if ($realFilePath && strpos($realFilePath, $basePath) === 0 && file_exists($realFilePath)) {
                    $fileMimeType = mime_content_type($realFilePath) ?: 'application/octet-stream';
    
                    header('Content-Description: File Transfer');
                    header('Content-Type: ' . $fileMimeType);
                    header('Content-Disposition: attachment; filename="' . $fileDownloadName . '"');
                    header('Expires: 0');
                    header('Cache-Control: must-revalidate');
                    header('Pragma: public');
                    header('Content-Length: ' . filesize($realFilePath));
    
                    ob_end_clean();
                    readfile($realFilePath);
                    exit;
                } else {
                    // Return a 404 error if the file doesn't exist or access is denied
                    header('Content-Type: application/json');
                    http_response_code(404);
                    echo json_encode(['error' => 'File not found or access denied.']);
                    exit;
                }
            }
        } else {
            // Return a 400 error if no filename is provided
            header('Content-Type: application/json');
            http_response_code(400);
            echo json_encode(['error' => 'Filename not provided.']);
            exit;
        }
    }


    public function downloadFilesZip($fileData) {
        $basePath = realpath(DOCUMENT_ROOT . 'uploads/fileupload') . DIRECTORY_SEPARATOR;
    
        
    }
    

    public function getAWSImageMigrate() {
        // Fetch records without AWS path
        $folderName = 'aug_'.time().'/';
        $getNoramalImages = $this->_db->rawQuery("SELECT * FROM `tms_filemanager` WHERE `is_s3bucket` = 0 AND f_id = 1  limit 50 ");
        $awsFile = new awsFileupload();
        foreach ($getNoramalImages as $file) {
            //$filePath = 'http://tms.kanhasoftdev.com/uploads/fileupload/' . $file['name'];
            $filePath = UPLOADS_ROOT_NEW. 'fileupload/' . $file['name'];
            if (file_exists($filePath)) {
                //$currentDate = date('Y-m-d');
                $filenameWithoutExtension = pathinfo($file['name'], PATHINFO_FILENAME);
                $timestamp = time().mt_rand();
                $extensionName = pathinfo($file['name'], PATHINFO_EXTENSION);
                $filename = $filenameWithoutExtension.'_'.$timestamp.'.' .$extensionName;
                $keyNameTimestamp = '2024/06/'.$folderName . $filename ;
                $keyName = $keyNameTimestamp;
                $awsResult = $awsFile->awsFileUploadAnother($filePath, $keyName , $file['name']);
                
                if(isset($awsResult) && !empty($awsResult)){
                    $query = "UPDATE tms_filemanager SET name = ?, is_s3bucket = 1 WHERE fmanager_id = ?";
                    $params = [
                        $awsResult['file_url'],
                        $file['fmanager_id']
                    ];
                    $upodateCode = $this->_db->rawQuery($query, $params);
                    $this->_db->insert('tms_temp_filemanager',$file);
                }
            }
        }
    }

    public function tempFIleListApi() {

        $awsFile = new awsFileupload();
        $test = $awsFile->tempAwsFilelist('Anil');
        
        $getNoramalImages = $this->_db->rawQuery("SELECT name FROM `tms_filemanager` WHERE DATE(created_date) = '2024-11-22' AND is_s3bucket = 1 ");
        $tempdbArr = [];
        foreach($getNoramalImages as  $val){
            $tempdbArr[] = $val['name'];
        }
        
        $newtemp = array_diff($test, $tempdbArr);
        print_r($newtemp);

        return true;
    }

}
