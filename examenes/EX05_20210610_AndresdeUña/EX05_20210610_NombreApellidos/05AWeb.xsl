<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : 05AWeb.xsl
    Created on : 10 de junio de 2021, 8:46
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
                <title>05WEB.xsl Andrés de Uña</title>
                <style>
                    table, tr, td, th{border: 2px solid yellow;}
                </style>
                <link rel="stylesheet" href="estilo.css" type="text/css"/>
            </head>
            <body>
                <h1> 
                    <xsl:value-of select="concat('Base de datos: ',//database/@name)"/> 
                </h1>
           
           
        <xsl:apply-templates select="mysqldump/database/table_data[@name='DEPART' or @name='EMPLE']"/>
                
            </body>
        </html>
    </xsl:template>

    <xsl:template match="mysqldump/database/table_data[@name='DEPART' or @name='EMPLE']">
            <h2>Tabla: <xsl:value-of select="@name"/></h2>
            <table>
                <xsl:apply-templates select="row"/>
            </table>
    </xsl:template>

    <xsl:template match="row">
        <tr>
            <xsl:apply-templates select="field"/>
        </tr>
    </xsl:template>
    
    <xsl:template match="field">
        <td>
            <xsl:value-of select="."/>
        </td>
    </xsl:template>
    
    
</xsl:stylesheet>
