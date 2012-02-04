from ExtempFiles.update import MainUpdate

def update():
  paper = "msnbc"
  feeds = ("http://rss.msnbc.msn.com/id/3032552/device/rss/rss.xml",
           "http://rss.msnbc.msn.com/id/3032506/device/rss/rss.xml")

  #Get links and titles from parsing
  updatepaper = MainUpdate()
  updatepaper.parse(paper, feeds)

  if len(updatepaper.links) == 0:
    print("No new articles found.")
    return 0

  #change to printable
  dlext="/print/1/displaymode/1098"
  actualurls = []
  for link in updatepaper.links:
    actualurl = link + dlext
    actualurls.append(actualurl)

  #Download the links
  updatepaper.download(paper, actualurls, updatepaper.titles)

  #Insert the modified links into the DB
  updatepaper.insert(paper, updatepaper.outfiles, updatepaper.outtitles)
