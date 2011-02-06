#!/usr/bin/ent python
# -*- coding: utf-8 -*-

""" Imports                                                          """
import os
import user
import xml
import xml.dom.minidom as dom
import string
import re

from base64 import b64decode, b64encode
from urllib import URLopener, urlencode
from urllib2 import build_opener, HTTPCookieProcessor, URLError
from cookielib import CookieJar

""" Configuration                                                    """
CONFIG_DIR = user.home+os.sep+".config"+os.sep+"ade-programme"+os.sep
CONFIG_FILE = "config.xml"
BASE_IMG_URL = "http://web.univ-ubs.fr/ade/imageEt?projectId=3&idPianoD\
ay=0%2C1%2C2%2C3%2C4&width=800&height=500&lunchName=REPAS&displayMode=1\
057855&showLoad=false&ttl=1272441274368&displayConfId=8"

""" Definitions                                                      """
class AdeConnectionUtil:
	identifier = None
	CJ = None
	connection = None
	connected = False
	username = ""
	password = ""
	
	def __init__(self):
		""" Initialisation de AdeConnectionUtil
		Cette méthode permet de construire le connecteur de site et le
		gestionnaire de cookie."""
		self.CJ = CookieJar()
		self.connection = build_opener(HTTPCookieProcessor(self.CJ))
	
	def setIds(self, newusername, newpassword):
		""" Initialisation des username password
		Sans ceux-ci, impossible de se connecter."""
		checkType(newusername, str)
		checkType(newpassword, str)
		
		self.username = newusername
		self.password = newpassword
	
	def getConnection(self, force = False, username = None, password = None):
		""" Méthode appelée par toutes les autres méthodes de la classe
		Elle permet de voir si on a déjà récupérer les cookies nécéssaires
		à la connection sur Ade. """
		if force:self.connected = False
		if not(username and password):
			username = self.username
			password = self.password
		if not(self.connected):
			try:
				u = self.connection.open("https://cas.univ-ubs.fr/login").read()
				f = '<input type="hidden" name="lt" value="'
				l = u.rfind(f)
				r = u.rfind('" />\n\t\t\t\t\t\t<input type="hidden" name="_eventId"')
				data = u[l+len(f):r]
				params = urlencode({
					"username":username,
					"password":password,
					"lt":data,
					"_eventId":"submit",
					"submit":"SE CONNECTER"
				})
				
				self.connection.open("https://cas.univ-ubs.fr/login", params)
				
				u = self.connection.open("http://web.univ-ubs.fr/edt/ade/custom/myplanning/myPlanning.jsp?top=top.moniframeesup")
				u = u.read()
				f = '<FRAME src="../../'
				l = u.rfind(f)
				r = u.rfind('" name="planning">')
				data = u[l+len(f):r]
			
				if len(data) > 500:
					raise ValueError
				
				self.connection.open("http://web.univ-ubs.fr/edt/ade/"+data)
			except URLError:
				raise IOError
			self.connected = True
	
	def getGroups(self):
		""" Méthode permettant de connaitre les différents groups attachés
		à l'année qu'est en train de suivre l'élève qui se connecte. """
		self.getConnection()
		groups = {}
		try:
			u = self.connection.open("http://web.univ-ubs.fr/ade/standard/gui/tree.jsp?forceLoad=false&isDirect=true")
			u = u.read()
			"""start = u.find("treelineselected")
			end = u.rfind("treelineselected")
			u = u[start:end+300]"""
			u = string.join(string.split(u, "javascript:check("), "<DEB>")
			u = string.join(string.split(u, ", 'true');\">"), "<SEP>")
			u = string.join(string.split(u, ", 'false');\">"), "<SEP>")
			u = string.join(string.split(u, "</a>"), "<FIN>")
			list = re.findall("<DEB>([0-9]*)<SEP>([0-9a-zA-Z -]*)<FIN>", u)
			for i in list:
				groups[i[1]] = int(i[0])
		except URLError:
			raise IOError
		return groups
	
	def getCorrectId(self):
		""" Permet d'obtenir un identifiant unique afin de pouvoir télécharger
		les plannings et autres informations... """
		if not(self.identifier):
			self.getConnection()
			try:
				u = self.connection.open("http://web.univ-ubs.fr/ade/custom/modules/plannings/imagemap.jsp?width=800&height=600")
				u = u.read()
				f = '<img border=0 src="/ade/imageEt?identifier='
				l = u.rfind(f)
				r = u.rfind('&projectId=3&idPianoWeek=')
				self.identifier = u[l+len(f):r]
			except URLError:
				raise IOError
		return self.identifier
	
	def getConnected(self, username = None, password = None):
		if username and password:
			self.getConnection(True, username, password)
		else:
			self.getConnection(True)
		return self.connected

