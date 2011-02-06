from ExtempFiles.update import MainUpdate

def update():
  paper = "latimes"
  feeds = ("http://feeds.latimes.com/latimes/news/nationworld/nation?format=xml",
           "http://feeds.latimes.com/latimes/news/nationworld/world?format=xml")

  #Get links and titles from parsing
  updatepaper = MainUpdate()
  updatepaper.parse(paper, feeds)

  if len(updatepaper.links) == 0:
    print("No new articles found.")
    return 0

  #Scrap articles for printable link
  scrapeurls = []
  beginurl = "http://www.latimes.com/news"
  for url in updatepaper.links:
    urlparts = url.split("/")
    scrapeurl = beginurl + "/" + urlparts[6] + "/" + urlparts[7] + "/" + urlparts[-1]
    scrapeurls.append(scrapeurl)

  updatepaper.scrape(paper, scrapeurls, updatepaper.titles)

  if len(updatepaper.scrapefiles) == 0:
    print("No new articles found.")
    return 0

  #Get printable urls
  actualurls = []
  actualtitles = []
  beginurl = "http://www.latimes.com"
  total = len(updatepaper.scrapefiles)
  for num, file in enumerate(updatepaper.scrapefiles):
    for line in file:
      if '>Print<' in line:
        actualurls.append(beginurl + line.split('"')[1])
        actualtitles.append(updatepaper.scrapetitles[num])
        break

  #Download the scraped links
  updatepaper.download(paper, actualurls, actualtitles)

  #Insert the modified links into the DB
  updatepaper.insert(paper, updatepaper.outfiles, updatepaper.outtitles)
