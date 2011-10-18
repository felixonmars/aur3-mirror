# -*- coding: utf-8 -*-
#  Open the document in a different encoding
#  Dependence: python >=2.5, pygtk
# 
#  Install: copy encoding.gedit-plugin and encodingpy.py to ~/.gnome2/gedit/plugins/
# 
#  Copyright (C) 2008 Vladislav Gorbunov
#   
#  This program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation; either version 3 of the License, or
#  (at your option) any later version.
#   
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#   
#  You should have received a copy of the GNU General Public License
#  along with this program; if not, write to the Free Software
#  Foundation, Inc., 59 Temple Place, Suite 330,
#  Boston, MA 02111-1307, USA.

# TODO:
# fix document_loaded: assertion `(tab->priv->state == GEDIT_TAB_STATE_LOADING) || (tab->priv->state == GEDIT_TAB_STATE_REVERTING)' failed

from gettext import gettext as _

from gi.repository import GObject, Gtk, Gio, Gedit
import functools

# All encodings names
enclist_func = lambda i=0: [Gedit.encoding_get_from_index(i)] + enclist_func(i+1) if Gedit.encoding_get_from_index(i) else []

shown_enc = Gio.Settings.new("org.gnome.gedit.preferences.encodings").get_strv("shown-in-menu")
# show the full list of encodings if not they not configured in the Open/Save Dialog
enclist = sorted(([Gedit.encoding_get_from_charset(encname) for encname in shown_enc]
                 if shown_enc else enclist_func())
                  + [Gedit.encoding_get_utf8()], key=lambda enc: enc.to_string())

ui_str = """<ui>
          <menubar name="MenuBar">
            <menu name="FileMenu" action="File">
              <placeholder name="FileOps_2">
                <menu name="FileEncodingMenu" action="FileEncoding">
                  <placeholder name="EncodingListHolder"/>
                  <separator/>
%s
                </menu>
              </placeholder>
            </menu>
          </menubar>
</ui>
""" % "\n".join(["<menuitem name=\"Encoding%i\" action=\"Encoding%i\"/>" % (i, i) for i in range(len(enclist))])

class EncodingWindowHelper:
    def __init__(self, plugin, window):
        self._window = window
        self._plugin = plugin
        self._insert_menu()

    def deactivate(self):
        self._remove_menu()
        self._window = None
        self._plugin = None
        self._action_group = None

    def _insert_menu(self):
        manager = self._window.get_ui_manager()
        self._action_group = Gtk.ActionGroup("EncodingPyPluginActions")
        self._action_group.add_actions([("FileEncoding", None, _("Encoding"))] + \
                                       [("Encoding%i" % i, None, enclist[i].to_string(), None, 
                                         _("Reopen the document in")+" "+enclist[i].to_string(),
                                         functools.partial(self.reopen_document, enc=enclist[i])) \
                                         for i in range(len(enclist))])
        manager.insert_action_group(self._action_group, -1)
        self._ui_id = manager.add_ui_from_string(ui_str)

    def _remove_menu(self):
        manager = self._window.get_ui_manager()
        manager.remove_ui(self._ui_id)
        manager.remove_action_group(self._action_group)
        manager.ensure_update()

    def update_ui(self):
        self._action_group.set_sensitive(self._window.get_active_document() != None)

    def reopen_document(self, action, _dummy = None, enc = None):
        doc = self._window.get_active_document()
        if doc and doc.get_location():
            line_pos = doc.get_iter_at_mark(doc.get_insert()).get_line()
            location = doc.get_location()
            doc.load(location, enc, line_pos+1, 1, False)
            # Can fix the 'document_loaded: assertion' if replace doc.load() to this two lines:
            #self._window.close_tab(self._window.get_active_tab())
            #self._window.create_tab_from_uri(uri, enc, line_pos+1, False, True)
    

class EncodingPlugin(GObject.Object, Gedit.WindowActivatable):

    window = GObject.property(type=Gedit.Window)

    def __init__(self):
        GObject.Object.__init__(self)
        self._instances = {}

    def do_activate(self):
        self._instances[self.window] = EncodingWindowHelper(self, self.window)

    def do_deactivate(self):
        self._instances[self.window].deactivate()
        del self._instances[self.window]

    def do_update_state(self):
        self._instances[self.window].update_ui()

