<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : 05BWeb.xsl
    Created on : 15 de junio de 2021, 13:11
    Author     : daw1
    Description:
        Purpose of transformation follows.
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html"/>

    <!-- TODO customize transformation rules 
         syntax recommendation http://www.w3.org/TR/xslt 
    -->
    <xsl:template match="/">
        <html>
            <head>
                <title>05BWeb.xsl Andrés</title>
                 <style>
                    table, tr, td, th{border: 2px solid yellow;}
                </style>
                <link rel="stylesheet" href="estilo.css" type="text/css"/>
            </head>
            <body>
                <h1><xsl:value-of select="concat('Base de datos:',//database/@name)"/></h1>
               <xsl:apply-templates select="//table_data[@name='DEPART' or @name='EMPLE']"/>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="//table_data[@name='DEPART' or @name='EMPLE']">
        <tr>
            <xsl:value-of select="@name"/>
        </tr>
    </xsl:template>

</xsl:stylesheet>
