for $i in //book
where $i/price>30
return $i//title/text()