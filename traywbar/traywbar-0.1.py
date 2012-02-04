#!/usr/bin/python2
# A GTKv2 status icon that sits in your tray and pops up a menu with the same selection of applications you already have configured for wbar
# Copyright 2011 Dan Serban
# Licensed under GPLv3

import os
import subprocess
import gtk

class TrayWbar:
  def __init__(self):
    self.status_icon = gtk.StatusIcon()
    self.status_icon.set_from_stock(gtk.STOCK_HOME)
    self.status_icon.set_visible(True)
    self.status_icon.set_tooltip("TrayWbar")
    self.status_icon.connect("activate", self.on_left_click)
    self.status_icon.connect("popup-menu", self.on_right_click)
    gtk.main()

  def on_execute(self, widget, event, data):
    subprocess.Popen(self.commands[data], shell=True)

  def on_quit(self, widget, event):
    gtk.main_quit()

  def on_left_click(self, event):
    with open(os.path.expanduser("~/.wbar"), "r") as wbarconfigfile:
      lines = wbarconfigfile.readlines()
    wbarconfigfile.close()
    i = 0
    self.names = []
    self.commands = {}
    for wbarconfigline in lines:
      wbarconfigline = wbarconfigline.strip()
      if wbarconfigline[:3] == "i: ":
        i += 1
        do_include = False
      if wbarconfigline[:3] == "c: " and wbarconfigline[3:7] != "wbar":
        self.commands[i] = wbarconfigline[3:]
        do_include = True
      if wbarconfigline[:3] == "t: " and do_include:
        self.names.append((wbarconfigline[3:],i))
    main_menu = gtk.Menu()
    for wbar_entry in self.names:
      main_menu_item = gtk.MenuItem(wbar_entry[0])
      main_menu_item.connect("activate", self.on_execute, self.status_icon, wbar_entry[1])
      main_menu.append(main_menu_item)
    main_menu.show_all()
    main_menu.popup(None, None, gtk.status_icon_position_menu, 1, gtk.get_current_event_time(), self.status_icon)

  def on_right_click(self, button, time, data):
    quit_menu = gtk.Menu()
    quit_menu_item = gtk.MenuItem("Quit")
    quit_menu_item.connect("activate", self.on_quit, self.status_icon)
    quit_menu.append(quit_menu_item)
    quit_menu.show_all()
    quit_menu.popup(None, None, gtk.status_icon_position_menu, 1, gtk.get_current_event_time(), self.status_icon)

if __name__ == "__main__":
  traywbar = TrayWbar()

