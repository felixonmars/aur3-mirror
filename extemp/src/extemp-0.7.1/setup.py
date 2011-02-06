#!/usr/bin/env python

from distutils.core import setup

files = ["Papers/*"]
setup(name='Extemp',
        version='0.7.1',
        description='Newspaper indexing software.',
        author='Matthew Bruenig',
        author_email='matthewbruenig@gmail.com',
        url='http://extemp.berlios.de/',
        classifiers=[
            'Intended Audience :: End Users/Desktop',
            'License :: GNU General Public License (GPL)',
            'Operating System :: Linux',
            'Programming Language :: Python',
            ],
        packages=["ExtempFiles", "ExtempFiles/Papers"],
        scripts = ['extemp'],
        data_files = [('share/man/man7', ['extemp.7'])],
        )
