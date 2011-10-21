#!/usr/bin/python
#_*_ coding:utf-8 _*_

import pygtk
pygtk.require('2.0')
import gtk
import os

emulador = "mednafen "

def out(self):
	gtk.main_quit()
	
def file_out(self):
	rom.hide()
	
def escolha(self):
	global jogo
	global jogo_sel
	jogo = rom.get_filename()
	dic = ('"')
	jogo_sel = dic + jogo + dic
	entrada.set_text(jogo_sel)
	rom.hide()

def out(self):
	gtk.main_quit()

def exec_rom(widget):
	os.system(emulador + jogo_sel)
	
def busca(self):
	global rom
	rom = gtk.FileSelection('Select a Rom')
	rom.set_size_request(640, 480)
	rom.cancel_button.connect('clicked', file_out)
	rom.ok_button.connect('clicked', escolha)
	rom.show()
			   
janela = gtk.Window()
janela.set_border_width(10)
janela.set_title('Gednafen')

janela.set_size_request(500,200)
janela.connect('destroy', gtk.main_quit)

label = gtk.Label('Rom: ')
label2 = gtk.Label('              GEDNAFEN\nThe Gui Frontend for Mednafen')
table = gtk.Table(3, 6)
table.set_col_spacings(5)
table.set_border_width(5)
entrada = gtk.Entry()

botao_busca = gtk.Button('Browser')
botao_busca.set_border_width(10)
botao_busca.connect('clicked', busca)

botao_exec = gtk.Button("  Play!  ")
botao_exec.set_border_width(10)
botao_exec.connect('clicked', exec_rom)

botao_exit = gtk.Button('Quit')
botao_exit.set_border_width(10)
botao_exit.connect('clicked', out)

table.attach(label, 0, 1, 0, 1)
table.attach(label2, 1, 5, 1, 2)
table.attach(entrada, 1, 5, 0, 1)
table.attach(botao_busca, 5, 6, 0, 1)
table.attach(botao_exec, 0, 1, 2, 3)
table.attach(botao_exit, 5, 6, 2, 3)

janela.add(table)
janela.show_all()

janela.show()
gtk.main()
