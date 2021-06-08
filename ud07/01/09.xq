for $book in doc('books')//book
      let $autores:=$book/author
      where count($autores)>2
      return $book/title/text()