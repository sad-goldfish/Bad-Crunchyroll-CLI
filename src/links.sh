#!/bin/sh
grep -hE "<loc>[^<>]*<\/loc>" *.html -o |\
sed "s/<loc>https:\/\/www\.crunchyroll\.com\/\([^<>]*\)<\/loc>/\1/g" |\
grep -vE "/comments$|/videos$|/reviews$|/discussions$|/more$|forumcategory|/en-gb/|/ru/|/fr/|/de/|/ar/|/it/|/pt-pt/|/pt-br/|/es-es/|/es/" |\
grep "^[^/]*/[^/]*$"
