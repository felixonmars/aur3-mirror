#!/usr/bin/python2

import os
import sys
import pynotify
import gtk
import locale
import gettext
from diskimage import DiskImage 
#import appindicator
import time
import gconf
import shutil
import gio

APP = "mounty"
APP_VERSION = "0.1.3"
DIR = '/usr/share/locale/'

locale.setlocale(locale.LC_ALL, '')
gettext.bindtextdomain(APP, DIR)
gettext.textdomain(APP)
_ = gettext.gettext

# register to libnotify
if not pynotify.init("mounty"):
    error(_("Cannot initialize libnotify"))
    sys.exit(1)

class application:
    def __init__(self):
# Begin XFCEpatch
#        self.ind = appindicator.Indicator ("mounty", "mounty", appindicator.CATEGORY_APPLICATION_STATUS)
#        self.ind.set_status (appindicator.STATUS_ACTIVE)
        self.statusIcon = gtk.StatusIcon()
        self.statusIcon.set_from_stock(gtk.STOCK_CDROM)
        self.statusIcon.set_visible(True)
        self.statusIcon.set_tooltip("Mounty")
        self.statusIcon.connect("popup-menu", self.on_right_click)
# End XFCEpatch

        self.isos = {}
        
        client = gconf.client_get_default()
        if client.get_bool('/apps/mounty/remember-mounts'):
            mounts = client.get_list('/apps/mounty/mounts', gconf.VALUE_STRING)
            for iso_name in mounts:
                try:
                    DiskImage(iso_name).mount()
                except:
                    pass
        if len(sys.argv) > 1:
            for i in sys.argv[1:]:
                DiskImage(sys.argv[i]).mount()
        self.update_menu()


    def quit(self, widget, data = None):
        client = gconf.client_get_default()
        
        if client.get_bool('/apps/mounty/remember-mounts'):
            iso_list = []
            for iso in self.isos:
                iso_list.append(iso)
        else:
            iso_list = []

        client.set_list('/apps/mounty/mounts', gconf.VALUE_STRING, iso_list)
        gtk.main_quit()

    def update_menu(self):
        self.isos = {}
        
        def umount(widget, iso_name, data = None):
            self.isos[iso_name].umount()
            self.update_menu()
            notification = pynotify.Notification(_('Disk Image Unmounted'), os.path.basename(iso_name), 'media-eject')
            notification.show()

        def browse(widget, iso_name, data = None):
            self.isos[iso_name].browse()

        def burn(widget, iso_name, data = None):
            self.isos[iso_name].burn()
        
        try:
            mtab_path = os.path.join(os.path.expanduser('~'),'.mtab.fuseiso')
            mtab = open(mtab_path).read().split('\n')
        except:
            mtab = []
        
        menu = gtk.Menu()
        menu.show()
        show_separator = False
        for line in mtab:
            if line:
                show_separator = True
                items = line.split(' ')
                items[0] = items[0].replace('\\040',' ')
                iso = DiskImage(items[0])
                self.isos[items[0]] = iso

                item = gtk.MenuItem(os.path.basename(items[0]))
                #item.set_image(gtk.image_new_from_icon_name('media-cdrom',gtk.ICON_SIZE_MENU))
                item.show()
                item.connect("activate", browse, items[0])
                menu.append(item)

#                item = gtk.MenuItem(_('  Burn'))
#                item.show()
#                item.connect("activate", burn, items[0])
#                menu.append(item)

                item = gtk.MenuItem(_('  Eject'))
                item.show()
                item.connect("activate", umount, items[0])
                menu.append(item)

                separator = gtk.MenuItem()
                separator.show()
                menu.append(separator)
                
        image = gtk.MenuItem(_('Open Disk Image...'))
        image.connect("activate",  self.add_image)
        image.show()
        menu.append(image)

#        item = gtk.CheckMenuItem(_('Remember mounted images'))
#        client = gconf.client_get_default()
#        item.set_active(client.get_bool('/apps/mounty/remember-mounts'))
#        item.connect("activate",  self.set_remember)
#        item.show()
#        menu.append(item)

