<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:sp="http://www.w3.org/2005/sparql-results#" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" version="2.0" xmlns:c="https://schemas.dataspecer.com/xsd/core/">
  <xsl:import href="../../datova-schranka/datova-schranka/lowering.xslt"/>
  <xsl:import href="../../ustanoveni-pravniho-predpisu/ustanoveni-pravniho-predpisu/lowering.xslt"/>
  <xsl:import href="../../pracoviste/pracoviste/lowering.xslt"/>
  <xsl:import href="../../adresni-misto/adresni-misto/lowering.xslt"/>
  <xsl:output method="xml" version="1.0" encoding="utf-8" indent="yes"/>
  <xsl:param name="subj" select="'s'"/>
  <xsl:param name="pred" select="'p'"/>
  <xsl:param name="obj" select="'o'"/>
  <xsl:variable name="type" select="'http://www.w3.org/1999/02/22-rdf-syntax-ns#type'"/>
  <xsl:function name="c:id-key">
    <xsl:param name="node"/>
    <xsl:value-of select="concat(namespace-uri($node),'|',local-name($node),'|',string($node))"/>
  </xsl:function>
  <xsl:template match="/sp:sparql">
    <xsl:apply-templates select="sp:results/sp:result"/>
  </xsl:template>
  <xsl:template match="sp:result[sp:binding[@name=$pred]/sp:uri/text()=$type and sp:binding[@name=$obj]/sp:uri/text()=&#34;https://slovník.gov.cz/legislativní/sbírka/111/2009/pojem/orgán-veřejné-moci&#34;]">
    <orgán-veřejné-moci>
      <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1657559419870-0fbe-aa7c-b6fd">
        <xsl:with-param name="id">
          <xsl:copy-of select="sp:binding[@name=$subj]/*"/>
        </xsl:with-param>
      </xsl:call-template>
    </orgán-veřejné-moci>
  </xsl:template>
  <xsl:template match="sp:result[sp:binding[@name=$pred]/sp:uri/text()=$type and sp:binding[@name=$obj]/sp:uri/text()=&#34;https://slovník.gov.cz/legislativní/sbírka/111/2009/pojem/právnická-osoba-se-svěřenou-působností-v-oblasti-veřejné-správy&#34;]">
    <právnická_osoba_se_svěřenou_působností_v_oblasti_veřejné_správy>
      <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1665471766114-9669-dd70-be42">
        <xsl:with-param name="id">
          <xsl:copy-of select="sp:binding[@name=$subj]/*"/>
        </xsl:with-param>
      </xsl:call-template>
    </právnická_osoba_se_svěřenou_působností_v_oblasti_veřejné_správy>
  </xsl:template>
  <xsl:template match="@xml:lang">
    <xsl:copy-of select="."/>
  </xsl:template>
  <xsl:template match="sp:literal">
    <xsl:apply-templates select="@*"/>
    <xsl:value-of select="."/>
  </xsl:template>
  <xsl:template match="sp:uri">
    <xsl:value-of select="."/>
  </xsl:template>
  <xsl:template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1657559419870-0fbe-aa7c-b6fd">
    <xsl:param name="id"/>
    <xsl:param name="type_name" select="()"/>
    <xsl:param name="no_iri" select="false()"/>
    <xsl:if test="not(empty($type_name))">
      <xsl:attribute name="xsi:type">
        <xsl:value-of select="$type_name"/>
      </xsl:attribute>
    </xsl:if>
    <xsl:if test="not($no_iri)">
      <xsl:for-each select="$id/sp:uri">
        <c:iri>
          <xsl:value-of select="."/>
        </c:iri>
      </xsl:for-each>
    </xsl:if>
    <xsl:variable name="id_test">
      <xsl:value-of select="c:id-key($id/*)"/>
    </xsl:variable>
    <xsl:for-each select="//sp:result[sp:binding[@name=$subj]/*[$id_test = c:id-key(.)] and sp:binding[@name=$pred]/sp:uri/text()=&#34;https://slovník.gov.cz/legislativní/sbírka/111/2009/pojem/má-identifikátor-orgánu-veřejné-moci&#34;]">
      <identifikátor>
        <xsl:apply-templates select="sp:binding[@name=$obj]/sp:literal"/>
      </identifikátor>
    </xsl:for-each>
    <xsl:for-each select="//sp:result[sp:binding[@name=$subj]/*[$id_test = c:id-key(.)] and sp:binding[@name=$pred]/sp:uri/text()=&#34;https://slovník.gov.cz/legislativní/sbírka/111/2009/pojem/má-název-orgánu-veřejné-moci&#34;]">
      <název>
        <xsl:apply-templates select="sp:binding[@name=$obj]/sp:literal"/>
      </název>
    </xsl:for-each>
    <xsl:for-each select="//sp:result[sp:binding[@name=$subj]/*[$id_test = c:id-key(.)] and sp:binding[@name=$pred]/sp:uri/text()=&#34;https://slovník.gov.cz/legislativní/sbírka/111/2009/pojem/je-vnitřní-organizační-jednotkou&#34;]">
      <vnitřní-organizační-jednotka>
        <xsl:apply-templates select="sp:binding[@name=$obj]/sp:literal"/>
      </vnitřní-organizační-jednotka>
    </xsl:for-each>
    <xsl:for-each select="//sp:result[sp:binding[@name=$subj]/*[$id_test = c:id-key(.)] and sp:binding[@name=$pred]/sp:uri/text()=&#34;https://slovník.gov.cz/legislativní/sbírka/111/2009/pojem/má-identifikační-číslo-osoby-orgánu-veřejné-moci&#34;]">
      <ičo>
        <xsl:apply-templates select="sp:binding[@name=$obj]/sp:literal"/>
      </ičo>
    </xsl:for-each>
    <xsl:for-each select="//sp:result[sp:binding[@name=$subj]/*[$id_test = c:id-key(.)] and sp:binding[@name=$pred]/sp:uri/text()=&#34;https://slovník.gov.cz/legislativní/sbírka/111/2009/pojem/má-datovou-schránku-orgánu-veřejné-moci&#34;]">
      <datové-schránky>
        <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1657559128500-ff58-4916-90ae">
          <xsl:with-param name="id">
            <xsl:copy-of select="sp:binding[@name=$obj]/*"/>
          </xsl:with-param>
        </xsl:call-template>
      </datové-schránky>
    </xsl:for-each>
    <xsl:for-each select="//sp:result[sp:binding[@name=$subj]/*[$id_test = c:id-key(.)] and sp:binding[@name=$pred]/sp:uri/text()=&#34;https://slovník.gov.cz/legislativní/sbírka/111/2009/pojem/vykonává-působnost-na-základě-ustanovení&#34;]">
      <ustanovení>
        <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1657544512440-5565-5801-8edb">
          <xsl:with-param name="id">
            <xsl:copy-of select="sp:binding[@name=$obj]/*"/>
          </xsl:with-param>
        </xsl:call-template>
      </ustanovení>
    </xsl:for-each>
    <xsl:for-each select="//sp:result[sp:binding[@name=$obj]/*[$id_test = c:id-key(.)] and sp:binding[@name=$pred]/sp:uri/text()=&#34;https://slovník.gov.cz/agendový/104/pojem/má-zařazený-subjekt&#34;]">
      <seznam-kategorií>
        <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1657559665658-7ee1-7aa7-a6e5">
          <xsl:with-param name="id">
            <xsl:copy-of select="sp:binding[@name=$subj]/*"/>
          </xsl:with-param>
        </xsl:call-template>
      </seznam-kategorií>
    </xsl:for-each>
    <xsl:for-each select="//sp:result[sp:binding[@name=$subj]/*[$id_test = c:id-key(.)] and sp:binding[@name=$pred]/sp:uri/text()=&#34;https://slovník.gov.cz/legislativní/sbírka/111/2009/pojem/má-adresu-místa-pobytu-orgánu-veřejné-moci&#34;]">
      <adresa-místa-pobytu>
        <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1657559753017-c544-9c6a-abbd">
          <xsl:with-param name="id">
            <xsl:copy-of select="sp:binding[@name=$obj]/*"/>
          </xsl:with-param>
        </xsl:call-template>
      </adresa-místa-pobytu>
    </xsl:for-each>
    <xsl:for-each select="//sp:result[sp:binding[@name=$subj]/*[$id_test = c:id-key(.)] and sp:binding[@name=$pred]/sp:uri/text()=&#34;https://slovník.gov.cz/legislativní/sbírka/111/2009/pojem/má-adresu-sídla-orgánu-veřejné-moci&#34;]">
      <adresa-sídla>
        <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1657559753119-bbb1-2a03-a15e">
          <xsl:with-param name="id">
            <xsl:copy-of select="sp:binding[@name=$obj]/*"/>
          </xsl:with-param>
        </xsl:call-template>
      </adresa-sídla>
    </xsl:for-each>
    <xsl:for-each select="//sp:result[sp:binding[@name=$subj]/*[$id_test = c:id-key(.)] and sp:binding[@name=$pred]/sp:uri/text()=&#34;https://slovník.gov.cz/legislativní/sbírka/111/2009/pojem/stojí-v-čele-orgánu-veřejné-moci&#34;]">
      <osoba-v-čele>
        <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1657559796268-8b50-672b-9536">
          <xsl:with-param name="id">
            <xsl:copy-of select="sp:binding[@name=$obj]/*"/>
          </xsl:with-param>
        </xsl:call-template>
      </osoba-v-čele>
    </xsl:for-each>
    <xsl:for-each select="//sp:result[sp:binding[@name=$subj]/*[$id_test = c:id-key(.)] and sp:binding[@name=$pred]/sp:uri/text()=&#34;https://slovník.gov.cz/legislativní/sbírka/111/2009/pojem/má-datum-zahájení-výkonu-působnosti-orgánu-veřejné-moci&#34;]">
      <zahájení>
        <xsl:apply-templates select="sp:binding[@name=$obj]/sp:literal"/>
      </zahájení>
    </xsl:for-each>
    <xsl:for-each select="//sp:result[sp:binding[@name=$subj]/*[$id_test = c:id-key(.)] and sp:binding[@name=$pred]/sp:uri/text()=&#34;https://slovník.gov.cz/agendový/104/pojem/má-datum-ukončení-výkonu-působnosti-orgánu-veřejné-moci&#34;]">
      <ukončení>
        <xsl:apply-templates select="sp:binding[@name=$obj]/sp:literal"/>
      </ukončení>
    </xsl:for-each>
    <xsl:for-each select="//sp:result[sp:binding[@name=$subj]/*[$id_test = c:id-key(.)] and sp:binding[@name=$pred]/sp:uri/text()=&#34;https://slovník.gov.cz/legislativní/sbírka/111/2009/pojem/má-pozastavený-výkon-působnosti-orgánu-veřejné-moci-od&#34;]">
      <pozastavení-od>
        <xsl:apply-templates select="sp:binding[@name=$obj]/sp:literal"/>
      </pozastavení-od>
    </xsl:for-each>
    <xsl:for-each select="//sp:result[sp:binding[@name=$subj]/*[$id_test = c:id-key(.)] and sp:binding[@name=$pred]/sp:uri/text()=&#34;https://slovník.gov.cz/legislativní/sbírka/111/2009/pojem/má-pozastavený-výkon-působnosti-orgánu-veřejné-moci-do&#34;]">
      <pozastavení-do>
        <xsl:apply-templates select="sp:binding[@name=$obj]/sp:literal"/>
      </pozastavení-do>
    </xsl:for-each>
    <xsl:for-each select="//sp:result[sp:binding[@name=$subj]/*[$id_test = c:id-key(.)] and sp:binding[@name=$pred]/sp:uri/text()=&#34;https://slovník.gov.cz/legislativní/sbírka/111/2009/pojem/má-přerušený-výkon-působnosti-orgánu-veřejné-moci-od&#34;]">
      <přerušení-od>
        <xsl:apply-templates select="sp:binding[@name=$obj]/sp:literal"/>
      </přerušení-od>
    </xsl:for-each>
    <xsl:for-each select="//sp:result[sp:binding[@name=$subj]/*[$id_test = c:id-key(.)] and sp:binding[@name=$pred]/sp:uri/text()=&#34;https://slovník.gov.cz/legislativní/sbírka/111/2009/pojem/má-přerušený-výkon-působnosti-orgánu-veřejné-moci-do&#34;]">
      <přerušení-do>
        <xsl:apply-templates select="sp:binding[@name=$obj]/sp:literal"/>
      </přerušení-do>
    </xsl:for-each>
    <xsl:for-each select="//sp:result[sp:binding[@name=$subj]/*[$id_test = c:id-key(.)] and sp:binding[@name=$pred]/sp:uri/text()=&#34;https://slovník.gov.cz/legislativní/sbírka/111/2009/pojem/má-pracoviště-vykonávající-úkon&#34;]">
      <pracoviště-ovm>
        <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1657560056054-d880-7f9a-b210">
          <xsl:with-param name="id">
            <xsl:copy-of select="sp:binding[@name=$obj]/*"/>
          </xsl:with-param>
        </xsl:call-template>
      </pracoviště-ovm>
    </xsl:for-each>
  </xsl:template>
  <xsl:template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1665471766114-9669-dd70-be42">
    <xsl:param name="id"/>
    <xsl:param name="type_name" select="()"/>
    <xsl:param name="no_iri" select="false()"/>
    <xsl:if test="not(empty($type_name))">
      <xsl:attribute name="xsi:type">
        <xsl:value-of select="$type_name"/>
      </xsl:attribute>
    </xsl:if>
    <xsl:if test="not($no_iri)">
      <xsl:for-each select="$id/sp:uri">
        <c:iri>
          <xsl:value-of select="."/>
        </c:iri>
      </xsl:for-each>
    </xsl:if>
    <xsl:variable name="id_test">
      <xsl:value-of select="c:id-key($id/*)"/>
    </xsl:variable>
    <xsl:for-each select="//sp:result[sp:binding[@name=$subj]/*[$id_test = c:id-key(.)] and sp:binding[@name=$pred]/sp:uri/text()=&#34;https://slovník.gov.cz/legislativní/sbírka/111/2009/pojem/má-identifikátor-orgánu-veřejné-moci&#34;]">
      <identifikátor>
        <xsl:apply-templates select="sp:binding[@name=$obj]/sp:literal"/>
      </identifikátor>
    </xsl:for-each>
    <xsl:for-each select="//sp:result[sp:binding[@name=$subj]/*[$id_test = c:id-key(.)] and sp:binding[@name=$pred]/sp:uri/text()=&#34;https://slovník.gov.cz/legislativní/sbírka/111/2009/pojem/má-název-orgánu-veřejné-moci&#34;]">
      <název>
        <xsl:apply-templates select="sp:binding[@name=$obj]/sp:literal"/>
      </název>
    </xsl:for-each>
    <xsl:for-each select="//sp:result[sp:binding[@name=$subj]/*[$id_test = c:id-key(.)] and sp:binding[@name=$pred]/sp:uri/text()=&#34;https://slovník.gov.cz/legislativní/sbírka/111/2009/pojem/je-vnitřní-organizační-jednotkou&#34;]">
      <vnitřní-organizační-jednotka>
        <xsl:apply-templates select="sp:binding[@name=$obj]/sp:literal"/>
      </vnitřní-organizační-jednotka>
    </xsl:for-each>
    <xsl:for-each select="//sp:result[sp:binding[@name=$subj]/*[$id_test = c:id-key(.)] and sp:binding[@name=$pred]/sp:uri/text()=&#34;https://slovník.gov.cz/legislativní/sbírka/111/2009/pojem/má-identifikační-číslo-osoby-orgánu-veřejné-moci&#34;]">
      <ičo>
        <xsl:apply-templates select="sp:binding[@name=$obj]/sp:literal"/>
      </ičo>
    </xsl:for-each>
    <xsl:for-each select="//sp:result[sp:binding[@name=$subj]/*[$id_test = c:id-key(.)] and sp:binding[@name=$pred]/sp:uri/text()=&#34;https://slovník.gov.cz/legislativní/sbírka/111/2009/pojem/má-datovou-schránku-orgánu-veřejné-moci&#34;]">
      <datové-schránky>
        <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1657559128500-ff58-4916-90ae">
          <xsl:with-param name="id">
            <xsl:copy-of select="sp:binding[@name=$obj]/*"/>
          </xsl:with-param>
        </xsl:call-template>
      </datové-schránky>
    </xsl:for-each>
    <xsl:for-each select="//sp:result[sp:binding[@name=$subj]/*[$id_test = c:id-key(.)] and sp:binding[@name=$pred]/sp:uri/text()=&#34;https://slovník.gov.cz/legislativní/sbírka/111/2009/pojem/vykonává-působnost-na-základě-ustanovení&#34;]">
      <ustanovení>
        <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1657544512440-5565-5801-8edb">
          <xsl:with-param name="id">
            <xsl:copy-of select="sp:binding[@name=$obj]/*"/>
          </xsl:with-param>
        </xsl:call-template>
      </ustanovení>
    </xsl:for-each>
    <xsl:for-each select="//sp:result[sp:binding[@name=$obj]/*[$id_test = c:id-key(.)] and sp:binding[@name=$pred]/sp:uri/text()=&#34;https://slovník.gov.cz/agendový/104/pojem/má-zařazený-subjekt&#34;]">
      <seznam-kategorií>
        <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1657559665658-7ee1-7aa7-a6e5">
          <xsl:with-param name="id">
            <xsl:copy-of select="sp:binding[@name=$subj]/*"/>
          </xsl:with-param>
        </xsl:call-template>
      </seznam-kategorií>
    </xsl:for-each>
    <xsl:for-each select="//sp:result[sp:binding[@name=$subj]/*[$id_test = c:id-key(.)] and sp:binding[@name=$pred]/sp:uri/text()=&#34;https://slovník.gov.cz/legislativní/sbírka/111/2009/pojem/má-adresu-místa-pobytu-orgánu-veřejné-moci&#34;]">
      <adresa-místa-pobytu>
        <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1657559753017-c544-9c6a-abbd">
          <xsl:with-param name="id">
            <xsl:copy-of select="sp:binding[@name=$obj]/*"/>
          </xsl:with-param>
        </xsl:call-template>
      </adresa-místa-pobytu>
    </xsl:for-each>
    <xsl:for-each select="//sp:result[sp:binding[@name=$subj]/*[$id_test = c:id-key(.)] and sp:binding[@name=$pred]/sp:uri/text()=&#34;https://slovník.gov.cz/legislativní/sbírka/111/2009/pojem/má-adresu-sídla-orgánu-veřejné-moci&#34;]">
      <adresa-sídla>
        <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1657559753119-bbb1-2a03-a15e">
          <xsl:with-param name="id">
            <xsl:copy-of select="sp:binding[@name=$obj]/*"/>
          </xsl:with-param>
        </xsl:call-template>
      </adresa-sídla>
    </xsl:for-each>
    <xsl:for-each select="//sp:result[sp:binding[@name=$subj]/*[$id_test = c:id-key(.)] and sp:binding[@name=$pred]/sp:uri/text()=&#34;https://slovník.gov.cz/legislativní/sbírka/111/2009/pojem/stojí-v-čele-orgánu-veřejné-moci&#34;]">
      <osoba-v-čele>
        <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1657559796268-8b50-672b-9536">
          <xsl:with-param name="id">
            <xsl:copy-of select="sp:binding[@name=$obj]/*"/>
          </xsl:with-param>
        </xsl:call-template>
      </osoba-v-čele>
    </xsl:for-each>
    <xsl:for-each select="//sp:result[sp:binding[@name=$subj]/*[$id_test = c:id-key(.)] and sp:binding[@name=$pred]/sp:uri/text()=&#34;https://slovník.gov.cz/legislativní/sbírka/111/2009/pojem/má-datum-zahájení-výkonu-působnosti-orgánu-veřejné-moci&#34;]">
      <zahájení>
        <xsl:apply-templates select="sp:binding[@name=$obj]/sp:literal"/>
      </zahájení>
    </xsl:for-each>
    <xsl:for-each select="//sp:result[sp:binding[@name=$subj]/*[$id_test = c:id-key(.)] and sp:binding[@name=$pred]/sp:uri/text()=&#34;https://slovník.gov.cz/agendový/104/pojem/má-datum-ukončení-výkonu-působnosti-orgánu-veřejné-moci&#34;]">
      <ukončení>
        <xsl:apply-templates select="sp:binding[@name=$obj]/sp:literal"/>
      </ukončení>
    </xsl:for-each>
    <xsl:for-each select="//sp:result[sp:binding[@name=$subj]/*[$id_test = c:id-key(.)] and sp:binding[@name=$pred]/sp:uri/text()=&#34;https://slovník.gov.cz/legislativní/sbírka/111/2009/pojem/má-pozastavený-výkon-působnosti-orgánu-veřejné-moci-od&#34;]">
      <pozastavení-od>
        <xsl:apply-templates select="sp:binding[@name=$obj]/sp:literal"/>
      </pozastavení-od>
    </xsl:for-each>
    <xsl:for-each select="//sp:result[sp:binding[@name=$subj]/*[$id_test = c:id-key(.)] and sp:binding[@name=$pred]/sp:uri/text()=&#34;https://slovník.gov.cz/legislativní/sbírka/111/2009/pojem/má-pozastavený-výkon-působnosti-orgánu-veřejné-moci-do&#34;]">
      <pozastavení-do>
        <xsl:apply-templates select="sp:binding[@name=$obj]/sp:literal"/>
      </pozastavení-do>
    </xsl:for-each>
    <xsl:for-each select="//sp:result[sp:binding[@name=$subj]/*[$id_test = c:id-key(.)] and sp:binding[@name=$pred]/sp:uri/text()=&#34;https://slovník.gov.cz/legislativní/sbírka/111/2009/pojem/má-přerušený-výkon-působnosti-orgánu-veřejné-moci-od&#34;]">
      <přerušení-od>
        <xsl:apply-templates select="sp:binding[@name=$obj]/sp:literal"/>
      </přerušení-od>
    </xsl:for-each>
    <xsl:for-each select="//sp:result[sp:binding[@name=$subj]/*[$id_test = c:id-key(.)] and sp:binding[@name=$pred]/sp:uri/text()=&#34;https://slovník.gov.cz/legislativní/sbírka/111/2009/pojem/má-přerušený-výkon-působnosti-orgánu-veřejné-moci-do&#34;]">
      <přerušení-do>
        <xsl:apply-templates select="sp:binding[@name=$obj]/sp:literal"/>
      </přerušení-do>
    </xsl:for-each>
    <xsl:for-each select="//sp:result[sp:binding[@name=$subj]/*[$id_test = c:id-key(.)] and sp:binding[@name=$pred]/sp:uri/text()=&#34;https://slovník.gov.cz/legislativní/sbírka/111/2009/pojem/má-pracoviště-vykonávající-úkon&#34;]">
      <pracoviště-ovm>
        <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1657560056054-d880-7f9a-b210">
          <xsl:with-param name="id">
            <xsl:copy-of select="sp:binding[@name=$obj]/*"/>
          </xsl:with-param>
        </xsl:call-template>
      </pracoviště-ovm>
    </xsl:for-each>
    <xsl:for-each select="//sp:result[sp:binding[@name=$subj]/*[$id_test = c:id-key(.)] and sp:binding[@name=$pred]/sp:uri/text()=&#34;https://slovník.gov.cz/legislativní/sbírka/111/2009/pojem/má-právní-formu-osoby&#34;]">
      <má_právní_formu_osoby>
        <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1665471782991-9a6f-f47a-bb23">
          <xsl:with-param name="id">
            <xsl:copy-of select="sp:binding[@name=$obj]/*"/>
          </xsl:with-param>
        </xsl:call-template>
      </má_právní_formu_osoby>
    </xsl:for-each>
  </xsl:template>
  <xsl:template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1657559665658-7ee1-7aa7-a6e5">
    <xsl:param name="id"/>
    <xsl:param name="type_name" select="()"/>
    <xsl:param name="no_iri" select="false()"/>
    <xsl:if test="not(empty($type_name))">
      <xsl:attribute name="xsi:type">
        <xsl:value-of select="$type_name"/>
      </xsl:attribute>
    </xsl:if>
    <xsl:if test="not($no_iri)">
      <xsl:for-each select="$id/sp:uri">
        <c:iri>
          <xsl:value-of select="."/>
        </c:iri>
      </xsl:for-each>
    </xsl:if>
    <xsl:variable name="id_test">
      <xsl:value-of select="c:id-key($id/*)"/>
    </xsl:variable>
    <xsl:for-each select="//sp:result[sp:binding[@name=$subj]/*[$id_test = c:id-key(.)] and sp:binding[@name=$pred]/sp:uri/text()=&#34;https://slovník.gov.cz/agendový/104/pojem/zařazuje-do-kategorie&#34;]">
      <kategorie>
        <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1657559683351-771d-0f7f-a9ff">
          <xsl:with-param name="id">
            <xsl:copy-of select="sp:binding[@name=$obj]/*"/>
          </xsl:with-param>
        </xsl:call-template>
      </kategorie>
    </xsl:for-each>
    <xsl:for-each select="//sp:result[sp:binding[@name=$subj]/*[$id_test = c:id-key(.)] and sp:binding[@name=$pred]/sp:uri/text()=&#34;https://slovník.gov.cz/agendový/104/pojem/má-datum-zařazení-do-kategorie&#34;]">
      <zařazení-od>
        <xsl:apply-templates select="sp:binding[@name=$obj]/sp:literal"/>
      </zařazení-od>
    </xsl:for-each>
    <xsl:for-each select="//sp:result[sp:binding[@name=$subj]/*[$id_test = c:id-key(.)] and sp:binding[@name=$pred]/sp:uri/text()=&#34;https://slovník.gov.cz/agendový/104/pojem/má-datum-vyřazení-z-kategorie&#34;]">
      <zařazení-do>
        <xsl:apply-templates select="sp:binding[@name=$obj]/sp:literal"/>
      </zařazení-do>
    </xsl:for-each>
  </xsl:template>
  <xsl:template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1657559753017-c544-9c6a-abbd">
    <xsl:param name="id"/>
    <xsl:param name="type_name" select="()"/>
    <xsl:param name="no_iri" select="false()"/>
    <xsl:if test="not(empty($type_name))">
      <xsl:attribute name="xsi:type">
        <xsl:value-of select="$type_name"/>
      </xsl:attribute>
    </xsl:if>
    <xsl:if test="not($no_iri)">
      <xsl:for-each select="$id/sp:uri">
        <c:iri>
          <xsl:value-of select="."/>
        </c:iri>
      </xsl:for-each>
    </xsl:if>
    <xsl:variable name="id_test">
      <xsl:value-of select="c:id-key($id/*)"/>
    </xsl:variable>
  </xsl:template>
  <xsl:template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1657559753119-bbb1-2a03-a15e">
    <xsl:param name="id"/>
    <xsl:param name="type_name" select="()"/>
    <xsl:param name="no_iri" select="false()"/>
    <xsl:if test="not(empty($type_name))">
      <xsl:attribute name="xsi:type">
        <xsl:value-of select="$type_name"/>
      </xsl:attribute>
    </xsl:if>
    <xsl:if test="not($no_iri)">
      <xsl:for-each select="$id/sp:uri">
        <c:iri>
          <xsl:value-of select="."/>
        </c:iri>
      </xsl:for-each>
    </xsl:if>
    <xsl:variable name="id_test">
      <xsl:value-of select="c:id-key($id/*)"/>
    </xsl:variable>
    <xsl:for-each select="//sp:result[sp:binding[@name=$subj]/*[$id_test = c:id-key(.)] and sp:binding[@name=$pred]/sp:uri/text()=&#34;https://slovník.gov.cz/generický/adresy/pojem/kód-adresního-místa&#34;]">
      <kód_adresního_místa>
        <xsl:apply-templates select="sp:binding[@name=$obj]/sp:literal"/>
      </kód_adresního_místa>
    </xsl:for-each>
  </xsl:template>
  <xsl:template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1657559796268-8b50-672b-9536">
    <xsl:param name="id"/>
    <xsl:param name="type_name" select="()"/>
    <xsl:param name="no_iri" select="false()"/>
    <xsl:if test="not(empty($type_name))">
      <xsl:attribute name="xsi:type">
        <xsl:value-of select="$type_name"/>
      </xsl:attribute>
    </xsl:if>
    <xsl:if test="not($no_iri)">
      <xsl:for-each select="$id/sp:uri">
        <c:iri>
          <xsl:value-of select="."/>
        </c:iri>
      </xsl:for-each>
    </xsl:if>
    <xsl:variable name="id_test">
      <xsl:value-of select="c:id-key($id/*)"/>
    </xsl:variable>
    <xsl:for-each select="//sp:result[sp:binding[@name=$subj]/*[$id_test = c:id-key(.)] and sp:binding[@name=$pred]/sp:uri/text()=&#34;https://slovník.gov.cz/legislativní/sbírka/111/2009/pojem/má-jméno-a-příjmení-osoby-stojící-v-čele-orgánu-veřejné-moci&#34;]">
      <jméno>
        <xsl:apply-templates select="sp:binding[@name=$obj]/sp:literal"/>
      </jméno>
    </xsl:for-each>
  </xsl:template>
  <xsl:template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1665471782991-9a6f-f47a-bb23">
    <xsl:param name="id"/>
    <xsl:param name="type_name" select="()"/>
    <xsl:param name="no_iri" select="false()"/>
    <xsl:if test="not(empty($type_name))">
      <xsl:attribute name="xsi:type">
        <xsl:value-of select="$type_name"/>
      </xsl:attribute>
    </xsl:if>
    <xsl:if test="not($no_iri)">
      <xsl:for-each select="$id/sp:uri">
        <c:iri>
          <xsl:value-of select="."/>
        </c:iri>
      </xsl:for-each>
    </xsl:if>
    <xsl:variable name="id_test">
      <xsl:value-of select="c:id-key($id/*)"/>
    </xsl:variable>
  </xsl:template>
  <xsl:template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1657559683351-771d-0f7f-a9ff">
    <xsl:param name="id"/>
    <xsl:param name="type_name" select="()"/>
    <xsl:param name="no_iri" select="false()"/>
    <xsl:if test="not(empty($type_name))">
      <xsl:attribute name="xsi:type">
        <xsl:value-of select="$type_name"/>
      </xsl:attribute>
    </xsl:if>
    <xsl:if test="not($no_iri)">
      <xsl:for-each select="$id/sp:uri">
        <c:iri>
          <xsl:value-of select="."/>
        </c:iri>
      </xsl:for-each>
    </xsl:if>
    <xsl:variable name="id_test">
      <xsl:value-of select="c:id-key($id/*)"/>
    </xsl:variable>
  </xsl:template>
  <xsl:template match="@*|*"/>
</xsl:stylesheet>
