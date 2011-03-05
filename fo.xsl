<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:fo="http://www.w3.org/1999/XSL/Format">

<xsl:import href="/usr/share/asciidoc/docbook-xsl/fo.xsl"/>

<xsl:param name="paper.type" select="'A4'"/>

<xsl:param name="body.font.family">CMU Serif,AR PL SungtiL GB</xsl:param>
<xsl:param name="title.font.family">CMU Sans Serif,Droid Sans Fallback</xsl:param>
<xsl:param name="monospace.font.family">CMU Typewriter Text,AR PL KaitiM GB</xsl:param>
<xsl:param name="symbol.font.family">CMU Serif</xsl:param>

<xsl:param name="body.font.master">10</xsl:param>

<xsl:param name="line-height">1.6</xsl:param>

<xsl:attribute-set name="normal.para.spacing">
	<xsl:attribute name="text-indent">2em</xsl:attribute>
</xsl:attribute-set>

<!-- show link as footnotes -->
<xsl:param name="ulink.show">1</xsl:param>
<xsl:param name="ulink.footnotes">1</xsl:param>


<xsl:attribute-set name="monospace.properties">
  <xsl:attribute name="font-size">10pt</xsl:attribute>
</xsl:attribute-set>

<xsl:attribute-set name="section.title.properties">
  <xsl:attribute name="font-family">
    <xsl:value-of select="$title.font.family"></xsl:value-of>
  </xsl:attribute>
  <xsl:attribute name="font-weight">bold</xsl:attribute>
  <!-- font size is calculated dynamically by section.heading template -->
  <xsl:attribute name="keep-with-next.within-column">always</xsl:attribute>
  <xsl:attribute name="space-before.minimum">2.6em</xsl:attribute>
  <xsl:attribute name="space-before.optimum">2.8em</xsl:attribute>
  <xsl:attribute name="space-before.maximum">3.0em</xsl:attribute>
  <xsl:attribute name="space-after.minimum">1.6em</xsl:attribute>
  <xsl:attribute name="space-after.optimum">1.8em</xsl:attribute>
  <xsl:attribute name="space-after.maximum">2.0em</xsl:attribute>
  <xsl:attribute name="text-align">start</xsl:attribute>
  <xsl:attribute name="start-indent"><xsl:value-of select="$title.margin.left"></xsl:value-of></xsl:attribute>
</xsl:attribute-set>


<xsl:attribute-set name="section.title.level1.properties">
  <xsl:attribute name="font-size">
    <xsl:value-of select="$body.font.master * 1.45"></xsl:value-of>
    <xsl:text>pt</xsl:text>
  </xsl:attribute>
</xsl:attribute-set>


<xsl:attribute-set name="section.title.level2.properties">
  <xsl:attribute name="font-size">
    <xsl:value-of select="$body.font.master * 1.25"></xsl:value-of>
    <xsl:text>pt</xsl:text>
  </xsl:attribute>
</xsl:attribute-set>


<xsl:attribute-set name="section.title.level3.properties">
  <xsl:attribute name="font-size">
    <xsl:value-of select="$body.font.master * 1.115"></xsl:value-of>
    <xsl:text>pt</xsl:text>
  </xsl:attribute>
</xsl:attribute-set>

<!-- set chapter title margins -->
<xsl:attribute-set name="component.title.properties">
  <xsl:attribute name="margin-top">6em</xsl:attribute>
  <xsl:attribute name="margin-bottom">2.5em</xsl:attribute>
</xsl:attribute-set>


<!-- Only shade programlisting and screen verbatim elements -->
<xsl:param name="shade.verbatim" select="1"/>
<xsl:attribute-set name="shade.verbatim.style">
  <xsl:attribute name="background-color">
    <xsl:choose>
      <xsl:when test="self::programlisting|self::screen">#F2F2F2</xsl:when>
      <xsl:otherwise>#FFFFFF</xsl:otherwise>
    </xsl:choose>
  </xsl:attribute>
  <xsl:attribute name="padding-left">0.5em</xsl:attribute>
  <xsl:attribute name="padding-right">0.5em</xsl:attribute>
  <xsl:attribute name="padding-top">0.5em</xsl:attribute>
  <xsl:attribute name="padding-bottom">0.5em</xsl:attribute>
  <xsl:attribute name="font-size">
    <xsl:value-of select="$body.font.master * 0.6"></xsl:value-of>
    <xsl:text>pt</xsl:text>
  </xsl:attribute>
</xsl:attribute-set>

</xsl:stylesheet>
