#! /usr/bin/env python2

import eyeD3
import sys
import locale

ENCODING = locale.getpreferredencoding();
filename = sys.argv[1]
parameter = sys.argv[2]
tag = eyeD3.Tag()
tag.link(filename)

if parameter == "art": 
	print tag.getArtist().encode(ENCODING, "replace")
elif parameter == "alb": 
	print tag.getAlbum().encode(ENCODING, "replace")
elif parameter == "tit": 
	print tag.getTitle().encode(ENCODING, "replace")
elif parameter == "gen": 
	print tag.getGenre()
elif parameter == "yea": 
	print tag.getYear()
elif parameter == "tra": 
	print tag.getTrackNum()
