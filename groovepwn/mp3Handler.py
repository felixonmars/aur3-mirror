#!/usr/bin/python2

import os, shutil, errno
from pyid3lib import tag

def organiseMP3(tempFileName):
	try:
		id3tag = tag(tempFileName)
		try:
			title = id3tag.title
		except:
			title = 'Unknown Title'
		try:
			artist = id3tag.artist
		except:
			artist = 'Unknown Artist'
		try:
			album = id3tag.album
		except:
			album = 'Unknown Album'
		fileName = "%s.mp3" % (title)
		songDir = os.path.join('/tmp', artist, album)
		try:
			os.makedirs(songDir)
		except OSError, e:
			if e.errno != errno.EEXIST:
				raise e
		target = os.path.join(songDir, fileName)
		shutil.move(tempFileName, target)
		print "Pwn'd an MP3 file: %s" % (target)
	except Exception, e:
		print "Encoding/identification errors have occurred, but a temp file was stored.", e
		shutil.move(tempFileName, "./")
