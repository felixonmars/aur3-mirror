from ExtempFiles.update import MainUpdate

def update():
  paper = "allafrica"
  feeds = ("http://allafrica.com/tools/headlines/rdf/latest/headlines.rdf",)

  #Get links and titles from parsing
  updatepaper = MainUpdate()
  updatepaper.parse(paper, feeds)

  if len(updatepaper.links) == 0:
    print("No new articles found.")
    return 0

  #Do allaffrica specific stuff to the links
  beginurl = "http://allafrica.com/stories/printable/"
  actualurls = []
  for link in updatepaper.links:
    splitlink = link.split("/")
    actualurl = beginurl + splitlink[-1]
    actualurls.append(actualurl)

  #Download the modified links
  updatepaper.download(paper, actualurls, updatepaper.titles)

  #Insert the modified links into the DB
  updatepaper.insert(paper, updatepaper.outfiles, updatepaper.outtitles)
