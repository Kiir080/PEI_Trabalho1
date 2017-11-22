<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:template match="/">
        <html>
            <head>
                <h2 style="align: center"><b><xsl:value-of select="Mapa_de_Exames/Curso"/></b>/></h2>
                <p><xsl:value-of select="Mapa_de_Exames/Epoca"/></p>
                <p><xsl:value-of select="Mapa_de_Exames/Data_Inicio"/>
                   a <xsl:value-of select="Mapa_de_Exames/Data_Fim"/>
                </p>
            </head>
            <body>
                <tr>
                   <td>Dia</td>
                   <td>Ano</td>
                   <td>Unidade Curricular</td>
                   <td>Hora</td>
                   <td>Sala</td>
                   <td>Responsavel</td>
                </tr>
                <xsl:for-each select="Mapa_de_Exames/Exame">
                    <xsl:sort select="Data"/>
                    <tr>
                        <td><xsl:value-of select="Data"/></td>
                    </tr>
                </xsl:for-each>
            </body>
        </html>
        
        
    </xsl:template>
    
    
</xsl:stylesheet>