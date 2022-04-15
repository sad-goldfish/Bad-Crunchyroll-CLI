# Bad-Crunchyroll-CLI
A crude crunchyroll command line interface.

## Configs
Recommended configs for streamlink and mpv are in the config folder. These are mostly quality-of-life but https://github.com/bloc97/Anime4K will drastically improve quality.

## Usage
Run `src/populate.sh` to get a list of anime on crunchyroll. This part is espescially crude and may take a long time. The script will create a list at `~/.local/bad-crunchyroll-cli/links.txt`. When it is done, about 64M of storage will be used. After this, run `src/stream.sh`. Dmenu will pop and you will be able to select and view the anime of your choice. To keep `links.txt` updated, run `src/populate.sh`.

## Requirements
- Python
- Cloudscraper
- yt-dlp
- Mpv (recommended with https://github.com/bloc97/Anime4K, will use yt-dlp hook)
- Dmenu (Or replace with bemenu if using wayland in `src/stream.sh`)
