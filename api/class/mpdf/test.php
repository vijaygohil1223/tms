<?php

require_once __DIR__ . '/vendor/autoload.php';

use Mpdf\Mpdf;
use Mpdf\MpdfException;
use Mpdf\Output\Destination; // Import the Destination class
//$mpdf = new \Mpdf\Mpdf();
$mpdf = new \Mpdf\Mpdf([
  'setAutoTopMargin' => 'stretch',
  'setAutoBottomMargin' => 'stretch',
  'autoMarginPadding' => 10,
]);

try {
  $header = '
<table width="100%" style="vertical-align: bottom; font-family: serif; font-size: 8pt; color: #000000; font-weight: bold; font-style: italic; ">
<tr>
    <td width="33%">{DATE j-m-Y}</td>
    <td width="33%" align="center"> </td>
    <td width="33%" style="text-align: right;"><img src="https://tms.dosina.no/assets/img/BeConnected_Logo.png" class="img-full" alt="..." style="max-height: 50px; max-width: 100%; width: auto;"></td>
</tr>
</table>';

  // Set footer content
  $footer = '
<table  >
    <tr>
    <td></td>
    <td> {PAGENO}/{nbpg} </td>
    <td></td>
    </tr>
    <tr>
        <td class="table-data-text"> <strong class="ng-binding">Dosina Translations AS</strong> </td>
        <td class="table-data-text"> </td>
        <td class="table-data-text"> <strong> VAT NUMBER:</strong> </td>
    </tr>
    <tr>
        <td class="table-data-text ng-binding"> Munthes gate 42 </td>
        <td class="table-data-text"> Email:<a href="mailto:work@dosinatranslations.no" class="ng-binding"> work@dosinatranslations.no</a> </td>
        <td class="table-data-text">Foretaksregisteret: </td>
    </tr>
    <tr>
        <td class="table-data-text ng-binding"> 0260  Oslo </td>
        <td class="table-data-text"> <!-- ngIf: invoiceSettingData.server_no==2 --> </td>
        <td class="table-data-text ng-binding">NO922694788</td>
    </tr>
    <tr>
        <td class="table-data-text ng-binding"> Norway </td>
        <td class="table-data-text"> </td>
        <td class="table-data-text"> </td>
    </tr>
</table>';

  // Set header and footer
  $mpdf->SetHTMLHeader($header);
  $mpdf->SetHTMLFooter($footer);

  $htmlContent = '
<style>
@page *{
  margin-top: 2.54cm;
  margin-bottom: 2.54cm;
  margin-left: 3.175cm;
  margin-right: 3.175cm;
}
</style>

<div class="col-sm-12" id="pdfExport">
<div class="container invoice">
    <div class="invoice-body">
        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12">
                <div class="panel panel-default ">
                    <div class="panel-heading-img"> 
                     </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <p class="address-title"> <span class="ng-binding">Dosina Translations AS | </span> <span class="ng-binding">Munthes gate 42, </span> <span class="ng-binding">0260 </span> <span class="ng-binding">Oslo, </span>  <span class="ng-binding">Norway</span> </p>
                    </div>

                    <div class="panel-body" style="padding-top: 0px;">
                        <dl class="dl-horizontal">
                            <dd style="margin-bottom: 8px;"><strong class="ng-binding"> ICS Translate </strong></dd>
                            <dd class="ng-binding"> 2 Park Lane </dd>
                            <dd class="ng-binding"> LS3 1ES <!-- ngIf: clientCity --><span ng-if="clientCity" class="ng-binding ng-scope">Leeds</span><!-- end ngIf: clientCity --></dd>
                            <dd class="ng-binding">United Kingdom</dd>
                            <!-- ngIf: invoiceDetail.clientVatinfo --><dd ng-if="invoiceDetail.clientVatinfo" class="ng-binding ng-scope"> IE6388047V </dd><!-- end ngIf: invoiceDetail.clientVatinfo -->
                    </dl></div>
                    <div class="panel-body" style="padding-top: 0px;">
                      <!-- <dl class="dl-horizontal"> -->
                          <!-- ngIf: invoiceSettingData.server_no===2 -->
                          <!-- ngIf: invoiceSettingData.server_no===2 -->
                          <!-- ngIf: invoiceSettingData.server_no===2 -->
                          <div class="col-sm-3">
                            <p class="mb-d"><strong>Date</strong></p> 
                            <input class="form-control ng-pristine ng-untouched ng-valid ng-isolate-scope ng-not-empty" type="text" ng-model="invoiceDetail.invoice_date" id="createDate" ng-datepicker2="" ng-change="changeCreateDate(invoiceDetail.invoice_date)" name="invoice_date" ng-disabled="editDisabled" style="margin-top: -3px;" disabled="disabled" aria-invalid="false">
                          </div>
                          
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="panel panel-default invoice-header-height">
                <div class="panel-body">
                    <dl class="dl-horizontal">
                        <dd class="invoice-heading">
                          <div class="d-flex"> <strong>Invoice</strong> 
                            <input class="form-control ng-pristine ng-untouched ng-valid ng-not-empty" type="text" ng-model="invoiceDetail.custom_invoice_number" id="custom_invoice_number" name="custom_invoice_number" ng-disabled="editDisabled" style="width: 150px; font-weight:bold;margin-left: 5px;margin-top: -3px;" disabled="disabled" aria-invalid="false">
                          </div>
                        </dd>
                </dl></div>
                <table class="table table-bordered table-condensed">
                    <thead>
                        <tr class="header-tr-border">
                            <th style="width:50%;">Project</th>
                            <th style="width:30%;"> PO Number</th>
                            <th style="width:20%;" class="ng-binding">Price in GBP </th>
                        </tr>
                    </thead>
                    <!-- ngRepeat: invL in invoiceList track by $index --><tbody ng-init="invoiceLength = invoiceList.length - 1" s="" class="table table-striped bg-white b-a ng-scope" ng-repeat="invL in invoiceList track by $index">
                      <tr class="thfont">
                        <td class="table-data-txt ng-binding"> SPE220003-001</td>
                        <td class="table-data-txt ng-binding"> GIMM00012 - Daily Drops TnC</td>
                        <td class="table-data-txt"> 
                          <input class="invoiceCal form-control ng-pristine ng-untouched ng-valid ng-not-empty" type="text" ng-model="invL.item.itemTotalVal" id="invSubTotal0" ng-change="changeInvoiceField($index,$parent.$index,invL.item.subTotal)" name="itemVal_5" ng-disabled="editDisabled" disabled="disabled" aria-invalid="false">
                          <a href="javascript:void(0);" class="btnDelete ng-hide" ng-hide="editDisabled" ng-click="itemScoopDelete(invL.itemId,$index)" aria-hidden="true"><i class="iconDelete glyph-icon fa-times" aria-hidden="true"></i></a>
                        </td>
                      </tr> 
                      <!-- <tr ng-if="$index == invoiceLength">
                        <td colspan="2">
                          <strong>Sub Total</strong>
                        </td>
                        <td class="nowrap">
                          {{invoiceTotal}} </td>
                      </tr>
                      <tr ng-if="$index == invoiceLength && vatTax>0">
                        <td colspan="2"><strong>{{vatTax | customNumber}}% Tax</strong></td>
                        <td class="nowrap"> 
                          <span ng-if="vatAmount">{{vatAmount | customNumber}}</span>
                          <span ng-if="!vatAmount">0</span>
                        </td>
                      </tr>  -->
                        
                    </tbody><!-- end ngRepeat: invL in invoiceList track by $index --><tbody ng-init="invoiceLength = invoiceList.length - 1" s="" class="table table-striped bg-white b-a ng-scope" ng-repeat="invL in invoiceList track by $index">
                      <tr class="thfont">
                        <td class="table-data-txt ng-binding"> SPE220004-001</td>
                        <td class="table-data-txt ng-binding"> GIMM00013 - WowPots</td>
                        <td class="table-data-txt"> 
                          <input class="invoiceCal form-control ng-pristine ng-untouched ng-valid ng-not-empty" type="text" ng-model="invL.item.itemTotalVal" id="invSubTotal1" ng-change="changeInvoiceField($index,$parent.$index,invL.item.subTotal,)" name="itemVal_6" ng-disabled="editDisabled" disabled="disabled" aria-invalid="false">
                          <a href="javascript:void(0);" class="btnDelete ng-hide" ng-hide="editDisabled" ng-click="itemScoopDelete(invL.itemId,$index)" aria-hidden="true"><i class="iconDelete glyph-icon fa-times" aria-hidden="true"></i></a>
                        </td>
                      </tr> 
                      <!-- <tr ng-if="$index == invoiceLength">
                        <td colspan="2">
                          <strong>Sub Total</strong>
                        </td>
                        <td class="nowrap">
                          {{invoiceTotal}} </td>
                      </tr>
                      <tr ng-if="$index == invoiceLength && vatTax>0">
                        <td colspan="2"><strong>{{vatTax | customNumber}}% Tax</strong></td>
                        <td class="nowrap"> 
                          <span ng-if="vatAmount">{{vatAmount | customNumber}}</span>
                          <span ng-if="!vatAmount">0</span>
                        </td>
                      </tr>  -->
                        
                    </tbody><!-- end ngRepeat: invL in invoiceList track by $index -->
                </table>
                <table class="table table-bordered table-condensed">
                    <thead>
                        <tr class="header-tr-border">
                            <th style="width:50%;">Project</th>
                            <th style="width:30%;"> PO Number</th>
                            <th style="width:20%;" class="ng-binding">Price in GBP </th>
                        </tr>
                    </thead>
                    <!-- ngRepeat: invL in invoiceList track by $index --><tbody ng-init="invoiceLength = invoiceList.length - 1" s="" class="table table-striped bg-white b-a ng-scope" ng-repeat="invL in invoiceList track by $index">
                      <tr class="thfont">
                        <td class="table-data-txt ng-binding"> SPE220003-001</td>
                        <td class="table-data-txt ng-binding"> GIMM00012 - Daily Drops TnC</td>
                        <td class="table-data-txt"> 
                          <input class="invoiceCal form-control ng-pristine ng-untouched ng-valid ng-not-empty" type="text" ng-model="invL.item.itemTotalVal" id="invSubTotal0" ng-change="changeInvoiceField($index,$parent.$index,invL.item.subTotal,)" name="itemVal_5" ng-disabled="editDisabled" disabled="disabled" aria-invalid="false">
                          <a href="javascript:void(0);" class="btnDelete ng-hide" ng-hide="editDisabled" ng-click="itemScoopDelete(invL.itemId,$index)" aria-hidden="true"><i class="iconDelete glyph-icon fa-times" aria-hidden="true"></i></a>
                        </td>
                      </tr> 
                      <!-- <tr ng-if="$index == invoiceLength">
                        <td colspan="2">
                          <strong>Sub Total</strong>
                        </td>
                        <td class="nowrap">
                          {{invoiceTotal}} </td>
                      </tr>
                      <tr ng-if="$index == invoiceLength && vatTax>0">
                        <td colspan="2"><strong>{{vatTax | customNumber}}% Tax</strong></td>
                        <td class="nowrap"> 
                          <span ng-if="vatAmount">{{vatAmount | customNumber}}</span>
                          <span ng-if="!vatAmount">0</span>
                        </td>
                      </tr>  -->
                        
                    </tbody><!-- end ngRepeat: invL in invoiceList track by $index --><tbody ng-init="invoiceLength = invoiceList.length - 1" s="" class="table table-striped bg-white b-a ng-scope" ng-repeat="invL in invoiceList track by $index">
                      <tr class="thfont">
                        <td class="table-data-txt ng-binding"> SPE220004-001</td>
                        <td class="table-data-txt ng-binding"> GIMM00013 - WowPots</td>
                        <td class="table-data-txt"> 
                          <input class="invoiceCal form-control ng-pristine ng-untouched ng-valid ng-not-empty" type="text" ng-model="invL.item.itemTotalVal" id="invSubTotal1" ng-change="changeInvoiceField($index,$parent.$index,invL.item.subTotal,)" name="itemVal_6" ng-disabled="editDisabled" disabled="disabled" aria-invalid="false">
                          <a href="javascript:void(0);" class="btnDelete ng-hide" ng-hide="editDisabled" ng-click="itemScoopDelete(invL.itemId,$index)" aria-hidden="true"><i class="iconDelete glyph-icon fa-times" aria-hidden="true"></i></a>
                        </td>
                      </tr> 
                      <!-- <tr ng-if="$index == invoiceLength">
                        <td colspan="2">
                          <strong>Sub Total</strong>
                        </td>
                        <td class="nowrap">
                          {{invoiceTotal}} </td>
                      </tr>
                      <tr ng-if="$index == invoiceLength && vatTax>0">
                        <td colspan="2"><strong>{{vatTax | customNumber}}% Tax</strong></td>
                        <td class="nowrap"> 
                          <span ng-if="vatAmount">{{vatAmount | customNumber}}</span>
                          <span ng-if="!vatAmount">0</span>
                        </td>
                      </tr>  -->
                        
                    </tbody><!-- end ngRepeat: invL in invoiceList track by $index -->
                </table><table class="table table-bordered table-condensed">
                    <thead>
                        <tr class="header-tr-border">
                            <th style="width:50%;">Project</th>
                            <th style="width:30%;"> PO Number</th>
                            <th style="width:20%;" class="ng-binding">Price in GBP </th>
                        </tr>
                    </thead>
                    <!-- ngRepeat: invL in invoiceList track by $index --><tbody ng-init="invoiceLength = invoiceList.length - 1" s="" class="table table-striped bg-white b-a ng-scope" ng-repeat="invL in invoiceList track by $index">
                      <tr class="thfont">
                        <td class="table-data-txt ng-binding"> SPE220003-001</td>
                        <td class="table-data-txt ng-binding"> GIMM00012 - Daily Drops TnC</td>
                        <td class="table-data-txt"> 
                          <input class="invoiceCal form-control ng-pristine ng-untouched ng-valid ng-not-empty" type="text" ng-model="invL.item.itemTotalVal" id="invSubTotal0" ng-change="changeInvoiceField($index,$parent.$index,invL.item.subTotal,)" name="itemVal_5" ng-disabled="editDisabled" disabled="disabled" aria-invalid="false">
                          <a href="javascript:void(0);" class="btnDelete ng-hide" ng-hide="editDisabled" ng-click="itemScoopDelete(invL.itemId,$index)" aria-hidden="true"><i class="iconDelete glyph-icon fa-times" aria-hidden="true"></i></a>
                        </td>
                      </tr> 
                      <!-- <tr ng-if="$index == invoiceLength">
                        <td colspan="2">
                          <strong>Sub Total</strong>
                        </td>
                        <td class="nowrap">
                          {{invoiceTotal}} </td>
                      </tr>
                      <tr ng-if="$index == invoiceLength && vatTax>0">
                        <td colspan="2"><strong>{{vatTax | customNumber}}% Tax</strong></td>
                        <td class="nowrap"> 
                          <span ng-if="vatAmount">{{vatAmount | customNumber}}</span>
                          <span ng-if="!vatAmount">0</span>
                        </td>
                      </tr>  -->
                        
                    </tbody><!-- end ngRepeat: invL in invoiceList track by $index --><tbody ng-init="invoiceLength = invoiceList.length - 1" s="" class="table table-striped bg-white b-a ng-scope" ng-repeat="invL in invoiceList track by $index">
                      <tr class="thfont">
                        <td class="table-data-txt ng-binding"> SPE220004-001</td>
                        <td class="table-data-txt ng-binding"> GIMM00013 - WowPots</td>
                        <td class="table-data-txt"> 
                          <input class="invoiceCal form-control ng-pristine ng-untouched ng-valid ng-not-empty" type="text" ng-model="invL.item.itemTotalVal" id="invSubTotal1" ng-change="changeInvoiceField($index,$parent.$index,invL.item.subTotal,)" name="itemVal_6" ng-disabled="editDisabled" disabled="disabled" aria-invalid="false">
                          <a href="javascript:void(0);" class="btnDelete ng-hide" ng-hide="editDisabled" ng-click="itemScoopDelete(invL.itemId,$index)" aria-hidden="true"><i class="iconDelete glyph-icon fa-times" aria-hidden="true"></i></a>
                        </td>
                      </tr> 
                      <!-- <tr ng-if="$index == invoiceLength">
                        <td colspan="2">
                          <strong>Sub Total</strong>
                        </td>
                        <td class="nowrap">
                          {{invoiceTotal}} </td>
                      </tr>
                      <tr ng-if="$index == invoiceLength && vatTax>0">
                        <td colspan="2"><strong>{{vatTax | customNumber}}% Tax</strong></td>
                        <td class="nowrap"> 
                          <span ng-if="vatAmount">{{vatAmount | customNumber}}</span>
                          <span ng-if="!vatAmount">0</span>
                        </td>
                      </tr>  -->
                        
                    </tbody><!-- end ngRepeat: invL in invoiceList track by $index -->
                </table><table class="table table-bordered table-condensed">
                    <thead>
                        <tr class="header-tr-border">
                            <th style="width:50%;">Project</th>
                            <th style="width:30%;"> PO Number</th>
                            <th style="width:20%;" class="ng-binding">Price in GBP </th>
                        </tr>
                    </thead>
                    <!-- ngRepeat: invL in invoiceList track by $index --><tbody ng-init="invoiceLength = invoiceList.length - 1" s="" class="table table-striped bg-white b-a ng-scope" ng-repeat="invL in invoiceList track by $index">
                      <tr class="thfont">
                        <td class="table-data-txt ng-binding"> SPE220003-001</td>
                        <td class="table-data-txt ng-binding"> GIMM00012 - Daily Drops TnC</td>
                        <td class="table-data-txt"> 
                          <input class="invoiceCal form-control ng-pristine ng-untouched ng-valid ng-not-empty" type="text" ng-model="invL.item.itemTotalVal" id="invSubTotal0" ng-change="changeInvoiceField($index,$parent.$index,invL.item.subTotal,)" name="itemVal_5" ng-disabled="editDisabled" disabled="disabled" aria-invalid="false">
                          <a href="javascript:void(0);" class="btnDelete ng-hide" ng-hide="editDisabled" ng-click="itemScoopDelete(invL.itemId,$index)" aria-hidden="true"><i class="iconDelete glyph-icon fa-times" aria-hidden="true"></i></a>
                        </td>
                      </tr> 
                      <!-- <tr ng-if="$index == invoiceLength">
                        <td colspan="2">
                          <strong>Sub Total</strong>
                        </td>
                        <td class="nowrap">
                          {{invoiceTotal}} </td>
                      </tr>
                      <tr ng-if="$index == invoiceLength && vatTax>0">
                        <td colspan="2"><strong>{{vatTax | customNumber}}% Tax</strong></td>
                        <td class="nowrap"> 
                          <span ng-if="vatAmount">{{vatAmount | customNumber}}</span>
                          <span ng-if="!vatAmount">0</span>
                        </td>
                      </tr>  -->
                        
                    </tbody><!-- end ngRepeat: invL in invoiceList track by $index --><tbody ng-init="invoiceLength = invoiceList.length - 1" s="" class="table table-striped bg-white b-a ng-scope" ng-repeat="invL in invoiceList track by $index">
                      <tr class="thfont">
                        <td class="table-data-txt ng-binding"> SPE220004-001</td>
                        <td class="table-data-txt ng-binding"> GIMM00013 - WowPots</td>
                        <td class="table-data-txt"> 
                          <input class="invoiceCal form-control ng-pristine ng-untouched ng-valid ng-not-empty" type="text" ng-model="invL.item.itemTotalVal" id="invSubTotal1" ng-change="changeInvoiceField($index,$parent.$index,invL.item.subTotal,)" name="itemVal_6" ng-disabled="editDisabled" disabled="disabled" aria-invalid="false">
                          <a href="javascript:void(0);" class="btnDelete ng-hide" ng-hide="editDisabled" ng-click="itemScoopDelete(invL.itemId,$index)" aria-hidden="true"><i class="iconDelete glyph-icon fa-times" aria-hidden="true"></i></a>
                        </td>
                      </tr> 
                      <!-- <tr ng-if="$index == invoiceLength">
                        <td colspan="2">
                          <strong>Sub Total</strong>
                        </td>
                        <td class="nowrap">
                          {{invoiceTotal}} </td>
                      </tr>
                      <tr ng-if="$index == invoiceLength && vatTax>0">
                        <td colspan="2"><strong>{{vatTax | customNumber}}% Tax</strong></td>
                        <td class="nowrap"> 
                          <span ng-if="vatAmount">{{vatAmount | customNumber}}</span>
                          <span ng-if="!vatAmount">0</span>
                        </td>
                      </tr>  -->
                        
                    </tbody><!-- end ngRepeat: invL in invoiceList track by $index -->
                </table><table class="table table-bordered table-condensed">
                    <thead>
                        <tr class="header-tr-border">
                            <th style="width:50%;">Project</th>
                            <th style="width:30%;"> PO Number</th>
                            <th style="width:20%;" class="ng-binding">Price in GBP </th>
                        </tr>
                    </thead>
                    <!-- ngRepeat: invL in invoiceList track by $index --><tbody ng-init="invoiceLength = invoiceList.length - 1" s="" class="table table-striped bg-white b-a ng-scope" ng-repeat="invL in invoiceList track by $index">
                      <tr class="thfont">
                        <td class="table-data-txt ng-binding"> SPE220003-001</td>
                        <td class="table-data-txt ng-binding"> GIMM00012 - Daily Drops TnC</td>
                        <td class="table-data-txt"> 
                          <input class="invoiceCal form-control ng-pristine ng-untouched ng-valid ng-not-empty" type="text" ng-model="invL.item.itemTotalVal" id="invSubTotal0" ng-change="changeInvoiceField($index,$parent.$index,invL.item.subTotal,)" name="itemVal_5" ng-disabled="editDisabled" disabled="disabled" aria-invalid="false">
                          <a href="javascript:void(0);" class="btnDelete ng-hide" ng-hide="editDisabled" ng-click="itemScoopDelete(invL.itemId,$index)" aria-hidden="true"><i class="iconDelete glyph-icon fa-times" aria-hidden="true"></i></a>
                        </td>
                      </tr> 
                      <!-- <tr ng-if="$index == invoiceLength">
                        <td colspan="2">
                          <strong>Sub Total</strong>
                        </td>
                        <td class="nowrap">
                          {{invoiceTotal}} </td>
                      </tr>
                      <tr ng-if="$index == invoiceLength && vatTax>0">
                        <td colspan="2"><strong>{{vatTax | customNumber}}% Tax</strong></td>
                        <td class="nowrap"> 
                          <span ng-if="vatAmount">{{vatAmount | customNumber}}</span>
                          <span ng-if="!vatAmount">0</span>
                        </td>
                      </tr>  -->
                        
                    </tbody><!-- end ngRepeat: invL in invoiceList track by $index --><tbody ng-init="invoiceLength = invoiceList.length - 1" s="" class="table table-striped bg-white b-a ng-scope" ng-repeat="invL in invoiceList track by $index">
                      <tr class="thfont">
                        <td class="table-data-txt ng-binding"> SPE220004-001</td>
                        <td class="table-data-txt ng-binding"> GIMM00013 - WowPots</td>
                        <td class="table-data-txt"> 
                          <input class="invoiceCal form-control ng-pristine ng-untouched ng-valid ng-not-empty" type="text" ng-model="invL.item.itemTotalVal" id="invSubTotal1" ng-change="changeInvoiceField($index,$parent.$index,invL.item.subTotal,)" name="itemVal_6" ng-disabled="editDisabled" disabled="disabled" aria-invalid="false">
                          <a href="javascript:void(0);" class="btnDelete ng-hide" ng-hide="editDisabled" ng-click="itemScoopDelete(invL.itemId,$index)" aria-hidden="true"><i class="iconDelete glyph-icon fa-times" aria-hidden="true"></i></a>
                        </td>
                      </tr> 
                      <!-- <tr ng-if="$index == invoiceLength">
                        <td colspan="2">
                          <strong>Sub Total</strong>
                        </td>
                        <td class="nowrap">
                          {{invoiceTotal}} </td>
                      </tr>
                      <tr ng-if="$index == invoiceLength && vatTax>0">
                        <td colspan="2"><strong>{{vatTax | customNumber}}% Tax</strong></td>
                        <td class="nowrap"> 
                          <span ng-if="vatAmount">{{vatAmount | customNumber}}</span>
                          <span ng-if="!vatAmount">0</span>
                        </td>
                      </tr>  -->
                        
                    </tbody><!-- end ngRepeat: invL in invoiceList track by $index -->
                </table><table class="table table-bordered table-condensed">
                    <thead>
                        <tr class="header-tr-border">
                            <th style="width:50%;">Project</th>
                            <th style="width:30%;"> PO Number</th>
                            <th style="width:20%;" class="ng-binding">Price in GBP </th>
                        </tr>
                    </thead>
                    <!-- ngRepeat: invL in invoiceList track by $index --><tbody ng-init="invoiceLength = invoiceList.length - 1" s="" class="table table-striped bg-white b-a ng-scope" ng-repeat="invL in invoiceList track by $index">
                      <tr class="thfont">
                        <td class="table-data-txt ng-binding"> SPE220003-001</td>
                        <td class="table-data-txt ng-binding"> GIMM00012 - Daily Drops TnC</td>
                        <td class="table-data-txt"> 
                          <input class="invoiceCal form-control ng-pristine ng-untouched ng-valid ng-not-empty" type="text" ng-model="invL.item.itemTotalVal" id="invSubTotal0" ng-change="changeInvoiceField($index,$parent.$index,invL.item.subTotal,)" name="itemVal_5" ng-disabled="editDisabled" disabled="disabled" aria-invalid="false">
                          <a href="javascript:void(0);" class="btnDelete ng-hide" ng-hide="editDisabled" ng-click="itemScoopDelete(invL.itemId,$index)" aria-hidden="true"><i class="iconDelete glyph-icon fa-times" aria-hidden="true"></i></a>
                        </td>
                      </tr> 
                      <!-- <tr ng-if="$index == invoiceLength">
                        <td colspan="2">
                          <strong>Sub Total</strong>
                        </td>
                        <td class="nowrap">
                          {{invoiceTotal}} </td>
                      </tr>
                      <tr ng-if="$index == invoiceLength && vatTax>0">
                        <td colspan="2"><strong>{{vatTax | customNumber}}% Tax</strong></td>
                        <td class="nowrap"> 
                          <span ng-if="vatAmount">{{vatAmount | customNumber}}</span>
                          <span ng-if="!vatAmount">0</span>
                        </td>
                      </tr>  -->
                        
                    </tbody><!-- end ngRepeat: invL in invoiceList track by $index --><tbody ng-init="invoiceLength = invoiceList.length - 1" s="" class="table table-striped bg-white b-a ng-scope" ng-repeat="invL in invoiceList track by $index">
                      <tr class="thfont">
                        <td class="table-data-txt ng-binding"> SPE220004-001</td>
                        <td class="table-data-txt ng-binding"> GIMM00013 - WowPots</td>
                        <td class="table-data-txt"> 
                          <input class="invoiceCal form-control ng-pristine ng-untouched ng-valid ng-not-empty" type="text" ng-model="invL.item.itemTotalVal" id="invSubTotal1" ng-change="changeInvoiceField($index,$parent.$index,invL.item.subTotal,)" name="itemVal_6" ng-disabled="editDisabled" disabled="disabled" aria-invalid="false">
                          <a href="javascript:void(0);" class="btnDelete ng-hide" ng-hide="editDisabled" ng-click="itemScoopDelete(invL.itemId,$index)" aria-hidden="true"><i class="iconDelete glyph-icon fa-times" aria-hidden="true"></i></a>
                        </td>
                      </tr> 
                      <!-- <tr ng-if="$index == invoiceLength">
                        <td colspan="2">
                          <strong>Sub Total</strong>
                        </td>
                        <td class="nowrap">
                          {{invoiceTotal}} </td>
                      </tr>
                      <tr ng-if="$index == invoiceLength && vatTax>0">
                        <td colspan="2"><strong>{{vatTax | customNumber}}% Tax</strong></td>
                        <td class="nowrap"> 
                          <span ng-if="vatAmount">{{vatAmount | customNumber}}</span>
                          <span ng-if="!vatAmount">0</span>
                        </td>
                      </tr>  -->
                        
                    </tbody><!-- end ngRepeat: invL in invoiceList track by $index -->
                </table><table class="table table-bordered table-condensed-second" ng-init="invoiceLength = invoiceList.length - 1">
                    <tbody>
                        <tr>
                            <td class="table-data-txt" colspan="2"> Subtotal excl. TAX </td>
                            <td class="table-data-txt ng-binding" style="width:20%;"> 24,02 </td>
                        </tr>
                        <tr>
                            <td class="table-data-txt ng-binding" colspan="2"> 15,00 % TAX </td>
                            <td class="table-data-txt ng-binding"> 3,60</td>
                        </tr>
                        <!-- ngIf: $index == invoiceLength && invL.paid_amount > 0 -->
                        <!-- ngIf: $index == invoiceLength && invL.paid_amount > 0 -->
                        <tr>
                            <td class="table-data-txt" colspan="2"> <strong>Total Price</strong> </td>
                            <td class="table-data-txt" style="border-top:1px solid #000; border-bottom:1px solid #000;">  <strong class="ng-binding"> 27,62 </strong> </td>
                        </tr>
                    </tbody>
                </table>
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12">
                        <div class="panel panel-default">
                            <div class="panel-body">
                                <dl class="dl-horizontal">
                                    <dd class="ng-binding"> </dd>
                                    <dd>Payment for this invoice is due by <span ng-bind="invoiceDetail.paymentDueDate | globalDtFormat" class="ng-binding">11.01.2023</span>. </dd><br>
                                    <dd><strong>Payment details:</strong> </dd>
                                    <dd>Bank Name: <span ng-bind="vBankInfo.bank_name" class="ng-binding">Revolut Bank UAB</span></dd>
                                    <dd>Bank Address: <span ng-bind="vBankInfo.address" class="ng-binding">Konstitucijos pr. 21b, 08130 Vilnius, Lithuania</span></dd>
                                    <dd>Account holder: <span ng-bind="vBankInfo.holder_name" class="ng-binding">SpellUp AS</span></dd>
                                    <dd>IBAN: <span ng-bind="vBankInfo.iban" class="ng-binding">LT73 3250 0792 0252 8674</span></dd>
                                    <dd>SWIFT: <span ng-bind="vBankInfo.swift_bic" class="ng-binding">REVOLT21</span></dd>
                            </dl></div>
                        </div>
                    </div>
                </div>
                <div class="d-flex">
                  <div class="line1"> </div>
                  <div class="line2"> </div>
                  <div class="line3"> </div>
                  <div class="line4"> </div>
                </div>
                
            </div>
        </div>
    </div>
</div>
</div>';

  // Write content to PDF (allowing automatic page breaks)
  $mpdf->WriteHTML($htmlContent);

  // $mpdf->Output();

  //$mpdf->Output('example.pdf', Destination::FILE);
  $mpdf->Output('example.pdf', Destination::DOWNLOAD);
  
} catch (MpdfException $e) {
  // Handle mPDF exceptions
  echo 'An error occurred: ' . $e->getMessage();
} catch (Exception $e) {
  // Handle other exceptions
  echo 'An unexpected error occurred: ' . $e->getMessage();
}