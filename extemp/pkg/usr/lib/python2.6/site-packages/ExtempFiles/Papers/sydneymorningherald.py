from ExtempFiles.update import MainUpdate

def update():
  paper = "sydneymorningherald"
  feeds = ("http://feeds.smh.com.au/rssheadlines/top.xml",
           "http://feeds.smh.com.au/rssheadlines/national.xml",
           "http://feeds.smh.com.au/rssheadlines/world.xml")
  
  #Get links and titles from parsing
  updatepaper = MainUpdate()
  updatepaper.parse(paper, feeds)

  if len(updatepaper.links) == 0:
    print("No new articles found.")
    return 0

  #printable
  beginurl = "http://www.smh.com.au/cgi-bin/common/popupPrintArticle.pl?path=/articles/"
  actualurls = []
  for link in updatepaper.links:
    splitlink = link.split("/")
    actualurl = beginurl + splitlink[-4] + "/" + splitlink[-3] + "/" + splitlink[-2] + "/" + splitlink[-1]
    actualurls.append(actualurl)

  #Download the links
  updatepaper.download(paper, actualurls, updatepaper.titles)

  #Insert the modified links into the DB
  updatepaper.insert(paper, updatepaper.outfiles, updatepaper.outtitles)
