from ExtempFiles.update import MainUpdate

def update():
  paper = "sfchronicle"
  feeds = ("http://feeds.sfgate.com/sfgate/rss/feeds/news",
           "http://feeds.sfgate.com/sfgate/rss/feeds/business")
 
  #Get links and titles from parsing
  updatepaper = MainUpdate()
  updatepaper.parse(paper, feeds, "id")

  if len(updatepaper.links) == 0:
    print("No new articles found.")
    return 0

  #printable
  actualurls = []
  actualtitles = []
  beginurl = "http://www.sfgate.com/cgi-bin/article.cgi?f="
  total = len(updatepaper.links)
  for num in range(0, total):
    if "DTL" in updatepaper.links[num]:
      actualurl = beginurl + updatepaper.links[num].replace("http://feeds.sfgate.com", "") + "&type=printable"
      actualurls.append(actualurl)
      actualtitles.append(updatepaper.titles[num])

  if not actualurls:
    print("No new articles found.")
    return 0

  #Download modified links
  updatepaper.download(paper, actualurls, actualtitles)

  #Insert the modified links into the DB
  updatepaper.insert(paper, updatepaper.outfiles, updatepaper.outtitles)
