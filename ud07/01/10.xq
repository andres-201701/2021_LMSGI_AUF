<libros>
{
 for $book in doc('books')//book
 let $autores:=$book/author
 return 
 <libro autores="{count($autores)}">{$book/title/text()}</libro>
}
</libros>
