__license__ = """
Extemp, newspaper indexing software
Copyright 2008 Matthew Bruenig <matthewbruenig@gmail.com>

This file is part of Extemp.

Extemp is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; either version 3 of the License, or
(at your option) any later version.

Extemp is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.
"""

import os
import sys
import urllib
import feedparser
import sqlite3
import time

class MainUpdate:

  #Defines constants and initializes DB
  def __init__(self):
    self.DB = os.path.join(os.environ['HOME'], ".extemp", "articles.db")
    self.articlesdb = sqlite3.connect(self.DB)
    self.dbcursor = self.articlesdb.cursor()
    #(id INTEGER PRIMARY KEY, date TEXT, paper TEXT, title TEXT, content TEXT)

  #Takes rss feeds and returns list of titles and urls
  def parse(self, paper, feeds, attr = "link"):
    self.links = []
    self.titles = []
    totalfeeds = len(feeds)

    try:
      for num, url in enumerate(feeds):
        sys.stdout.write("\r[Retrieving]  Extracting links from rss feeds: " + str(num + 1) + " of " + str(totalfeeds) + " ")
        sys.stdout.flush()
        try:
          rssfeed = feedparser.parse(url)
        except KeyboardInterrupt:
          exit("\nProgram was interrupted by user")

        #Append new urls and titles to their respective lists
        entriesnum = len(rssfeed['entries'])
        for i in range(0, entriesnum):
          entryurl = rssfeed['entries'][i][attr]
          cleantitle = rssfeed['entries'][i]['title'].encode("ascii", "replace")

          matchtuple = (paper, cleantitle)
          dbmatch = self.dbcursor.execute("select * from articles where paper=? AND title=? limit 1", matchtuple).fetchone()
          if not cleantitle == "" and not cleantitle in self.titles and dbmatch == None:
            self.links.append(entryurl)
            self.titles.append(cleantitle)

    except KeyboardInterrupt:
      exit("\nProgram was interrupted by user")

    print("")
  
  #takes urls, downloads them and returns them as strings
  def scrape(self, paper, urls, titles):
    total = len(urls)
    self.scrapefiles = []
    self.scrapetitles = []
    for num, links in enumerate(urls):

      try:
        sys.stdout.write("\r[Scraping]    Extracting links from  articles: " + str(num + 1) + " of " + str(total) + " ")
        sys.stdout.flush()
        scrapefile = urllib.urlopen(urls[num])
        self.scrapefiles.append(scrapefile.readlines())
        self.scrapetitles.append(titles[num])

      except KeyboardInterrupt:
        exit("\nProgram interrupted by user.")
      except:
        print("==> FAILED")
    
    print("")

  #Takes a list of urls, and outputs a list of html file text and titles
  def download(self, paper, urls, titles):
    total = len(urls)

    #Do the downloading part and fill outfiles list
    self.outfiles = []
    self.outtitles = []
    paperlinechars = 54
    for num in range(0, total):

      #Print the number and title downloading line
      titlechars = paperlinechars - len("[Downloading] " + str(num + 1) + " of " + str(total) + " ==> ")
      if len(titles[num]) > titlechars:
        title = titles[num][0:titlechars-4] + "..." + " "
      else:
        title = titles[num] + " " * (titlechars - len(titles[num]))

      sys.stdout.write("\r[Downloading] " + str(num + 1) + " of " + str(total) + " ==> " + title)
      sys.stdout.flush()

      #Download
      try:
        urlobj = urllib.urlopen(urls[num])
        urlfile = urlobj.read()
        htmlfile = urlfile.replace("HREF=", "FOO=").replace("href=", "foo=").replace("src=", "foo=").replace("SRC=", "FOO=")

        if len(htmlfile.replace("\n", "").replace(" ", "")) == 0:
          endchars = paperlinechars - len("[Downloading] " + str(num + 1) + " of " + str(total) + " ==> FAILED" + "\n")
          sys.stdout.write("\r[Downloading] " + str(num + 1) + " of " + str(total) + " ==> FAILED" + " " * endchars + "\n")
        else:
          self.outfiles.append(htmlfile)
          self.outtitles.append(titles[num])

      except KeyboardInterrupt:
        exit("\nProgram interrupted by user.")

      except:
        endchars = paperlinechars - len("[Downloading] " + str(num + 1) + " of " + str(total) + " ==> FAILED" + "\n")
        sys.stdout.write("\r[Downloading] " + str(num + 1) + " of " + str(total) + " ==> FAILED" + " " * endchars + "\n")
        sys.stdout.flush()
        
    print("")

  #Takes a paper name and a list of html file text and titles, inserts into DB
  def insert(self, paper, htmlfiles, titles):
    print("[Committing]  " + "Saving articles to the database")
    date = int(time.time())
    total = len(htmlfiles)

    for num in range(0, total):

      title = titles[num]
      content = unicode(htmlfiles[num], "latin-1")
      inserttuple = (date, paper, title, content)
      self.dbcursor.execute("insert into articles values (null, ?, ?, ?, ?)", inserttuple)

    self.articlesdb.commit()
    self.dbcursor.close()
