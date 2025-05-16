<!-- Handle <app> elements for critical apparatus with toggle -->
<xsl:template match="tei:app">
  <span class="variant">
    <xsl:apply-templates select="tei:rdg[@wit='#B_AWP']"/>
    <xsl:apply-templates select="tei:rdg[@wit='#N_AWP']"/>
  </span>
</xsl:template>

<!-- Witness B shown by default -->
<xsl:template match="tei:rdg[@wit='#B_AWP']">
  <span class="rdg rdg-B">
    <xsl:apply-templates/>
  </span>
</xsl:template>

<!-- Witness A hidden initially -->
<xsl:template match="tei:rdg[@wit='#N_AWP']">
  <span class="rdg rdg-A hidden">
    <xsl:apply-templates/>
  </span>
</xsl:template>
