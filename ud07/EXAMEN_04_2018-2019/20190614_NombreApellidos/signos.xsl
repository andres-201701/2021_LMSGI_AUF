<?xml version="1.0" encoding="UTF-8"?>

<!--
Document   : signos.xsl
Created on : 14 de junio de 2019, 11:12
Author     : 
Description:
Mostrar horoscopo / los signos del zodiaco
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  
    <xsl:output method="html"/>
    <xsl:include href="./lib/libWeb.xsl"/>
    <xsl:template match="/">
        <xsl:call-template name="DocTipo"/>
        <html>
            <head>
                <xsl:call-template name="metaWeb">
                    <xsl:with-param name="titulo" select="'Horoscopo Andres de Uña'"/>
                    <xsl:with-param name="descripcion" select="'Horoscopo'"/>
                    <xsl:with-param name="keywords" select="'Horoscopo, xsl, xslt, xml'"/>
                </xsl:call-template>
            </head>
            <body>
                <div id="contenedor">
                    <h1>HOROSCOPO/SIGNOS DEL ZODIACO </h1>
                    <xsl:apply-templates select="//signo"/>
                </div>
            </body>
        </html>
    </xsl:template>
   
    <xsl:template match="//signo">
        <div class="caja">
            <a>
                <xsl:attribute name="href">
                    <xsl:value-of select="concat('horoscopo\',nombre,'\horoscopo.xml')"/>
                </xsl:attribute>
            <img>
                <xsl:attribute name="src">
                    <xsl:value-of select="concat('images\',@id,'.svg')"/>
                </xsl:attribute>
                <xsl:attribute name="alt">
                    <xsl:value-of select="nombre"/>
                </xsl:attribute>
                <xsl:attribute name="style">
                   background-image:url('<xsl:value-of select="concat('images/bg-', @id, '.jpg')"/>')
                </xsl:attribute>
                
            </img>
            </a>
            <div><xsl:value-of select="nombre"/></div>
            <div class="fecha"><xsl:value-of select="fecha"/></div>
        </div>
    </xsl:template>
</xsl:stylesheet>
 
