#!/usr/bin/python
################################################################################
#
# Copyright (c) 2009 - 2012 Malek Hadj-Ali
# All rights reserved.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are met:
#
# 1. Redistributions of source code must retain the above copyright notice,
#    this list of conditions and the following disclaimer.
# 2. Redistributions in binary form must reproduce the above copyright notice,
#    this list of conditions and the following disclaimer in the documentation
#    and/or other materials provided with the distribution.
# 3. Neither the name of the copyright holders nor the names of its contributors
#    may be used to endorse or promote products derived from this software
#    without specific prior written permission.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
# AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
# THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
# ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS
# BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY,
# OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT
# OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
# INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER
# IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
# ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF
# THE POSSIBILITY OF SUCH DAMAGE.
#
#
# Alternatively, the contents of this file may be used under the terms of the
# GNU General Public License (the GNU GPL) version 3 or (at your option) any
# later version, in which case the provisions of the GNU GPL are applicable
# instead of those of the modified BSD license above.
# If you wish to allow use of your version of this file only under the terms
# of the GNU GPL and not to allow others to use your version of this file under
# the modified BSD license above, indicate your decision by deleting
# the provisions above and replace them with the notice and other provisions
# required by the GNU GPL. If you do not delete the provisions above,
# a recipient may use your version of this file under either the modified BSD
# license above or the GNU GPL.
#
################################################################################

import distutils.core

import os
import re
pyev_version = "0.8.1"
pyev_description = open(os.path.abspath("README.txt"), "r").read()
libev_dir = os.path.abspath("src/libev")
libev_configure_ac = open(os.path.join(libev_dir, "configure.ac"), "r").read()
libev_version = re.search("AM_INIT_AUTOMAKE\(libev,(\S+)\)",
                          libev_configure_ac).group(1)

distutils.core.setup(
	author       = 'Malek Hadj-Ali',
	author_email = 'lekmalek@gmail.com',
	description  = 'Python libev interface',
	download_url = 'http://pypi.python.org/pypi/pyev/',
	license      = "BSD License / GNU General Public License (GPL)",
	name         = 'pyev',
	platforms    = ["Microsoft Windows", "POSIX"],
	url          = 'http://packages.python.org/pyev/',
	version      = "%s-%s" % (pyev_version, libev_version),
	
	classifiers = [
		"Development Status :: 4 - Beta",
		"Intended Audience :: Developers",
		"Intended Audience :: System Administrators",
		"License :: OSI Approved :: BSD License",
		"License :: OSI Approved :: GNU General Public License (GPL)",
		"Operating System :: Microsoft :: Windows :: Windows NT/2000",
		"Operating System :: POSIX",
		"Programming Language :: Python :: 2.6",
		"Programming Language :: Python :: 2.7",
		"Programming Language :: Python :: 3.1",
		"Programming Language :: Python :: 3.2",
	],
	
	ext_modules = [
		distutils.core.Extension("pyev", ["src/pyev.c"],
			define_macros = [
				('PYEV_VERSION',  "\"%s\"" % (pyev_version)),
				('LIBEV_VERSION', "\"%s\"" % (libev_version)),
				# uncomment the following macros to modify priorities
				#("EV_MINPRI", "-5"),
				#("EV_MAXPRI", "5"),
			]
		),
	]
)
