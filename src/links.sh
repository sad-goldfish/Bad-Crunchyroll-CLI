#!/bin/sh
{
	if [ ! -z "$1" ]
	then
		find -name "*.html.xz" | sed -E 's/\.\/([0-9]*).html.xz/\1/g' | awk "{if (\$1 >= $1) print \$1\".html.xz\"}" | xargs xzcat
	else
		find -name "*.html.xz" -exec xzcat {} +
	fi
} |\
grep -hE "<loc>[^<>]*<\/loc>" -o |\
sed "s/<loc>https:\/\/www\.crunchyroll\.com\([^<>]*\)<\/loc>/\1/g" |\
grep -vE "/comments$|/videos$|/reviews$|/discussions$|/more$|forumcategory|/en-gb/|/ru/|/fr/|/de/|/ar/|/it/|/pt-pt/|/pt-br/|/es-es/|/es/" |\
grep "^/[^/]*/[^/]*$" |\
cut -c 2-
