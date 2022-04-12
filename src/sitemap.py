from selenium import webdriver
import re
import sys

googleURL = "https://www.crunchyroll.com/sitemap"

browser = webdriver.Firefox()
#browser = webdriver.Chrome()
browser.get(googleURL)
content = browser.page_source
f=open("sitemap.txt","w")
f.write(content)
f.close()
maps = re.findall("<loc>([^<>]*)<\/loc>",content)
for i in range(int(sys.argv[1]) if len(sys.argv) > 1 else 0,len(maps)):
    f=open(f"{i}.html","w")
    browser.get(maps[i])
    f.write(browser.page_source)
    f.close()
f=open("latest.txt","w")
f.write(str(len(maps)-1))
f.close
