
(: O código, nome e regente das disciplinas existentes no mapa :)

for $x in doc("MapaExames.xml")/Mapa_de_Exames/cursos/curso/unidades/unidade
return <unidade> 
<codigo>{data($x/@codigo)}</codigo>
<nome>{data($x/nome)}</nome>
<regente>{data($x/regente)}</regente>
</unidade>


