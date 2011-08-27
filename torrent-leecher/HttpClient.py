#! /usr/bin/env python
# -*- coding: utf-8 -*-

#Librarys
###################################################################################
from http.client import HTTPConnection, HTTPSConnection

#Classes
###################################################################################
class HttpClient:
	def __init__(self, Parent):
		self.Parent = Parent
	def open(self, data):
		if data["scheme"] == "https":
			conn = HTTPSConnection(data["netloc"], timeout=self.Parent.Configs.timeout)
		else:
			conn = HTTPConnection(data["netloc"], timeout=self.Parent.Configs.timeout)
		try:
			conn.request("GET", data["path"], "", data["headers"])
		except:
			return False
		try:
			response = conn.getresponse()
			output = {"status":response.status, "reason":response.reason, "data":response.read(), "headers":response.getheaders()}
		except:
			output = False
		conn.close()
		return output
