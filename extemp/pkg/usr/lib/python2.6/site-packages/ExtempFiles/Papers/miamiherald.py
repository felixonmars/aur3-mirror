from ExtempFiles.update import MainUpdate

def update():
  paper = "miamiherald"
  feeds = ("http://www.miamiherald.com/884/index.xml",
           "http://www.miamiherald.com/509/index.xml",
           "http://www.miamiherald.com/578/index.xml",
           "http://www.miamiherald.com/579/index.xml",
           "http://www.miamiherald.com/581/index.xml",
           "http://www.miamiherald.com/582/index.xml")
        
  #Get links and titles from parsing
  updatepaper = MainUpdate()
  updatepaper.parse(paper, feeds)

  if len(updatepaper.links) == 0:
    print("No new articles found.")
    return 0

  #change to printable
  actualurls = []
  for link in updatepaper.links:
    actualurl = link.replace("/story/", "/v-print/story/")
    actualurls.append(actualurl)

  #Download the links
  updatepaper.download(paper, actualurls, updatepaper.titles)


  #Weed out the non complete articles
  insertfiles = []
  inserttitles = []
  for num, file in enumerate(updatepaper.outfiles):
    if not "Click here for full story" in file:
      insertfiles.append(file)
      inserttitles.append(updatepaper.outtitles[num])

  #Insert the modified links into the DB
  updatepaper.insert(paper, insertfiles, inserttitles)
