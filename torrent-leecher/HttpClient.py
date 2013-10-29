#! /usr/bin/env python
# -*- coding: utf-8 -*-

#Librarys
###################################################################################
from http.client import HTTPConnection, HTTPSConnection
from io import BytesIO
from gzip import GzipFile

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
			#Gzip error fix
			for header in output['headers']:
				if header[0] == 'Content-Encoding' and header[1] == 'gzip':
					output['data'] = GzipFile(fileobj=BytesIO(output['data'])).read()
					output['headers'].remove(header)
		except:
			output = False
		conn.close()
		return output
