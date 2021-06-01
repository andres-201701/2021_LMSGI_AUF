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
    <xsl:include href="./lib/libWeb.xsl"/>
    <xsl:template match="/">
        <xsl:call-template name="DocTipo"/>
        <html>
            <head>
                <xsl:call-template name="metaWeb">
                    <xsl:with-param name="titulo" select="'Horoscopo David del Prado'"/>
                    <xsl:with-param name="descripcion" select="'Horoscopo'"/>
                    <xsl:with-param name="keywords" select="'Horoscopo, xsl, xslt, xml'"/>
                </xsl:call-template>
            </head>
            <body>
                <div id="contenedor">
                    <h1>HOROSCOPO <xsl:value-of select="document('signos.xml')//signo[@id=current()//sing/@id]/nombre"/></h1>
                    <xsl:apply-templates select="//signo"/>
                </div>
            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>
