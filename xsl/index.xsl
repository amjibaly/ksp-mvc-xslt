<?xml version="1.0"?>
<!DOCTYPE xsl:stylesheet [ <!ENTITY nbsp "&#160;"> ]>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template match="main">
    <xsl:apply-templates select="body/content/main-feature" />
  </xsl:template>

  <xsl:template match="main-feature">
    <div class="main-feature">
      <h1><xsl:value-of select="title" /></h1>
      <a href="{@link}"><img src="{graphic}" /></a>
      <xsl:copy-of select="text" />
    </div>
  </xsl:template>

</xsl:stylesheet>