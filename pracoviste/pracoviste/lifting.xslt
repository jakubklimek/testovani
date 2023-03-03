<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" version="2.0" xmlns:c="https://schemas.dataspecer.com/xsd/core/" xmlns:ns0="https://slovník.gov.cz/legislativní/sbírka/111/2009/pojem/" xmlns:ns1="https://slovník.gov.cz/agendový/104/pojem/">
  <xsl:import href="../../adresni-misto/adresni-misto/lifting.xslt"/>
  <xsl:output method="xml" version="1.0" encoding="utf-8" media-type="application/rdf+xml" indent="yes"/>
  <xsl:template match="/pracoviště">
    <rdf:RDF>
      <xsl:variable name="result">
        <xsl:sequence>
          <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1657560056054-d880-7f9a-b210"/>
        </xsl:sequence>
      </xsl:variable>
      <xsl:for-each select="$result">
        <xsl:copy>
          <xsl:call-template name="remove-top"/>
        </xsl:copy>
      </xsl:for-each>
      <xsl:for-each select="$result//top-level/node()">
        <xsl:copy>
          <xsl:call-template name="remove-top"/>
        </xsl:copy>
      </xsl:for-each>
    </rdf:RDF>
  </xsl:template>
  <xsl:template match="@xml:lang">
    <xsl:copy-of select="."/>
  </xsl:template>
  <xsl:template name="remove-top">
    <xsl:for-each select="@*">
      <xsl:copy/>
    </xsl:for-each>
    <xsl:for-each select="node()[not(. instance of element(top-level))]">
      <xsl:copy>
        <xsl:call-template name="remove-top"/>
      </xsl:copy>
    </xsl:for-each>
  </xsl:template>
  <xsl:template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1657560056054-d880-7f9a-b210">
    <xsl:param name="arc" select="()"/>
    <xsl:param name="no_iri" select="false()"/>
    <rdf:Description>
      <xsl:apply-templates select="@*"/>
      <xsl:variable name="id">
        <id>
          <xsl:choose>
            <xsl:when test="c:iri and not($no_iri)">
              <xsl:attribute name="rdf:about">
                <xsl:value-of select="c:iri"/>
              </xsl:attribute>
            </xsl:when>
            <xsl:otherwise>
              <xsl:attribute name="rdf:nodeID">
                <xsl:value-of select="generate-id()"/>
              </xsl:attribute>
            </xsl:otherwise>
          </xsl:choose>
        </id>
      </xsl:variable>
      <xsl:copy-of select="$id//@*"/>
      <rdf:type rdf:resource="https://slovník.gov.cz/legislativní/sbírka/111/2009/pojem/pracoviště"/>
      <xsl:copy-of select="$arc"/>
      <xsl:for-each select="adresa-pr">
        <ns0:má-adresu-pracoviště>
          <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1657559334424-059d-9a4b-9c94"/>
        </ns0:má-adresu-pracoviště>
      </xsl:for-each>
      <xsl:for-each select="adresa-pr-txt">
        <ns1:má-adresu-pracoviště-neevidovanou-v-rúian rdf:datatype="http://www.w3.org/2001/XMLSchema#string">
          <xsl:apply-templates select="@*"/>
          <xsl:value-of select="."/>
        </ns1:má-adresu-pracoviště-neevidovanou-v-rúian>
      </xsl:for-each>
      <xsl:for-each select="stát-pr">
        <ns1:má-stát-pracoviště>
          <xsl:attribute name="rdf:resource">
            <xsl:value-of select="."/>
          </xsl:attribute>
        </ns1:má-stát-pracoviště>
      </xsl:for-each>
      <xsl:for-each select="otevření">
        <ns1:má-datum-otevření-pracoviště rdf:datatype="http://www.w3.org/2001/XMLSchema#date">
          <xsl:apply-templates select="@*"/>
          <xsl:value-of select="."/>
        </ns1:má-datum-otevření-pracoviště>
      </xsl:for-each>
      <xsl:for-each select="uzavření">
        <ns1:má-datum-uzavření-pracoviště rdf:datatype="http://www.w3.org/2001/XMLSchema#date">
          <xsl:apply-templates select="@*"/>
          <xsl:value-of select="."/>
        </ns1:má-datum-uzavření-pracoviště>
      </xsl:for-each>
    </rdf:Description>
  </xsl:template>
  <xsl:template match="@*|*"/>
</xsl:stylesheet>
