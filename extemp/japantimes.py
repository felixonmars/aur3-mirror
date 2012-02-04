from ExtempFiles.update import MainUpdate

def update():
  paper = "japantimes"
  feeds = ("http://feeds.feedburner.com/japantimes_news",)

  #Get links and titles from parsing
  updatepaper = MainUpdate()
  updatepaper.parse(paper, feeds)

  if len(updatepaper.links) == 0:
    print("No new articles found.")
    return 0

  #Change links to printable
  beginurl = "http://search.japantimes.co.jp/print/"
  actualurls = []
  for link in updatepaper.links:
    actualurl = beginurl + link.split("/")[-1]
    actualurls.append(actualurl)

  #Download the links
  updatepaper.download(paper, actualurls, updatepaper.titles)

  #Insert the modified links into the DB
  updatepaper.insert(paper, updatepaper.outfiles, updatepaper.outtitles)
