import re
import sys
import cloudscraper

sitemap_url = "https://www.crunchyroll.com/sitemap"
scraper = cloudscraper.create_scraper()

content = scraper.get(sitemap_url)
maps = re.findall("<loc>([^<>]*)<\/loc>",content.text)

def getpage(i):
    print(maps[i],file=sys.stderr)
    tx=scraper.get(maps[i]).text
    print(tx)

r = range(int(sys.argv[1]) if len(sys.argv) > 1 else 0,len(maps))
for i in r:
    getpage(i)
