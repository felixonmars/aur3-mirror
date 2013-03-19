#!/usr/bin/python

from bs4 import BeautifulSoup
import re, string, spacebgutils

##
# Find today's astronomy image
def getbg():
	# parse the page for image information
	base = "http://apod.nasa.gov/apod/"
	item = []
	tree = spacebgutils.geturl(base)
	## title
	i = tree.find_all('center')[1].b.string.strip()
	item.append(i)
	## description
	i = tree.find_all('p')
	i[3].clear()
	item.append(i[2].get_text().strip().replace('\n','<br>'))
	## url
	try:
		i = tree.img.parent['href']
	except AttributeError as e: #no image
		# maybe video
		item.append("")
		item.append(getvideo(tree))
		return item
	# image
	if (i.find('http://') > -1):
		item.append(i)
	else:
		item.append(base+i)
	item.append("")
	return item

##
# Parse for video file
def getvideo(tree):
	i = tree.find_all('iframe')
	if(len(i) == 0):
		return ""
	url = i[0]['src']
	r = re.compile(r'\?.+')
	url = r.sub('', str(url))
	return url

#
