
for $i in doc('books')//book
order by $i/title
where $i/price>30
return concat(data($i/title),':',data($i/price),'$')


