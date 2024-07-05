<?php

//require_once __DIR__ . '/mpdf/vendor/autoload.php';
require_once 'mpdf/vendor/autoload.php';

class mpdf
{

    protected $_db;
    protected $_mpdf;

    public function __construct()
    {
        // $this->_db = db::getInstance();
        //$this->_db = new db(DB_SERVER, DB_USERNAME, DB_PASSWORD, DB_DATABASE);

        $this->_mpdf = new \Mpdf\Mpdf([
            'setAutoTopMargin' => 'stretch',
            'setAutoBottomMargin' => 'stretch',
            'autoMarginPadding' => 10
        ]);
        // $this->_mpdfException = new Mpdf\MpdfException();
    }

    public function downloadPDF($htmlContent)
    {
        try {
            //$htmlstring = addslashes($htmlContent);
            $pdfHeader = $htmlContent && isset($htmlContent['pdfHeader']) ? $htmlContent['pdfHeader'] : '';
            $pdfFooter = $htmlContent && isset($htmlContent['pdfFooter']) ? $htmlContent['pdfFooter'] : '';
            $pdfContent = $htmlContent && isset($htmlContent['pdfContent']) ? $htmlContent['pdfContent'] : '';
            $pdfFileName = $htmlContent && isset($htmlContent['pdfFileName']) ? $htmlContent['pdfFileName'] : time() . '-file.pdf';
            $base64Content = isset($htmlContent['base64Content']) && $htmlContent['base64Content'] === true ? true : false;

            if (!preg_match('/<html>/i', $pdfFooter)) {
                $pdfContent = "<html><head><meta charset='UTF-8'></head><body>{$pdfContent} </body></html>";
                //$htmlContent = "<html><head><meta charset='UTF-8'></head><body>{$htmlContent}</body></html>";
            }

            // Set header and footer
            if ($pdfHeader && $pdfHeader != '')
                $this->_mpdf->SetHTMLHeader($pdfHeader);
            if ($pdfFooter && $pdfFooter != '')
                $this->_mpdf->SetHTMLFooter($pdfFooter);

            $this->_mpdf->WriteHTML($pdfContent);

            if ($base64Content === true) {
                // save and download at frontend
                $pdfContent = $this->_mpdf->Output('', 'S');
                // Convert PDF binary data to base64-encoded string
                $pdfBase64 = base64_encode($pdfContent);
                $return = $pdfBase64;
            } else {
                $filePath = UPLOADS_ROOT . 'tempfile/' . $pdfFileName;
                // save file in folder
                $this->_mpdf->Output($filePath, 'F');
                $return = true;
            }
        } catch (\Mpdf\MpdfException $e) {
            //echo 'An error occurred: ' . $e->getMessage();
            $return = false;
        } catch (\Exception $e) {
            //echo 'An unexpected error occurred: ' . $e->getMessage();
            $return = false;
        }
        return $return;
    }

}

?>