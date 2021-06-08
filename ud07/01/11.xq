<libros>
{
for $book in doc('books')//book
  return
  <libro>
  {$book/title}
  {$book/author}
  </libro>
}
</libros>