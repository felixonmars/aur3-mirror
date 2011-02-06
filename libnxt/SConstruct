from glob import glob
from os import environ

import SCons.Util

auto_libs = ''

# Detect the system's endianness
from sys import byteorder
if byteorder == 'big':
        endian = '_NXT_BIG_ENDIAN'
else:
        endian = '_NXT_LITTLE_ENDIAN'

soname = environ['_soname']
shname = environ['_shname']

CCFLAGS = \
    environ.get('CFLAGS', '').split() + ['-Wall', '-std=gnu99', '-D' + endian]
SHLINKFLAGS = '-Wl,-soname,' + soname
BuildEnv = Environment(CCFLAGS=CCFLAGS)
BuildEnv['SHLINKFLAGS'] += SCons.Util.CLVar(SHLINKFLAGS)

if auto_libs:
        BuildEnv.ParseConfig('pkg-config --cflags --libs ' + auto_libs)

BuildEnv.Command('flash_routine.h',
                 'flash_routine.h.base',
                 'python2 make_flash_header.py')

library_files = [x for x in glob('*.c')
                 if not x.startswith('main_')]

Default(BuildEnv.Library('nxt', library_files, LIBS='usb'))

Default(BuildEnv.SharedLibrary(shname, library_files, LIBS='usb',
                               SHLIBSUFFIX=''))

Default(BuildEnv.Program('fwflash', ['main_fwflash.c', shname],
                         LIBS=['usb'], LIBPATH='.'))

Default(BuildEnv.Program('fwexec', ['main_fwexec.c', shname],
                         LIBS=['usb'], LIBPATH='.'))
