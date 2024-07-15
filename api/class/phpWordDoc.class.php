<?php

//require_once __DIR__ . '/mpdf/vendor/autoload.php';
//require_once __DIR__ . '/PHPWord/bootstrap.php';

//require_once 'mpdf/vendor/autoload.php';
require_once 'PHPWord/bootstrap.php';
use PhpOffice\PhpWord\Settings;

class phpWordDoc
{

    protected $_db;
    protected $_phpWord;

    public function __construct()
    {
        $this->_phpWord = new \PhpOffice\PhpWord\PhpWord();
        $this->_phpWord->addParagraphStyle('Heading2', ['alignment' => 'center']);
        
        // Load PHPWord configurations
        Settings::loadConfig();
        
        // Set PDF renderer if necessary
        $vendorDirPath = __DIR__ . '/vendor';
        $dompdfPath = $vendorDirPath . '/dompdf/dompdf';
        if (file_exists($dompdfPath)) {
            define('DOMPDF_ENABLE_AUTOLOAD', false);
            Settings::setPdfRenderer(Settings::PDF_RENDERER_DOMPDF, $dompdfPath);
        }
        
        // Set writers
        $writers = ['Word2007' => 'docx', 'ODText' => 'odt', 'RTF' => 'rtf', 'HTML' => 'html', 'PDF' => 'pdf'];
        
        // Set PDF renderer
        if (null === Settings::getPdfRendererPath()) {
            $writers['PDF'] = null;
        }
        
        // Turn output escaping on
        Settings::setOutputEscapingEnabled(true);
    }

    public function generateWordDocument($headerHtml, $mainHtml, $outputFilename = 'output_document.docx')
    {
        // Adding a section to the document
        $section = $this->_phpWord->addSection();

        // Add header with HTML content
        $header = $section->addHeader();
        $header->addHtml('<p class="address-title"> <span class="ng-binding">Dosina Translations AS | </span> <span class="ng-binding">Munthes gate 42, </span> <span class="ng-binding">0260 </span> <span class="ng-binding">Oslo, </span>  <span class="ng-binding">Norway</span> </p>');

        // Add HTML content to the main body of the section
        \PhpOffice\PhpWord\Shared\Html::addHtml($section, $mainHtml, false, false);

        // Save file
        $objWriter = \PhpOffice\PhpWord\IOFactory::createWriter($this->_phpWord, 'Word2007');
        $objWriter->save($outputFilename);

        return $outputFilename;
    }

}

?>