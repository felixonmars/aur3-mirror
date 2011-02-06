#!/usr/bin/ent python
# -*- coding: utf-8 -*-

""" Imports                                                          """
import pygtk
pygtk.require('2.0')

import gtk
import thread
import adeProgrammeUtils
import gobject

from time import strftime

""" Definitions                                                      """
def checkType(object, req):
	if type(object) != req:
		raise TypeError(str(type(object))+" recieved "+str(req)+" expected.")

class Defaults:
	def doEmit(self, widget, signal, funcP = ()):
		args = [signal]
		for i in funcP:
			args.append(i)
		self.emit(*args)

class MainWindow(gtk.Window, Defaults):
	def __init__(self):
		super(MainWindow, self).__init__()
		self.set_title('Programme scolaire')
		self.set_icon_list(gtk.gdk.pixbuf_new_from_file("/usr/share/pixmaps/ade-programme-gtk.png"))
		
		self.setupACT()
		self.setupUI()
		self.setupSignals()
	
	def setupACT(self):
		# Define the Accelerator (shortcut with keysequence)
		accelGroup = gtk.AccelGroup()
		self.add_accel_group(accelGroup)
		
		# Define the actiongroup
		self.actionGroup = gtk.ActionGroup("BasicAction")
		
		# Define the actions
		self.quitterAction = gtk.Action("quit", "_Quitter", "Quitter l'application.", gtk.STOCK_QUIT)
		self.actionGroup.add_action_with_accel(self.quitterAction, None)
		self.quitterAction.set_accel_group(accelGroup)
		
		self.parametresAction = gtk.Action("properties", "_Paramètres", "Accéder aux paramètres de l'application.", gtk.STOCK_PROPERTIES)
		self.actionGroup.add_action_with_accel(self.parametresAction, None)
		self.parametresAction.set_accel_group(accelGroup)
		
		self.aboutAction = gtk.Action("about", "À _propos", "Qui à crée ce sympatique programme ?", gtk.STOCK_ABOUT)
		self.actionGroup.add_action_with_accel(self.aboutAction, None)
		self.aboutAction.set_accel_group(accelGroup)
	
	def setupUI(self):
		mainLayout = gtk.VBox()
		self.add(mainLayout)
		
		
		self.menuBar = gtk.MenuBar()
		mainLayout.pack_start(self.menuBar, False)
		
		menuItemFichier = gtk.MenuItem("Fichier")
		self.menuBar.append(menuItemFichier)
		
		menuFichier = gtk.Menu()
		menuItemFichier.set_submenu(menuFichier)
		
		menuFichier.append(self.quitterAction.create_menu_item())
		
		menuItemEdition = gtk.MenuItem("Edition")
		self.menuBar.append(menuItemEdition)
		
		menuEdition = gtk.Menu()
		menuItemEdition.set_submenu(menuEdition)
		
		menuEdition.append(self.parametresAction.create_menu_item())
		
		menuItemAide = gtk.MenuItem("?")
		self.menuBar.append(menuItemAide)
		
		menuAide = gtk.Menu()
		menuItemAide.set_submenu(menuAide)
		
		menuAide.append(self.aboutAction.create_menu_item())
		
		toolBar = gtk.Table(1, 2)
		toolBar.set_homogeneous(True)
		mainLayout.pack_start(toolBar, False)
		
		semaineBar = gtk.HBox()
		toolBar.attach(semaineBar, 0, 1, 0, 1)
		
		self.week = gtk.combo_box_new_text()
		i=35
		while i<54:
			self.week.append_text("Semaine "+str(i))
			i=i+1
		i=1
		while i<31:
			self.week.append_text("Semaine "+str(i))
			i=i+1
		semaineBar.add(self.week)
		
		self.thisWeek = gtk.Button("Cette semaine")
		semaineBar.pack_end(self.thisWeek, False)
		
		groupBar = gtk.HBox()
		toolBar.attach(groupBar, 1, 2, 0, 1)
		
		self.grp = gtk.combo_box_new_text()
		groupBar.add(self.grp)
		
		self.refresh = gtk.Button("Rafraichir")
		groupBar.pack_end(self.refresh, False)
		
		self.image = gtk.Image()
		self.image.set_size_request(800,500)
		mainLayout.add(self.image)
		
		""" ABOUT WINDOW """
		self.aboutW = gtk.Dialog("À propos de Ade Programme", self, gtk.DIALOG_MODAL | gtk.DIALOG_DESTROY_WITH_PARENT)
		self.aboutW.set_resizable(False)
		self.aboutW.add_button(gtk.STOCK_OK, gtk.RESPONSE_OK)
		txtIntro = gtk.Label(str('''Ce programme à été réalisé par Charles Gaël DJEDAI.
		
		Il permet à toute personne ayant un compre sur ADE de pouvoir
		obtenir son planning sans même avoir à ouvrir son navigateur ni
		avoir à se connecter à chaque fois.
		
		Si vous trouvez des BUGS, dites le moi !''').replace("\t", ""))
		self.aboutW.get_content_area().pack_start(txtIntro, True, True, 20)
		self.aboutW.get_content_area().show_all()
	
	def setupSignals(self):
		# Definition des signaux
		gobject.signal_new("quitter", MainWindow, gobject.SIGNAL_RUN_FIRST, gobject.TYPE_NONE, ())
		gobject.signal_new("waiting-for-this-week", MainWindow, gobject.SIGNAL_RUN_FIRST, gobject.TYPE_NONE, ())
		gobject.signal_new("waiting-for-dl-img", MainWindow, gobject.SIGNAL_RUN_FIRST, gobject.TYPE_NONE, ())
		gobject.signal_new("waiting-for-params", MainWindow, gobject.SIGNAL_RUN_FIRST, gobject.TYPE_NONE, ())
		gobject.signal_new("pb-dl", FirstRunWindow, gobject.SIGNAL_RUN_LAST, gobject.TYPE_NONE, ())
		
		# Connection des signaux
		self.connect("destroy", self.doEmit, "quitter")
		self.quitterAction.connect("activate", self.doEmit, "quitter")
		self.parametresAction.connect("activate", self.doEmit, "waiting-for-params")
		self.aboutAction.connect("activate", self.displayAbout)
		self.thisWeek.connect("clicked", self.doEmit, "waiting-for-this-week")
		self.week.connect("changed", self.doEmit, "waiting-for-dl-img")
		self.grp.connect("changed", self.doEmit, "waiting-for-dl-img")
	
	def displayAbout(self, widget):
		self.aboutW.run()
		self.aboutW.hide()

