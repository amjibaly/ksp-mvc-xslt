<?xml version="1.0"?>
<!DOCTYPE xsl:stylesheet [ <!ENTITY nbsp "&#160;"> ]>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  
  <xsl:template match="tapes">
    <tapes>
      <h2>Tape albums</h2>
      <xsl:apply-templates select="album" />
      <h2>Tapes by topic</h2>
      <ul class="bookstore-tape-topics">
        <xsl:apply-templates select="topic" />
      </ul>
    </tapes>
  </xsl:template>
  
  <xsl:template match="album">
    <div class="bookstore-album">
      <a href="album.php?id={title/@id}">
        <img src="images/albums/{image}" />
      </a>
      <a class="bookstore-album-title" href="album.php?id={title/@id}">
        <xsl:value-of select="title" />
      </a>
    </div>
  </xsl:template>

  <xsl:template match="topic">
    <li>
      <a class="bookstore-tape-topic" href="tape_topic.php?topic={.}">
        <xsl:value-of select="." />
      </a>
    </li>
  </xsl:template>
  
</xsl:stylesheet>