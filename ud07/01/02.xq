for $i in doc('books')//books
order by $i/title
where $i/price>30
return $i/title/text()