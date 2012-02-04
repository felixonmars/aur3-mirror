#!/usr/bin/env python

from distutils.core import setup

setup(
  name='qttube',
  version='0.1',
  license='GPL',
  author='Siegfried-Angel Gevatter Pujals',
  author_email='siggi.gevatter@gmail.com',
  url='https://launchpad.net/qttube/',
  description='A YouTube video downloader',
  long_description='A simple application that allows you to download videos from YouTube (either by writing the URL where you can view them or their ID), and convert them to .ogg or another format you want',
  scripts=['src/qttube.py'],
  package_dir={'': 'src'},
  py_modules=['pal', 'preferences', 'ui_about', 'ui_main', 'ui_preferences'],
  data_files=[('share/applications', ['data/qttube.desktop'])]
)