class FirstRunWindow(gtk.Dialog, Defaults):
	def __init__(self, parent = None):
		super(FirstRunWindow, self).__init__("Premier démarrage", parent, gtk.DIALOG_MODAL | gtk.DIALOG_DESTROY_WITH_PARENT)
		self.set_size_request(550, 400)
		self.set_resizable(False)
		
		self.setupUI()
		self.setupSignals()
		self.actPage = -1
		self.setState(0)
	
	def setState(self, val):
		checkType(val, int)
		if not(val >=0 and val < len(self.pages)):raise ValueError
		
		for i in self.pages:
			i.hide()
		self.pages[val].show_all()
		
		if val == len(self.pages)-1:
			self.btnSuivant.hide()
			self.btnFermer.show()
		elif val == 0:
			self.btnSuivant.show()
			self.btnFermer.hide()
		else:
			self.btnSuivant.show()
			self.btnFermer.hide()
		
		self.actPage = val
	
	def setupUI(self):
		self.btnQuitter = gtk.Button(None, gtk.STOCK_QUIT)
		self.get_action_area().add(self.btnQuitter)
		
		self.btnSuivant = gtk.Button(None, gtk.STOCK_MEDIA_NEXT)
		self.get_action_area().add(self.btnSuivant)
		
		self.btnFermer = gtk.Button(None, gtk.STOCK_CLOSE)
		self.get_action_area().add(self.btnFermer)
		
		self.get_action_area().show_all()
		
		self.pages = []
		
		""" PAGE 0 """
		self.pages.append(gtk.VBox())
		self.get_content_area().add(self.pages[0])
		
		item = gtk.Label(str('''Bienvenue,
		C'est la première fois que vous démarrez cet utilitaire.
		Vous devez configurer celui-ci affin de pouvoir recevoir
		votre planning.''').replace("\t", ""))
		self.pages[0].add(item)
		
		""" PAGE 1 """
		self.pages.append(gtk.VBox())
		self.get_content_area().add(self.pages[1])
		
		txtIntro = gtk.Label(str('''Pour commencer avec le paramêtrage, vous devez entrer vos
		identifiants de connection à l'ENT. Ceux-ci ne seront pas dévoilés
		à quelque moment que ce soit.''').replace("\t", ""))
		
		formulaire = gtk.Table(4, 2)
		formulaire.attach(txtIntro, 0, 2, 0, 1)
		formulaire.attach(gtk.Label("Numéro étudiant :"), 0, 1, 1, 2, 0, 0)
		formulaire.attach(gtk.Label("Mot de passe :"), 0, 1, 2, 3, 0, 0)
		formulaire.attach(gtk.Label(""), 0, 2, 3, 4)
		
		self.champUsername = gtk.Entry()
		self.champPassword = gtk.Entry()
		self.champPassword.set_visibility(False)
		
		formulaire.attach(self.champUsername, 1, 2, 1, 2, 0, 0)
		formulaire.attach(self.champPassword, 1, 2, 2, 3, 0, 0)
		
		self.pages[1].add(formulaire)
		
		""" PAGE 2 """
		self.pages.append(gtk.VBox())
		self.get_content_area().add(self.pages[2])
		
		txtIntro = gtk.Label(str('''Il faut maintenant que vous sélectionniez le groupe auquel vous
		appartenez. Pour se faire, selectionnez un groupe avant de continuer.''').replace("\t", ""))
		self.pages[2].pack_start(txtIntro, False, True, 10)
		
		tableBox = gtk.HBox()
		self.tableGroups = gtk.TreeView()
		self.tableGroups.set_headers_visible(False)
		self.tableModel = gtk.TreeStore(str)
		self.tableGroups.set_model(self.tableModel)
		tableScroll = gtk.VScrollbar(self.tableGroups.get_vadjustment())
		tableBox.add(self.tableGroups)
		tableBox.pack_end(tableScroll, False)
		self.pages[2].pack_start(tableBox, True, True, 10)
		
		nomsR = gtk.CellRendererText()
		noms = gtk.TreeViewColumn("Groupes", nomsR, text=0)
		noms.set_sort_order(gtk.SORT_ASCENDING)
		self.tableGroups.append_column(noms)
		noms.pack_end(nomsR)
		
		""" PAGE 3 """
		self.pages.append(gtk.VBox())
		self.get_content_area().add(self.pages[3])
		
		txtIntro = gtk.Label(str('''Félicitations, vous avez maintenant configuré l'utilitaire
		de résolution du planning de ADE. Lors des prochains redémarrages
		cet utilitaire ne réapparaitra pas.''').replace("\t", ""))
		self.pages[3].add(txtIntro)
	
	def setupSignals(self):
		# Definition des signaux
		gobject.signal_new("terminated", FirstRunWindow, gobject.SIGNAL_RUN_LAST, gobject.TYPE_NONE, ())
		gobject.signal_new("waiting-for-verif-id", FirstRunWindow, gobject.SIGNAL_RUN_LAST, gobject.TYPE_NONE, (gobject.TYPE_STRING, gobject.TYPE_STRING))
		gobject.signal_new("verif-id-done", FirstRunWindow, gobject.SIGNAL_RUN_LAST, gobject.TYPE_NONE, (gobject.TYPE_INT,))
		gobject.signal_new("waiting-for-groups", FirstRunWindow, gobject.SIGNAL_RUN_LAST, gobject.TYPE_NONE, (gobject.TYPE_OBJECT,))
		gobject.signal_new("groups-done", FirstRunWindow, gobject.SIGNAL_RUN_LAST, gobject.TYPE_NONE, ())
		gobject.signal_new("waiting-for-set-group", FirstRunWindow, gobject.SIGNAL_RUN_LAST, gobject.TYPE_NONE, (gobject.TYPE_STRING,))
		gobject.signal_new("set-group-done", FirstRunWindow, gobject.SIGNAL_RUN_LAST, gobject.TYPE_NONE, ())
		
		# Connection des signaux
		self.connect("delete-event", self.evtDestroy)
		self.connect("verif-id-done", self.callbackVerifIds)
		self.connect("groups-done", self.callbackRefreshGroup)
		self.connect("set-group-done", self.callbackSelectGroup)
		self.btnQuitter.connect("clicked", self.evtDestroy)
		self.btnFermer.connect("clicked", self.doEmit, "terminated")
		self.btnSuivant.connect("clicked", self.evtSuivant)
		self.champUsername.connect("activate", self.evtSuivant)
		self.champPassword.connect("activate", self.evtSuivant)
		self.tableGroups.connect("row-activated", self.evtSuivant)
	
	def evtDestroy(self, widget, data = None):
		errDiag = gtk.MessageDialog(self, gtk.DIALOG_MODAL | gtk.DIALOG_DESTROY_WITH_PARENT, gtk.MESSAGE_WARNING, gtk.BUTTONS_YES_NO)
		errDiag.set_title("Attention...")
		errDiag.set_markup("Etes vous sur de vouloir quitter ?")
		errDiag.format_secondary_markup("Nous ne pouvons nous laisser utiliser l'application sans l'avoir configurée auparavant.")
		response = errDiag.run()
		if response == gtk.RESPONSE_YES:
			self.doEmit(self, "quitter")
		errDiag.hide()
		return True
	
	def evtSuivant(self, widget, a = None, b = None):
		if self.actPage == 1:
			self.evtVerifIds()
		elif self.actPage == 2:
			self.evtSelectGroup()
		else:
			self.setState(self.actPage+1)
	
	def evtVerifIds(self):
		self.tmp = gtk.Dialog("Veuillez patienter...", self, gtk.DIALOG_MODAL | gtk.DIALOG_DESTROY_WITH_PARENT)
		self.tmp.set_has_separator(False)
		self.tmp.set_resizable(False)
		self.tmp.set_deletable(False)
		self.tmp.get_content_area().add(gtk.Label("Vérification des identifiants..."))
		self.tmp.show_all()
		thread.start_new_thread(
			self.doEmit,
			(self, "waiting-for-verif-id", (self.champUsername.get_text(), self.champPassword.get_text()))
		)
	
	def evtRefreshGroup(self, widget):
		self.tmp = gtk.Dialog("Veuillez patienter...", self, gtk.DIALOG_MODAL | gtk.DIALOG_DESTROY_WITH_PARENT)
		self.tmp.set_has_separator(False)
		self.tmp.set_resizable(False)
		self.tmp.set_deletable(False)
		self.tmp.get_content_area().add(gtk.Label("Chargement des noms de groupes..."))
		self.tmp.show_all()
		thread.start_new_thread(
			self.doEmit,
			(self, "waiting-for-groups", (self.tableModel,))
		)
	
	def evtSelectGroup(self):
		val = self.tableGroups.get_selection().get_selected_rows()
		if val[1]:
			iter = val[0].get_iter_from_string(str(val[1][0][0]))
			grp = val[0].get_value(iter, 0)
			self.tmp = gtk.Dialog("Veuillez patienter...", self, gtk.DIALOG_MODAL | gtk.DIALOG_DESTROY_WITH_PARENT)
			self.tmp.set_has_separator(False)
			self.tmp.set_resizable(False)
			self.tmp.set_deletable(False)
			self.tmp.get_content_area().add(gtk.Label("Enregistrement des données utilisateur..."))
			self.tmp.show_all()
			thread.start_new_thread(
				self.doEmit,
				(self, "waiting-for-set-group", (grp,))
			)
		else:
			errDiag = gtk.MessageDialog(self, gtk.DIALOG_MODAL | gtk.DIALOG_DESTROY_WITH_PARENT, gtk.MESSAGE_WARNING, gtk.BUTTONS_OK)
			errDiag.set_title("Attention...")
			errDiag.set_markup("Aucune entrée selectionnée.")
			errDiag.format_secondary_markup("Vous devez sélectionner une entrée afin de faire partie d'un groupe.")
			errDiag.run()
			errDiag.hide()
	
	def callbackVerifIds(self, widget, error = 0):
		checkType(error, int)
		# 1:IdsError
		# 2:Connection
		
		self.tmp.hide()
		del self.tmp
		if error == 1:
			errDiag = gtk.MessageDialog(self, gtk.DIALOG_MODAL | gtk.DIALOG_DESTROY_WITH_PARENT, gtk.MESSAGE_ERROR, gtk.BUTTONS_OK)
			errDiag.set_title("Erreur...")
			errDiag.set_markup("Il y à un problème avec vos identifiants.")
			errDiag.format_secondary_markup("Nous vous suggéront de bien vouloir vérifier si vos identifiants sont corrects et le cas échéant les modifier.")
			errDiag.run()
			errDiag.hide()
		elif error == 2:
			errDiag = gtk.MessageDialog(self, gtk.DIALOG_MODAL | gtk.DIALOG_DESTROY_WITH_PARENT, gtk.MESSAGE_ERROR, gtk.BUTTONS_OK)
			errDiag.set_title("Erreur...")
			errDiag.set_markup("Impossible de contacter le service.")
			errDiag.format_secondary_markup("Il semblerais que le service que vous essayez de contacter soit hors service, ou que vous n'ayez pas de connection internet.")
			errDiag.run()
			errDiag.hide()
		else:
			self.setState(self.actPage+1)
			self.evtRefreshGroup(self)
		
	def callbackRefreshGroup(self, widget):
		self.tmp.hide()
		del self.tmp
	
	def callbackSelectGroup(self, widget):
		self.tmp.hide()
		del self.tmp
		self.setState(self.actPage+1)

