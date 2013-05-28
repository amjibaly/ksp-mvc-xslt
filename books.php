<?php

include_once('includes/ksp_includes.php');

$engine = xslt_create();

$xmlstring = ksp_xml_query('bookstore/books');
$xslfile = 'xsl/bookstore-books.xsl';
$books = ksp_xslt($engine, $xmlstring, $xslfile, NULL, NULL);

$xmlfile = 'xml/books.xml';
$xslfile = 'xsl/books.xsl';
$args = array('/books' => $books);
$body = ksp_xslt($engine, $xmlfile, $xslfile, $args, NULL);

$params = array('show_rightnav' => '0');
$output = new ksp_html_output($engine, $body, $params);
$output->setpage($xmlfile);
$output->write();

xslt_free($engine);

?>