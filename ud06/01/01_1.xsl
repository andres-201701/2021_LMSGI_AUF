<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : 01-1.xsl
    Created on : 20 de abril de 2021, 12:32
    Author     : amor
    Description:
        Solucion usando for
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html"/>

    <!-- TODO customize transformation rules 
         syntax recommendation http://www.w3.org/TR/xslt 
    -->
    <xsl:template match="/edificio">
        <html>
            <head>
                <title>XLST 01 Nombre y Apellidos</title>
            </head>
            <body>
                <h1>Información de las viviendas</h1>
                <!-- <xsl:apply-templates select="vivienda"/> -->
                <xsl:for-each select="vivienda">
                    <div>
                        Piso: <xsl:value-of select="piso"/>
                        Puerta: <xsl:value-of select="puerta"/>
                        <ol>
                            <!-- <xsl:apply-templates select="vecinos/nombre"/>-->
                            <xsl:for-each select="vecinos/nombre">
                                <li>
                                    <xsl:value-of select="current()/text()"/>
                                </li>
                            </xsl:for-each>
                        </ol>
                    </div>
                </xsl:for-each>
                <div>Número de viviendas <xsl:value-of select="count(vivienda)"/></div>
                <div>Número total de vecinos <xsl:value-of select="count(//nombre)"/></div>
            </body>
        </html>
    </xsl:template>
    <!--
    <xsl:template match="vivienda">
        <div>
            Piso: <xsl:value-of select="piso"/>
            Puerta: <xsl:value-of select="puerta"/>
            <ol>
                <xsl:apply-templates select="vecinos/nombre"/>
            </ol>
        </div>
    </xsl:template>
    <xsl:template match="vecinos/nombre">
        <li>
            <xsl:value-of select="current()/text()"/>
        </li>
    </xsl:template>
        -->
</xsl:stylesheet>
