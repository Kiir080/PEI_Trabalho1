<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="1.0">
  
  
    <xsl:variable name="first" select="Mapa_de_Exames/Data_Inicio"/>
    <xsl:variable name="week">
        <segunda><xsl:value-of select="xs:date($first)"/></segunda>
        <terca><xsl:value-of select="xs:date($first) + xs:dayTimeDuration('P2D') "/></terca>
        <quarta><xsl:value-of select="xs:date($first) + xs:dayTimeDuration('P3D')"/></quarta>
        <quinta><xsl:value-of select="xs:date($first) + xs:dayTimeDuration('P4D')"/></quinta>
        <sexta><xsl:value-of select="xs:date($first) + xs:dayTimeDuration('P5D')"/></sexta>
    </xsl:variable>
    
    
  

    <xsl:template match="/">
        
        <html>
            <head>
                <title>Mapa de Exames</title>
            </head>
            <body>
                <h2 style="text-align: center"><b><xsl:value-of select="Mapa_de_Exames/Curso/nome"/></b></h2>
                <p><xsl:value-of select="Mapa_de_Exames/Epoca"/></p>
                <p><xsl:value-of select="Mapa_de_Exames/Data_Inicio"/>
                    a <xsl:value-of select="Mapa_de_Exames/Data_Fim"/>
                </p>
                
                
            
                
                <table border="1">
                <tr>
                   <td>Dia</td>
                   <td>Ano&#160;Unidade Curricular</td>
                   <td>Hora</td>
                   <td>Sala</td>
                   <td>Responsavel</td>
                </tr>
                    <xsl:for-each select="$week/child::node()">
                        <xsl:choose>
                            <xsl:when test="xs:date(Mapa_de_Exames/Exames/Exame/Data)=xs:date($week/child::text())">
                                
                                    <tr>
                                        <xsl:for-each select="Mapa_de_Exames/Exames/Exame">  
                                            <td><xsl:value-of select="$week/child::text()"/></td>
                                            <td><xsl:value-of select="Unidade/ano"/>&#160;&#160;&#160;&#160;&#160;&#160;&#160;<xsl:value-of select="Unidade/name"/></td>
                                            <td><xsl:value-of select="Hora"/></td>
                                            <td><xsl:value-of select="Sala"/></td>
                                            <td><xsl:value-of select="Responsavel/name"/></td>    
                                        </xsl:for-each>
                                     </tr>   
                            </xsl:when>
                            <xsl:otherwise>
                                <tr>
                                    <td><xsl:value-of select="$week/descendant::node()"/></td>                                   
                                </tr>     
                            </xsl:otherwise>
                        </xsl:choose> 
                        
                             
                    </xsl:for-each>
                  
                    
                </table>
            </body>
        </html>
   
        
    </xsl:template>
    
    
</xsl:stylesheet>