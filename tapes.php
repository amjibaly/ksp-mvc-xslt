<?php

include_once('includes/ksp_includes.php');

$engine = xslt_create();

$xmlstring = ksp_xml_query('bookstore/tapes');
$xslfile = 'xsl/bookstore-tapes.xsl';
$tapes = ksp_xslt($engine, $xmlstring, $xslfile, NULL, NULL);

$xmlfile = 'xml/tapes.xml';
$xslfile = 'xsl/tapes.xsl';
$args = array('/tapes' => $tapes);
$body = ksp_xslt($engine, $xmlfile, $xslfile, $args, NULL);

$params = array('show_rightnav' => '0');
$output = new ksp_html_output($engine, $body, $params);
$output->setpage($xmlfile);
$output->write();

xslt_free($engine);

?>