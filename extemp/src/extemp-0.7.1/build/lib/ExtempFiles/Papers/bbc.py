from ExtempFiles.update import MainUpdate

def update():
  paper = "bbc"
  feeds = ("http://newsrss.bbc.co.uk/rss/newsonline_world_edition/africa/rss.xml",
           "http://newsrss.bbc.co.uk/rss/newsonline_world_edition/americas/rss.xml",
           "http://newsrss.bbc.co.uk/rss/newsonline_world_edition/asia-pacific/rss.xml",
           "http://newsrss.bbc.co.uk/rss/newsonline_world_edition/europe/rss.xml",
           "http://newsrss.bbc.co.uk/rss/newsonline_world_edition/middle_east/rss.xml",
           "http://newsrss.bbc.co.uk/rss/newsonline_world_edition/south_asia/rss.xml"
           )


  #Get links and titles from parsing
  updatepaper = MainUpdate()
  updatepaper.parse(paper, feeds)

  if len(updatepaper.links) == 0:
    print("No new articles found.")
    return 0

  #Do bbc specific stuff to the links
  filter = ("sport", "default", "thread", "blogs", "picture_gallery", "pop_ups")
  beginurl = "http://newsvote.bbc.co.uk/mpapps/pagetools/print/news.bbc.co.uk"
  total = len(updatepaper.links)
  actualurls = []
  actualtitles = []
  for num in range(0,  total):
    link = updatepaper.links[num]
    title = updatepaper.titles[num]

    append = "yes"
    for blacklist in filter:
      if blacklist in link:
        append = "no"
        break

    if append == "yes":
      splitlink = link.split("/")
      beginnum = splitlink.index("-") + 1
      actualurl = beginurl
      for urlchunk in splitlink[beginnum:]:
        actualurl = actualurl + "/" + urlchunk
      actualurls.append(actualurl)
      actualtitles.append(title)

  #Check to see if after filter, there are any urls left
  if len(actualurls) == 0:
    print("No new articles found.")
    return 0

  #Download the modified links
  updatepaper.download(paper, actualurls, actualtitles)

  #Insert the modified links into the DB
  updatepaper.insert(paper, updatepaper.outfiles, updatepaper.outtitles)