class AdeProgrammeUtils:
	connection = AdeConnectionUtil()
	document = None
	uo = URLopener()
	
	def __init__(self):
		""" Constructeur de la classe AdeProgrammeUtils
		Il vérifie si les fichiers de configurations sont présents et, 
		le cas échéant en crée un. """
		if not(os.path.exists(CONFIG_DIR)):
			os.mkdir(CONFIG_DIR)
		os.chdir(CONFIG_DIR)
		if not(os.path.isfile(CONFIG_FILE)):
			# Basic configuration of the file
			self.setBasicDocument()
		else:
			try:
				self.document = dom.parse(CONFIG_FILE)
				self.makeCorrectIds()
				con = self.getConnectionIds()
				self.connection.setIds(str(con["username"]), str(con["password"]))
			except xml.parsers.expat.ExpatError:
				# Basic configuration of the file
				self.setBasicDocument()
		self.saveDocument()
	
	def setBasicDocument(self):
		""" Permet de mettre le contenu minimal du document. """
		# Basic configuration of the file
		self.document = dom.Document()
		root = self.document.createElement("data")
		
		# It's the first run for the application
		firstrun = self.document.createElement("merge")
		root.appendChild(firstrun)
		firstrun.setAttribute("id", "firstrun")
		firstrun.setAttribute("value", "True")
		
		self.document.appendChild(root)
		self.makeCorrectIds()
	
	def makeCorrectIds(self):
		""" Permet de lier les id aux identifiants des neuds pour pouvoir
		y accéder par le getElementById. """
		for i in self.document.getElementsByTagName("*"):
			if i.hasAttribute("id"):
				i.setIdAttribute("id")
	
	def saveDocument(self):
		""" Permet de sauvegarder le fichier de configuration. """
		os.chdir(CONFIG_DIR)
		f = open(CONFIG_FILE, "w")
		f.write(self.document.toxml())
		f.close()
	
	def isFirstRun(self):
		""" Permet de connaitre si c'est le premier démarrage de
		l'application. """
		ret = True
		firstrun = self.document.getElementById("firstrun")
		if firstrun:
			if firstrun.hasAttribute("value"):
				values = ("False", "True")
				val = firstrun.getAttribute("value")
				if val in values:
					ret = bool(int(values.index(val)))
		return ret
		
	def setFirstRun(self, newfirstrun):
		""" Permet de définir si le permier démarrage est fini. """
		checkType(newfirstrun, bool)
		
		root = self.document.firstChild
		firstrun = self.document.getElementById("firstrun")
		if not(firstrun):
			firstrun = self.document.createElement("merge")
			firstrun.setAttribute("id", "firstrun")
			firstrun.setIdAttribute("id")
			root.appendChild(firstrun)
		firstrun.setAttribute("value", str(newfirstrun))
		self.saveDocument()
	
	def setConnectionIds(self, newusername, newpassword):
		""" Permet à l'utilisateur de changer ses identifiants. """
		checkType(newusername, str)
		checkType(newpassword, str)
		
		self.connection.setIds(newusername, newpassword)
		root = self.document.firstChild
		username = self.document.getElementById("username")
		password = self.document.getElementById("password")
		if not(username):
			username = self.document.createElement("merge")
			username.setAttribute("id", "username")
			username.setIdAttribute("id")
			root.appendChild(username)
		username.setAttribute("value", newusername)
		if not(password):
			password = self.document.createElement("merge")
			password.setAttribute("id", "password")
			password.setIdAttribute("id")
			root.appendChild(password)
		password.setAttribute("value", b64encode(newpassword))
		self.saveDocument()
	
	def getConnectionIds(self):
		""" Permet à l'utilisateur d'obtenir ses identifiants. """
		username = self.document.getElementById("username")
		password = self.document.getElementById("password")
		ret = {
			"username":"",
			"password":""
		}
		if username and username.hasAttribute("value"):
			ret["username"] = username.getAttribute("value")
		if password and password.hasAttribute("value"):
			ret["password"] = b64decode(password.getAttribute("value"))
		return ret
	
	def refreshGroups(self):
		""" Permet de rafraichir la liste des groupes utiles à
		l'utilisateur. """
		groupTable = self.connection.getGroups()
		root = self.document.firstChild
		groups = self.document.getElementById("groups")
		if not(groups):
			groups = self.document.createElement("merge")
			groups.setAttribute("id", "groups")
			groups.setIdAttribute("id")
			root.appendChild(groups)
		else:
			while groups.hasChildNodes():
				groups.removeChild(groups.firstChild)
		for i in groupTable:
			node = self.document.createElement("merge")
			node.setAttribute("name", i)
			node.setAttribute("value", str(groupTable[i]))
			groups.appendChild(node)
		self.saveDocument()
	
	def getGroups(self):
		""" Permet d'obtenir la liste des groupes. """
		groupTable = []
		groups = self.document.getElementById("groups")
		if groups:
			first = groups.firstChild
			if first:
				node = first
				while True:
					if node.hasAttribute("name") and node.hasAttribute("value"):
						#groupTable[node.getAttribute("name")] = int(node.getAttribute("value"))
						groupTable.append(node.getAttribute("name"))
					node = node.nextSibling
					if not(node):
						break
		return groupTable
	
	def getGroupsIds(self):
		""" Permet d'obtenir la liste des groupes et des identifiants
		qui y son rattachés. """
		groupTable = {}
		groups = self.document.getElementById("groups")
		if groups:
			first = groups.firstChild
			if first:
				node = first
				while True:
					if node.hasAttribute("name") and node.hasAttribute("value"):
						groupTable[node.getAttribute("name")] = int(node.getAttribute("value"))
					node = node.nextSibling
					if not(node):
						break
		return groupTable
	
	def getUserGroup(self):
		""" Permet de connaitre le groupe de l'utilisateur. """
		usergroup = 0
		group = self.document.getElementById("usergroup")
		if group and group.hasAttribute("value"):
			usergroup = int(group.getAttribute("value"))
		groups = self.getGroupsIds()
		for i in groups:
			if usergroup == groups[i]:
				return i
		return 0
	
	def setUserGroup(self, grpName):
		""" Permet de définir le groupe de l'utilisateur. """
		checkType(grpName, str)
		
		if grpName in self.getGroups():
			numGrp = self.getGroupsIds()[grpName]
			root = self.document.firstChild
			group = self.document.getElementById("usergroup")
			if not(group):
				group = self.document.createElement("merge")
				group.setAttribute("id", "usergroup")
				group.setIdAttribute("id")
				root.appendChild(group)
			group.setAttribute("value", str(numGrp))
			self.saveDocument()
	
	def getPlanning(self, semaine, groupId = None, identifier = None):
		""" Permet d'avoir l'addresse du planning dans le dossier tmp. """
		checkType(semaine, int)
		if groupId:checkType(groupId, str)
		else:
			if self.getUserGroup():
				groupId = self.getUserGroup()
			else:
				raise ReferenceError
		groupId = self.getGroupsIds()[groupId]
		
		if identifier:checkType(identifier, str)
		else:
			identifier = self.connection.getCorrectId()
		
		num = (semaine + 18) % 53
		url = BASE_IMG_URL+'&idPianoWeek='+str(num)+'&idTree='+str(groupId)+'&identifier='+identifier
		file = self.uo.retrieve(url)[0]
		return file

def checkType(object, req):
	if type(object) != req:
		raise TypeError(str(type(object))+" recieved "+str(req)+" expected.")
