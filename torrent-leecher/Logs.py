#! /usr/bin/env python
# -*- coding: utf-8 -*-

#Librarys
###################################################################################
from time import strftime, localtime

#Classes
###################################################################################
class Logs:
	def __init__(self, Parent):
		self.Parent = Parent

	def log(self, message):
		#print("["+str(strftime("%H:%M:%S", gmtime()))+"] "+str(message))
		logfile = open("/var/log/torrent-leecher.log", "a") 
		logfile.write("["+str(strftime("%H:%M:%S", localtime()))+"] "+str(message)+"\r\n")
		logfile.close()
