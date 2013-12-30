#!/usr/bin/python2
#Written by FX-Ti <zjxiang1998@gmail.com>

CFLAGS='-O2'

import os,re,subprocess

file = os.listdir(os.getcwd())

libs = []
cfiles = []

for i in file:
	match = re.match(r'\w+\.c$',i)
	if not match is None:
		cfiles.append(match.group())

for i in file:
	match = re.match(r'\w+\.h$',i)
	if not match is None:
		libs.append(match.group())

deps = subprocess.check_output(["pkg-config","--cflags","--libs","MagickWand"])

params = ' ' + CFLAGS + ' -o zimg ' + ' '.join(libs) + ' ' + ' '.join(cfiles) + ' -levent -levent_openssl -levent_pthreads -lssl -lcrypto -levhtp -lmemcached ' + deps

compile_state = os.system("gcc" + params)

if compile_state == 1:
	print "Check your setting!"
else:
	print "Zimg Compile successfully!"

