from ExtempFiles.update import MainUpdate

def update():
  paper = "seattlepi"
  feeds = ("http://seattlepi.nwsource.com/rss/apafrica.rss",
           "http://seattlepi.nwsource.com/rss/apaa.rss",
           "http://seattlepi.nwsource.com/rss/apasia.rss",
           "http://seattlepi.nwsource.com/rss/apelection.rss",
           "http://seattlepi.nwsource.com/rss/apmideast.rss",
           "http://seattlepi.nwsource.com/rss/apwash.rss")
   
  #Get links and titles from parsing
  updatepaper = MainUpdate()
  updatepaper.parse(paper, feeds)

  if len(updatepaper.links) == 0:
    print("No new articles found.")
    return 0

  #printable version
  beginurl = "http://seattlepi.nwsource.com/printer2/index.asp?ploc=t&refer="
  actualurls = []
  for link in updatepaper.links:
    actualurl = beginurl + link
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
