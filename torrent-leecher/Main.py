#! /usr/bin/env python
# -*- coding: utf-8 -*-

#Files
###################################################################################
from Configs import Configs
from DataUnits import DataUnits
from HttpClient import HttpClient
from HttpServer import HttpServer
from Logs import Logs
from Manipulator import Manipulator

#Classes
###################################################################################
class Main:
	def __init__(self):
		self.Logs = Logs(self)
		self.Configs = Configs(self)
		self.DataUnits = DataUnits(self)
		self.HttpClient = HttpClient(self)
		self.HttpServer = HttpServer(self)
		self.Manipulator = Manipulator(self)

	def start(self):
		self.HttpServer.start()
#Run
###################################################################################
TorrentLeecher = Main()
TorrentLeecher.start()
