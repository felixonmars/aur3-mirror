#!/usr/bin/python2

import re, tempfile, mp3Handler

streamURLRegex = re.compile(
	"(http://.*[.]grooveshark[.]com/.*[.]mp3.*" +
	"|http://stream.*[.]grooveshark[.]com/stream.php)"
)

adCSSRegex = re.compile(
	"http://.*[.]grooveshark[.]com/webincludes/css/gslite[.]css.*"
)

class Filter(object):
	def __init__(self, *args, **kwargs):
		pass
	
	def process(self, data):
		return data
	
	def done(self):
		pass

class SongDownloader(Filter):
	"""A filter which will save MP3s which are transferred through the proxy"""
	# A string which will store the song data
	data = ""
	
	# Remember if the headers have been sent yet
	headersFinished = False
	
	def process(self, data):
		self.data += data
		return Filter.process(self, data)
	
	def done(self):
		try:
			header, song = self.data.split("\r\n\r\n", 2)
		except ValueError:
			# Header issues of some sort...
			return Filter.done(self)
		
		# Check that a music file arrived
		if len(song) > 10000:
			_ , mp3FileName = tempfile.mkstemp()
			mp3File = open(mp3FileName, "wb")
			mp3File.write(song)
			mp3File.close()
			
			mp3Handler.organiseMP3(mp3FileName)
		
		return Filter.done(self)

class AdStripper(Filter):
	"""
	A filter to strip out ads from grooveshark.
	
	This uses a prettey nasty hack by simply swapping out the actual response with
	some static CSS and a rough invalid HTTP header. It works but it ain't prety.
	"""
	def process(self, data):
		return ""
	
	def done(self):
		print "Strip ads..."
		
		# Makeshift header -- invalid really!
		newCSS  = "HTTP/1.0 200 OK\r\n"
		newCSS += "\r\n"
		
		# Create a simple stylesheet to do the minimum to show just the flash
		# component and no ads!
		newCSS += "body { background-color : black; color : black; }"
		newCSS += "#adPane { display : none }"
		newCSS += "#sidebarFrameWrapper { display : none }"
		newCSS += "#gsliteswf { position : absolute; display : block;"
		newCSS += "             top : 0; left : 0; right : 0; bottom : 0;}"
		
		return newCSS

def getFilter(path):
	if streamURLRegex.match(path):
		return SongDownloader(path)
	elif adCSSRegex.match(path):
		return AdStripper(path)
	else:
		return Filter(path)
