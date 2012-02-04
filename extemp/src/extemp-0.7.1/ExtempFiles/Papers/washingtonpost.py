from ExtempFiles.update import MainUpdate

def update():
  paper = "washingtonpost"
  feeds = ("http://feeds.washingtonpost.com/wp-dyn/rss/politics/administration/index_xml",
           "http://feeds.washingtonpost.com/wp-dyn/rss/politics/congress/index_xml",
           "http://feeds.washingtonpost.com/wp-dyn/rss/politics/elections/index_xml",
           "http://feeds.washingtonpost.com/wp-dyn/rss/world/index_xml",
           "http://feeds.washingtonpost.com/wp-dyn/rss/business/economy/index_xml")
 
  #Get links and titles from parsing
  updatepaper = MainUpdate()
  updatepaper.parse(paper, feeds, "id")

  if len(updatepaper.links) == 0:
    print("No new articles found.")
    return 0

  #printable
  actualurls = []
  for link in updatepaper.links:
    splitlink = link.split(".")
    if splitlink[3:]:
      actualurl = splitlink[0] + "." + splitlink[1] + "." + splitlink[2] + "_pf." + splitlink[3]
      actualurls.append(actualurl)

  #Download modified links
  updatepaper.download(paper, actualurls, updatepaper.titles)

  #Insert the modified links into the DB
  updatepaper.insert(paper, updatepaper.outfiles, updatepaper.outtitles)