class ParametersWindow(gtk.Dialog, Defaults):
	groupName = ""
	modifications = False
	
	def __init__(self, parent):
		super(ParametersWindow, self).__init__("Paramètres de l'application", parent, gtk.DIALOG_MODAL | gtk.DIALOG_DESTROY_WITH_PARENT)
		self.set_size_request(550, 400)
		self.set_resizable(False)
		
		self.setupUI()
		self.setupSignals()
	
	def setupUI(self):
		self.btnAnnuler = gtk.Button(None, gtk.STOCK_CLOSE)
		self.get_action_area().add(self.btnAnnuler)
		
		self.btnAppliquer = gtk.Button(None, gtk.STOCK_APPLY)
		self.get_action_area().add(self.btnAppliquer)
		
		mainLayout = self.get_content_area()
		
		self.tabbed = gtk.Notebook()
		self.tabbed.set_tab_pos(gtk.POS_LEFT)
		mainLayout.pack_start(self.tabbed, True, True, 10)
		
		""" PAGE 1 """
		page1 = gtk.VBox()
		self.tabbed.append_page(page1, gtk.Label("Accueil"))
		
		page1.add(gtk.Label(str('''Dans cet utilitaire, vous pouvez modifier vos identifiants ou
		bien changer votre groupe d'appartenance.
		
		Toutefois, nous vous mettons en garde : Toute action est
		irréversible.''').replace("\t", "")))
		
		""" PAGE 2 """
		page2 = gtk.VBox()
		self.tabbed.append_page(page2, gtk.Label("Modifier vos\nidentifiants"))
		
		txtIntro = gtk.Label(str('''Changer vos identifiants permet de changer d'itentité sur ADE.''').replace("\t", ""))
		txtExtro = gtk.Label(str('''Laissez les champs vides pour n'appliquer aucune modification.''').replace("\t", ""))
		
		formulaire = gtk.Table(4, 2)
		formulaire.attach(txtIntro, 0, 2, 0, 1)
		formulaire.attach(gtk.Label("Nouveau numéro étudiant :"), 0, 1, 1, 2, 0, 0)
		formulaire.attach(gtk.Label("Nouveau mot de passe :"), 0, 1, 2, 3, 0, 0)
		formulaire.attach(txtExtro, 0, 2, 3, 4)
		
		self.champUsername = gtk.Entry()
		self.champPassword = gtk.Entry()
		self.champPassword.set_visibility(False)
		
		formulaire.attach(self.champUsername, 1, 2, 1, 2, 0, 0)
		formulaire.attach(self.champPassword, 1, 2, 2, 3, 0, 0)
		
		page2.add(formulaire)
		
		""" PAGE 3 """
		page3 = gtk.VBox()
		self.tabbed.append_page(page3, gtk.Label("Modifier votre\ngroupe"))
		
		txtIntro = gtk.Label(str('''Modifier votre groupe permet de changer le groupe par défaut
		qui s'affiche automatiquement lors de l'ouverture du programme.''').replace("\t", ""))
		
		page3.pack_start(txtIntro, False, True, 10)
		
		tableBox = gtk.HBox()
		self.tableGroups = gtk.TreeView()
		self.tableGroups.set_headers_visible(False)
		self.tableModel = gtk.TreeStore(str)
		self.tableGroups.set_model(self.tableModel)
		tableScroll = gtk.VScrollbar(self.tableGroups.get_vadjustment())
		tableBox.add(self.tableGroups)
		tableBox.pack_end(tableScroll, False)
		page3.pack_start(tableBox)
		
		nomsR = gtk.CellRendererText()
		noms = gtk.TreeViewColumn("Groupes", nomsR, text=0)
		noms.set_sort_order(gtk.SORT_ASCENDING)
		self.tableGroups.append_column(noms)
		noms.pack_end(nomsR)
		
		groupsRefreshBox = gtk.HBox()
		page3.pack_end(groupsRefreshBox, False)
		
		self.btnRefreshGroups = gtk.Button("Actualiser la liste des Groupes")
		groupsRefreshBox.pack_end(self.btnRefreshGroups, False)
	
	def setupSignals(self):
		# Definition des signaux
		"""gobject.signal_new("terminated", FirstRunWindow, gobject.SIGNAL_RUN_LAST, gobject.TYPE_NONE, ())
		gobject.signal_new("waiting-for-verif-id", ParametersWindow, gobject.SIGNAL_RUN_LAST, gobject.TYPE_NONE, (gobject.TYPE_STRING, gobject.TYPE_STRING))
		gobject.signal_new("verif-id-done", ParametersWindow, gobject.SIGNAL_RUN_LAST, gobject.TYPE_NONE, (gobject.TYPE_INT,))
		gobject.signal_new("waiting-for-groups", ParametersWindow, gobject.SIGNAL_RUN_LAST, gobject.TYPE_NONE, (gobject.TYPE_OBJECT,))
		gobject.signal_new("groups-done", ParametersWindow, gobject.SIGNAL_RUN_LAST, gobject.TYPE_NONE, ())
		gobject.signal_new("waiting-for-set-group", ParametersWindow, gobject.SIGNAL_RUN_LAST, gobject.TYPE_NONE, (gobject.TYPE_STRING,))
		gobject.signal_new("set-group-done", ParametersWindow, gobject.SIGNAL_RUN_LAST, gobject.TYPE_NONE, ())"""
		
		# Connection des signaux
		self.connect("delete-event", self.evtDestroy)
		self.btnAnnuler.connect("clicked", self.evtDestroy)
		self.btnAppliquer.connect("clicked", self.evtAppliquer)
		self.connect("verif-id-done", self.callbackVerifIds)
		self.connect("set-group-done", self.callbackSelectGroup)
		self.btnRefreshGroups.connect("clicked", self.evtRefreshGroup)
		self.connect("groups-done", self.callbackRefreshGroup)
	
	def evtDestroy(self, widget, data = None):
		usernameOk = len(self.champUsername.get_text()) == 0 or len(self.champPassword.get_text()) == 0
		
		val = self.tableGroups.get_selection().get_selected_rows()
		groupeOk = val[1] and val[0].get_value(val[0].get_iter_from_string(str(val[1][0][0])), 0) == self.groupName
		if usernameOk and groupeOk:
			self.hide()
		else:
			errDiag = gtk.MessageDialog(self, gtk.DIALOG_MODAL | gtk.DIALOG_DESTROY_WITH_PARENT, gtk.MESSAGE_WARNING, gtk.BUTTONS_YES_NO)
			errDiag.set_title("Attention...")
			errDiag.set_markup("Etes vous sur de vouloir fermer la fenetre ?")
			errDiag.format_secondary_markup("Il y a des paramètres que vous avez modifiés et non sauvegardés.")
			if errDiag.run() == gtk.RESPONSE_YES:
				self.champUsername.set_text("")
				self.champPassword.set_text("")
				self.hide()
			errDiag.hide()
		return True
	
	def evtAppliquer(self, widget = None):
		usernameOk = len(self.champUsername.get_text()) == 0 or len(self.champPassword.get_text()) == 0
		
		val = self.tableGroups.get_selection().get_selected_rows()
		groupeOk = val[1] and val[0].get_value(val[0].get_iter_from_string(str(val[1][0][0])), 0) == self.groupName
		
		if not(val[1]):
			errDiag = gtk.MessageDialog(self, gtk.DIALOG_MODAL | gtk.DIALOG_DESTROY_WITH_PARENT, gtk.MESSAGE_WARNING, gtk.BUTTONS_OK)
			errDiag.set_title("Attention...")
			errDiag.set_markup("Vous n'avez pas sélectionné de groupe.")
			errDiag.format_secondary_markup("Vous devez impérativement sélectionner un groupe pour le bon fonctionnement du programme.")
			errDiag.run()
			errDiag.hide()
			self.tabbed.set_current_page(2)
		elif not(usernameOk):
			self.modifications = True
			self.tmp1 = gtk.Dialog("Veuillez patienter...", self, gtk.DIALOG_MODAL | gtk.DIALOG_DESTROY_WITH_PARENT)
			self.tmp1.set_has_separator(False)
			self.tmp1.set_resizable(False)
			self.tmp1.set_deletable(False)
			self.tmp1.get_content_area().add(gtk.Label("Vérification des identifiants..."))
			self.tmp1.show_all()
			thread.start_new_thread(
				self.doEmit,
				(self, "waiting-for-verif-id", (self.champUsername.get_text(), self.champPassword.get_text()))
			)
		elif not(groupeOk):
			self.modifications = True
			val = self.tableGroups.get_selection().get_selected_rows()
			newGrp = val[0].get_value(val[0].get_iter_from_string(str(val[1][0][0])), 0)
			thread.start_new_thread(
				self.doEmit,
				(self, "waiting-for-set-group", (newGrp,))
			)
		else:
			thread.start_new_thread(self.doEmit, (self, "terminated"))
	
	def evtRefreshGroup(self, widget):
		self.tmp = gtk.Dialog("Veuillez patienter...", self, gtk.DIALOG_MODAL | gtk.DIALOG_DESTROY_WITH_PARENT)
		self.tmp.set_has_separator(False)
		self.tmp.set_resizable(False)
		self.tmp.set_deletable(False)
		self.tmp.get_content_area().add(gtk.Label("Chargement des noms de groupes..."))
		self.tmp.show_all()
		thread.start_new_thread(
			self.doEmit,
			(self, "waiting-for-groups", (self.tableModel,))
		)
	
	def callbackVerifIds(self, widget, error = 0):
		checkType(error, int)
		# 1:IdsError
		# 2:Connection
		
		self.tmp1.hide()
		del self.tmp1
		if error == 1:
			errDiag = gtk.MessageDialog(self, gtk.DIALOG_MODAL | gtk.DIALOG_DESTROY_WITH_PARENT, gtk.MESSAGE_ERROR, gtk.BUTTONS_OK)
			errDiag.set_title("Erreur...")
			errDiag.set_markup("Il y à un problème avec vos identifiants.")
			errDiag.format_secondary_markup("Nous vous suggéront de bien vouloir vérifier si vos identifiants sont corrects et le cas échéant les modifier.")
			errDiag.run()
			errDiag.hide()
		elif error == 2:
			errDiag = gtk.MessageDialog(self, gtk.DIALOG_MODAL | gtk.DIALOG_DESTROY_WITH_PARENT, gtk.MESSAGE_ERROR, gtk.BUTTONS_OK)
			errDiag.set_title("Erreur...")
			errDiag.set_markup("Impossible de contacter le service.")
			errDiag.format_secondary_markup("Il semblerais que le service que vous essayez de contacter soit hors service, ou que vous n'ayez pas de connection internet.")
			errDiag.run()
			errDiag.hide()
		else:
			self.champUsername.set_text("")
			self.champPassword.set_text("")
			self.evtAppliquer()
	
	def callbackSelectGroup(self, widget):
		self.evtAppliquer()
		
	def callbackRefreshGroup(self, widget):
		self.tmp.hide()
		del self.tmp
		

