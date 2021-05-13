<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html"/>
    <xsl:template match="/factura">
        <html>
            <head>
                <title>factura.xsl</title>
                <style>
                    table, tr, td, th{border: 1px solid grey;}
                </style>
            </head>
            <body>
                <table>
                    <tr>
                        <th colspan="3">Factura número: <xsl:value-of select="n_factura"/></th>
                    </tr>
                    <tr>
                        <th colspan="3">Datos emisor</th>
                    </tr>
                    <tr>
                        <xsl:apply-templates select="datos_emisor"/>
                    </tr>
                    <tr>
                        <th colspan="3">Datos receptor</th>
                    </tr>
                    <tr>
                        <xsl:apply-templates select="datos_receptor"/>
                    </tr>
                    <tr>
                        <th colspan="3">Resumen factura</th>
                    </tr>
                    <tr>
                        <xsl:apply-templates select="datos_factura"/>
                    </tr>
                    <tr>
                        <th colspan="3">Detalle factura</th>
                    </tr>
                    <tr>
                        <table>
                            <body>
                                <tr>
                                    <th>Ref</th>
                                    <th>Descripcion</th>
                                    <th>Cantidad</th>
                                    <th>Precio</th>
                                    <th>Importe</th>
                                </tr>
                            </body>
                        </table>
                    </tr>
                </table>
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="datos_emisor">
        <tr>
            <td>Razón social: <xsl:value-of select="nombre"/></td>
            <td colspan="2">NIF/CIF: <xsl:value-of select="cif"/></td>
        </tr>
        <tr>
            <td>Dirección:</td>
            <td colspan="2">
                <xsl:value-of select="dir"/>
                <xsl:value-of select="cod_postal"/><xsl:value-of select="poblacion"/>
                <xsl:value-of select="provincia"/>
            </td>
        </tr>
        <tr>
            <td colspan="3">Datos de contacto</td>
        </tr>
        <tr>
            <td>Telefono:<xsl:value-of select="num_tel"/></td>
            <td colspan="2">FAX:<xsl:value-of select="num_fax"/></td>
        </tr>
    </xsl:template>
    
    <xsl:template match="datos_receptor">
        <tr>
            <td colspan="3">Num Cliente: <xsl:value-of select="n_cli"/></td>
        </tr>
        <tr>
            <td>Dirección:</td>
            <td colspan="2">
                <xsl:value-of select="dir"/>
                <xsl:value-of select="cod_postal"/><xsl:value-of select="poblacion"/>
                <xsl:value-of select="provincia"/>
            </td>
        </tr>
    </xsl:template>
    
    <xsl:template match="datos_factura">
        <tr>
            <td>Numero pedido: <xsl:value-of select="n_ped"/></td>
            <td>IVA: <xsl:value-of select="iva"/></td>
            <td>Forma de pago: <xsl:value-of select="f_pago"/></td>
        </tr>
        <tr>
            <td>Moneda: <xsl:value-of select="moneda"/></td>
            <td colspan="2">Fecha: <xsl:value-of select="fecha"/></td>
        </tr>
    </xsl:template>
</xsl:stylesheet>