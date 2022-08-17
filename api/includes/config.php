<?php
define('SITE_URL', "http://" . $_SERVER['SERVER_NAME'] . "/");
define('DOCUMENT_ROOT', $_SERVER['DOCUMENT_ROOT'] . "/");
define('UPLOADS_ROOT', DOCUMENT_ROOT . "uploads/");

//db constants
define('DB_SERVER', 'localhost'); //please enter mysql server name
define('DB_USERNAME', 'root'); // please enter mysql user name
define('DB_PASSWORD', 'kWb24pEBdUj4uKOA'); // please enter mysql user password
define('DB_DATABASE', 'kanhawhp_tms'); // please enter your database name
// smtp mail
//define('SMTP_EMAIL_USER', 'chrisgilesitworks@gmail.com');
//define('SMTP_EMAIL_PASSWORD', 'kanha@tmschris');
define('SMTP_EMAIL_USER', 'tms.kanhasoft@gmail.com');
define('SMTP_EMAIL_PASSWORD', 'yizzlgrzyojjghmy'); // tms@anil567kanha
// mailJET
define('EMAIL_API_KEY', '4d5ded6fff23e16a88fc58f0f6d9667c');
define('EMAIL_SECRETE_KEY', 'b1168bedb467db13e3973f27567b7259');
define('SMTP_FROM_NAME','TMS');
define('SMTP_FROM_EMAIL','tms.kanhasoft@gmail.com');

define('DB_PREFIX', 'tms_');
define('LOGOUT_TIME', 1800);
define('DECIMAL', 2);
define('MIN_COMPONENTS_TO_DISPLAY', 4);
define('TAX_DECIMAL', 5);
define('DATE_FORMAT', "d-m-Y");
define('DEFAULT_CURRENCY', '$');
define('DEFAULT_AREA_UNIT', 'sqmt');
define('FORMATS', "pdf,docx,doc");
define('IMG_FORMATS', "jpg,jpeg,gif,png");
define('DEFAULT_COUNTRY_ID', 'IN');
date_default_timezone_set('Asia/Kolkata');
?>