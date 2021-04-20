<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : 01.xsl
    Created on : 14 de abril de 2020, 9:08
    Author     : amor
    Description:
        Transformacion de 01.xml en un archivo con la lista de nombres y apellidos
		Usando una sola plantilla (xsl:template)
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:output method="html"/>  
    
    <xsl:template match="alumno">
        <tr> 
            <th>
      <p> <xsl:value-of select="concat(nombre)"/></p>
            </th>
      <p> <xsl:value-of select="concat(apellido)"/></p>
        </tr>
      <!--
      <p> <xsl:value-of select="concat(direccion/cp,' ',direccion/poblacion)"/></p>
      -->
   
    </xsl:template>

</xsl:stylesheet> 
