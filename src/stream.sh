#!/bin/sh
cat ~/.local/bad-crunchyroll-cli/links.txt | dmenu -i -l 12 | xargs -I 1# mpv https://www.crunchyroll.com/1# --ytdl --script-opts=ytdl_hook-try_ytdl_first=yes --slang=enUS
