# Bad-Crunchyroll-CLI
A crude crunchyroll command line interface.

## Configs
Recommended configs for streamlink and mpv are in the config folder. These are mostly quality-of-life but https://github.com/bloc97/Anime4K will drastically improve quality.

## Usage
Run `src/populate.sh` to get a list of anime on crunchyroll. This part is espescially crude and may take a long time. A browser window will pop up, download about a gigabyte of data and create a list at `~/.local/bad-crunchyroll-cli/links.txt`. Do not close the window until it stops and complete the captcha if required. When it is done, about 64M of storage will be used. After this, run `src/stream.sh`. Dmenu will pop and you will be able to select and view the anime of your choice. To keep `links.txt` updated, run `src/populate.sh`. Future runs should be far more efficient. A cron job or systemd timer is a good option for this so long as you're not hit by a captcha. Delete `~/.local/bad-crunchyroll-cli/latest.txt` to refresh `links.txt` entirely.

## Requirements
- Selenium Webdriver (Firefox geckodriver by default)
- Python
- xz/unxz
- Streamlink (Mpv recommended with https://github.com/bloc97/Anime4K)
- Dmenu
