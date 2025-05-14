<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="tei">

  <xsl:output method="html" indent="yes" encoding="UTF-8"/>

  <xsl:template match="/">
    <html>
      <head>
        <meta charset="UTF-8"/>
        <title>
          <xsl:value-of select="//tei:title"/>
        </title>
        <link rel="stylesheet" href="../css/style.css"/>
      </head>
      <body>
        <h1><xsl:value-of select="//tei:title"/></h1>
        <div class="book">
          <xsl:apply-templates select="//tei:body"/>
        </div>
      </body>
    </html>
  </xsl:template>

  <xsl:template match="tei:p">
    <p><xsl:apply-templates/></p>
  </xsl:template>

  <xsl:template match="tei:pb">
    <div class="page">
      <xsl:variable name="facs-id" select="substring-after(@facs, '#')"/>
      <xsl:variable name="img-url" select="//tei:surface[@xml:id=$facs-id]/tei:graphic/@url"/>
      <img>
        <xsl:attribute name="src">
          <xsl:value-of select="$img-url"/>
        </xsl:attribute>
        <xsl:attribute name="alt">
          Page <xsl:value-of select="$facs-id"/>
        </xsl:attribute>
      </img>
    </div>
  </xsl:template>

  <xsl:template match="*">
    <xsl:apply-templates/>
  </xsl:template>

  <xsl:template match="text()">
    <xsl:value-of select="normalize-space()"/>
  </xsl:template>

</xsl:stylesheet>