<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:fo="http://www.w3.org/1999/XSL/Format">

<xsl:import href="docbook-xsl/fo/docbook.xsl"/>

<xsl:param name="paper.type" select="'A4'"/>

<xsl:param name="l10n.gentext.language">zh_cn</xsl:param>

<!-- 开启FOP扩展，可能生成PDF书签 -->
<xsl:param name="fop1.extensions">1</xsl:param>

<!-- 单行显示variablelist的term -->
<xsl:param name="variablelist.as.blocks">1</xsl:param>

<!-- alignment默认为justify，中英混排时还是left合适点 -->
<xsl:param name="alignment">left</xsl:param>

<!-- 字体设置 -->
<xsl:param name="body.font.family">
  CMU Serif,AR PL SungtiL GB</xsl:param>
<xsl:param name="title.font.family">
  CMU Sans Serif,Source Han Sans</xsl:param>
<xsl:param name="monospace.font.family">
  CMU Typewriter Text,AR PL KaitiM GB</xsl:param>
<xsl:param name="symbol.font.family">
  CMU Serif</xsl:param>

<!-- 字体大小 -->
<xsl:param name="body.font.master">10</xsl:param>
<xsl:attribute-set name="section.title.level1.properties">
  <xsl:attribute name="font-size">15pt</xsl:attribute>
</xsl:attribute-set>
<xsl:attribute-set name="section.title.level2.properties">
  <xsl:attribute name="font-size">13pt</xsl:attribute>
</xsl:attribute-set>
<xsl:attribute-set name="section.title.level3.properties">
  <xsl:attribute name="font-size">11pt</xsl:attribute>
</xsl:attribute-set>

<!-- 行高 -->
<xsl:param name="line-height">1.6</xsl:param>

<!-- 显示section数字编号 -->
<xsl:param name="section.autolabel">1</xsl:param>
<xsl:param name="section.label.includes.component.label">1</xsl:param>
<xsl:param name="section.autolabel.max.depth" select="2"/>

<!-- 首行缩进两个字符 -->
<xsl:attribute-set name="normal.para.spacing">
	<xsl:attribute name="text-indent">2em</xsl:attribute>
</xsl:attribute-set>

<!-- 章节标题margin -->
<xsl:attribute-set name="component.title.properties">
  <xsl:attribute name="margin-top">6em</xsl:attribute>
  <xsl:attribute name="margin-bottom">2.5em</xsl:attribute>
</xsl:attribute-set>

<!-- 标题margin -->
<xsl:attribute-set name="section.title.properties">
  <xsl:attribute name="space-before.minimum">2.6em</xsl:attribute>
  <xsl:attribute name="space-before.optimum">2.8em</xsl:attribute>
  <xsl:attribute name="space-before.maximum">3.0em</xsl:attribute>
  <xsl:attribute name="space-after.minimum">1.6em</xsl:attribute>
  <xsl:attribute name="space-after.optimum">1.8em</xsl:attribute>
  <xsl:attribute name="space-after.maximum">2.0em</xsl:attribute>
</xsl:attribute-set>

<!-- 代码块显示 -->
<xsl:param name="shade.verbatim" select="1"/>
<xsl:attribute-set name="shade.verbatim.style">
  <xsl:attribute name="background-color">#F2F2F2</xsl:attribute>
  <xsl:attribute name="padding-left">0.5em</xsl:attribute>
  <xsl:attribute name="padding-right">0.5em</xsl:attribute>
  <xsl:attribute name="padding-top">0.5em</xsl:attribute>
  <xsl:attribute name="padding-bottom">0.5em</xsl:attribute>
</xsl:attribute-set>

<!--
<xsl:attribute-set name="monospace.properties">
  <xsl:attribute name="font-size">10pt</xsl:attribute>
</xsl:attribute-set>
-->

</xsl:stylesheet>
