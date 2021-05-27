for $i in doc('prediccion')//estado_cielo/@descripcion
where count($i)
order by ($i)
return data($i)