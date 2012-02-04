#!/usr/bin/python2

import hyphen, locale
from hyphen.dictools import install, install_dict_info

print 'Downloading dictionary info...',
hyphen.dict_info = install_dict_info()
print 'done.'

print 'Downloading dictionaries... en_US',
install('en_US')

# Install dict for local language if needed
locale.setlocale(locale.LC_ALL, '')
local_lang = locale.getlocale()[0]
if local_lang != 'en_US':
    if local_lang in hyphen.dict_info:
        print local_lang,
        install(local_lang)
print 'done.'
