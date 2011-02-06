#!/usr/bin/env python

from distutils.core import setup

setup(name='django-rosetta',
	  version='0.4.0',
	  description='A Django application that eases the translation process of your Django projects',
	  author='mbonetti',
	  url='http://code.google.com/p/django-rosetta/',
	  requires=['django (>=1.0)'],
	  packages=['rosetta', 'rosetta.conf', 'rosetta.templatetags'],
	  package_data={'rosetta': [
		  'templates/rosetta/*.html',
		  'templates/rosetta/css/*.css',
		  'templates/rosetta/js/*.js',
		  'locale/*/LC_MESSAGES/*'
		  ]},
	 )

