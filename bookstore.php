<?php
session_start();
include_once('includes/ksp_includes.php');

$engine = xslt_create();

$xmlstring = ksp_xml_query('bookstore/books');
$xslfile = 'xsl/bookstore-books.xsl';
$books = ksp_xslt($engine, $xmlstring, $xslfile, NULL, NULL);

$xmlstring = ksp_xml_query('bookstore/tapes');
$xslfile = 'xsl/bookstore-tapes.xsl';
$tapes = ksp_xslt($engine, $xmlstring, $xslfile, NULL, NULL);

$xmlfile = 'xml/bookstore.xml';
$xslfile = 'xsl/bookstore.xsl';
$args = array('/books' => $books, '/tapes' => $tapes);
$body = ksp_xslt($engine, $xmlfile, $xslfile, $args, NULL);

$params = array('show_rightnav' => '0');
$output = new ksp_html_output($engine, $body, $params);
$output->setpage($xmlfile);
$output->write();

xslt_free($engine);

?>