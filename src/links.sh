#!/bin/sh
find -name "*.html.xz" -exec xzcat {} + |\
grep -hE "<loc>[^<>]*<\/loc>" -o |\
sed "s/<loc>https:\/\/www\.crunchyroll\.com\([^<>]*\)<\/loc>/\1/g" |\
grep -vE "/comments$|/videos$|/reviews$|/discussions$|/more$|forumcategory|/en-gb/|/ru/|/fr/|/de/|/ar/|/it/|/pt-pt/|/pt-br/|/es-es/|/es/" |\
grep "^/[^/]*/[^/]*$" |\
cut -c 2-