#        item = gtk.CheckMenuItem(_('Load at startup'))
#        if os.path.exists(os.path.join(os.path.expanduser('~'), '.config', 'autostart', 'mounty-autostart.desktop')):
#            item.set_active(True)
#        item.connect("activate",  self.set_startup)
#        item.show()
#        menu.append(item)

        item = gtk.MenuItem(_('About'))
        item.connect("activate", self.show_about)
        item.show()
        menu.append(item)
                
# Begin XFCEpatch
#        item = gtk.MenuItem(_('Quit'))
#        item.connect("activate", self.quit)
#        item.show()
#        menu.append(item)
#        self.ind.set_menu(menu)
        try:
            self.statusIcon.disconnect(self.handlerid)
        except:
            pass
        self.handlerid = self.statusIcon.connect("activate", self.on_left_click, menu)

    def on_left_click(self, widget, data):
        data.show_all()
        data.popup(None, None, gtk.status_icon_position_menu, 1, gtk.get_current_event_time(), self.statusIcon)

    def on_right_click(self, button, time, data):
        quit_menu = gtk.Menu()
        quit_menu_item = gtk.MenuItem("Quit")
        quit_menu_item.connect("activate", self.on_quit, self.statusIcon)
        quit_menu.append(quit_menu_item)
        quit_menu.show_all()
        quit_menu.popup(None, None, gtk.status_icon_position_menu, 1, gtk.get_current_event_time(), self.statusIcon)

    def on_quit(self, widget, event):
        gtk.main_quit()
# End XFCEpatch
        
    def show_about(self, widget, data = None):
        about = gtk.AboutDialog()
        about.set_position(gtk.WIN_POS_CENTER_ON_PARENT)
        about.set_program_name("Mounty")
        about.set_version(APP_VERSION)
        about.set_authors([_("Krasimir S. Stefanov <lokiisyourmaster@gmail.com>")])
        about.set_website("http://skss.learnfree.eu/")
        about.set_translator_credits(_("Bulgarian - Krasimir S. Stefanov <lokiisyourmaster@gmail.com>"))
        about.set_logo_icon_name('media-cdrom')
        license = _('''Mounty - Mount disk images from app indicator
Copyright (C) 2011 Krasimir S. Stefanov

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.''')
        about.set_license(license)
        about.run()
        about.hide()
        
    def set_startup(self, widget, data = None):
        autostart = os.path.join(os.path.expanduser('~'), '.config', 'autostart', 'mounty-autostart.desktop')
        if widget.get_active():
            shutil.copy2('/usr/share/applications/mounty.desktop', autostart)
        else:
            os.remove(autostart)
        
            
    def set_remember(self, widget, data = None):
        client = gconf.client_get_default()
        client.set_bool('/apps/mounty/remember-mounts', int(widget.get_active()))

    def add_image(self, widget, data = None):
        dialog = gtk.FileChooserDialog(_('Open Disk Image...'),
                       None,
                       gtk.FILE_CHOOSER_ACTION_OPEN,
                       (gtk.STOCK_CANCEL, gtk.RESPONSE_CANCEL,
                        gtk.STOCK_OPEN, gtk.RESPONSE_OK))
        dialog.set_default_response(gtk.RESPONSE_OK)
        
        filter = gtk.FileFilter()
        filter.set_name(_("Disk Images"))
        filter.add_pattern("*.iso")
        filter.add_pattern("*.img")
        filter.add_pattern("*.bin")
        filter.add_pattern("*.mdf")
        filter.add_pattern("*.nrg")
        dialog.add_filter(filter)

        filter = gtk.FileFilter()
        filter.set_name(_("All files"))
        filter.add_pattern("*")
        dialog.add_filter(filter)
        
        
        response = dialog.run()
        if response == gtk.RESPONSE_OK:
            iso_name = dialog.get_filename()
            iso = DiskImage(iso_name)
            if iso.mount():
                notification = pynotify.Notification(_('Disk Image Mounted'), os.path.basename(iso_name), 'media-cdrom')
                notification.show()
            else:
                notification = pynotify.Notification(_('Error while mounting disk image'), os.path.basename(iso_name), 'error')
                notification.show()
                
        dialog.destroy()
        while gtk.events_pending():
            gtk.main_iteration(False)
        self.update_menu()

if __name__ == "__main__":
    application()
    gtk.main()

