<?php
//If directory doesnot exists create it.
$output_dir = "uploads/fileupload/";

if(isset($_FILES["myfile"]))
{
	$ret = array();

	$error =$_FILES["myfile"]["error"];
   {
    
    	if(!is_array($_FILES["myfile"]['name'])) //single file
    	{
          $ex = str_replace(' ','_',$_FILES["myfile"]["name"]);
          $filename = rand(0,1000).'_'.$ex;
       	 	move_uploaded_file($_FILES["myfile"]["tmp_name"],$output_dir. $filename);
       	 	 //echo "<br> Error: ".$_FILES["myfile"]["error"];

	       	 	 //$ret[$fileName]= $output_dir.$fileName;
            $checkext = explode('.', $filename);
            $ret['ext'] = end($checkext);
            $ret['size'] = $_FILES['myfile']['size'];;
           
             $ret['name']= $filename;
    	}
    	else
    	{
    	    $fileCount = count($_FILES["myfile"]['name']);
    		  for($i=0; $i < $fileCount; $i++)
    		  {
    		  	$fileName = $_FILES["myfile"]["name"][$i];
	       	 	 $ret[$fileName]= $output_dir.$fileName;
    		    move_uploaded_file($_FILES["myfile"]["tmp_name"][$i],$output_dir.$fileName );
    		  }
    	
    	}
    }
    echo json_encode($ret);
 
}

?>