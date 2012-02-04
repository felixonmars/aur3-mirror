from ExtempFiles.update import MainUpdate

def update():
  paper = "haaretz"
  feeds = ("http://www.haaretz.com/feed/enewsRss.xml",
           "http://www.haaretz.com/feed/edefenseRss.xml",
           "http://www.haaretz.com/feed/enationalRss.xml",
           "http://www.haaretz.com/feed/ejewishworldRss.xml")
  
  #Get links and titles from parsing
  updatepaper = MainUpdate()
  updatepaper.parse(paper, feeds)

  if len(updatepaper.links) == 0:
    print("No new articles found.")
    return 0

  beginurl = "http://www.haaretz.com/hasen/objects/pages/PrintArticleEn.jhtml?itemNo="
  actualurls = []
  for link in updatepaper.links:
    actualurl = beginurl + link.split("/")[-1].replace(".html", "")
    actualurls.append(actualurl)

  #Download the links
  updatepaper.download(paper, actualurls, updatepaper.titles)

  if len(updatepaper.outfiles) == 0:
    return 0

  #Strip some bad stuff out of the downloaded files
  insertfiles = []
  for file in updatepaper.outfiles:
    insertfiles.append(file.replace('<body bgcolor="" onload="print();">', "").replace('charset="windows-1255"', ''))

  #Insert the modified links into the DB
  updatepaper.insert(paper, insertfiles, updatepaper.outtitles)  # 1 - nothing was downloaded, 2 - keyboard interrupt
