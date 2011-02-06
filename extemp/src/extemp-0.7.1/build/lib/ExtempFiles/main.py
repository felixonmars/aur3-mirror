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
import tarfile
import time
import urllib
import sqlite3
from ftplib import FTP

class Main:

  #Define constants, create/initiate DB, prepare TMPDIR
  def __init__(self):
    self.MATCHLIMIT = 30
    self.CLEANDAYS = 21
    self.FTPHOST = 'ftp.berlios.de'
    self.FTPDIR = '/pub/extemp/'
    self.EXTEMPDIR = os.path.join(os.environ['HOME'], ".extemp")
    self.DB = os.path.join(self.EXTEMPDIR, "articles.db")
    self.TMPDIR = os.path.join(self.EXTEMPDIR, "tmp")

    self.PAPERS = []
    #Get list of papers
    import ExtempFiles.Papers
    for file in os.listdir(ExtempFiles.Papers.__path__[0]):
      if not "__init__" in file and not ".pyc" in file:
        papername = file.split('.')[0]
        if not papername == '':
          self.PAPERS.append(papername)
    self.PAPERS.sort()

    #Create EXTEMPDIR
    if not os.path.isdir(self.EXTEMPDIR):
      os.makedirs(self.EXTEMPDIR)

    #Create self.TMPDIR / clean it out
    if not os.path.isdir(self.TMPDIR):
      os.makedirs(self.TMPDIR)
    else:
      for root, dirs, files in os.walk(self.TMPDIR, topdown=False):
        for file in files:
          os.remove(os.path.join(root, file))
        for dir in dirs:
          os.rmdir(os.path.join(root, dir))

    #HACK ALERT: I need to not open the db to make sure
    #the file is not in use when I am syncing
    #UGLY!!!
    #Create self.DB if it does not exist
    if sys.argv[1:] and not sys.argv[1] == "sync":
      if not os.path.isfile(self.DB):
        self.articlesdb = sqlite3.connect(self.DB)
        self.dbcursor = self.articlesdb.cursor()
        self.dbcursor.execute('CREATE TABLE articles (id INTEGER PRIMARY KEY, date TEXT, paper TEXT, title TEXT, content TEXT)')
        self.articlesdb.commit()
      else:
        self.articlesdb = sqlite3.connect(self.DB)
        self.dbcursor = self.articlesdb.cursor()


  #Determine if network is up
  def checknetwork(self):
    try:
      urllib.urlopen("http://google.com")
    except IOError:
      exit("There is no internet connection.")



  #The download bar called by sync and urlretrieve
  def downloadbar(self, completed, blocksize, totalsize):
    currenttime = float(time.time())
    sizeinmb = float(totalsize) / float(1000000)
    totalblocks = float(totalsize) / float(blocksize)
    percdone = (float(completed) * float(100)) / float(totalblocks)

    if percdone > 100:
      percdone = 100

    sys.stdout.write("\r" + "[Downloading] " + "%.1f" % percdone + "% of " + "%.1f" % sizeinmb + " MB ")
    sys.stdout.flush()



  #Display the help dialog
  def help(self):
    print('Usage: extemp [option] [paper] [search phrases]')
    print("")
    print('Options:')
    print("")
    print('     title   - search article titles for `search phrases\'')
    print('     search  - search article content for `search phrases\'')
    print("")
    print('     sync    - download the latest database snapshot')
    print('     update  - download new articles into the database')
    print("")
    print('     clean   - remove old downloaded articles')
    print('     delete  - remove all articles from `paper\'')
    print('     remove  - remove a numbered database entry')
    print('     vacuum  - perform sql vacuum on database')
    print("")
    print('     status  - print the status of the database')
    print("")
    print('Papers:')
    print("")
    print('all - applies option to all of the papers below')
    print("")

    #Get character number of longest paper
    longest = len(max(self.PAPERS, key=len))
    papernum = len(self.PAPERS)

    #Determine distance in the array between papers in order to alphabetize
    wordsperline = 3
    papergap = papernum / wordsperline
    if (papernum % wordsperline) > 0:
      papergap += 1

    #Print papers
    for i in range(0, papergap):
      for num in range(i, papernum, papergap):
        spaces = longest - len(self.PAPERS[num]) + 2
        sys.stdout.write(self.PAPERS[num] + " " * spaces)
      sys.stdout.write("\n")



  #Delete old articles by checking timestamps
  def clean(self):

    #Exit if no paper is specified
    if not sys.argv[2:]:
      exit('No paper specified for `clean\', see extemp help')

    #Parse Arguments, set papers and length
    if sys.argv[2] in self.PAPERS:
      papers = [ sys.argv[2] ]
      paperlength = len(papers)
    elif sys.argv[2] == "all":
      papers = self.PAPERS
      paperlength = len(max(papers, key=len))
    else:
      exit('Paper `' + sys.argv[2] + "' is not a valid paper, see extemp help")

    #Delete old articles
    currentdate = int(time.time())
    cleandate = currentdate - (self.CLEANDAYS * 24 * 60 * 60)
    totalentriesdel = 0
    for paper in papers:
      cleantuple = (paper, cleandate)
      entriesdel = self.dbcursor.execute("select count(*) from articles where paper=? AND date < ?", cleantuple).fetchone()[0]
      self.dbcursor.execute("delete from articles where paper=? AND date < ?", cleantuple)
      totalentriesdel += entriesdel

      #Output single paper
      spaces = paperlength - len(paper) + 1
      print(paper + ":" + "%*s" % (spaces, "") + "%5s" % str(entriesdel) + " deleted")

    #Delete entries from papers no longer supported and output TOTAL
    if sys.argv[2] == "all":

      #Old Articles not in self.PAPERS, perhaps a paper no longer supported
      cleantuple = (cleandate,)
      entriesdel = self.dbcursor.execute("select count(*) from articles where date < ?", cleantuple).fetchone()[0]
      self.dbcursor.execute("delete from articles where date < ?", cleantuple)

      #Only output del total if some found
      if entriesdel > 0:
        spaces = paperlength - len("unidentified") + 1
        print("unidentified:" + "%*s" % (spaces, "") + "%5s" % str(entriesdel) + " deleted")
        totalentriesdel += entriesdel
      
      #Output
      print("")
      spaces = paperlength - len("TOTAL") + 1
      print("TOTAL" + ":" + "%*s" % (spaces, "") + "%5s" % str(totalentriesdel) + " deleted")

      self.articlesdb.commit()



  #Delete all the entries from db of paper specified
  def delete(self):
    #Exit if no paper is specified
    if not sys.argv[2:]:
      exit('No paper specified for `delete\', see extemp help')

    elif sys.argv[2] == "all":
      entriesdel = self.dbcursor.execute("select count(*) from articles").fetchone()[0]
      self.dbcursor.execute("delete from articles")
      self.articlesdb.commit()
      print(str(entriesdel) + " articles deleted from database.")

    elif sys.argv[2] in self.PAPERS:
      deletetuple = (sys.argv[2],)
      entriesdel = self.dbcursor.execute("select count(*) from articles where paper=?", deletetuple).fetchone()[0]
      self.dbcursor.execute("delete from articles where paper=?", deletetuple)
      self.articlesdb.commit()
      print(str(entriesdel) + " articles deleted from " + sys.argv[2])

    else:
      exit('Paper `' + sys.argv[2] + "' is not a valid paper, see extemp help")  



  #Delete a specific entry by its id number
  def remove(self):
    #Sanity checks on input
    if not sys.argv[2:]:
      exit('No id number was specified for `remove\'')
    elif not sys.argv[2].isdigit():
      exit('Id `' + sys.argv[2] + "' is not a valid database entry id")

    removetuple = (sys.argv[2],)
    entriesrem = self.dbcursor.execute("select count(*) from articles where id=?", removetuple).fetchone()[0]
    if entriesrem == 0:
      print("There are no entries with the id `" + sys.argv[2] + "'")
    else:
      entriesrem = self.dbcursor.execute("delete from articles where id=?", removetuple)
      self.articlesdb.commit()
      print("Removed entry `" + sys.argv[2] + "'")



  #Count the number of articles paper directory
  def status(self):
    #Parse arguments, set papers, paperlength
    if not sys.argv[2:]:
      exit('No paper specified for `status\', see extemp help')
    elif sys.argv[2] in self.PAPERS:
      papers = [ sys.argv[2] ]
      paperlength = len(sys.argv[2])
    elif sys.argv[2] == "all":
      papers = self.PAPERS
      paperlength = len(max(papers, key=len))
    else:
      exit('Paper `' + sys.argv[2] + "' is not a valid paper, see extemp help")

    #Count the files
    totalfiles = 0
    for paper in papers:
      papertuple = (paper,)
      filenum = self.dbcursor.execute("select count(*) from articles where paper=?", papertuple).fetchone()[0]

      #Output single paper
      spaces = paperlength - len(paper) + 1
      print(paper + ":" + "%*s" % (spaces, "") + "%5s" % str(filenum) + "  articles")

    #Output total if all selected
    if sys.argv[2] == "all":
      print("")
      filenum = self.dbcursor.execute("select count(*) from articles").fetchone()[0]
      spaces = paperlength - len("TOTAL") + 1
      print("TOTAL" + ":" + "%*s" % (spaces, "") + "%5s" % str(filenum) + "  " + "articles")



  #Search through the articles, open matches in firefox
  def search(self, type):

    #Parse arguments
    if type == "search":
      dbnum = 4
    elif type == "title":
      dbnum = 3
      
    if not sys.argv[2:]:
      exit('No paper specified for `' + type + "', see extemp help")
    elif len(sys.argv[3:]) == 0:
      exit('No search terms were specified, see extemp help')

    #Get the initial matches from DB
    if sys.argv[2] == "all":
      querytuple = ("%" + sys.argv[3] + "%",)
      if type == "search":
        matches = self.dbcursor.execute('select * from articles where content like ?', querytuple).fetchall()
      elif type == "title":
        matches = self.dbcursor.execute('select * from articles where title like ?', querytuple).fetchall()
    elif sys.argv[2] in self.PAPERS:
      querytuple = (sys.argv[2], "%" + sys.argv[3] + "%")
      if type == "search":
        matches = self.dbcursor.execute('select * from articles where paper=? AND content like ?', querytuple).fetchall()
      elif type == "title":
        matches = self.dbcursor.execute('select * from articles where paper=? AND title like ?', querytuple).fetchall()
    else:
      exit("Paper `" + sys.argv[2] + "' is not in the database, see extemp help")
    
    #Print first argfindings
    matchnum = len(matches)
    arglist = "`" + sys.argv[3] + "'"
    maxnumlen = len(str(matchnum))
    print("%*s" % (maxnumlen, matchnum) + " matches for search terms: " + arglist)
    if matchnum == 0:
      exit()

    #Other argument searching
    if sys.argv[4:]:

      for arg in sys.argv[4:]:
        oldmatches = matches
        matches = []
        arglist = arglist + " & " + "`" + arg + "'"
        for dbentry in oldmatches:
          if arg.lower() in dbentry[dbnum].lower():
            matches.append(dbentry)

        #Print search result output
        matchnum = len(matches)
        print("%*s" % (maxnumlen, len(matches)) + " matches for search terms: " + arglist)
        if matchnum == 0:
          exit()

    #Get user intervention on what to open
    print("\n" + str(matchnum) + " matches, what do you want to do?\n")
    if matchnum > self.MATCHLIMIT:
      print("1. Open all " + str(matchnum) + " of them.")
      print("2. Open " + str(self.MATCHLIMIT) + " of them.")
      print("3. Open none of them.")
      print("")
      while True:
        answer = raw_input("Option Number: ")
        if answer == "1":
          action = "all"
          break
        elif answer == "2":
          action = "limit"
          break
        elif answer == "3":
          exit()
    else:
      print("1. Open them.")
      print("2. Don't open them.")
      print("")
      while True:
        answer = raw_input("Option Number: ")
        if answer == "1":
          action = "all"
          break
        elif answer == "2":
          exit()

    #Make all matched db entries into html files
    if action == "all":
      for dbentry in matches:
        htmlfile = os.path.join(self.TMPDIR, dbentry[2] + "-" + str(dbentry[0]) + ".html")
        fileobj = open(htmlfile, "w")
        title = "<title>" + dbentry[3].encode("latin-1", "replace") + "</title>\n"
        content = dbentry[4].encode("latin-1", "replace") 
        fileobj.write(title + content)
        fileobj.close()
    
    #Make MATCHLIMIT number of html files by equally spacing out the db entries
    elif action == "limit":
      jump = matchnum / self.MATCHLIMIT
      iter = 0
      for num in range(0, matchnum, jump):
        htmlfile = os.path.join(self.TMPDIR, matches[num][2] + "-" + str(matches[num][0]) + ".html") 
        fileobj = open(htmlfile, "w")
        title = "<title>" + matches[num][3].encode("latin-1", "replace") + "</title>\n"
        content = matches[num][4].encode("latin-1", "replace") 
        fileobj.write(title + content)
        fileobj.close()
        iter += 1
        if iter == self.MATCHLIMIT:
          break

    #Open with firefox
    os.system("firefox " + os.path.join(self.TMPDIR, "*") + " >/dev/null 2>&1 &")



  #Download database snapshot from internet and extract it
  def sync(self):
    #Parse arguments
    if not sys.argv[2:]:
      exit('No paper specified for `sync\', see extemp help')
    elif sys.argv[2] != "all":
      exit("Only `all' can be synced")
    else:

      #Make sure connected to internet
      self.checknetwork()

      #Get snapshot data from ftp
      try:
        sys.stdout.write("[Searching]   Looking for available snapshots ") 
        sys.stdout.flush()
        ftpobj = FTP(self.FTPHOST)
        ftpobj.login()
        ftpobj.cwd(self.FTPDIR)
        snapshotlist = ftpobj.nlst()
        snapshotlist.sort()
        snapshot = snapshotlist[-1]
      except:
        exit("\nFailed to download list of available snapshots")

      #Check if anything in dir
      if not snapshot:
        exit("\nNo snapshots were found")

      snappath = os.path.join(self.EXTEMPDIR, snapshot)

      #If snapshot is different from local, download it
      if os.path.isfile(snappath):
        exit("\nThe most up to date snapshot is already installed")

      print("==> Found: " + snapshot)
      try:
        urllib.urlretrieve("ftp://" + self.FTPHOST + self.FTPDIR  + snapshot, snappath, self.downloadbar)
      except:
        if os.path.isfile(snappath):
          os.remove(snappath)
        exit("\nDownloading the snapshot failed.")

      #Delete old snapshot tarballs if they exist
      for file in os.listdir(self.EXTEMPDIR):
        if "tar" in file and file != snapshot:
          sys.stdout.write("\n[Deleting]    Removing old snapshot ")
          sys.stdout.flush()
          os.remove(os.path.join(self.EXTEMPDIR, file))

      #Delete old database
      if os.path.isfile(self.DB):
        sys.stdout.write("\n[Deleting]    Removing old database ")
        sys.stdout.flush()
        os.remove(self.DB)

      #Extract new snapshot
      print("\n[Extracting]  Installing new database ")
      tarball = tarfile.open(snappath, 'r')
      tarball.extractall(self.EXTEMPDIR)



  #Calls update.py, downloads newspaper articles into database
  def update(self):
    paperlinechars = 54
    if not sys.argv[2:]:
      exit("No paper specified for `update', see extemp help")
    elif sys.argv[2] in self.PAPERS:

      #output paper header line
      paperchoice = sys.argv[2]
      paperlen = len(paperchoice) + 2
      beginchars = (paperlinechars - paperlen) / 2
      endchars = paperlinechars - paperlen - beginchars - 1
      print("\n" + "~" * beginchars + " " + paperchoice + " " + "~" * endchars)

      paper = __import__('ExtempFiles.Papers', globals(), locals(), [paperchoice], -1)
      paper = getattr(paper, paperchoice)
      try:
        paper.update()
      except KeyboardInterrupt:
        exit("\nProgram interrupted by user.")
    elif sys.argv[2] == "all":

      for paperchoice in self.PAPERS:
        #output paper header line
        paperlen = len(paperchoice) + 2
        beginchars = (paperlinechars - paperlen) / 2
        endchars = paperlinechars - paperlen - beginchars - 1
        print("\n" + "~" * beginchars + " " + paperchoice + " " + "~" * endchars)

        paper = __import__('ExtempFiles.Papers', globals(), locals(), [paperchoice], -1)
        paper = getattr(paper, paperchoice)
        try:
          paper.update()
        except KeyboardInterrupt:
          exit("\nProgram interrupted by user.")

    else:
      exit('Paper `' + sys.argv[2] + "' is not a valid paper, see extemp help")



  #Vacuum the database to optimize
  def vacuum(self):
    self.dbcursor.execute("vacuum")
    self.articlesdb.commit()
