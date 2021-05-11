<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : 04.xsl
    Created on : 4 de mayo de 2021, 13:12
    Author     : daw1
    Description:
        Purpose of transformation follows.
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
      <xsl:output method="xml" omit-xml-declaration="no"/>

    <!-- TODO customize transformation rules 
         syntax recommendation http://www.w3.org/TR/xslt 
    -->
    <xsl:template match="/">
        <factura>
             <xsl:value-of select="@*"/>
        </factura>
    </xsl:template>
    <xsl:template match="poblacion">
        <xsl:for-each select="datos_emisor/poblacion">
        <poblacion>
             <xsl:value-of select="@*"/>
        </poblacion>
        </xsl:for-each>
    </xsl:template>
    <xsl:template match="@*">
        <xsl:copy>
            <xsl:apply-templates select="@*"/>
        </xsl:copy>
    </xsl:template>
    <xsl:template match="@*">
        <xsl:elemet name="{name()}">
            <xsl:value-of select="."/>
        </xsl:elemet>
        
    </xsl:template>

</xsl:stylesheet>

  
  
  
  
  
