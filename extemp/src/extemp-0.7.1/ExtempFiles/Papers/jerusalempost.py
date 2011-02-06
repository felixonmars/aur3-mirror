from ExtempFiles.update import MainUpdate

def update():
  paper = "jerusalempost"
  feeds = ("http://www.jpost.com/servlet/Satellite?pagename=JPost/Page/RSS&cid=1178443463156",
           "http://www.jpost.com/servlet/Satellite?pagename=JPost/Page/RSS&cid=1123495333498",
           "http://www.jpost.com/servlet/Satellite?pagename=JPost/Page/RSS&cid=1178443463144",
           "http://www.jpost.com/servlet/Satellite?pagename=JPost/Page/RSS&cid=1123495333468")
 
  #Get links and titles from parsing
  updatepaper = MainUpdate()
  updatepaper.parse(paper, feeds)

  if len(updatepaper.links) == 0:
    print("No new articles found.")
    return 0

  #Change links to printable
  actualurls = []
  for link in updatepaper.links:
    actualurl = link.replace("ShowFull", "Printer")
    actualurls.append(actualurl)

  #Download the links
  updatepaper.download(paper, actualurls, updatepaper.titles)

  #Insert the modified links into the DB
  updatepaper.insert(paper, updatepaper.outfiles, updatepaper.outtitles)
