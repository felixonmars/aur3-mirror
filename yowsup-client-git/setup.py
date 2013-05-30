#!/usr/bin/env python

from distutils.core import setup
from pkgutil import walk_packages

setup(name='yowsup-cli',
      version='1.0',
      packages=['YowsupCli'],
      package_dir = {'': 'src'},
      data_files = [('/usr/bin/',['src/yowsup-cli']),],
      )
