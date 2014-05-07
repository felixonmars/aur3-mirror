#!/usr/bin/env python
# -*- coding: utf-8 -*-
# Created by Aaron Caffrey
# License: GPLv3
import re
import subprocess
try:
    from urllib.request import urlopen
except ImportError:
    from urllib import urlopen

class FirefoxUpdater(object):
    def __init__(self):

        firefox_link = urlopen('https://ftp.mozilla.org/pub/mozilla.org/'
            'firefox/releases/latest/linux-x86_64/en-GB/').read().decode('utf-8')

        tar_bz2 = re.compile("td><a [^>]*href=['\"]([^'\"]+)['\"][^>]*>")\
        .findall(firefox_link)[1]

        parsed_ff_ver = tar_bz2.replace('firefox-', '').split('.tar')[0]

        print('\nFound: {}\n'.format(tar_bz2))

        with open('PKGBUILD','rt') as f:

            b = f.read()
            c = re.search('pkgver=(.*)', b)
            current_ff_ver = str(c.group()).replace('pkgver=', '')

        if parsed_ff_ver != current_ff_ver:
            print('Firefox version {} is older than {},' 
                ' will make a new package.\n'
                .format(current_ff_ver, parsed_ff_ver))

            with open('PKGBUILD', 'wt') as f:
                f.write(b.replace(current_ff_ver, parsed_ff_ver))

            subprocess.call('makepkg -s', shell=True)
            subprocess.call('makepkg --source', shell=True)

        else:

            print('No newer versions, {} is the latest stable version\n'
                .format(parsed_ff_ver))

if __name__ == '__main__':
    FirefoxUpdater()