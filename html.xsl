<xsl:stylesheet
    version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:import href="docbook-xsl/html/docbook.xsl"/>

  <xsl:output method="html" encoding="UTF-8" indent="yes"/>

  <xsl:param name="generate.toc">book toc</xsl:param>
  <xsl:param name="html.stylesheet">docbook.css</xsl:param>
  <xsl:param name="l10n.gentext.language">zh_cn</xsl:param>
  <xsl:param name="toc.section.depth">1</xsl:param>
</xsl:stylesheet>
