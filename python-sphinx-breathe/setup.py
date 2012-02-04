import os
import os.path
import sys
import shutil

def getpyver(cmd):
    '''
    Get python version
    getpyver(python_path) --> python_version

    Simple example:
        getpyver("python3") --> "3.2"
    '''
    import subprocess
    p = subprocess.Popen((cmd, "--version"), stderr=subprocess.PIPE)
    if p.wait():
        return None
    p = p.stderr.read().decode('ascii')
    p = p.split()[1].split('.') 
    return p[0] + '.' + p[1]

def get_python_path(cmd):
    pyv = getpyver(cmd)
    return ("/usr/lib/python{}/site-packages".format(pyv) if pyv else None)

def check(cmd):
    path = get_python_path(cmd)
    if os.path.isdir(os.path.join(path, "sphinx")):
        return path
    else:
        return None

def copy_location():
    if check("python3"):
        return check("python3")
    if check("python2"):
        return check("python2")
    raise RuntimeError("It seems that you have not install sphinx yet.")

pkgdir = sys.argv[1]
srcdir = sys.argv[2]
breathedir = os.path.join(srcdir, "breathe")

insdir = os.path.join(pkgdir, copy_location()[1:])
insdir = os.path.join(insdir, "breathe")

docdir = os.path.join(pkgdir, "usr/share/doc/python-sphinx-breathe")
htmldir = os.path.join(srcdir,"testsuite/build/html")
shutil.move(breathedir, insdir)
shutil.move(htmldir, docdir)
