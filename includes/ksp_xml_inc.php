<?php

define ('KSP_XML_REGEX', '\<\?.*xml.*\?\>');

class ksp_xml
{
  var $xml;
  var $endtag;

  function ksp_xml($name, $attlist = NULL, $content = NULL)
  {
    $this->xml = '<?xml version="1.0"?>';
    $this->xml.= $this->xml_process($name, $attlist, $content, 'NO_END_TAG');
    $this->endtag = '</' . $name . '>';
  }

  function xml_process($name, $attlist, $content, $flag)
  {
    $output = '<' . $name;

    while ( $attlist && list($att, $val) = each ($attlist) ) {
      $output .= ' ' . $att . '=' . ksp_dquote($val);
    }

    $output .= '>' . eregi_replace(KSP_XML_REGEX, '', $content);

    if ($flag != 'NO_END_TAG') {
      $output .= '</' . $name . '>';
    }

    return $output;
  }

  function append($content)
  {
    $this->xml .= eregi_replace(KSP_XML_REGEX, '', $content);
    return $this->build();
  }


  function add($name, $attlist, $content)
  {
    $this->xml .= $this->xml_process($name, $attlist, $content, '');
    return $this->build();
  }

  function build()
  {
    return $this->xml . $this->endtag;
  }
}


function ksp_xslt($engine, $xml, $xsl, $args=NULL, $params=NULL) {
  $xmlstring = $xml;
  $xslstring = $xsl;

  if ( !eregi(KSP_XML_REGEX, $xml) )
  {
    $xmlstring = file_get_contents($xml);
  }

  if ( !eregi(KSP_XML_REGEX, $xsl) )
  {
    $xslstring = file_get_contents($xsl);
  }

  $args = array_merge( $args, array('/_xml' => $xmlstring, '/_xsl' => $xslstring) );
  $output = xslt_process($engine, 'arg:/_xml', 'arg:/_xsl', NULL, $args, $params);

  return $output;
}

function ksp_xml_query($query_string)
{
  $query_array = explode('/', $query_string);

  require_once('queries/' . $query_array[0] . '_queries.php');

  $class_name = 'ksp_' . $query_array[0] . '_queries';
  $query_class = new $class_name($query_array[1]);

  return $query_class->output();
}

?>
