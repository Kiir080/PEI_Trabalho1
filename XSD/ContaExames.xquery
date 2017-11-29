declare function local:forInsideExames() as xs:int{
for $x in doc("MapaExames.xml")/Mapa_de_Exames/cursos/curso/unidades/unidade[semestre="1" and ano="2"]
return count($x/exames/exame[epoca="Epoca_Normal" and $x/exames/exame/Data>="2018-01-20" and $x/exames/exame/Data<="2018-01-27"])
};

for $y in doc("MapaExames.xml")/Mapa_de_Exames/cursos/curso/unidades
return count($y/unidade[exames/exame/epoca="Epoca_Normal" 
and $y/exames/exame/Data>="2018-01-20" and $y/exames/exame/Data<="2018-01-27"]) + local:forInsideExames()