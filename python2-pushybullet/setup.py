#!/usr/bin/env python2

from distutils.core import setup

setup(name='PushyBullet',
      version='1.0',
      description='PushBullet APIv2 python bindings',
      author='Konstantin Stepanov',
      author_email='me@kstep.me',
      url='http://github.com/kstep/pushybullet/',
      py_modules=['pushybullet'],
      scripts=['pb'],
      classifiers=[
          'Topic :: Software Development :: Libraries',
          'Topic :: Utilities',
          'Topic :: Internet',
          'Development Status :: 5 - Production/Stable',
          'Environment :: Console',
          ])
