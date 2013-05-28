<?xml version="1.0"?>
<!DOCTYPE xsl:stylesheet [ <!ENTITY nbsp "&#160;"> ]>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template match="main">
    <title><xsl:value-of select="title" /></title>
    <xsl:apply-templates select="header/location-bar" />
  </xsl:template>
  
  <xsl:template match="location-bar">
    <location-bar>
      <xsl:apply-templates select="loc" />
      <xsl:value-of select="@name" />
    </location-bar>
  </xsl:template>
  
  <xsl:template match="loc">
    <a href="{@href}"><xsl:value-of select="." /></a>&nbsp;&gt;&nbsp;
  </xsl:template>
</xsl:stylesheet>