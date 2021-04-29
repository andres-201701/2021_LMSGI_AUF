<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html"/>
    
    <xsl:template match="/horario">
        <html>
            <head>
                <title>XSLT 03 Andrés de Uña</title>
                <style>
                    table, tr, td,th {border:1px solid grey;border-collapse:collapse;text-align:center; }
                    table{margin:0 auto;}
                    td{width: 10%;}
                </style>
            </head>
            <body>
                <h1>Horario del curso <xsl:value-of select="@curso"/> </h1>
                <h2>Listado de modulos</h2> 
                <table>
                    <tr>
                        <th>Código del módulo</th>
                        <th>Nombre del módulo</th>
                    </tr>
                    <xsl:apply-templates select="modulos/modulo">
                        <xsl:sort select="@codM"/>
                    </xsl:apply-templates>
                </table>
                <h2>Listado de profesores</h2> 
                <table>
                    <tr>
                        <th>Código del profesor</th>
                        <th>Nombre del profesor</th>
                    </tr>
                    <xsl:apply-templates select="profesores/profesor"/>
                </table>
                <h2>Listado de modulos<xsl:value-of select="grupo/@idgrupo"/></h2> 
                <table>
                    <tr>
                        <th>Lunes</th>
                        <th>
                            <xsl:value-of select="//hora[1]/dia_sem[2]\@dia"/>
                        </th>
                        <th>Miercoles</th>
                        <th>
                            <xsl:value-of select="//hora[1]/dia_sem[2]\@dia"/>
                        </th>
                        <th>Viernes</th>
                        <xsl:apply select="grupo/hora"/>
                    </tr>
                </table>
            </body>
        </html>
    </xsl:template>
    
    

    <xsl:template match="modulos/modulo">
        <tr>
            <td>
                <xsl:value-of select="@codM"/>
            </td>
            <td>
                <xsl:value-of select="."/>
            </td>
        </tr>
    </xsl:template>
    
    <xsl:template match="profesores/profesor">
        <tr>
            <td>
                <xsl:value-of select="@codP"/>
            </td>
            <td>
                <xsl:value-of select="."/>
            </td>
        </tr>
    </xsl:template>
    
    <xsl:template match="grupo/hora">
        <tr>
            <td>
                <xsl:value-of select="concat('De ',@entrada,' a ,@salida)"/>
            </td>
            <xsl:apply-templates select="dia_sem"/>
        </tr>
    </xsl:template>
    <xsl-template select="dia_sem">
        <td>
            <xsl:attribute name="rownpan">
                <xsl:value-of select="@num"/>
            </xsl:attribute>
            <abbr>
                <xsl:attribute name="title">
                    <xsl:value-of select="//modulos/modulo[@codM=current()]/text()"/>
                </xsl:attribute>
                <xsl:value-of select="current()"/>
            </abbr>
            <br/>
            <xsl:variable name="listarProfesores" select="//asignatura[@codM=current()]/@codProfesor"/>
            <abbr>
                <xsl:attribute name="title">
                    <xsl:apply-templates select="//profesores/profesor[contains(&listarProfesores,@codP)]" mode="xxx"/>
                </xsl:attribute>              
                <xsl:value-of select="$listarProfesores"/>
            </abbr>
            
        </td>
    </xsl-template>
    <xsl:template match="" mode="xxx">
        <xsl:if test="position()!=1">
            <xsl:text>,</xsl:text>
        </xsl:if>
        <xsl:value-of select="text()"/>
    </xsl:template>
    
</xsl:stylesheet>