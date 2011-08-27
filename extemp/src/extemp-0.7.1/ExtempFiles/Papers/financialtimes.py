from ExtempFiles.update import MainUpdate

def update():
  paper = "financialtimes"
  feeds = ("http://www.ft.com/rss/world",
           "http://www.ft.com/rss/companies",
           "http://www.ft.com/rss/home/uk",
           "http://www.ft.com/rss/home/us",
           "http://www.ft.com/rss/home/europe",
           "http://www.ft.com/rss/home/asia",
           "http://www.ft.com/rss/lex")

  #Get links and titles from parsing
  updatepaper = MainUpdate()
  updatepaper.parse(paper, feeds)

  if len(updatepaper.links) == 0:
    print("No new articles found.")
    return 0
    
  #Modify links for printable version
  actualurls = []
  for link in updatepaper.links:
    actualurl = link.replace("0/", "").replace(".html", ",print=yes.html")
    actualurls.append(actualurl)

  #Download the links
  updatepaper.download(paper, actualurls, updatepaper.titles)

  if len(updatepaper.outfiles) == 0:
    return 0

  #Format outputted files
  insertfiles = []
  for file in updatepaper.outfiles:
    readfile = file.split("\n")
    insertfile = "<b>Financial Times</b>"

    for line in readfile:
      if "ft-story-header" in line or "ft-story-body" in line or "charset" in line:
        insertfile = insertfile + "\n" + line
        
    insertfile = insertfile.replace('lang=     "en">', '').replace('}// ]]></script>', '').replace('<script type="text/javascript">' , '')
    insertfiles.append(insertfile)

  #Insert the modified links into the DB
  updatepaper.insert(paper, insertfiles, updatepaper.outtitles)
