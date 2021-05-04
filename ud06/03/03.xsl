<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html"/>
    
    <xsl:template match="/horario">
        <html>
            <head>
                <title>XSLT 03 David del Prado Losada</title>
                <style>
                    table, tr, td, th{border: 1px solid grey;}
                </style>
            </head>
            <body>
                <h1>Horario del curso <xsl:value-of select="@curso"/> </h1>
                <h3>Tabla de modulos</h3>
                <table>
                    <tr>
                        <th>Código del módulo</th>
                        <th>Nombre del módulo</th>
                    </tr>
                    <xsl:apply-templates select="modulos/modulo">
                        <xsl:sort select="@codM"/>
                    </xsl:apply-templates>
                </table>
                
                <h3>Tabla de profesores</h3>
                <table>
                    <tr>
                        <th>Código del profesor</th>
                        <th>Nombre del profesor</th>
                    </tr>
                    <xsl:apply-templates select="profesores/profesor">
                        <xsl:sort select="@codP"/>
                    </xsl:apply-templates>
                </table>
                
                <h2>Horario del grupo <xsl:value-of select="grupo/@idgrupo"/></h2>
                <table>
                    <tr>
                        <th>Horas</th>
                        <th>Lunes</th>
                        <th>Martes</th>
                        <th>Miercoles</th>
                        <th>Jueves</th>
                        <th>Viernes</th>
                    </tr>
                    <xsl:apply-templates select="grupo/hora"/>
                </table>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="modulos/modulo">
        <tr>
            <td><xsl:value-of select="@codM"/></td>
            <td><xsl:value-of select="."/></td>
        </tr>
    </xsl:template>
    
    <xsl:template match="profesores/profesor">
        <tr>
            <td>
                <abbr>
                    <xsl:attribute name="title">
                        <xsl:value-of select="."/>
                    </xsl:attribute>
                    <xsl:value-of select="@codP"/>
                </abbr>
            </td>
            <td><xsl:value-of select="."/></td>
        </tr>
    </xsl:template>
    
    <xsl:template match="grupo/hora">
        <tr>
            <td><xsl:value-of select="@entrada"/>-<xsl:value-of select="@salida"/></td>
            <xsl:apply-templates select="dia_sem"/>
        </tr>
    </xsl:template>
    
    <xsl:template match="dia_sem">
        <td>
            <xsl:attribute name="rowspan">
                <xsl:value-of select="@num"/>
            </xsl:attribute>
            <abbr>
                <xsl:attribute name="title">
                    <xsl:value-of select="//modulo[@codM=current()]/text()"/>
                </xsl:attribute>
                <xsl:value-of select="."/>
            </abbr>
            <br/>
            <xsl:variable name="listaProfesores" select="//asignatura[@codM=current()]/@codProfesor"/>
            <abbr>
                <xsl:attribute name="title">
                    <xsl:apply-templates select="//profesor[contains($listaProfesores, @codP)]" mode="xxx"/>
                </xsl:attribute>
                <xsl:value-of select="$listaProfesores"/>
            </abbr>
        </td>
    </xsl:template>
    <xsl:template match="profesor" mode="xxx">
        <xsl:if test="position()!=1">
            <xsl:text>, </xsl:text>
        </xsl:if>
        <xsl:value-of select="text()"/>
    </xsl:template>
</xsl:stylesheet>