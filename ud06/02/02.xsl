<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : 02.xsl
    Created on : 29 de abril de 2021, 8:38
    Author     : daw1
    Description:
        Purpose of transformation follows.
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html"/>

    <!-- TODO customize transformation rules 
         syntax recommendation http://www.w3.org/TR/xslt 
    -->
    <xsl:template match="/listatickets">
        <html>
            <head>
                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
                <title>02.xsl Andrés</title>
                <meta charset="UTF-8"/>
                <meta name="viewport" content="width=device-width, inital-scale=1.0"/>
                <meta name="author" content="Andres de Uña"/>
                <meta name="application-name" content="AppWeb LMSGI"/>
                <meta name="descripcion" content="Informacion de tickets"/>
                <meta name="keywors" content="tickets, yotal, xslt, xml"/>
                <meta name="robots" content="index, follow"/>
                <link href="ccs/estilo.css" rel="stylesheet" type="text/css"/>
                        
            </head>
            <body>
                <h1>Información de tickets</h1>
                <h2>Listado de tickets</h2>
                <xsl:apply-templates select="ticket"/>
                 Número de tickets: <xsl:value-of select="count(//ticket)"/><br/>
                 Total de Tickets:<xsl:value-of select="sum(//total)"/>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="ticket">
        <h3>Tickets: <xsl:value-of select="numero"/></h3>
        <table>
            <tr>
                <th>Producto</th>
                <th>Precio</th>
            </tr>
            <xsl:apply-templates select="producto"/>
            <tr>
                <th>Total</th>
                <th>
                    <xsl:apply-templates select="total"/>
                </th>
            </tr>
        </table>
        <div>Fecha del ticket 2012-01-20</div>
    </xsl:template>
   
   <xsl:template match="producto">
    <tr>
       <xsl:apply-templates select="*"/>
        
    </tr>
   </xsl:template>
   <xsl:template match="*">
       <td><xsl:value-of select="current()"/></td>
   </xsl:template>
</xsl:stylesheet>
