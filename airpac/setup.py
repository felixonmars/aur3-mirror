#!/usr/bin/python

from distutils.core import setup


setup(
    name='airpac',
    version='0.1.2',
    description='aria2c wrapper for pacman',
    author='Darwin M. Bautista',
    author_email='djclue917@gmail.com',
    url='http://www.darwin.uk.to/',
    license='GPL',
    scripts=['airpac'],
    py_modules=['airpac'],
    data_files=[('/etc', ['airpac.conf'])]
)
