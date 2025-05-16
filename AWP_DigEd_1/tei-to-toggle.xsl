<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:tei="http://www.tei-c.org/ns/1.0"
  exclude-result-prefixes="tei">

  <xsl:output method="html" encoding="UTF-8" indent="yes"/>

  <xsl:template match="/">
    <html>
      <head>
        <title>TEI Edition</title>
        <link rel="stylesheet" href="style.css"/>
      </head>
      <body>
        <div id="controls">
          <button onclick="toggleWitness('B')">Show Witness B (1915)</button>
          <button onclick="toggleWitness('A')">Show Witness A (1914)</button>
        </div>
        <div id="text">
          <xsl:apply-templates select="//tei:text"/>
        </div>
        <script src="toggle.js"></script>
      </body>
    </html>
  </xsl:template>

  <xsl:template match="tei:text">
    <xsl:apply-templates/>
  </xsl:template>

  <xsl:template match="tei:body | tei:div | tei:ab | tei:lg">
    <div>
      <xsl:apply-templates/>
    </div>
  </xsl:template>

  <xsl:template match="tei:p | tei:l">
    <p><xsl:apply-templates/></p>
  </xsl:template>

  <xsl:template match="tei:app">
    <span class="variant">
      <xsl:apply-templates select="tei:rdg[@wit='#B_AWP']"/>
      <xsl:apply-templates select="tei:rdg[@wit='#N_AWP']"/>
    </span>
  </xsl:template>

  <xsl:template match="tei:rdg[@wit='#B_AWP']">
    <span class="rdg rdg-B">
      <xsl:apply-templates/>
    </span>
  </xsl:template>

  <xsl:template match="tei:rdg[@wit='#N_AWP']">
    <span class="rdg rdg-A hidden">
      <xsl:apply-templates/>
    </span>
  </xsl:template>

  <xsl:template match="tei:note">
    <sup class="note">
      <xsl:apply-templates/>
    </sup>
  </xsl:template>

  <!-- fallback for any unmatched element -->
  <xsl:template match="*">
    <xsl:apply-templates/>
  </xsl:template>

</xsl:stylesheet>
