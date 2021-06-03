for $i in doc('book')//book
order by $i/title
return $i/title/text()