from ExtempFiles.update import MainUpdate

def update():
  paper = "londontimes"
  feeds = ("http://www.timesonline.co.uk/tol/feeds/rss/worldnews.xml",)

  #Get links and titles from parsing
  updatepaper = MainUpdate()
  updatepaper.parse(paper, feeds)

  if len(updatepaper.links) == 0:
    print("No new articles found.")
    return 0

  #Change links to printable
  dlext="?print=yes"
  actualurls = []
  for link in updatepaper.links:
    actualurl = link.split("#")[0] + dlext
    actualurls.append(actualurl)

  #Download the links
  updatepaper.download(paper, actualurls, updatepaper.titles)

  #Insert the modified links into the DB
  updatepaper.insert(paper, updatepaper.outfiles, updatepaper.outtitles)
