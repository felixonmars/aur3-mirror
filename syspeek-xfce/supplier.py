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

import gobject
import os
import threading
import time
import traceback
from abc import ABCMeta, abstractmethod

class Supplier(threading.Thread):
	__metaclass__ = ABCMeta

	def __init__(self, display, interval=1):
		threading.Thread.__init__(self)
		self.display = display
		self.interval = interval
		self.setDaemon(True)

	def run(self):
		self.running = True
		while self.running:
			try:
				self.supply()
			except:
				traceback.print_exc()
			time.sleep(self.interval)

	def stop(self):
		self.running = False

	@abstractmethod
	def supply(self): pass

class CpuSupplier(Supplier):
	last_total = 0
	last_busy = 0

	IDLE = 3

	def supply(self):
		f = open('/proc/stat', 'r')
		line = f.readline()
		f.close()

		stats= [int(x) for x in line.split()[1:8]]

		total = sum(stats)
		busy = total - stats[self.IDLE]

		delta_total = total - self.last_total
		delta_busy = busy - self.last_busy

		percentage = 0
		if delta_total > 0 and delta_busy > 0:
			percentage = (float(delta_busy) / delta_total) * 100

		gobject.idle_add(self.display.update_cpu, percentage)

		self.last_total = total
		self.last_busy = busy

class MemSwapSupplier(Supplier):
	def supply(self):
		meminfo = {}

		f = open('/proc/meminfo', 'r')
		lines = f.readlines()
		f.close()

		for line in lines:
			row = line.split()
			if row[0] in ['MemTotal:', 'MemFree:', 'Buffers:', 'Cached:', 'SwapTotal:', 'SwapFree:']:
				meminfo[row[0][0:len(row[0]) - 1]] = int(row[1]) * 1024

		mem_used = meminfo['MemTotal'] - meminfo['MemFree'] - meminfo['Buffers'] - meminfo['Cached']
		swap_used = meminfo['SwapTotal'] - meminfo['SwapFree']
		
		gobject.idle_add(self.display.update_memswap, mem_used, meminfo['MemTotal'], swap_used, meminfo['SwapTotal'])

class NetworkSupplier(Supplier):
	last_receive = 0
	last_transmit = 0

	FLAGS = 3
	UG = '0003'
	ROUTE_INTERFACE = 0
	DEV_INTERFACE = 0
	RECEIVE = 1
	TRANSMIT = 9

	def supply(self):
		interface = self.active_interface()
		receive = 0
		transmit = 0
		if interface is not None:
			f = open('/proc/net/dev', 'r')
			lines = f.readlines()
			f.close()

			for line in lines:
				row = line.split()
				if row[self.DEV_INTERFACE] == interface + ':':
					receive = int(row[self.RECEIVE])
					transmit = int(row[self.TRANSMIT])

		delta_receive = receive - self.last_receive
		delta_transmit = transmit - self.last_transmit

		gobject.idle_add(self.display.update_network, delta_receive, delta_transmit)

		self.last_receive = receive
		self.last_transmit = transmit
					

	def active_interface(self):
		f = open('/proc/net/route', 'r')
		lines = f.readlines()
		f.close()

		for line in lines:
			row = line.split()
			if row[self.FLAGS] == self.UG:
				return row[self.ROUTE_INTERFACE]

class DiskSupplier(Supplier):
	def supply(self):
		stat = os.statvfs('/home')
		total = stat.f_bsize * stat.f_blocks
		used = total - (stat.f_bsize * stat.f_bfree)
		gobject.idle_add(self.display.update_disk, used, total)

