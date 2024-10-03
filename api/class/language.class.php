<?php
class language {

    public function __construct() {
        $this->_db = db::getInstance();
    }

    public function save($data) {
        $this->_db->where('lang_name',$data['lang_name']);
        $match = $this->_db->getOne('tms_language');
        if($match) {
                $return['status'] = 422;
                $return['msg'] = 'Language  already exists.';
        }else{
            $data['created_date'] = date('Y-m-d H:i:s');
            $data['modified_date'] = date('Y-m-d H:i:s');
            $id = $this->_db->insert('tms_language', $data);
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
        $this->_db->where('lang_name',$data['lang_name']);
        $match = $this->_db->getOne('tms_language');
        if($match && $match['lang_id'] != $id) {
                $return['status'] = 422;
                $return['msg'] = 'Language  already exists.';
        } else {
            $data['modified_date'] = date('Y-m-d H:i:s');
            $this->_db->where('lang_id', $id);
            $id = $this->_db->update('tms_language', $data);
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

    public function getAll() {

        $results = $this->_db->get('tms_language');
        return $results;
    }

    public function delete($id) {
        $this->_db->where('lang_id', $id);
        $id = $this->_db->delete('tms_language');
        if ($id) {
            $return['status'] = 200;
            $return['msg'] = 'Deleted Successfully.';
        } else {
            $return['status'] = 422;
            $return['msg'] = 'Not inserted.';
        }

        return $return;
    }

    public function getTypeById($id) {
        $this->_db->where('lang_id', $id);
        $result = $this->_db->getOne('tms_language');
        return $result;
    }

    public function getActive() {
        $this->_db->where('is_active', 1);
        $result = $this->_db->get('tms_language');
        return $result;
    }
    
    public function activelanguageGet(){
        $result = $this->_db->get('tms_language');
        return $result;
    }

    public function getMemoQLanguage(){
    	$ch = curl_init ("http://memoq.helpmax.net/en/reference-guide/supported-languages/");
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        $page = curl_exec($ch);

        $dom = new DOMDocument();
        libxml_use_internal_errors(true);
        $dom->loadHTML($page);
        libxml_clear_errors();
        $xpath = new DOMXpath($dom);

        $data = array();

        $table_rows = $xpath->query('//table[@id="TOGGLE0186A1"]/tr//table/tr');

        foreach($table_rows as $row) {
            foreach($row->childNodes as $td) {
                if(strlen(trim($td->nodeValue)) != 0){
                    array_push($data,trim($td->nodeValue));
                }
            }
        }

        $firstEleRemove     = array_shift($data);
        $secondEleRemove    = array_shift($data);
        $data = array_chunk($data,2);
        /*$dataOfArray = [];
        foreach ($data as $key => $value) {
            $dataOfArray[$key] = [];
            $dataOfArray[$key]["id"] = $data[$key][1];
            $dataOfArray[$key]["text"] = $data[$key][0];
        }*/
        //$data = $dataOfArray;
        return $data;
    }

    //------------------- Language Translation -----------------//
    public function languagesGetAll() {
        $this->_db->where('is_active','1');
        $results = $this->_db->get('tms_languages');
        return $results;
    }
    public function langsgetOne($id){
        $this->_db->where('lang_id',$id);
        $data = $this->_db->getone('tms_languages');
        return $data;
    }        
    public function langsupdate($id, $data) {
        $this->_db->where('lang_id',$data['lang_id']);
        $match = $this->_db->getOne('tms_languages');
        if($match['lang_id'] != $id) {
                $return['status'] = 422;
                //$return['msg'] = 'Language  already exists.';
                $return['msg'] = 'Not inserted';
        } else {
            if (isset($data['image'])) {
                if(isset($id) && isset($match)){
                    $image = $match['flagImg'];
                    if(isset($match['flagImg']) && $match['flagImg'] ){
                        $path = "../../assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/";
                        $images = glob($path.$image);
                        if(file_exists($path.$image)){
                            unlink($path.$image);
                        }else{
                            $image = $match['flagImg'];  
                        }        
                    }
                }    
                $data['flagImg'] = $this->uploadimage($data);
                unset($data['image']);
            }
            $data['modified_date'] = date('Y-m-d H:i:s');
            $this->_db->where('lang_id', $id);
            $id = $this->_db->update('tms_languages', $data);
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

    public function deletelangs($id) {
        $this->_db->where('lang_id', $id);
        $id = $this->_db->delete('tms_languages');
        if ($id) {
            $return['status'] = 200;
            $return['msg'] = 'Deleted Successfully.';
        } else {
            $return['status'] = 422;
            $return['msg'] = 'Not Deleted.';
        }

        return $return;

    }
    public function languagesave($data) {
        $this->_db->where('name',$data['name']);
        $match = $this->_db->getOne('tms_languages');
        if($match) {
                $return['status'] = 422;
                $return['msg'] = 'Language  already exists.';
        }else{
            if (isset($data['image'])) {
                $data['flagImg'] = $this->uploadimage($data);
                unset($data['image']);
            }
            $uniqueID = $this->generateUniqueIdentifier($data['title'], $data['name']);
            $this->_db->where('id',$uniqueID);
            $matchId = $this->_db->getOne('tms_languages');
            if($matchId) {
                $uniqueID = $this->generateUniqueIdentifier($this->getLletter().$data['title'], $this->getCLetter().$data['name']);
            }
            $data['id'] = $uniqueID;
            //$data['is_active'] = 1;
            $data['flagTitle'] = $data['title'];
            $data['created_date'] = date('Y-m-d H:i:s');
            $data['modified_date'] = date('Y-m-d H:i:s');
            $id = $this->_db->insert('tms_languages', $data);
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

    public function languagesGetAllPage() {
        
        $perPage = isset($_GET['perPage']) ? intval($_GET['perPage']) : 10;
        $currentPage = isset($_GET['page']) ? intval($_GET['page']) : 1;
        $offset = ($currentPage - 1) * $perPage;
        
        $search = isset($_GET['search']) ? $_GET['search'] : '';
        $whereCond = '';
        if($search != ''){
            $whereCond = " where title LIKE '%$search%' ";
            $currentPage = 0;
        }
        $qry = "SELECT * from tms_languages $whereCond  ";
        $tCount = $this->_db->rawQuery($qry);
        $totalCount = count($tCount);

        $totalPages = ceil($totalCount / $perPage);
        
        $qry = "SELECT * from tms_languages $whereCond limit $perPage offset $offset ";
        $results = $this->_db->rawQuery($qry);
        
        // Prepare response
        $results = array(
            'totalItems' => $totalCount,
            'totalPages' => $totalPages,
            'currentPage' => $currentPage,
            'data' => $results
        );

        return $results;
    }
    
    public static function getBytesFromHexString($hexdata) {
        for ($count = 0; $count < strlen($hexdata); $count+=2)
            $bytes[] = chr(hexdec(substr($hexdata, $count, 2)));
            return implode($bytes); 
    }

    public static function getImageMimeType($imagedata,$FileType) {
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

    public function uploadImage($data) {
        // Split the image data to extract the base64 string
        $result = explode(',', $data['image']);
        $getFileType = explode(';', explode(':', $result[0])[1]);
        $finalString = base64_decode($result[1]);
    
        // Determine the MIME type
        $mimeType = self::getImageMimeType($finalString, $getFileType[0]);
        if ($mimeType === 'jpeg') {
            $mimeType = 'jpg';
        }
    
        $originalTitle = preg_replace('/[^a-zA-Z0-9_]/', '_', $data['title']); // Sanitize the title
        $timestamp = time();
        $filename = $originalTitle . "_" . $timestamp . "." . $mimeType;
    
        // Correct the output file path
        $outputFile = DOCUMENT_ROOT . "/assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/" . $filename;
    
        // Ensure the directory exists
        if (!file_exists(dirname($outputFile))) {
            mkdir(dirname($outputFile), 0755, true);
        }
    
        // Attempt to write the file
        $ifp = fopen($outputFile, "wb");
        if ($ifp) {
            fwrite($ifp, $finalString);
            fclose($ifp);
            return $filename;
        } else {
            //throw new Exception("Failed to open stream: Unable to create file at " . $outputFile);
            return '';
        }
    }
    

    public function uploadimage__($data) {
        $result = explode(',', $data['image']);
        $getFileType = explode(';',explode(':',$result[0])[1]);
        $finalstring = base64_decode($result[1]);

        $mimetype = self::getImageMimeType($finalstring,$getFileType[0]);
        if($mimetype == 'jpeg'){
            $mimetype = 'jpg';
        }
        $filename = $data['title']. "." . $mimetype;
        $output_file = $_SERVER['DOCUMENT_ROOT'] . "assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/" . $filename;
        $ifp = fopen($output_file, "wb");
        fwrite($ifp, $finalstring);
        fclose($ifp);
        return $filename;
    }

    public function generateUniqueIdentifier($title, $name) {
        $formattedTitle = strtolower(trim($title));
        $formattedName = strtolower(trim($name));
        $titlePart = substr($formattedTitle, 0, 3);
        $namePart = substr($formattedName, 0, 3);
        $namePart = strtoupper($namePart);
        $uniqueIdentifier = $titlePart . '_' . $namePart;
    
        return $uniqueIdentifier;
    }

    public function getLletter() {
        $lowercaseLetters = 'abcdefghijklmnopqrstuvwxyz';
        $randomIndex = rand(0, strlen($lowercaseLetters) - 1);
        return $lowercaseLetters[$randomIndex];
    }

    public function getCLetter() {
        $uppercaseLetters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
        $randomIndex = rand(0, strlen($uppercaseLetters) - 1);
        return $uppercaseLetters[$randomIndex];
    }

    public function languagesGetAllWithStatus() {
        $results = $this->_db->get('tms_languages');
        return $results;
    }

    public function languagesAdminGetAll() {
        //$this->_db->where('is_active','1');
        $this->_db->orderBy('title', 'ASC');
        $results = $this->_db->get('tms_languages');
        return $results;
    }

}
