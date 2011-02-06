from ExtempFiles.update import MainUpdate

def update():
  paper = "dallasmorningnews"
  feeds = ("http://www.dallasnews.com/newskiosk/rss/dallasnewsnationworld.xml",
           "http://www.dallasnews.com/newskiosk/rss/dallasnewsnationalpolitics.xml",
           "http://www.dallasnews.com/newskiosk/rss/dallasnewswash.xml",
           "http://www.dallasnews.com/newskiosk/rss/dallasnewsworld.xml")

  #Get links and titles from parsing
  updatepaper = MainUpdate()
  updatepaper.parse(paper, feeds)

  if len(updatepaper.links) == 0:
    print("No new articles found.")
    return 0

  #Download the links
  updatepaper.download(paper, updatepaper.links, updatepaper.titles)

  if len(updatepaper.outfiles) == 0:
    return 0

  #Format outputted files
  insertfiles = []
  for file in updatepaper.outfiles:
    readfile = file.split("\n")
    insertfile = "<b>Dallas Morning News</b>"

    dowrite = 0
    for line in readfile:
      if dowrite == 1:
        if "<!-- vstory end -->" in line:
          break
        else:
          insertfile = insertfile + "\n" + line
      elif "<!-- vstory begin -->" in line:
        dowrite = 1
        
    insertfiles.append(insertfile)

  #Insert the modified links into the DB
  updatepaper.insert(paper, insertfiles, updatepaper.outtitles)

