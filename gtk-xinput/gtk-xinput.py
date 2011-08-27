#!/usr/bin/python
# -*- coding: utf-8 -*-

import pygtk
pygtk.require("2.0")
import gtk
import os

# ce programme permet de gérer les pointeurs facilement à l'aide de xinput sans passer par le terminal
# écrit par Hugo Denisse, sous liscence GPL

# cette classe défini les pointeurs affichés à l'écrans
# ces pointeurs contiennent des "slaves" qui sont les souris associées à ces pointeurs
#
# variables membre :
# str name : nom du pointeur
# int id : id du pointeur
# SlavePointer slaves[] : tableau contenant la liste des slaves 
class MasterPointer:
	def __init__(self, name, id):
		self.name=name
		self.id = id
		self.slaves = []
	
	def add_slave(self, slave):
		self.slaves.append(slave)

# cette classe défini les souris esclaves des pointeurs
#
# variables membre :
# str name : nom de la souris
# int id : id de la souris
class SlavePointer:
	def __init__(self, name, id):
		self.name=name
		self.id = id
# cette classe permet d'afficher à l'écran la liste des pointeurs, mais aussi de modifier cette liste
# elle gère donc la partie graphique et la partie liée à xinput
#
# variables membre :
# gtk.Builder interface : fenêtre du programme
# gtk.TreeView treeview : arborescence des pointeurs affichée
# MasterPointer masters[] : tableau contenant la liste des pointeurs
class Window:
	def __init__(self):
		self.interface = gtk.Builder()
		self.interface.add_from_file('gtk-xinput.glade')
		self.interface.connect_signals(self)
		self.treeview="no_treeview_yet"
		self.refresh()

	# fermeture de la fenetre
	def on_mainWindow_destroy(self, widget):
		gtk.main_quit()

	# au clic sur le bouton recharger
	def on_toolbutton_refresh_clicked(self, widget):
		self.refresh()
		
	# au clic sur le bouton fichier>quitter
	def on_imagemenuitem_quit_activate(self, widget):
		gtk.main_quit()
	
	# au clic sur le bouton aide>à propos
	def on_imagemenuitem_about_activate(self, widget):
		self.interface.get_object("aboutdialog").run()
		self.interface.get_object("aboutdialog").hide()
	
	# au clic sur le bouton ajouter
	def on_toolbutton_add_clicked(self, widget):
		self.interface.get_object("dialog_add").run()
		self.interface.get_object("dialog_add").hide()
	
	# au clic sur le bouton ajouter de la fenetre de dialogue ajouter
	def on_button_add_clicked(self, widget):
		name = self.interface.get_object("entry_add").get_text()
		if(name==""):
			print "Erreur : aucun nom donné au pointeur"
			return
		
		# on vérifie qu'il n'ya que des lettres ou chiffres dans le nom
		if(os.popen("echo '"+name+"' |sed 's/[0-Z]*//g'").readlines()[0].rstrip()!=""):
			print "Erreur : nom du pointeur invalide"
			return
		
		print "Ajout du pointeur "+name
		# on execute la commande d'insertion et on recupere la valeur du exit pour voir si il y a une erreur
		err = os.system("xinput create-master "+name)
		if(err):
			print "Impossible de creer le pointeur "+name
		else:
			self.refresh()
	
	# au clic sur le bouton supprimer
	def on_toolbutton_remove_clicked(self, widget):
		# on recupere la ligne selectionnée sous forme de tuple (TreeModel, TreeIter)
		selected_line = self.treeview.get_selection().get_selected()
		# on recupere la valeur affichée sur cette ligne
		selected_line = selected_line[0].get_value(selected_line[1],0)
		id = os.popen("echo '"+selected_line+"' |cut -d= -f2 | sed 's/)//g'").readlines()[0].rstrip()
		# on execute la commande d'insertion et on recupere la valeur du exit pour voir si il y a une erreur
		err = os.system("xinput remove-master "+id)
		if(err):
			print "Impossible de supprimer le pointeur "+id
		else:
			self.refresh()
	
		
	# retourne le nom et l'id trouvés à partir de la chaine passée en argument
	def get_name_and_id(self, line):
		name = os.popen('echo "'+line+"\" | sed 's/⎡ //' | sed 's/⎜   ↳ //' | sed 's/∼ //' | cut -f1")
		name = name.readlines()[0].rstrip()
		id = os.popen('echo "'+line+'" | cut -d= -f2 | cut -f1')
		id = id.readlines()[0].rstrip()
		return (name,id)

	# recupere la liste de xinput
	def refresh(self):
		# on efface tous les masters
		self.masters = []
		# on recupere la liste avec la commande xinput list
		liste = os.popen("xinput list --short")
		nbMasterCreated = 0
		for line in liste.readlines():
			# si la ligne lue parle d'un master pointer
			if(line.__contains__("[master pointer")):
				data=self.get_name_and_id(line)
				# on creer un nouveau master
				self.masters.append(MasterPointer(data[0],data[1]))
				nbMasterCreated+=1
			# si la ligne lue parle d'un slave pointer
			if(line.__contains__("[slave  pointer")):
				data=self.get_name_and_id(line)
				slave = SlavePointer(data[0],data[1])
				# on creer un nouveau slave dans le dernier master créé
				self.masters[nbMasterCreated-1].add_slave(slave)
			# si la ligne lue parle des slaves sans masters
			if(line.__contains__("[floating slave]")):
				# si le master servant à contenir les slaves n'existe pas on le creer
				if(self.masters[nbMasterCreated-1].id!="floating"):
					self.masters.append(MasterPointer("Souris sans pointeur","floating"))
					nbMasterCreated+=1
				data=self.get_name_and_id(line)
				slave = SlavePointer(data[0],data[1])
				# on creer un nouveau slave dans le dernier master créé
				self.masters[nbMasterCreated-1].add_slave(slave)
		
		# on affiche les noms et id des masters et de leurs slaves
		for master in self.masters:
			print "master : name="+master.name+", id="+master.id
			for slave in master.slaves:
				print "slave : name="+slave.name+", id="+slave.id
		self.show_list()
				
	# affiche dans la fenêtre la liste des pointeurs
	def show_list(self):
		# on récupere la zone réservée à l'affichage
		zone = self.interface.get_object("scrolledwindow")
		if(self.treeview!="no_treeview_yet"):
			zone.remove(self.treeview)
		
		# Creation d'un TreeStore avec une colonne de type chaine, pour servir
		# de modele
		treestore = gtk.TreeStore(str)

		# A present ajoutons des donnees : 4 lignes ayant 3 lignes filles
		# chacune
		for i in range(self.masters.__len__()):
		    m_iter = treestore.append(None, [self.masters[i].name+" (id="+self.masters[i].id+")"])
		    for j in range(self.masters[i].slaves.__len__()):
				treestore.append(m_iter, [self.masters[i].slaves[j].name+" (id="+self.masters[i].slaves[j].id+")"])

		# creation du TreeView en utilisant notre TreeStore
		self.treeview = gtk.TreeView(treestore)
		# on autorise le drag'n'drop
		self.treeview.enable_model_drag_dest([('text/plain', 0, 0)],gtk.gdk.ACTION_MOVE)
		self.treeview.connect("drag-data-received", self.fonct_rappel_deposer)
		self.treeview.enable_model_drag_source(gtk.gdk.BUTTON1_MASK, [('text/plain', 0, 0)],gtk.gdk.ACTION_COPY)
		self.treeview.connect("drag-data-get", self.fonct_rappel_glisser)

		# creation du TreeViewColumn pour afficher les donnees
		tvcolumn = gtk.TreeViewColumn('Liste des pointeurs')
		# on place tvcolumn dans notre TreeView
		self.treeview.append_column(tvcolumn)
		# creation d'un CellRendererText pour afficher les donnees
		cell = gtk.CellRendererText()
		# on place cell dans le TreeViewColumn et on lui permet de s'etirer
		tvcolumn.pack_start(cell, True)
		# reglage de l'attribut "text" de cell sur la colonne 0 - recupere le
		# texte dans cette colonne du TreeStore
		tvcolumn.add_attribute(cell, 'text', 0)
		self.treeview.expand_all()
		#self.treeview.set_visible(True)
		# on ajoute le treeview dans l'interface
		zone.add(self.treeview)
		#zone.set_visible(True)
		zone.show_all();
		
	def fonct_rappel_deposer(self, treeview, contexte, x, y, selection, info, dateur):
		depot_info = treeview.get_dest_row_at_pos(x, y)
		if(depot_info):
			chemin, position = depot_info
			# on récupère l'id du master dans lequel on vient de déposer
			id = self.masters[chemin[0]].id
			print "attaching "+self.source_id+" to "+id
			err = os.system("xinput reattach "+self.source_id+" "+id)
			if(err):
				print "Impossible d'effectuer l'attachement"
			else:
				self.refresh()
			
	def fonct_rappel_glisser(self, treeview, contexte, selection, info, dateur):
		treeselection = treeview.get_selection()
		modele, iter = treeselection.get_selected()
		texte = modele.get_value(iter, 0)
		self.source_id = os.popen("echo '"+texte+"' |cut -d= -f2 | sed 's/)//g'").readlines()[0].rstrip()

if __name__ == "__main__":
	Window()
	gtk.main()
