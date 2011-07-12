#!/usr/bin/env python2

# VKGet - CLI mp3 audio downloader for vkontakte.ru
# Copyright (C) 2010-2011 Andrew Dunai
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
# You should have received a copy of the GNU General Public
# License along with this library; if not, write to the
# Free Software Foundation, Inc., 59 Temple Place - Suite 330,
# Boston, MA 02111-1307, USA.
#

import httplib, urllib
import sys, os, re

if len(sys.argv)!=2:
	print "Usage: vkget.py <search query>"
	exit(1)

def remove_html_tags(data):
	p = re.compile(r'<.*?>')
	return p.sub('', data).replace('&nbsp;', ' ');

def fetchCookies(response):
#	result=[]
	result=''
	i=0
	for header,content in response.getheaders():
		if header.lower()=='set-cookie':
			for cookie in content.split(', '):
				i+=1
				if i%2:
#					result.append(cookie[0:cookie.index(';')])
					result+=cookie[0:cookie.index(';')]+'; '
#			result.append(content[0:content.index(" ")])
	return result[0:-2]

#conn = httplib.HTTPConnection("m.vk.com")
#conn.request("POST", "/")

authParams = urllib.urlencode({
	'act':'login',
	'to':'',
	'from_host':'m.vk.com',
	'pda':1,
	'email':'awaken.seven@gmail.com',
	'pass':'andersonbot',
	})
	
headers = {"Content-type": "application/x-www-form-urlencoded", "Accept":"text/plain"}

print " > Logging in..."
conn = httplib.HTTPConnection("login.vk.com:80")
#conn.request("POST", "/?act=login&to=&from_host=m.vk.com&pda=1", authParams, authHeaders);
conn.request("POST", "/", authParams, headers)
response = conn.getresponse()
html = response.read()

print " > Parsing post-authoriation cookies and proceeding login..."
headers["Cookie"] = fetchCookies(response);

redirect=response.getheaders()[6][1]
redirect=redirect[redirect.rfind('/'):1000]

conn = httplib.HTTPConnection("m.vk.com:80")
conn.request("GET", redirect, '', headers);
#print "GETTING" + redirect;

response = conn.getresponse()
#print response.getheaders()
html=response.read()
#print html

headers["Cookie"] += fetchCookies(response)

#print " > ..."

###conn = httplib.HTTPConnection("m.vk.com:80")
###conn.request("GET", "/", '', headers);

###response = conn.getresponse()
#print response.getheaders()
###html=response.read()
#print html

#authParams2 = urllib.urlencode({
#	's':s,
#	'op':'slogin',
#	'redirect':1,
#	'expire':0,
#	'to':''
#	})
#conn.close()

#print " > Authorizing..."
#conn = httplib.HTTPConnection("m.vk.com:80")
#conn.request("POST", "/login", authParams2, headers);
#response = conn.getresponse()
#headers["Cookie"] += fetchCookies(response)
##print headers["Cookie"];

#searchParams = urllib.urlencode({
#	'from':'audio',
#	'q':sys.argv[1],
#	'section':'audio',
#	})

print " > Searching for a track..."
conn = httplib.HTTPConnection("vk.com")
conn.request("GET", "/gsearch.php?from=audio&q="+sys.argv[1].replace(' ','+')+"&section=audio", "", headers)
response = conn.getresponse()
html = response.read()

print " > Fetching URL..."
try:
	start=html.index('operate(')+9;
except ValueError:
	print " > Nothing found :("
	exit(0)
end=html.index(');', start);
operate=html[start:end].split(',');
operate[3]=operate[3][1:-1];

start=html.index('audioTitle')+15
end=html.index('fl_l', start)-15;
track=remove_html_tags(html[start:end])

url="http://cs"+operate[1]+".vkontakte.ru/u"+operate[2]+"/audio/"+operate[3]+".mp3"

print " > Done!"
print " > Track name: "+track
print " > Track URL: "+url

os.system('wget -c '+url+' -O "'+track+'.mp3"')
