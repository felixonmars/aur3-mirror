#! /usr/bin/env python
# -*- coding: utf-8 -*-

#Librarys
###################################################################################
from http.server import BaseHTTPRequestHandler, HTTPServer
from sys import exc_info

#Remove unnecessary messages from http.server
###################################################################################
def a(b, c, d, e, f):
	pass
BaseHTTPRequestHandler.log_message = a

#Classes
###################################################################################
class HttpServer(HTTPServer):
	def __init__(self, Parent):
		self.Parent = Parent
		self.Parent.Logs.log("Starting..")
		try:
			HTTPServer.__init__(self, (self.Parent.Configs.host, self.Parent.Configs.port), Handler)
			self.Parent.Logs.log("Running proxy on port "+str(self.Parent.Configs.port))
		except:
			self.Parent.Logs.log("ERROR: Port "+str(self.Parent.Configs.port)+" is already in use")
			self.Parent.Logs.log("Shutting down..")
			exit()

	def start(self):
		self.serve_forever()

class Handler(BaseHTTPRequestHandler):
	def do_GET(self):
		self.handleRequest()

	def do_POST(self):
		self.handleRequest()

	def handleRequest(self):
		data = self.server.Parent.Manipulator.manipulate(self.path)
		#Valid request
		if data:
			if self.server.Parent.Configs.logIp:
				self.server.Parent.Logs.log(str(self.client_address[0])+":"+str(self.client_address[1])+" is communicating with "+data["netloc"])
			else:
				self.server.Parent.Logs.log("Communicating with "+data["netloc"])	
			data["headers"] = dict(self.headers.items())
			output = self.server.Parent.HttpClient.open(data)
			#Tracker answerred
			if output:
				#200
				if output["status"] == 200:
					if data["stats"]:
						self.server.Parent.Logs.log("Downloads:"+self.server.Parent.DataUnits.convert(data["stats"]["original"]["down"], self.server.Parent.Configs.sizeFormat)+", Uploads:"+self.server.Parent.DataUnits.convert(data["stats"]["original"]["up"], self.server.Parent.Configs.sizeFormat)+", Modified downloads:"+self.server.Parent.DataUnits.convert(data["stats"]["modified"]["down"], self.server.Parent.Configs.sizeFormat)+", Modified uploads:"+self.server.Parent.DataUnits.convert(data["stats"]["modified"]["up"], self.server.Parent.Configs.sizeFormat))
					else:
						self.server.Parent.Logs.log("No stats to send.")
				#NOT 
				else:
					self.server.Parent.Logs.log("ERROR: "+str(output["status"])+" "+str(output["reason"]))
				try:
					self.send_response(output["status"])
					for header in output["headers"]:
						self.send_header(header[0], header[1])
					self.end_headers()
					if output["data"]:
						self.wfile.write(output["data"])
				except:
					self.server.Parent.Logs.log("ERROR: Couldn't sen data to client: "+str(exc_info()[1]))
			#Tracker didn't answer
			else:
				try:
					self.send_response(503)
					self.send_header("Content-type", "text/plain")
					self.end_headers()
					self.server.Parent.Logs.log("ERROR: Couldn't connect to tracker.")
				except:
					self.server.Parent.Logs.log("ERROR: Couldn't sen data to client: "+str(exc_info()[1]))
		#Invalid request
		else:
			if self.server.Parent.Configs.logIp:
				self.server.Parent.Logs.log("ERROR: "+str(self.client_address[0])+":"+str(self.client_address[1])+" sent invalid request")
			else:
				self.server.Parent.Logs.log("ERROR: Invalid request")
			try:
				self.send_response(400)
				self.send_header("Content-type", "text/plain")
				self.end_headers()
				self.wfile.write(bytes("d14:failure reason36:Missing or bad info_hash in request.e", encoding="utf8"))
			except:
				self.server.Parent.Logs.log("ERROR: Couldn't sen data to client: "+str(exc_info()[1]))
