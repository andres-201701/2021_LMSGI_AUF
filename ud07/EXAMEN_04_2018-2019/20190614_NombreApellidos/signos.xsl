<?xml version="1.0" encoding="UTF-8"?>

<!--
Document   : signos.xsl
Created on : 14 de junio de 2019, 11:12
Author     : 
Description:
Mostrar horoscopo / los signos del zodiaco
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <html>
        <head>
              
                
            <title>signos.xsl Andrés de Uña</title>
            <style>
                   
            </style>
            <link rel="stylesheet" href="estilos.css" type="text/css"/>
            <body>
                <h1>Horoscopo/Signo del zodiaco </h1>
                <xsl:apply-templates select="//signo"/>
            </body>
        </head>
    </html>
    <xsl:template match="signo">
        
                <xsl:value-of select="substring(@fecha,9,2)"/>
          
             <xsl:value-of select="prob_precipitacion"/>
        
                <img>
                    <xsl:attribute name="src">
                        <xsl:value-of select="concat('images/',signo,'.svg')"/>
                    </xsl:attribute>
                    <xsl:attribute name="alt">
                        <xsl:value-of select="signo/@id"/>
                    </xsl:attribute>
                    <xsl:attribute name="title">
                        <xsl:value-of select="signo/@id"/>
                    </xsl:attribute>
                </img>
    </xsl:template>
</xsl:stylesheet>
