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
import sys
import http.client, urllib, urllib.request
import xml.dom.minidom

class Downloader():
	host = 'www.syntevo.com'
	filename = ''
	download_request = ''
	header = {}

	def __init__(self, product, filename):
		self.filename = filename
		download_html = '/' + product + '/download.html'
		file_path = product + '/' + filename
		self.download_request = download_html + '?file=' + file_path

	def suck(self):
		conn = http.client.HTTPConnection(self.host, timeout=5)
                
		refer = "http://" + self.host + self.download_request
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
		dom = xml.dom.minidom.parseString(response.read().decode('UTF-8'))
		formElem = dom.getElementsByTagName("form")[1]
		action = formElem.getAttribute('action')[2:]
		idvar = ''
		for inputElem in formElem.getElementsByTagName("input"):
			if inputElem.getAttribute('type') == 'hidden':
				idvar = inputElem.getAttribute('name')

		conn.close()
		
		data = { idvar: '', 'accept': 'on' }
		data = urllib.parse.urlencode(data)
		header = self.header.copy()
		header["Content-type"] =  "application/x-www-form-urlencoded"
		conn = http.client.HTTPConnection(self.host, timeout=5)
		conn.request("POST", action, data, header)
		response = conn.getresponse()
		if response.status == 302:
			conn = http.client.HTTPConnection(self.host, timeout=5)
			#redo request with cookie
			conn.request("GET", response.getheader('Location'), headers=self.header)
			response = conn.getresponse()
			dom = xml.dom.minidom.parseString(response.read().decode('UTF-8'))
			meta_refresh = dom.getElementsByTagName("meta")[1]
			content = meta_refresh.getAttribute('content')
			fileurl = content[len("1; URL="):]
		
			print('Downloading ' + self.filename )
			urllib.request.urlretrieve( 'http://' + self.host + fileurl, self.filename)
			print('Finished')
		else:
			print( 'Not moved :(')
		conn.close()

if __name__ == '__main__':
	downloader = Downloader(sys.argv[1],sys.argv[2])
	sys.exit(downloader.suck())
