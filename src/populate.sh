#!/bin/sh
set -e
mkdir -p ~/.local/bad-crunchyroll-cli/
SDIR=$(readlink -f "$(dirname "$0")")
cd ~/.local/bad-crunchyroll-cli/
find -name "*.html.xz" -exec unxz --verbose {} +
if [ -e ~/.local/bad-crunchyroll-cli/latest.txt ]
then
  python3 "${SDIR}"/sitemap.py "$(cat ~/.local/bad-crunchyroll-cli/latest.txt)"
else
  python3 "${SDIR}"/sitemap.py
fi
sh "${SDIR}"/links.sh
find -name "*.html" -exec xz --verbose {} +
