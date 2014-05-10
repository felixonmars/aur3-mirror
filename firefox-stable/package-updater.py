#!/usr/bin/env python
# -*- coding: utf-8 -*-
# Created by Aaron Caffrey
# License: GPLv3
# Python 2 and Python 3 compatible script
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

        with open('PKGBUILD', 'rt') as rf:
            read_file = rf.read()
            c = re.search('pkgver=(.*)', read_file)
            current_ff_ver = str(c.group()).replace('pkgver=', '')

        if parsed_ff_ver != current_ff_ver:
            print('\nFirefox version {} is older than {},' 
                ' will make a new package.\n'
                .format(current_ff_ver, parsed_ff_ver))

            with open('PKGBUILD', 'wt') as wf:
                wf.write(read_file.replace(current_ff_ver, parsed_ff_ver))

            subprocess.check_output(['makepkg', '-s', '-c'])
            subprocess.check_output(['makepkg', '--source'])
            subprocess.check_output(['updpkgsums'])

        else:

            print('\nNo newer versions, {} is the latest stable version\n'
                .format(parsed_ff_ver))

if __name__ == '__main__':
    try:
        FirefoxUpdater()
    except KeyboardInterrupt:
        raise SystemExit('\nCTRL + C, LOL!')