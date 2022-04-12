from selenium import webdriver
import re

googleURL = "https://www.crunchyroll.com/en-gb/sitemap"

#browser = webdriver.Firefox()
browser = webdriver.Chrome()
browser.get(googleURL)
content = browser.page_source
f=open("sitemap.txt","w")
f.write(content)
f.close()
maps = re.findall("<loc>([^<>]*)<\/loc>",content)
for i in range(len(maps)):
    f=open(f"{i}.html","w")
    browser.get(maps[i])
    f.write(browser.page_source)
    f.close()
