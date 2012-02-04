#!/bin/environment python3

""" 
	A short hacked script to download syntevo products.
	Copyright (C) 2011  Peinthor Rene
        Adopted for smartgit download by Alexey Stukalov

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
"""
import os.path
import sys
import re
import http.client, urllib, urllib.request

class Downloader():
	host = 'www.syntevo.com'
	filename = ''
	download_request = ''
	header = {}

	def __init__(self, request_path, file_param):
		self.filename = os.path.basename(file_param)
		sys.stderr.write( 'Initiating ' + self.filename + ' download from ' + self.host + '...\n' )
		self.download_request = '/' + request_path + '?file=' + file_param

	def suck(self):
		sys.stderr.write( 'Connecting to ' + self.host + '...\n' )
		conn = http.client.HTTPConnection(self.host, timeout=5)

		refer = "http://" + self.host + self.download_request
		sys.stderr.write( 'Request URL: ' + refer + '\n' )
		conn.request("GET", self.download_request)
		response = conn.getresponse()
		#get our cookie
		cookie = response.getheader('Set-Cookie')[:response.getheader('Set-Cookie').find(';')] + ';'
		
		self.header["Cookie"] = cookie
		self.header["Referer"] = refer

		conn = http.client.HTTPConnection(self.host, timeout=5)
		#redo request with cookie
		conn.request("GET", self.download_request, headers=self.header)
		response = conn.getresponse()
		htmlstring = response.read().decode('UTF-8')
		conn.close()

		sys.stderr.write( 'Agreeing with the license...\n' )
		form_match = re.search( '\<form action\="\.\.(\/\?[^"]+)" .+\<input type\="hidden" name\="([^"]+)"',
								htmlstring, re.MULTILINE + re.DOTALL )
		if not form_match:
			raise RuntimeError( 'Error parsing license agreement html\n' )
		action = form_match.group(1)
		idvar = form_match.group(2)
		data = { idvar: '', 'accept': 'on' }
		data = urllib.parse.urlencode(data)
		header = self.header.copy()
		header["Content-type"] =  "application/x-www-form-urlencoded"
		conn = http.client.HTTPConnection(self.host, timeout=5)
		conn.request("POST", action, data, header)

		sys.stderr.write( 'Getting file URL...\n' )
		response = conn.getresponse()
		if response.status == 302:
			conn = http.client.HTTPConnection(self.host, timeout=5)
			#redo request with cookie
			conn.request("GET", response.getheader('Location'), headers=self.header)
			response = conn.getresponse()
			htmlstring = response.read().decode('UTF-8')
			conn.close()

			meta_match = re.search( '\<meta http-equiv="refresh" content="1\; URL\=([^"]+)"',
			                        htmlstring, re.MULTILINE + re.DOTALL )
			if not meta_match:
				raise RuntimeError( 'Error parsing file download location\n' )
			fileurl = meta_match.group(1)
		
			sys.stderr.write('Downloading ' + self.filename + '...\n' )
			urllib.request.urlretrieve( 'http://' + self.host + fileurl, self.filename)
			sys.stderr.write('Download finished\n')
		else:
			sys.stderr.write( 'Not moved :(\n')
			conn.close()

if __name__ == '__main__':
	downloader = Downloader(sys.argv[1],sys.argv[2])
	sys.exit(downloader.suck())
