#!/usr/bin/env python

from distutils.core import setup

setup(
  name='tubemaster',
  version='0.2a',
  license='GPL',
  author='Selim Ok',
  author_email='selimok@gmail.com',
  url='https://tubemaster.googlecode.com/',
  description='A YouTube video downloader',
  long_description='A simple application to download videos from YouTube with a simple copy paste of the URL',
  scripts=['src/tubemaster'],
  package_dir={'': 'src'},
  py_modules=['constants', 'converter', 'fetcher', 'getdownloadurl',
              'getoriginaltitle', 'notifications', 'preferences', 'ui_about',
              'ui_main', 'ui_preferences'],
  data_files=[('share/tubemaster', ['data/abort.png', 'data/download.png',
                                    'data/gettitle.png', 'data/pause.png',
                                    'data/resume.png',
                                    'data/tubemaster-24x24.png',
                                    'data/tubemaster-32x32.png',
                                    'data/tubemaster-48x48.png',
                                    'data/tubemaster-84x84.png'])]
)
