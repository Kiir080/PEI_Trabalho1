
(: Número de disciplinas existentes no mapa para um determinado docente (código) :)

for $x in doc("MapaExames.xml")/Mapa_de_Exames/cursos/curso/unidades
return count($x/unidade[docentes/docente[@cod="mfr"]])