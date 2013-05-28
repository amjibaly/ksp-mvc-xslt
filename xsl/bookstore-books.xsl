<?xml version="1.0"?>
<!DOCTYPE xsl:stylesheet [
  <!ENTITY nbsp "&#160;">
  <!ENTITY amps "&#38;">
]>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  
  <xsl:template match="books">
    <books>
      <h2>Books in a series</h2>
      <xsl:apply-templates select="series" />
      <h2>Non-series books</h2>
      <xsl:apply-templates select="single" />
    </books>
  </xsl:template>
  
  <xsl:template match="series">
    <div class="bookstore-series-box">
      <a href="series.php?name={name}">
        <img class="bookstore-series-img" src="images/series/{image}" />
      </a>
      <div class="bookstore-series-txt">
        <a class="bookstore-series" href="series.php?name={name}">
          <xsl:value-of select="name" />
        </a>
        <ul class="bookstore-series">
          <xsl:apply-templates select="title">
            <xsl:sort select="@seq" order="ascending" />
          </xsl:apply-templates>
        </ul>
      </div>
      <div class="hr"><hr /></div>
    </div>
  </xsl:template>

  <xsl:template match="title">
    <li>
      <a class="bookstore-series-title" href="book.php?id={@id}">
        <xsl:value-of select="." />
      </a>
    </li>
  </xsl:template>

  <xsl:template match="single">
    <div class="bookstore-single-title">
      <a href="book.php?id={title/@id}">
        <xsl:value-of select="title" />
      </a>
    </div>
  </xsl:template>
  
</xsl:stylesheet>