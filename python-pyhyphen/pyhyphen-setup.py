#!/usr/bin/python2

import sys, locale, urllib2
from hyphen.dictools import install

sys.stdout.write('Installing dictionaries\n... en_US ')
sys.stdout.flush()
install('en_US')
sys.stdout.write('OK.\n')

# Install dict for local language if needed
locale.setlocale(locale.LC_ALL, '')
local_lang = locale.getlocale()[0]
if local_lang != 'en_US':
	sys.stdout.write('... ' + local_lang + ' ')
	sys.stdout.flush()
	try:
		install(local_lang)
		sys.stdout.write('OK.\n')
	except urllib2.HTTPError:
		sys.stdout.write('Not available.\n')
