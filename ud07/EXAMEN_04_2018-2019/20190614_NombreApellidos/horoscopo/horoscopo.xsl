<?xml version="1.0" encoding="UTF-8"?>

<!--
Document   : horoscopo.xsl
Created on : 14 de junio de 2019, 11:12
Author     : 
Description:
Mostrar horoscopo / los signos del zodiaco
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html"/>
    <xsl:include href="../lib/libWeb.xsl"/>
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
                    <figure>
                        <img>
                            <xsl:attribute name="src">
                                <xsl:value-of select="concat('../images/',//sign/@id,'.svg')"/>
                            </xsl:attribute>
                            <xsl:attribute name="alt">
                                <xsl:value-of select="//sing/@id"/>
                            </xsl:attribute>
                            <xsl:attribute name="style">
                                background-image:url('<xsl:value-of select="concat('../images/bg-',//sign/@id,'.jpg')"/>')
                            </xsl:attribute>
                        </img>
                    </figure>
                    <h1>HOROSCOPO <xsl:value-of select="document('../signos.xml')//signo[@id=current()//sing/@id]/nombre"/></h1>
                    <h2>Predicción para hoy <xsl:value-of select="//date"/></h2>
                    <div class="mensaje">
                        <xsl:value-of select="//message"/>
                    </div>
                    
                </div>
            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>
