<?php

define ('KSP_XML_FILE_DEFAULT', 'xml/index.xml');
define ('KSP_XSL_FILE_DEFAULT', 'xsl/main-template.xsl');
define ('KSP_LOCBAR_XSL', 'xsl/location-bar.xsl');
define ('KSP_PAGESETUP_XSL', 'xsl/page-setup.xsl');

class ksp_html_output
{
  var $engine;
  var $imports;
  var $params;
  var $xml;
  var $xsl;
  //var $loc;
  var $locxml;
  var $page;

  function ksp_html_output($engine, $imports, $params = NULL, $xml = NULL, $xsl = NULL)
  {
    $this->engine = $engine;

    $this->imports = new ksp_xml( 'imports' );
    if (is_array($imports)) {
      while ( list($key, $val) = each ($imports) ) {
		    $this->imports->add( $key, '', $val );
      }
    }
    else {
      $this->imports->add( 'body', '', $imports );
    }

    $this->params = $params;
    $this->xml = $xml ? $xml : KSP_XML_FILE_DEFAULT;
    $this->xsl = $xsl ? $xsl : KSP_XSL_FILE_DEFAULT;
    //$this->loc = new ksp_xml('locations');
  }

  function write()
  {
    /* set location bar
    $locxml = $this->locxml ? $this->locxml : $this->xml;
    $locbar = ksp_xslt($this->engine, $locxml, KSP_LOCBAR_XSL);
    $this->imports->append( $locbar );
    */

    /* set page options */
    $pagefile = $this->page ? $this->page : $this->xml;
    $pageimports = ksp_xslt($this->engine, $pagefile, KSP_PAGESETUP_XSL);
    $this->imports->append( $pageimports );

    $args = array( "/imports" => $this->imports->build() );
    $output = ksp_xslt($this->engine, $this->xml, $this->xsl, $args, $this->params);
    print $output;
  }

  function setpage( $xmlfile )
  {
    $this->page = $xmlfile;
  }

  function setlocbar( $xmlfile )
  {
    $this->locxml = $xmlfile;
  }

  /*
   * unused function
   *
  function setlocation( $loclist, $name, $address )
  {
    $loc = new ksp_xml('location-bar', array('current'=>$name));

    if ($loclist)
    {
      $dup = array_search($address, $loclist['addresses']);

	  if ($dup)
	  {
	    array_splice($loclist['names'], $dup-1);
	    array_splice($loclist['addresses'], $dup-1);
	  }

	  for($i = 0; $i < count($loclist['names']); $i++)
	  {
	    $locname = $loclist['names'][$i];
	    $href = $loclist['addresses'][$i];
	    $loc->add('location', array('href'=>$href), $locname);
	  }
	}
	$this->loc = $loc;
    $loclist['names'][] = $name;
    $loclist['addresses'][] = $address;
    return $loclist;
  }
  */
}

?>
