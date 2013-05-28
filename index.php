<?php
session_start();
include('includes/ksp_includes.php');

$engine = xslt_create();

$xmlfile = 'xml/index.xml';
$xslfile = 'xsl/index.xsl';

$body = ksp_xslt($engine, $xmlfile, $xslfile);
$xslparams = array( "date" => date("l F jS, Y") );


$output = new ksp_html_output($engine, $body, $xslparams);
$output->write();

xslt_free($engine);

?>