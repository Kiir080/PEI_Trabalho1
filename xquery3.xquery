
(: Número de exames existentes numa determinada semana para um dado curso, semestre e ano curricular :)

let  $x := /Mapa_de_Exames/cursos/curso/unidades/unidade[semestre="1" and ano="1"]/exames/exame[Data>="2018-01-20" and Data<="2018-01-27"]
return count($x)