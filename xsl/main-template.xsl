<?xml version="1.0"?>
<!DOCTYPE xsl:stylesheet [ <!ENTITY nbsp "&#160;"> ]>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:param name="imports">
    <xsl:copy-of select="document('arg:/imports')/imports/*" />
  </xsl:param>
  <xsl:param name="date" />
  <xsl:param name="show_rightnav" select="1" />
  
  <xsl:template match="main">
    <html>
      <head>
        <title><xsl:value-of select="$imports/title" /></title>
        <link rel="stylesheet" type="text/css" href="css/ksp.css" />
      </head>
      <body>
        <xsl:apply-templates select="header">
          <xsl:with-param name="date" select="$date" />
          <xsl:with-param name="imports" select="$imports" />
        </xsl:apply-templates>
        <div class="body">
          <xsl:apply-templates select="body">
            <xsl:with-param name="imports" select="$imports" />
            <xsl:with-param name="show_rightnav" select="$show_rightnav" />
          </xsl:apply-templates>
        </div>
        <xsl:apply-templates select="footer" />
      </body>
    </html>
  </xsl:template>

  <xsl:template match="header">
    <xsl:param name="date" />
    <div class="bismillah">Bismillah Ar-Rahman Ar-Raheem | In the Name of Allah, the Most Gracious, the Most Merciful</div>
    <div class="header">
      <a class="ksplogo" href="index.php"><img src="images/KSP_Logo_web.gif" width="117" height="68" /></a>
      <div class="cartbar"><a href="#">Login</a> | <a href="#">My Account</a> | <a href="#">My Cart</a></div>
      <div class="quickbar"><a href="books.php">Books</a>&nbsp;&nbsp;<a href="tapes.php">Tapes</a>&nbsp;&nbsp;<a href="#">Knowledge</a></div>
      <div class="location-bar">
        <xsl:copy-of select="$imports/location-bar" />
      </div>
    </div>
    <div class="junk">&nbsp;</div>
  </xsl:template>

  <xsl:template match="body">
    <div class="leftnav">
      <div class="junk">&nbsp;</div>
      <xsl:apply-templates select="menu/menu-item" />
    </div>
    <div class="leftmargin">&nbsp;</div>
    <div class="content">
      <xsl:copy-of select="$imports/body" />
    </div>
    <xsl:if test="$show_rightnav=1">
      <div class="rightmargin">&nbsp;</div>
      <div class="rightnav">
        <div class="junk">&nbsp;</div>
        <xsl:copy-of select="rightnav" />
      </div>
    </xsl:if>
  </xsl:template>
  
  <xsl:template match="menu-item">
    <a href="{link}"><xsl:value-of select="title" /></a>
  </xsl:template>
  
  <xsl:template match="footer">
    <div class="footer">About KSP | Policies | Copyright 2003 Al-Kitaab and As-Sunnah Publishing</div>
  </xsl:template>
  
</xsl:stylesheet>