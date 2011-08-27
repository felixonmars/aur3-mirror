from ExtempFiles.update import MainUpdate

def update():
  paper = "economist"
  feeds = ("http://www.economist.com/rss/briefings_rss.xml",
           "http://www.economist.com/rss/europe_rss.xml",
           "http://www.economist.com/rss/united_states_rss.xml",
           "http://www.economist.com/rss/the_americas_rss.xml",
           "http://www.economist.com/rss/middle_east_and_africa_rss.xml",
           "http://www.economist.com/rss/asia_rss.xml",
           "http://www.economist.com/rss/international_rss.xml",
           "http://www.economist.com/rss/finance_and_economics_rss.xml")
   
  #Get links and titles from parsing
  updatepaper = MainUpdate()
  updatepaper.parse(paper, feeds)

  if len(updatepaper.links) == 0:
    print("No new articles found.")
    return 0

  #Modify links for printable version
  actualurls = []
  for link in updatepaper.links:
    actualurl = link.replace("displaystory", "PrinterFriendly")
    actualurls.append(actualurl)
  
  #Download the links
  updatepaper.download(paper, actualurls, updatepaper.titles)

  #Insert the modified links into the DB
  updatepaper.insert(paper, updatepaper.outfiles, updatepaper.outtitles)
