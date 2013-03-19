#!/usr/bin/python

from bs4 import BeautifulSoup
import urllib.request, subprocess, os

#
## Generic functions
#

##
# Return the contents of a url
def geturl(url):
	content = urllib.request.urlopen(url)
	data = content.read()
	content.close()
	return BeautifulSoup(data)
	#return BeautifulSoup(data, convertEntities=BeautifulSoup.HTML_ENTITIES)

##
# Dump a list
def pprint(items):
	i = 0
	while i < len(items):
		item = items[i]
		print(item)
		i += 1

##
# Time difference between two files
def diff(f1, f2):
	fas = subprocess.check_output(["/usr/lib/space-bg/fileage.sh", f1, f2])
	fas = fas[0:-1]
	fa = int(fas)
	return fa

#
