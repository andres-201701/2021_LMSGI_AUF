<html>
<head>
<title>05</title>
<link href="css/estilos.css" type="text/css" rel="stylesheet"/>
</head>
<body>
<h1>BOOKSTORE</h1>
<table>
<tr>
  <th>Titulo</th>
  <th>Categoría</th>
</tr>
  {for $i in doc('books.xml')//book
  order by $i/title
  return
<tr>
  <td>{$i/title/text()}</td>
  <td>{data($i/@category)}</td>
</tr>
}
</table>
<ul>
{
  for $i in doc('books.xml')//book
  order by $i/title
  return
  <li class="{data($i/@category)}"> {data($i/title)}</li>

}

</ul>
</body>
</html>