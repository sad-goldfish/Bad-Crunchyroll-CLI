#!/bin/sh
set -e
mkdir -p ~/.local/bad-crunchyroll-cli/
SDIR="$(readlink -f "$(dirname "$0")")"
cd ~/.local/bad-crunchyroll-cli/
if [ -e ~/.local/bad-crunchyroll-cli/latest.txt ]
then
  python3 "${SDIR}"/sitemap.py "$(cat ~/.local/bad-crunchyroll-cli/latest.txt)"
else
  python3 "${SDIR}"/sitemap.py
fi
find -name "*.html" -exec xz -f --verbose {} +
sh "${SDIR}"/links.sh > ~/.local/bad-crunchyroll-cli/links.txt
