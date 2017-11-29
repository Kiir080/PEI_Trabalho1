<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
    xmlns:xs="http://www.w3.org/2001/XMLSchema" 
    exclude-result-prefixes="xs" 
    version="2.0">
    
    <xsl:variable name="Epoca" select="Mapa_de_Exames/calendario/epoca[nome='Epoca_Normal'and semestre ='1']"/>
    
    <xsl:template match="/">
        <html>
            <head>
                <title>Mapa de Exames</title>
            </head>
            <body>
                <h2 style="text-align: center">
                    <b>
                        <xsl:value-of select="Mapa_de_Exames/cursos/curso/name"/>
                    </b>
                </h2>
                <p>
                    <xsl:value-of select="$Epoca/nome"/>
                </p>
                <p>
                    <xsl:value-of select="$Epoca/dataInicio"/>
                    a
                    <xsl:value-of select="$Epoca/dataFim"/>
                </p>
                <table border="1">
                    <tr>
                        <td>Dia</td>
                        <td>Ano</td>
                        <td>Unidade Curricular</td>
                        <td>Hora</td>
                        <td>Sala</td>
                        <td>Responsavel</td>
                    </tr>
                    <xsl:for-each-group select="Mapa_de_Exames/cursos/curso/unidades/unidade[semestre=$Epoca/semestre]/exames/exame[epoca=$Epoca/nome]" group-by="Data">
                        <xsl:sort select="Data"/>
                        <tr>
                            <xsl:call-template name="RowTemplate"/>
                        </tr>
                    </xsl:for-each-group>
                </table>
            </body>
        </html>
    </xsl:template>
    <xsl:template name="RowTemplate">
        <td>
            <xsl:call-template name="DataTemplate"/>
        </td>
        <td>
            <xsl:call-template name="AnoTemplate"/>
        </td>
        <td>
            <xsl:call-template name="NomeUCTemplate"/>
        </td>
        <td>
            <xsl:call-template name="HoraTemplate"/>
        </td>
        <td>
            <xsl:call-template name="SalaTemplate"/>
        </td>
        <td>
            <xsl:call-template name="ResponsavelTemplate"/>
        </td>
    </xsl:template>
    <xsl:template name="DataTemplate">
        <p>
            <xsl:value-of select="format-date(Data,'[F]')"/>
        </p>
        <p>
            <xsl:value-of select="format-date(Data,'[D]/[M]/[Y]')"/>
        </p>
    </xsl:template>
    <xsl:template name="ResponsavelTemplate">
        <xsl:for-each select="current-group()">
            <xsl:sort select="Hora"/>
            <p>
                <xsl:value-of select="Responsavel/nome"/>
            </p>
        </xsl:for-each>
    </xsl:template>
    <xsl:template name="SalaTemplate">
        <xsl:for-each select="current-group()">
            <xsl:sort select="Hora"/>
            <p>
                <xsl:value-of select="Sala"/>
            </p>
        </xsl:for-each>
    </xsl:template>
    <xsl:template name="HoraTemplate">
        <xsl:for-each select="current-group()">
            <xsl:sort select="Hora"/>
            <p>
                <xsl:value-of select="Hora"/>
            </p>
        </xsl:for-each>
    </xsl:template>
    <xsl:template name="NomeUCTemplate">
        <xsl:for-each select="current-group()">
            <xsl:sort select="Hora"/>
            <p>
                <xsl:value-of select="ancestor::node()/nome"/>
            </p>
        </xsl:for-each>
    </xsl:template>
    <xsl:template name="AnoTemplate">
        <xsl:for-each select="current-group()">
            <xsl:sort select="Hora"/>
            <p>
                <xsl:value-of select="ancestor::node()/ancestor::node()/ano"/>
                º
            </p>
        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>