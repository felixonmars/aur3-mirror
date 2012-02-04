import os

CCFLAGS=["-O3 -Wno-long-long -Wreturn-type -g -fPIC"]
CXXFLAGS=CCFLAGS+["-ftemplate-depth-100 -g -fPIC"]
CPPPATH=['/usr/include/m4ri']

PREFIX=os.environ['pkgdir']+'/usr'
PYINSTALLPREFIX=os.environ['pkgdir']+os.environ['PYTHONSITE']

HAVE_DOXYGEN=False
HAVE_PYDOC=False
HAVE_L2H=False
HAVE_HEVEA=False
HAVE_TEX4HT=False
HAVE_PYTHON_EXTENSION=False
EXTERNAL_PYTHON_EXTENSION=True
