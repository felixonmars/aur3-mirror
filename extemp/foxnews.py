from ExtempFiles.update import MainUpdate

def update():
  paper = "foxnews"
  feeds = ("http://feeds.foxnews.com/foxnews/world?format=xml",
           "http://feeds.foxnews.com/foxnews/politics?format=xml")

  #Get links and titles from parsing
  updatepaper = MainUpdate()
  updatepaper.parse(paper, feeds)

  if len(updatepaper.links) == 0:
    print("No new articles found.")
    return 0

  #Modify links for printable version
  beginurl = "http://www.foxnews.com/printer_friendly_story/"
  actualurls = []
  for link in updatepaper.links:
    actualurl = beginurl + link.split('/')[-1].replace("2933", "3566")
    actualurls.append(actualurl)
  
  #Download the links
  updatepaper.download(paper, actualurls, updatepaper.titles)

  #Make sure failures are taken out
  actualinsertfiles = []
  actualtitles = []
  for num, outfile in enumerate(updatepaper.outfiles):
    if not "404 Not Found" in outfile and not "Page cannot be found" in outfile:
      actualinsertfiles.append(outfile)
      actualtitles.append(updatepaper.outtitles[num])

  #Insert the modified links into the DB
  updatepaper.insert(paper, actualinsertfiles, actualtitles)
