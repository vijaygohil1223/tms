<?php

require_once 'functions.class.php';
require_once 'mail_format.class.php';

class payment {

    public function __construct() {
        $this->_db = db::getInstance();
    }

    public function save($info) {
        $info['dtCreatedDate'] = date('Y-m-d H:i:s');
        $info['dtUpdatedDate'] = date('Y-m-d H:i:s');
        $id = $this->_db->insert('tms_payment', $info);
        if ($id) {
            $return['status'] = 200;
            $return['msg'] = 'Successfully Inserted.';
        } else {
            $return['status'] = 422;
            $return['msg'] = 'Not Saved.';
        }
        return $return;
    }

    public function getPaymentById($user_id, $type) {
        $this->_db->where('iUserId', $user_id);
        $this->_db->where('iType', $type);
        return $data = $this->_db->getOne('tms_payment');
    }

    public function updatePayment($id, $type, $info) {
        $info['dtUpdatedDate'] = date('Y-m-d H:i:s');
        $this->_db->where('iUserId', $id);
        $this->_db->where('iType', $type);
        $id = $this->_db->update('tms_payment', $info);
        if ($id) {
            $return['status'] = 200;
            $return['msg'] = 'Successfully Updated.';
        } else {
            $return['status'] = 422;
            $return['msg'] = 'Not Saved.';
        }
        return $return;
    }
    public function getuserpaymentdata($id){
    	$this->_db->where('iUserId', $id);
    	$data = $this->_db->getOne('tms_payment');
    	return $data;
    }
    public function getClientpayment($id){
        $this->_db->where('iClientId', $id);
    	$data = $this->_db->getOne('tms_payment');
    	return $data;
    }
    public function paymentdirectUpdate($id, $type, $info) {
    	$info['dtUpdatedDate'] = date('Y-m-d H:i:s');
    	$this->_db->where('iClientId', $id);
    	$this->_db->where('iType', $type);
    	$id = $this->_db->update('tms_payment', $info);
    	if ($id) {
    		$return['status'] = 200;
    		$return['msg'] = 'Successfully Updated.';
    	} else {
    		$return['status'] = 422;
    		$return['msg'] = 'Not Saved.';
    	}
    	return $return;
    }

