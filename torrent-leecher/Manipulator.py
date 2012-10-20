#! /usr/bin/env python
# -*- coding: utf-8 -*-

#Librarys
###################################################################################
from urllib.parse import urlparse

#Classes
###################################################################################
class Manipulator:
	def __init__(self, Parent):
		self.Parent = Parent

	def manipulate(self, path):
		o = urlparse(path)
		path = o.path
		#Is path valid
		if o.scheme and o.netloc and o.path:
			#Do we have something to manipulate
			if o.query:
				stats = {}
				stats["original"] =  {}
				stats["original"]["up"] = 0
				stats["original"]["down"] = 0
				stats["modified"] = {}
				stats["modified"]["up"] = 0
				stats["modified"]["down"] = 0
				queryItems = {}
				attributes = o.query.split("&")
				for attribute in attributes:
					temp = attribute.split("=")
					key = temp[0]
					value = temp[1]
					queryItems[key] = value
				a = -1
				showStats = True
				#Set download
				try:
					stats["original"]["down"] = int(queryItems["downloaded"])
					stats["modified"]["down"] = int(queryItems["downloaded"])
				except:
					showStats = False
				#Set upload
				try:
					stats["original"]["up"] = int(queryItems["uploaded"])
					stats["modified"]["up"] = int(queryItems["uploaded"])
				except:
					showStats = False
				for key, value in queryItems.items():
					a += 1
					#If mofifying uploads
					if key == "uploaded" and self.Parent.Configs.manipulateUploads["enabled"]:
						if self.Parent.Configs.manipulateUploads["type"] == 1:
							value = int(round(int(value)*self.Parent.Configs.manipulateUploads["factor"]))
						else:
							value = int(round(int(queryItems["downloaded"])*self.Parent.Configs.manipulateUploads["factor"]))
						#Set modified upload
						stats["modified"]["up"] = value
					#If mofifying downloads
					if key == "downloaded" and self.Parent.Configs.manipulateDownloads["enabled"]:
						if self.Parent.Configs.manipulateDownloads["type"] == 0:
							value = int(round(int(value)*self.Parent.Configs.manipulateDownloads["factor"]))
						else:
							value = int(round(int(queryItems["uploaded"])*self.Parent.Configs.manipulateDownloads["factor"]))
						#Set modified download
						stats["modified"]["down"] = value
					if a == 0:
						path += "?"+str(key)+"="+str(value)
					else:
						path += "&"+str(key)+"="+str(value)		
				if showStats == False:
					stats = False
			else:
				stats = False
			return {"scheme":o.scheme, "netloc":o.netloc, "path":path, "stats": stats}
		else:
			return False
