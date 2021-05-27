for $i in //book
where $i/price>30
order by $i//title
return $i//title/text()