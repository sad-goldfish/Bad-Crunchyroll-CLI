#!/bin/sh
set -e
mkdir -p ~/.local/bad-crunchyroll-cli/
cd ~/.local/bad-crunchyroll-cli/
find -name "*.html.xz" -exec unxz --verbose {} +
if [ -e ~/.local/bad-crunchyroll-cli/latest.txt ]
then
  python3 "$(dirname "$0")"/sitemap.py "$(cat ~/.local/bad-crunchyroll-cli/latest.txt)"
else
  python3 "$(dirname "$0")"/sitemap.py
fi
sh "$(dirname "$0")"/links.sh
find -name "*.html" -exec xz --verbose {} +
