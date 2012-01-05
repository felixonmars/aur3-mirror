#!/usr/bin/env python2
# setup.py: the distutils script to build and install mkdn.

from distutils.core import setup

setup(
    name = 'mkdn',
    scripts = ['mkdn'],
    version = '0.1.0',
    description = 'Markdown previewer',
    author = 'Rupa',
    author_email = 'rupa@lrrr.us',
    url = 'https://github.com/rupa/mkdn',
    license = 'WTFPL',
    classifiers = [
        'Programming Language :: Python',
        'Operating System :: POSIX :: Linux',
    ]
)