class AdeProgrammeGtk():
	utils = adeProgrammeUtils.AdeProgrammeUtils()
	mainW = MainWindow()
	firstRunW = FirstRunWindow(mainW)
	parametersW = ParametersWindow(mainW)
	
	def __init__(self):
		
		# mainW
		ugroup = self.utils.getUserGroup()
		keys = self.utils.getGroups()
		keys.sort()
		id = -1
		for i in keys:
			self.mainW.grp.append_text(i)
			if i == ugroup:
				id = keys.index(i)
		self.mainW.grp.set_active(id)
		self.evtMainWThisWeek()
		
		self.mainW.show_all()
		# /mainW
		# firstRunW
		if self.utils.isFirstRun():
			self.firstRunW.show()
		# /firstRunW
		
		self.setupReactions()
		
		gtk.gdk.threads_init()
		
		if not(self.utils.isFirstRun()):
			self.tmp = gtk.Dialog("Veuillez patienter...", self.mainW, gtk.DIALOG_MODAL | gtk.DIALOG_DESTROY_WITH_PARENT)
			self.tmp.set_has_separator(False)
			self.tmp.set_resizable(False)
			self.tmp.set_deletable(False)
			self.tmp.get_content_area().add(gtk.Label("Connection au service et récupération de l'image du planning..."))
			self.tmp.show_all()
			
			thread.start_new_thread(self.evtMainWDlPlanning, ())
		
		gtk.main()
	
	def destroy(self, widget):
		gtk.main_quit()
	
	def setupReactions(self):
		self.mainW.connect("quitter", self.destroy)
		self.mainW.connect("waiting-for-this-week", self.evtMainWThisWeek)
		self.mainW.connect("waiting-for-dl-img", self.evtMainWDlPlanning)
		self.mainW.connect("waiting-for-params", self.evtMainWParamsShow)
		self.parametersW.connect("waiting-for-verif-id", self.evtParametersWVerifIds)
		self.parametersW.connect("waiting-for-groups", self.evtParametersWGroups)
		self.parametersW.connect("waiting-for-set-group", self.evtParametersWSetGroup)
		self.parametersW.connect("terminated", self.evtParametersWTerminated)
		self.firstRunW.connect("quitter", self.destroy)
		self.firstRunW.connect("waiting-for-verif-id", self.evtFirstRunWVerifIds)
		self.firstRunW.connect("waiting-for-groups", self.evtFirstRunWGroups)
		self.firstRunW.connect("waiting-for-set-group", self.evtFirstRunWSetGroup)
		self.firstRunW.connect("terminated", self.evtFirstRunWTerminated)
	
	def evtMainWThisWeek(self, widget = None):
		week = int(strftime("%W"))
		if week<30:
			self.mainW.week.set_active(53-35+week)
		elif week>35:
			self.mainW.week.set_active(week-35)
	
	def evtMainWDlPlanning(self, widget = None):
		try:
			semaine = int(self.mainW.week.get_active_text().replace("Semaine ", ""))
			groupe = self.mainW.grp.get_active_text()
			if groupe and semaine:
				self.mainW.image.set_from_file(self.utils.getPlanning(semaine, groupe))
			self.tmp.hide()
			del self.tmp
		except ValueError:
			self.tmp.hide()
			del self.tmp
			errDiag = gtk.MessageDialog(self.mainW, gtk.DIALOG_MODAL | gtk.DIALOG_DESTROY_WITH_PARENT, gtk.MESSAGE_ERROR, gtk.BUTTONS_OK)
			errDiag.set_title("Erreur...")
			errDiag.set_markup("Il y à un problème avec vos identifiants.")
			errDiag.format_secondary_markup("Nous vous suggéront de bien vouloir vérifier si vos identifiants sont corrects et le cas échéant les modifier.")
			errDiag.run()
			errDiag.hide()
		except IOError:
			self.tmp.hide()
			del self.tmp
			errDiag = gtk.MessageDialog(self.mainW, gtk.DIALOG_MODAL | gtk.DIALOG_DESTROY_WITH_PARENT, gtk.MESSAGE_ERROR, gtk.BUTTONS_OK)
			errDiag.set_title("Erreur...")
			errDiag.set_markup("Impossible de contacter le service.")
			errDiag.format_secondary_markup("Il semblerais que le service que vous essayez de contacter soit hors service, ou que vous n'ayez pas de connection internet.")
			errDiag.run()
			errDiag.hide()
	
	def evtMainWParamsShow(self, widget):
		treeSel = self.parametersW.tableGroups.get_selection()
		model = self.parametersW.tableModel
		model.clear()
		ugroup = self.utils.getUserGroup()
		groups = self.utils.getGroups()
		groups.sort()
		it = None
		id = 0
		for i in groups:
			item = model.append(None, [i])
			if i == ugroup:
				it = item
				id = i
		if it and treeSel:
			treeSel.select_iter(it)
			self.parametersW.groupName = id
		self.parametersW.tabbed.set_current_page(0)
		self.parametersW.show_all()
	
	def evtParametersWVerifIds(self, widget, username, password):
		try:
			self.utils.connection.getConnected(username, password)
			self.utils.setConnectionIds(username, password)
			widget.emit("verif-id-done", 0)
		except ValueError:
			widget.emit("verif-id-done", 1)
		except IOError:
			widget.emit("verif-id-done", 2)
	
	def evtParametersWGroups(self, widget, model):
		checkType(model, gtk.TreeStore)
		
		model.clear()
		self.utils.refreshGroups()
		groups = self.utils.getGroups()
		groups.sort()
		for i in groups:
			model.append(None, [i])
		widget.emit("groups-done")
	
	def evtParametersWSetGroup(self, widget, grpName):
		checkType(grpName, str)
		
		self.utils.setUserGroup(grpName)
		widget.groupName = grpName
		widget.emit("set-group-done")
	
	def evtParametersWTerminated(self, widget):
		widget.hide()
		
		self.mainW.grp.get_model().clear()
		ugroup = self.utils.getUserGroup()
		keys = self.utils.getGroups()
		keys.sort()
		id = -1
		for i in keys:
			self.mainW.grp.append_text(i)
			if i == ugroup:
				id = keys.index(i)
		self.mainW.grp.set_active(id)
		self.mainW.show_all()
	
	def evtFirstRunWVerifIds(self, widget, username, password):
		try:
			self.utils.connection.getConnected(username, password)
			self.utils.setConnectionIds(username, password)
			widget.emit("verif-id-done", 0)
		except ValueError:
			widget.emit("verif-id-done", 1)
		except IOError:
			widget.emit("verif-id-done", 2)
	
	def evtFirstRunWGroups(self, widget, model):
		checkType(model, gtk.TreeStore)
		
		model.clear()
		self.utils.refreshGroups()
		groups = self.utils.getGroups()
		groups.sort()
		for i in groups:
			model.append(None, [i])
		widget.emit("groups-done")
	
	def evtFirstRunWSetGroup(self, widget, grpName):
		checkType(grpName, str)
		
		self.utils.setUserGroup(grpName)
		widget.emit("set-group-done")
	
	def evtFirstRunWTerminated(self, widget):
		self.utils.setFirstRun(False)
		widget.hide()
		
		ugroup = self.utils.getUserGroup()
		keys = self.utils.getGroups()
		keys.sort()
		id = -1
		for i in keys:
			self.mainW.grp.append_text(i)
			if i == ugroup:
				id = keys.index(i)
		self.mainW.grp.set_active(id)
		self.mainW.show_all()

""" Main - Serve for test cases                                      """
if __name__ == "__main__":
	w = AdeProgrammeGtk()
