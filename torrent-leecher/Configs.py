#! /usr/bin/env python
# -*- coding: utf-8 -*-

#Librarys
###################################################################################
from configparser import SafeConfigParser
from decimal import Decimal
from os import path, unlink

#Classes
###################################################################################
class Configs(SafeConfigParser):
	def __init__(self, Parent):
		SafeConfigParser.__init__(self)
		self.Parent = Parent
		self.confFile = "/etc/torrent-leecher.conf"
		self.lockFile = "/var/run/daemons/torrent-leecher"
		self.loadConfigs()

	def loadConfigs(self):
		#Load config-file
		if path.exists(self.confFile):
			self.read(self.confFile)
		else:
			self.Parent.Logs.log("ERROR: Config-file doesn't exist")
			unlink(self.lockFile)
			exit()
		#Load connection settings
		try:
			self.host = self.get("connection", "host")
			self.port = self.getint("connection", "port")
		except:
			self.Parent.Logs.log("ERROR: Fix your connection settings")
			unlink(self.lockFile)
			exit()
		#Load tracker settings
		try:
			self.timeout = self.getint("tracker", "timeout")
		except:
			self.Parent.Logs.log("ERROR: Fix your tracker settings")
			unlink(self.lockFile)
			exit()
		#Load log settings
		try:
			self.logIp = self.get("logs", "logip")
			self.sizeFormat = self.get("logs", "sizeformat")
		except:
			self.Parent.Logs.log("ERROR: Fix your log settings")
			unlink(self.lockFile)
			exit()
		#Load download manipulation settings
		try:
			self.manipulateDownloads = {"enabled":self.getboolean("manipulate-downloads", "enabled"),
			"type":self.getint("manipulate-downloads", "type"),
			"factor": Decimal(self.get("manipulate-downloads", "factor"))
			}
		except:
			self.Parent.Logs.log("ERROR: Fix your download manipulation settings")
			unlink(self.lockFile)
			exit()
		#Load upload manipulation settings
		try:
			self.manipulateUploads = {"enabled":self.getboolean("manipulate-uploads", "enabled"),
			"type":self.getint("manipulate-uploads", "type"),
			"factor": Decimal(self.get("manipulate-uploads", "factor"))
			}
		except:
			self.Parent.Logs.log("ERROR: Fix your upload manipulation settings")
			unlink(self.lockFile)
			exit()
