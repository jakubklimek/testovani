<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" version="2.0" xmlns:c="https://schemas.dataspecer.com/xsd/core/" xmlns:ns0="https://slovník.gov.cz/legislativní/sbírka/111/2009/pojem/" xmlns:ns1="https://slovník.gov.cz/agendový/104/pojem/" xmlns:ns2="https://slovník.gov.cz/generický/adresy/pojem/">
  <xsl:import href="../../datova-schranka/datova-schranka/lifting.xslt"/>
  <xsl:import href="../../ustanoveni-pravniho-predpisu/ustanoveni-pravniho-predpisu/lifting.xslt"/>
  <xsl:import href="../../pracoviste/pracoviste/lifting.xslt"/>
  <xsl:import href="../../adresni-misto/adresni-misto/lifting.xslt"/>
  <xsl:output method="xml" version="1.0" encoding="utf-8" media-type="application/rdf+xml" indent="yes"/>
  <xsl:template match="/orgán-veřejné-moci">
    <rdf:RDF>
      <xsl:variable name="result">
        <xsl:sequence>
          <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1657559419870-0fbe-aa7c-b6fd"/>
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
  <xsl:template match="/právnická_osoba_se_svěřenou_působností_v_oblasti_veřejné_správy">
    <rdf:RDF>
      <xsl:variable name="result">
        <xsl:sequence>
          <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1665471766114-9669-dd70-be42"/>
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
  <xsl:template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1657559419870-0fbe-aa7c-b6fd">
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
      <rdf:type rdf:resource="https://slovník.gov.cz/legislativní/sbírka/111/2009/pojem/orgán-veřejné-moci"/>
      <xsl:copy-of select="$arc"/>
      <xsl:for-each select="identifikátor">
        <ns0:má-identifikátor-orgánu-veřejné-moci rdf:datatype="http://www.w3.org/2001/XMLSchema#string">
          <xsl:apply-templates select="@*"/>
          <xsl:value-of select="."/>
        </ns0:má-identifikátor-orgánu-veřejné-moci>
      </xsl:for-each>
      <xsl:for-each select="název">
        <ns0:má-název-orgánu-veřejné-moci>
          <xsl:apply-templates select="@*"/>
          <xsl:value-of select="."/>
        </ns0:má-název-orgánu-veřejné-moci>
      </xsl:for-each>
      <xsl:for-each select="vnitřní-organizační-jednotka">
        <ns0:je-vnitřní-organizační-jednotkou rdf:datatype="http://www.w3.org/2001/XMLSchema#boolean">
          <xsl:apply-templates select="@*"/>
          <xsl:value-of select="."/>
        </ns0:je-vnitřní-organizační-jednotkou>
      </xsl:for-each>
      <xsl:for-each select="ičo">
        <ns0:má-identifikační-číslo-osoby-orgánu-veřejné-moci rdf:datatype="http://www.w3.org/2001/XMLSchema#string">
          <xsl:apply-templates select="@*"/>
          <xsl:value-of select="."/>
        </ns0:má-identifikační-číslo-osoby-orgánu-veřejné-moci>
      </xsl:for-each>
      <xsl:for-each select="datové-schránky">
        <ns0:má-datovou-schránku-orgánu-veřejné-moci>
          <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1657559128500-ff58-4916-90ae"/>
        </ns0:má-datovou-schránku-orgánu-veřejné-moci>
      </xsl:for-each>
      <xsl:for-each select="ustanovení">
        <ns0:vykonává-působnost-na-základě-ustanovení>
          <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1657544512440-5565-5801-8edb"/>
        </ns0:vykonává-působnost-na-základě-ustanovení>
      </xsl:for-each>
      <xsl:for-each select="seznam-kategorií">
        <xsl:variable name="arc">
          <ns1:má-zařazený-subjekt>
            <rdf:Description>
              <xsl:copy-of select="$id//@*"/>
            </rdf:Description>
          </ns1:má-zařazený-subjekt>
        </xsl:variable>
        <top-level>
          <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1657559665658-7ee1-7aa7-a6e5">
            <xsl:with-param name="arc" select="$arc"/>
          </xsl:call-template>
        </top-level>
      </xsl:for-each>
      <xsl:for-each select="adresa-místa-pobytu">
        <ns0:má-adresu-místa-pobytu-orgánu-veřejné-moci>
          <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1657559753017-c544-9c6a-abbd"/>
        </ns0:má-adresu-místa-pobytu-orgánu-veřejné-moci>
      </xsl:for-each>
      <xsl:for-each select="adresa-sídla">
        <ns0:má-adresu-sídla-orgánu-veřejné-moci>
          <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1657559753119-bbb1-2a03-a15e"/>
        </ns0:má-adresu-sídla-orgánu-veřejné-moci>
      </xsl:for-each>
      <xsl:for-each select="osoba-v-čele">
        <ns0:stojí-v-čele-orgánu-veřejné-moci>
          <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1657559796268-8b50-672b-9536"/>
        </ns0:stojí-v-čele-orgánu-veřejné-moci>
      </xsl:for-each>
      <xsl:for-each select="zahájení">
        <ns0:má-datum-zahájení-výkonu-působnosti-orgánu-veřejné-moci rdf:datatype="http://www.w3.org/2001/XMLSchema#date">
          <xsl:apply-templates select="@*"/>
          <xsl:value-of select="."/>
        </ns0:má-datum-zahájení-výkonu-působnosti-orgánu-veřejné-moci>
      </xsl:for-each>
      <xsl:for-each select="ukončení">
        <ns1:má-datum-ukončení-výkonu-působnosti-orgánu-veřejné-moci rdf:datatype="http://www.w3.org/2001/XMLSchema#date">
          <xsl:apply-templates select="@*"/>
          <xsl:value-of select="."/>
        </ns1:má-datum-ukončení-výkonu-působnosti-orgánu-veřejné-moci>
      </xsl:for-each>
      <xsl:for-each select="pozastavení-od">
        <ns0:má-pozastavený-výkon-působnosti-orgánu-veřejné-moci-od rdf:datatype="http://www.w3.org/2001/XMLSchema#date">
          <xsl:apply-templates select="@*"/>
          <xsl:value-of select="."/>
        </ns0:má-pozastavený-výkon-působnosti-orgánu-veřejné-moci-od>
      </xsl:for-each>
      <xsl:for-each select="pozastavení-do">
        <ns0:má-pozastavený-výkon-působnosti-orgánu-veřejné-moci-do rdf:datatype="http://www.w3.org/2001/XMLSchema#date">
          <xsl:apply-templates select="@*"/>
          <xsl:value-of select="."/>
        </ns0:má-pozastavený-výkon-působnosti-orgánu-veřejné-moci-do>
      </xsl:for-each>
      <xsl:for-each select="přerušení-od">
        <ns0:má-přerušený-výkon-působnosti-orgánu-veřejné-moci-od rdf:datatype="http://www.w3.org/2001/XMLSchema#date">
          <xsl:apply-templates select="@*"/>
          <xsl:value-of select="."/>
        </ns0:má-přerušený-výkon-působnosti-orgánu-veřejné-moci-od>
      </xsl:for-each>
      <xsl:for-each select="přerušení-do">
        <ns0:má-přerušený-výkon-působnosti-orgánu-veřejné-moci-do rdf:datatype="http://www.w3.org/2001/XMLSchema#date">
          <xsl:apply-templates select="@*"/>
          <xsl:value-of select="."/>
        </ns0:má-přerušený-výkon-působnosti-orgánu-veřejné-moci-do>
      </xsl:for-each>
      <xsl:for-each select="pracoviště-ovm">
        <ns0:má-pracoviště-vykonávající-úkon>
          <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1657560056054-d880-7f9a-b210"/>
        </ns0:má-pracoviště-vykonávající-úkon>
      </xsl:for-each>
    </rdf:Description>
  </xsl:template>
  <xsl:template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1665471766114-9669-dd70-be42">
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
      <rdf:type rdf:resource="https://slovník.gov.cz/legislativní/sbírka/111/2009/pojem/právnická-osoba-se-svěřenou-působností-v-oblasti-veřejné-správy"/>
      <xsl:copy-of select="$arc"/>
      <xsl:for-each select="identifikátor">
        <ns0:má-identifikátor-orgánu-veřejné-moci rdf:datatype="http://www.w3.org/2001/XMLSchema#string">
          <xsl:apply-templates select="@*"/>
          <xsl:value-of select="."/>
        </ns0:má-identifikátor-orgánu-veřejné-moci>
      </xsl:for-each>
      <xsl:for-each select="název">
        <ns0:má-název-orgánu-veřejné-moci>
          <xsl:apply-templates select="@*"/>
          <xsl:value-of select="."/>
        </ns0:má-název-orgánu-veřejné-moci>
      </xsl:for-each>
      <xsl:for-each select="vnitřní-organizační-jednotka">
        <ns0:je-vnitřní-organizační-jednotkou rdf:datatype="http://www.w3.org/2001/XMLSchema#boolean">
          <xsl:apply-templates select="@*"/>
          <xsl:value-of select="."/>
        </ns0:je-vnitřní-organizační-jednotkou>
      </xsl:for-each>
      <xsl:for-each select="ičo">
        <ns0:má-identifikační-číslo-osoby-orgánu-veřejné-moci rdf:datatype="http://www.w3.org/2001/XMLSchema#string">
          <xsl:apply-templates select="@*"/>
          <xsl:value-of select="."/>
        </ns0:má-identifikační-číslo-osoby-orgánu-veřejné-moci>
      </xsl:for-each>
      <xsl:for-each select="datové-schránky">
        <ns0:má-datovou-schránku-orgánu-veřejné-moci>
          <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1657559128500-ff58-4916-90ae"/>
        </ns0:má-datovou-schránku-orgánu-veřejné-moci>
      </xsl:for-each>
      <xsl:for-each select="ustanovení">
        <ns0:vykonává-působnost-na-základě-ustanovení>
          <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1657544512440-5565-5801-8edb"/>
        </ns0:vykonává-působnost-na-základě-ustanovení>
      </xsl:for-each>
      <xsl:for-each select="seznam-kategorií">
        <xsl:variable name="arc">
          <ns1:má-zařazený-subjekt>
            <rdf:Description>
              <xsl:copy-of select="$id//@*"/>
            </rdf:Description>
          </ns1:má-zařazený-subjekt>
        </xsl:variable>
        <top-level>
          <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1657559665658-7ee1-7aa7-a6e5">
            <xsl:with-param name="arc" select="$arc"/>
          </xsl:call-template>
        </top-level>
      </xsl:for-each>
      <xsl:for-each select="adresa-místa-pobytu">
        <ns0:má-adresu-místa-pobytu-orgánu-veřejné-moci>
          <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1657559753017-c544-9c6a-abbd"/>
        </ns0:má-adresu-místa-pobytu-orgánu-veřejné-moci>
      </xsl:for-each>
      <xsl:for-each select="adresa-sídla">
        <ns0:má-adresu-sídla-orgánu-veřejné-moci>
          <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1657559753119-bbb1-2a03-a15e"/>
        </ns0:má-adresu-sídla-orgánu-veřejné-moci>
      </xsl:for-each>
      <xsl:for-each select="osoba-v-čele">
        <ns0:stojí-v-čele-orgánu-veřejné-moci>
          <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1657559796268-8b50-672b-9536"/>
        </ns0:stojí-v-čele-orgánu-veřejné-moci>
      </xsl:for-each>
      <xsl:for-each select="zahájení">
        <ns0:má-datum-zahájení-výkonu-působnosti-orgánu-veřejné-moci rdf:datatype="http://www.w3.org/2001/XMLSchema#date">
          <xsl:apply-templates select="@*"/>
          <xsl:value-of select="."/>
        </ns0:má-datum-zahájení-výkonu-působnosti-orgánu-veřejné-moci>
      </xsl:for-each>
      <xsl:for-each select="ukončení">
        <ns1:má-datum-ukončení-výkonu-působnosti-orgánu-veřejné-moci rdf:datatype="http://www.w3.org/2001/XMLSchema#date">
          <xsl:apply-templates select="@*"/>
          <xsl:value-of select="."/>
        </ns1:má-datum-ukončení-výkonu-působnosti-orgánu-veřejné-moci>
      </xsl:for-each>
      <xsl:for-each select="pozastavení-od">
        <ns0:má-pozastavený-výkon-působnosti-orgánu-veřejné-moci-od rdf:datatype="http://www.w3.org/2001/XMLSchema#date">
          <xsl:apply-templates select="@*"/>
          <xsl:value-of select="."/>
        </ns0:má-pozastavený-výkon-působnosti-orgánu-veřejné-moci-od>
      </xsl:for-each>
      <xsl:for-each select="pozastavení-do">
        <ns0:má-pozastavený-výkon-působnosti-orgánu-veřejné-moci-do rdf:datatype="http://www.w3.org/2001/XMLSchema#date">
          <xsl:apply-templates select="@*"/>
          <xsl:value-of select="."/>
        </ns0:má-pozastavený-výkon-působnosti-orgánu-veřejné-moci-do>
      </xsl:for-each>
      <xsl:for-each select="přerušení-od">
        <ns0:má-přerušený-výkon-působnosti-orgánu-veřejné-moci-od rdf:datatype="http://www.w3.org/2001/XMLSchema#date">
          <xsl:apply-templates select="@*"/>
          <xsl:value-of select="."/>
        </ns0:má-přerušený-výkon-působnosti-orgánu-veřejné-moci-od>
      </xsl:for-each>
      <xsl:for-each select="přerušení-do">
        <ns0:má-přerušený-výkon-působnosti-orgánu-veřejné-moci-do rdf:datatype="http://www.w3.org/2001/XMLSchema#date">
          <xsl:apply-templates select="@*"/>
          <xsl:value-of select="."/>
        </ns0:má-přerušený-výkon-působnosti-orgánu-veřejné-moci-do>
      </xsl:for-each>
      <xsl:for-each select="pracoviště-ovm">
        <ns0:má-pracoviště-vykonávající-úkon>
          <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1657560056054-d880-7f9a-b210"/>
        </ns0:má-pracoviště-vykonávající-úkon>
      </xsl:for-each>
      <xsl:for-each select="má_právní_formu_osoby">
        <ns0:má-právní-formu-osoby>
          <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1665471782991-9a6f-f47a-bb23"/>
        </ns0:má-právní-formu-osoby>
      </xsl:for-each>
    </rdf:Description>
  </xsl:template>
  <xsl:template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1657559665658-7ee1-7aa7-a6e5">
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
      <rdf:type rdf:resource="https://slovník.gov.cz/legislativní/sbírka/111/2009/pojem/zařazení-do-kategorie"/>
      <xsl:copy-of select="$arc"/>
      <xsl:for-each select="kategorie">
        <ns1:zařazuje-do-kategorie>
          <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1657559683351-771d-0f7f-a9ff"/>
        </ns1:zařazuje-do-kategorie>
      </xsl:for-each>
      <xsl:for-each select="zařazení-od">
        <ns1:má-datum-zařazení-do-kategorie rdf:datatype="http://www.w3.org/2001/XMLSchema#date">
          <xsl:apply-templates select="@*"/>
          <xsl:value-of select="."/>
        </ns1:má-datum-zařazení-do-kategorie>
      </xsl:for-each>
      <xsl:for-each select="zařazení-do">
        <ns1:má-datum-vyřazení-z-kategorie rdf:datatype="http://www.w3.org/2001/XMLSchema#date">
          <xsl:apply-templates select="@*"/>
          <xsl:value-of select="."/>
        </ns1:má-datum-vyřazení-z-kategorie>
      </xsl:for-each>
    </rdf:Description>
  </xsl:template>
  <xsl:template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1657559753017-c544-9c6a-abbd">
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
      <rdf:type rdf:resource="https://slovník.gov.cz/legislativní/sbírka/111/2009/pojem/adresní-místo"/>
      <xsl:copy-of select="$arc"/>
    </rdf:Description>
  </xsl:template>
  <xsl:template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1657559753119-bbb1-2a03-a15e">
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
      <rdf:type rdf:resource="https://slovník.gov.cz/legislativní/sbírka/111/2009/pojem/adresní-místo"/>
      <xsl:copy-of select="$arc"/>
      <xsl:for-each select="kód_adresního_místa">
        <ns2:kód-adresního-místa>
          <xsl:apply-templates select="@*"/>
          <xsl:value-of select="."/>
        </ns2:kód-adresního-místa>
      </xsl:for-each>
    </rdf:Description>
  </xsl:template>
  <xsl:template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1657559796268-8b50-672b-9536">
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
      <rdf:type rdf:resource="https://slovník.gov.cz/legislativní/sbírka/111/2009/pojem/osoba-stojící-v-čele-orgánu-veřejné-moci"/>
      <xsl:copy-of select="$arc"/>
      <xsl:for-each select="jméno">
        <ns0:má-jméno-a-příjmení-osoby-stojící-v-čele-orgánu-veřejné-moci rdf:datatype="http://www.w3.org/2001/XMLSchema#string">
          <xsl:apply-templates select="@*"/>
          <xsl:value-of select="."/>
        </ns0:má-jméno-a-příjmení-osoby-stojící-v-čele-orgánu-veřejné-moci>
      </xsl:for-each>
    </rdf:Description>
  </xsl:template>
  <xsl:template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1665471782991-9a6f-f47a-bb23">
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
      <rdf:type rdf:resource="https://slovník.gov.cz/legislativní/sbírka/111/2009/pojem/právní-forma"/>
      <xsl:copy-of select="$arc"/>
    </rdf:Description>
  </xsl:template>
  <xsl:template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1657559683351-771d-0f7f-a9ff">
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
      <rdf:type rdf:resource="https://slovník.gov.cz/legislativní/sbírka/111/2009/pojem/kategorie"/>
      <xsl:copy-of select="$arc"/>
    </rdf:Description>
  </xsl:template>
  <xsl:template match="@*|*"/>
</xsl:stylesheet>
