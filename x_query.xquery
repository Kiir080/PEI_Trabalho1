
(: O código, nome e regente das disciplinas existentes no mapa :)

for $x in doc("MapaExames.xml")/Mapa_de_Exames/cursos/curso/unidades/unidade
return <unidade> 
<codigo>{$x/regente/@cod}</codigo>
<nome>{data($x/nome)}</nome>
<regente>{data($x/regente)}</regente>
</unidade>


(: Número de disciplinas existentes no mapa para um determinado docente (código) :)

for $x in doc("MapaExames.xml")/Mapa_de_Exames/cursos/curso/unidades
return count($x/unidade[docentes/docente[@cod="mfr"]])


(: Número de exames existentes numa determinada semana para um dado curso, semestre e ano curricular :)

let  $x := /Mapa_de_Exames/cursos/curso/unidades/unidade[semestre="1" and ano="2"]/exames/exame[epoca="Epoca_Normal" and Data>="2018-01-20" and Data<="2018-01-27"]
return count($x)
