#!/usr/bin/env python2
# -*- coding: utf-8 -*-

import os
import os.path
import sys
import shutil
import glob
from subprocess import call

src = sys.argv[1]     # srcdir
dst = sys.argv[2]     # pkgdir
doc = sys.argv[3]     # document path

no_doc_list = []      # show which extensions have no documentation

os.chdir(src)
for i in os.listdir('.'):
    os.chdir(src)
    if os.path.isdir(i):
        os.chdir(i)
        if os.path.isfile("setup.py"):

            # Build module
            command = ["python2", "setup.py", "install", "--root=" + dst]
            call(command)

            # Build Documentation
            readmeList = glob.glob("README*") 
            readme = None
            if len(readmeList) == 1:
                readme = readmeList[0]
            elif "README" in readmeList:
                readme = "README"
            if readme != None:
                shutil.move(readme, os.path.join(doc, i + '.rst'))
            else:
                global no_doc_list
                no_doc_list += [i]

# Build embedded documentations
# Should be update manually.
SPECDOC = {
"zopeext":
"""
=============
autointerface
=============

Sphinx extension that adds an :dir:`autointerface` directive, which can be
used like autoclass to document zope interfaces.  Interfaces are
intended to be very different beasts than regular python classes, and
as a result require customized access to documentation, signatures
etc.

`autointerface` directive
-----------------------
The :dir:`autointerface` directive has the same form and option as the
:dir:`autoclass` directive::

    .. autointerface:: IClass
       ...

.. seealso:: :mod:`sphinx.ext.autodoc`

.. note:: This extension also serves as a simple example of using the
   new sphinx version 6.0 version :mod:`autodoc` refactoring.  Mostly
   this was straight forward, but I stumbled across a "gotcha":

   The `objtype` attribute of the documenters needs to be unique.
   Thus, for example, :attr:`InterfaceMethodDocumenter.objtype`
   cannot be `'method'` because this would overwrite the entry in
   :attr:`AutoDirective._registry` used to choose the correct
   documenter.
""",
}

for i in SPECDOC:
    if i in no_doc_list:
        with open(os.path.join(doc, i + '.rst'), "w") as f:
            f.write(SPECDOC[i])
        no_doc_list.remove(i)

print no_doc_list
