#
#    Copyright (C) 2011  Georg Schmidl <georg.schmidl@vicox.net>
#
#    This program is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with this program.  If not, see <http://www.gnu.org/licenses/>.
#

import gtk
#import appindicator
import os
from gettext import gettext as _

from syspeek import *
from syspeek.supplier import *
from syspeek.helper import human_readable as _h

#class SysPeekIndicator(appindicator.Indicator):
class SysPeekIndicator():
	menu_items = {}
	suppliers = {}
	active_suppliers = []

	LABEL_CPU = _('CPU') + ': {:.1f}%'
	LABEL_MEMORY = _('Memory') + ': {} ' + _('of') + ' {}'
	LABEL_SWAP = _('Swap') + ': {} ' + _('of') + ' {}'
	LABEL_DISK = _('Disk') + ': {} ' + _('of') + ' {}'
	LABEL_RECEIVING = _('Receiving') + ': {}/s'
	LABEL_SENDING = _('Sending') + ': {}/s'

	def __init__(self):
#		appindicator.Indicator.__init__(self, NAME, NAME + '-0',
#			appindicator.CATEGORY_HARDWARE
#		)
#		self.set_status((appindicator.STATUS_ACTIVE))

		self.statusIcon = gtk.StatusIcon()
		self.statusIcon.set_from_stock(gtk.STOCK_INFO)
		self.statusIcon.set_visible(True)
		self.statusIcon.set_tooltip("SysPeek")

		self.suppliers['cpu'] = CpuSupplier(self)
		self.suppliers['memswap'] = MemSwapSupplier(self, 2)
		self.suppliers['disk'] = DiskSupplier(self, 2)
		self.suppliers['network'] = NetworkSupplier(self)

		self.active_suppliers = ['cpu','memswap', 'disk', 'network']

		self.build_menu()

		for name in self.active_suppliers:
			self.suppliers[name].start()

	def build_menu(self):
		menu = gtk.Menu()
		
		self.menu_items['cpu'] = gtk.MenuItem()
		menu.append(self.menu_items['cpu'])

		self.menu_items['separator_cpu'] = gtk.SeparatorMenuItem()
		menu.append(self.menu_items['separator_cpu'])

		self.menu_items['memory'] = gtk.MenuItem()
		menu.append(self.menu_items['memory'])

		self.menu_items['swap'] = gtk.MenuItem()
		menu.append(self.menu_items['swap'])

		self.menu_items['separator_memswap'] = gtk.SeparatorMenuItem()
		menu.append(self.menu_items['separator_memswap'])

		self.menu_items['disk'] = gtk.MenuItem()
		menu.append(self.menu_items['disk'])

		self.menu_items['separator_disk'] = gtk.SeparatorMenuItem()
		menu.append(self.menu_items['separator_disk'])

		self.menu_items['receiving'] = gtk.MenuItem()
		menu.append(self.menu_items['receiving'])

		self.menu_items['sending'] = gtk.MenuItem()
		menu.append(self.menu_items['sending'])

		self.menu_items['separator_network'] = gtk.SeparatorMenuItem()
		menu.append(self.menu_items['separator_network'])

#		system_monitor = gtk.MenuItem(_('System Monitor'))
#		system_monitor.connect('activate', self.system_monitor)
#		system_monitor.show()
#		menu.append(system_monitor)

		about = gtk.MenuItem(_('About'))
		about.connect('activate', self.about)
		about.show()
		menu.append(about)

		quit = gtk.MenuItem(_('Quit'))
		quit.connect('activate', self.quit)
		quit.show()
		menu.append(quit)

		if 'cpu' in self.active_suppliers:
			self.menu_items['cpu'].show()
			self.menu_items['separator_cpu'].show()

		if 'memswap' in self.active_suppliers:
			self.menu_items['memory'].show()
			self.menu_items['swap'].show()
			self.menu_items['separator_memswap'].show()

		if 'disk' in self.active_suppliers:
			self.menu_items['disk'].show()
			self.menu_items['separator_disk'].show()

		if 'network' in self.active_suppliers:
			self.menu_items['receiving'].show()
			self.menu_items['sending'].show()
			self.menu_items['separator_network'].show()
			
#		self.set_menu(menu)

		try:
			self.statusIcon.disconnect(self.handlerid)
		except:
			pass
		self.handlerid = self.statusIcon.connect('popup-menu', self.popup_menu_cb, menu)

	def popup_menu_cb(self, widget, button, time, data = None):
		if button == 3:
			if data:
				data.show_all()
				data.popup(None, None, gtk.status_icon_position_menu, 3, time, self.statusIcon)

	def update_cpu(self, percentage):
#		self.set_icon(NAME + '-' + str(int(percentage / 10) * 10))
		self.menu_items['cpu'].set_label(
			self.LABEL_CPU.format(percentage)
		)

	def update_memswap(self, mem_used, mem_total, swap_used, swap_total):
		self.menu_items['memory'].set_label(
			self.LABEL_MEMORY.format(_h(mem_used), _h(mem_total))
		)
		self.menu_items['swap'].set_label(
			self.LABEL_SWAP.format(_h(swap_used), _h(swap_total))
		)


	def update_disk(self, used, total):
		self.menu_items['disk'].set_label(
			self.LABEL_DISK.format(_h(used), _h(total))
		)

	def update_network(self, receiving, sending):
		self.menu_items['receiving'].set_label(
			self.LABEL_RECEIVING.format(_h(receiving))
		)
		self.menu_items['sending'].set_label(
			self.LABEL_SENDING.format(_h(sending))
		)

	def system_monitor(self, widget):
		os.spawnlp(os.P_NOWAIT, 'gnome-system-monitor', 'gnome-system-monitor')
		os.wait3(os.WNOHANG)

	def about(self, widget):
		self.aboutdialog = gtk.AboutDialog()
		self.aboutdialog.set_name(DISPLAY_NAME)
		self.aboutdialog.set_version(VERSION)
		self.aboutdialog.set_copyright(COPYRIGHT)
		self.aboutdialog.set_website(WEBSITE)
		self.aboutdialog.set_authors(AUTHORS)
		self.aboutdialog.set_license(LICENSE_TEXT)
		self.aboutdialog.set_logo_icon_name("utilities-system-monitor")

		self.aboutdialog.connect('response', self.about_quit)
		self.aboutdialog.show()

	def about_quit(self, widget, event):
		self.aboutdialog.destroy()

	def quit(self, widget):
		gtk.main_quit()

