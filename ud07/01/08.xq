<html>
  <head>
    <title>Listar Practicas</title>
    <meta charset="UTF-8"/>
  </head>
  <body>
    <h1>Listado</h1>
    {
      for $tema in (1 to 7),$ejercicio in (1 to 3) return
      <div>
        <a href="ud{$tema}/0{$ejercicio}.html">
         {concat ("Tema",$tema,"Ejercicio",$ejercicio)}</a>
      </div>
}
  </body>
</html>
