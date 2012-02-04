#!/usr/bin/python
#_*_ coding:utf-8 _*_

###############################################################################

# Gednafen, é um frontend para o emulador multi-sistemas Mednafen.
# Gednafen, é um programa bem simples, ele assume que você tenha,
# o mednafen instalado e configurado corretamente.
# Ele apenas captura o caminho da rom salva em uma variável e
# repassa para o emulador, não necessitando assim usar a linha
# de comando.

###############################################################################

# Nome: Gednafen
# Versão: 2011.10.1
# Requerimentos: Python 2.7xx, Pygtk 2.xx e Mednafen
# Autor: Smarch < silveriomm@bol.com.br >

# Versão: 2011.11.01
# Revisão do código.
# Adicionado ícones padrões do GTK, nos botões.
# Arrumado o Label dentro do Frame.

###############################################################################

# Aqui são importados os modulos necessários ##################################

import pygtk
pygtk.require('2.0')
import gtk
import os

# Variáveis e funções que serão usados pelo programa ##########################

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

def exec_rom(widget):
	os.system(emulador + jogo_sel)
	
def busca(self):
	global rom
	rom = gtk.FileSelection('Selecione uma Rom')
	rom.set_size_request(640, 480)
	rom.cancel_button.connect('clicked', file_out)
	rom.ok_button.connect('clicked', escolha)
	rom.show()

# Aqui montamos a janela ######################################################
	   
janela = gtk.Window()
janela.set_border_width(10)
janela.set_title('Gednafen')

janela.set_size_request(520,200)
janela.connect('destroy', gtk.main_quit)

# Aqui criamos os frames labels e tables ######################################

frame = gtk.Frame('Gednafen')
label = gtk.Label('                                      Rom Selecionada:')
label2 = gtk.Label('Um Simples Frontend Para o Mednafen\n\nsilveriomm@bol.com.br')
table = gtk.Table(4, 6)
table.set_col_spacings(5)
table.set_border_width(5)
frame.add(label2)

# Aqui os widgets da janela ###################################################

entrada = gtk.Entry()

botao_busca = gtk.Button(stock=gtk.STOCK_OPEN)
botao_busca.set_border_width(5)
botao_busca.connect('clicked', busca)

botao_exec = gtk.Button(stock=gtk.STOCK_EXECUTE)
botao_exec.set_border_width(5)
botao_exec.connect('clicked', exec_rom)

botao_exit = gtk.Button(stock=gtk.STOCK_CLOSE)
botao_exit.set_border_width(5)
botao_exit.connect('clicked', out)

# Aqui montamos tudo na Table #################################################

table.attach(frame, 2, 4, 2, 4)
table.attach(label, 3, 4, 0, 1)
table.attach(entrada, 1, 6, 1, 2)
table.attach(botao_busca, 5, 6, 2, 3)
table.attach(botao_exec, 4, 5, 3, 4)
table.attach(botao_exit, 5, 6, 3, 4)

# Aqui a janela e seus componentes são mostrados ##############################

janela.add(table)
janela.show_all()

# Loop final ##################################################################

janela.show()
gtk.main()
