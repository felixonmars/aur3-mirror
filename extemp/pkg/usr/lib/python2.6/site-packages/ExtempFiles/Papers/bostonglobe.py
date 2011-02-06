from ExtempFiles.update import MainUpdate

def update():
  paper = "bostonglobe"
  feeds = ("http://syndication.boston.com/news/nation?mode=rss_10",
           "http://syndication.boston.com/news/politics/?mode=rss_10",
           "http://syndication.boston.com/business/?mode=rss_10")
  
  #Get links and titles from parsing
  updatepaper = MainUpdate()
  updatepaper.parse(paper, feeds)

  if len(updatepaper.links) == 0:
    print("No new articles found.")
    return 0

  #Do bostonglobe specific stuff to the links
  endurl = "?mode=PF"
  actualurls = []
  for link in updatepaper.links:
    actualurls.append(link.split('?')[0] + endurl)
  
  #Download the modified links
  updatepaper.download(paper, actualurls, updatepaper.titles)

  if len(updatepaper.outfiles) == 0:
    return 0

  #Strip some bad stuff out of the downloaded files
  insertfiles = []
  for file in updatepaper.outfiles:
    insertfiles.append(file.replace("document.location.replace(csplit);", ""))

  #Insert the modified links into the DB
  updatepaper.insert(paper, insertfiles, updatepaper.outtitles)
