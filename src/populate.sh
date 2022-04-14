#!/bin/sh
set -e
mkdir -p ~/.local/bad-crunchyroll-cli/
SDIR="$(readlink -f "$(dirname "$0")")"
cd ~/.local/bad-crunchyroll-cli/
{
if [ -e ~/.local/bad-crunchyroll-cli/latest.txt ]
then
  LATEST="$(cat ~/.local/bad-crunchyroll-cli/latest.txt)"
  python3 "${SDIR}"/sitemap.py "$(cat ~/.local/bad-crunchyroll-cli/latest.txt)"
else
  python3 "${SDIR}"/sitemap.py
fi
} |\
{
if [ -e ~/.local/bad-crunchyroll-cli/links.txt -a ! -z "$LATEST" ]
then
  sh "${SDIR}"/links.sh "$LATEST" | { grep -vFf ~/.local/bad-crunchyroll-cli/links.txt || true ; } >> ~/.local/bad-crunchyroll-cli/links.txt
else
  sh "${SDIR}"/links.sh > ~/.local/bad-crunchyroll-cli/links.txt
fi
}
