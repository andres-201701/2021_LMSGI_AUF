<books>
{
for $i at $n in doc('books')//book
return <book>{$n}. {$i/title/text()}
</book>
}
</books>