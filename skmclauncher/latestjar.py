#!/usr/bin/python2
import json, urllib
for i in json.loads(urllib.urlopen('https://api.github.com/repos/sk89q/skmclauncher/downloads').read()):
	if '-win.zip' not in i['html_url']:
		urllib.urlretrieve (i['html_url'], "skmc.zip")
		print i['html_url']
		break
