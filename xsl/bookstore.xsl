<?xml version="1.0"?>
<!DOCTYPE xsl:stylesheet [ <!ENTITY nbsp "&#160;"> ]>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:param name="books">
    <xsl:copy-of select="document('arg:/books')/books/*" />
  </xsl:param>
  <xsl:param name="tapes">
    <xsl:copy-of select="document('arg:/tapes')/tapes/*" />
  </xsl:param>
  
  <xsl:template match="main">
    <h1><xsl:value-of select="heading" /></h1>
    <xsl:copy-of select="$books" />
    <xsl:copy-of select="$tapes" />
  </xsl:template>
  
</xsl:stylesheet>