    public function getVatcount($countryCode, $vat) { //818624212
        $country1 = $countryCode;
        $vatnum1 = $vat;
        if($country1 == 'NO'){     
            // API Key registered with ( tms.kanhasoft@gmail.com / kanha@tmschris )   
            //$apikey = '782c8b15b60cf92ddb97f9e5585c4878';
            $apikey = 'b4853b8d084f1f57470df1aaad4a92e9';
            $endpoint = 'https://api.vatsense.com/1.0/validate?vat_number='.$country1.$vatnum1;
            // init curl
            $ch = curl_init();
            // set curl options
            curl_setopt($ch, CURLOPT_URL, $endpoint);
            curl_setopt($ch, CURLOPT_HTTPHEADER, array('Content-Type: application/json'));
            curl_setopt($ch, CURLOPT_USERPWD, 'user:'.$apikey);
            curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
            curl_setopt($ch, CURLOPT_TIMEOUT, 10);
            
            $response = curl_exec($ch);
            curl_close($ch);
            // print response as json
            header('Content-Type: application/json');
            // print response
            //$return['data'] = json_decode($response);
            $return['From'] = 'norway';
            $return['data'] = json_decode($response);
            return $return;
        }else{    
            // sol - 1
            // $url = 'http://ec.europa.eu/taxation_customs/vies/viesquer.do?ms='.$country1.'&iso='.$country1.'&vat='.$vatnum1.'&name=&companyType=&street1=&postcode=&city=&BtnSubmitVat=Verify';
            // $response2 = file_get_contents($url);
            // sol - 2
            // $api_key = 'ede39f93007b1269f52a8c36c7aa5a00';
            //$url = "http://apilayer.net/api/validate?access_key=13b874bb136eff80a24f5c03888262c9&vat_number=".$country1.$vatnum1."&format=1";
            $url = "http://apilayer.net/api/validate?access_key=13b874bb136eff80a24f5c03888262c9&vat_number=".$country1.$vatnum1."&format=1";

            // $data = file_get_contents($url);
            
            // $data = json_decode($data);

            $curl_handle=curl_init();
            curl_setopt($curl_handle, CURLOPT_URL,$url);
            curl_setopt($curl_handle, CURLOPT_CONNECTTIMEOUT, 2);
            curl_setopt($curl_handle, CURLOPT_RETURNTRANSFER, 1);
            //curl_setopt($curl_handle, CURLOPT_USERAGENT, 'Your application name');
            $data = curl_exec($curl_handle);
            curl_close($curl_handle);


            // sol -3
/*             $timeout = 30;
            $response = array ();
            $pattern = '/<(%s).*?>([\s\S]*)<\/\1/';
            $keys = array ( 'countryCode', 'vatNumber', 'requestDate', 'valid', 'name', 'address' );

            $content = "<s11:Envelope xmlns:s11='http://schemas.xmlsoap.org/soap/envelope/'>
            <s11:Body>
            <tns1:checkVat xmlns:tns1='urn:ec.europa.eu:taxud:vies:services:checkVat:types'>
            <tns1:countryCode>%s</tns1:countryCode>
            <tns1:vatNumber>%s</tns1:vatNumber>
            </tns1:checkVat>
            </s11:Body>
            </s11:Envelope>";
            
            $opts = array (
            'http' => array (
            'method' => 'POST',
            'header' => "Content-Type: text/xml; charset=utf-8; SOAPAction: checkVatService",
            'content' => sprintf ( $content, $countryCode, $vat ),
            'timeout' => $timeout 
            ) 
            );

            $ctx = stream_context_create ( $opts );
            $result = file_get_contents ( 'http://ec.europa.eu/taxation_customs/vies/services/checkVatService', false, $ctx );

            if (preg_match ( sprintf ( $pattern, 'checkVatResponse' ), $result, $matches )) {
            foreach ( $keys as $key )
                preg_match ( sprintf ( $pattern, $key ), $matches [2], $value ) && $response [$key] = $value [2];
            } */
            $return['data'] = $data ? json_decode($data) : '';
            $return['From'] = 'europa';
            return $return;
        }    

    }

    public function getVatcount_old($countryCode, $vat) { //818624212
        $country1 = $countryCode;
        $vatnum1 = $vat;
        if($country1 == 'NO'){
            //$url = 'http://data.brreg.no/enhetsregisteret/enhet/'.$vatnum1;
            $url = 'https://data.brreg.no/enhetsregisteret/enhet/'.$vatnum1.'.json';
            $ch = curl_init($url);
            curl_setopt($ch, CURLOPT_TIMEOUT, 5);
            curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, 5);
            curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
            curl_setopt( $ch, CURLOPT_HTTPHEADER, array('Content-Type:application/json'));
            $data = curl_exec($ch);
            curl_close($ch);
            
            $return['data'] = json_decode($data);
            $return['From'] = 'norway';
            return $return; 
        }else{//26375245

            $url = 'http://ec.europa.eu/taxation_customs/vies/viesquer.do?ms='.$country1.'&iso='.$country1.'&vat='.$vatnum1.'&name=&companyType=&street1=&postcode=&city=&BtnSubmitVat=Verify';
            //$response = file_get_contents($url);
            //echo $response;                 
            $ch = curl_init($url);
            curl_setopt($ch, CURLOPT_TIMEOUT, 5);
            curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, 5);
            curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
            $data = curl_exec($ch);
            curl_close($ch);
            $return['data'] = $data;
            $return['From'] = 'europa';
            return $return;
        }

    }
       
}
