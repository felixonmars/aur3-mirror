from ExtempFiles.update import MainUpdate

def update():
  paper = "spiegel"
  feeds = ("http://www.spiegel.de/schlagzeilen/rss/0,5291,676,00.xml",)

  #Get links and titles from parsing
  updatepaper = MainUpdate()
  updatepaper.parse(paper, feeds)

  if len(updatepaper.links) == 0:
    print("No new articles found.")
    return 0

  #pintable
  actualurls = []
  for link in updatepaper.links:
    splitlink = link.split(",")
    actualurl = splitlink[0] + "," + splitlink[1] + ",druck-" + splitlink[2] + "," + splitlink[3]
    actualurls.append(actualurl)

  #Download the links
  updatepaper.download(paper, actualurls, updatepaper.titles)

  if len(updatepaper.outfiles) == 0:
    return 0

  #Strip some bad stuff out of the downloaded files
  insertfiles = []
  for file in updatepaper.outfiles:
    insertfiles.append(file.replace('window.print()', ""))

  #Insert the modified links into the DB
  updatepaper.insert(paper, insertfiles, updatepaper.outtitles)
