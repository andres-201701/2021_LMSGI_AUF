<books>
  {for $i in //book
  return if ($i/@category="children")
  then <child>{data($i/title)}</child>
  else <adult>{data($i/title)}</adult>}
</books>