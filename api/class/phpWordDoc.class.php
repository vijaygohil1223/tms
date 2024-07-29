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

    public function generateWordDocument($headerHtml, $mainHtml, $htmlFooter, $filePath = '')
    {
        try {
            // Adding a section to the document
            $section = $this->_phpWord->addSection();

            //$header->addHtml('<p class="address-title"> <span class="ng-binding">Dosina Translations AS | </span> <span class="ng-binding">Munthes gate 42, </span> <span class="ng-binding">0260 </span> <span class="ng-binding">Oslo, </span>  <span class="ng-binding">Norway</span> </p>');
            // Add header with HTML content
            //$logourl = DOCUMENT_ROOT . 'assets/img/invoice_logo.png'; // Adjust the URL as per your actual path
            $logourl = SITE_URL.'/assets/img/invoice_logo.png'; 
            
            // Define header HTML with logo aligned to the right
            $headerHtml = '<div style="text-align: right;">';
            $headerHtml .= '<img src="' . $logourl . '" style="height: 50px; width: 200px;" />';
            $headerHtml .= '</div>';

            $header = $section->addHeader();
            \PhpOffice\PhpWord\Shared\Html::addHtml($header, $headerHtml, false, false);

            //$footerHtml = '<p class="address-title"> <span class="ng-binding">Dosina Translations AS | </span> <span class="ng-binding">Munthes gate 42, </span> <span class="ng-binding">0260 </span> <span class="ng-binding">Oslo, </span>  <span class="ng-binding">Norway</span> </p>';
            $footerHtml = $htmlFooter;

            // Add footer with page number and link
            // $footer = $section->addFooter();
            // $footer->addPreserveText('Page {PAGE} of {NUMPAGES}.', null, ['alignment' => \PhpOffice\PhpWord\SimpleType\Jc::CENTER]);
            // $footer->addLink('https://github.com/PHPOffice/PHPWord', 'PHPWord on GitHub');

            // $table = $footer->addTable();
            // $table->addRow();
            // $table->addCell(2000)->addText('Header 1');
            // $table->addCell(2000)->addText('Header 2');
            // $table->addCell(2000)->addText('Header 3');
            // $table->addRow();
            // $table->addCell(2000)->addText('Row 1, Cell 1');
            // $table->addCell(2000)->addText('Row 1, Cell 2');
            // $table->addCell(2000)->addText('Row 1, Cell 3');
            // $table->addRow();
            // $table->addCell(2000)->addText('Row 2, Cell 1');
            // $table->addCell(2000)->addText('Row 2, Cell 2');
            // $table->addCell(2000)->addText('Row 2, Cell 3');
            $footer = $section->addFooter();
            $footer->addPreserveText(' {PAGE} / {NUMPAGES}.', null, ['alignment' => \PhpOffice\PhpWord\SimpleType\Jc::CENTER]);
            //$footer->addLink('https://github.com/PHPOffice/PHPWord', 'PHPWord on GitHub');
            \PhpOffice\PhpWord\Shared\Html::addHtml($footer, $footerHtml, false, false);


            // Add HTML content to the main body of the section
            \PhpOffice\PhpWord\Shared\Html::addHtml($section, $mainHtml, false, false);

            // Save file
            $objWriter = \PhpOffice\PhpWord\IOFactory::createWriter($this->_phpWord, 'Word2007');
            $objWriter->save($filePath);

            if (file_exists($filePath)) {
                return true; // Return true if the file exists
            } else {
                return false; // Return false if the file does not exist (unlikely scenario if no exceptions were thrown)
            }
        } catch (Exception $e) {
            return false; 
        }

    }




}

?>