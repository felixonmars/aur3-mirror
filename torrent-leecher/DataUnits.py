#! /usr/bin/env python
# -*- coding: utf-8 -*-

#Classes
###################################################################################
class DataUnits: 
	def __init__(self, Parent):
		self.Parent = Parent
		#Data units
		self.dataUnits = [
			("TB", "Terabyte", 8796100000000.0),
			#("Tb", "Terabit", 1099511627776.0),
			("GB", "Gigabyte", 8589600000.0),
			#("Gb", "Gigabit", 1073700000.0),
			("MB", "Megabyte", 8388600.0),
			#("Mb", "Megabit", 1048600.0),
			("kB", "Kilobyte", 8192.0),
			#("kb", "Kilobit", 1024.0),
			("B", "Byte", 8.0),
			#("b", "Bit", 1.0),
		]

	def convert(self, amount, unit=False):
		if 0 > amount:
			amount = 0-amount
			minus = "-"
		else:
			minus = ""
		amount = int(amount*8)
		#If we have correct unit selected
		for i, line in enumerate(self.dataUnits):
			if line[0] == unit:
				output =  amount/line[2]
				output = "%.2f" % output
				return minus+""+str(output)+""+str(line[0])
		#Select unit automaticly
		if 1 > amount:
			return "0.00B"
		else:
			for i, line in enumerate(self.dataUnits):
				if amount >= line[2]/10.240407004:
					output = amount/line[2]
					output = "%.2f" % output
					return minus+""+str(output)+""+str(line[0])
