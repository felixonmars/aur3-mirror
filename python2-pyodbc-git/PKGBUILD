# Contributor: Clovis Fabricio Costa <arch.nosklo@0sg.net>

pkgname=python2-pyodbc-git
pkgver=20121214
pkgrel=2
pkgdesc="Python ODBC module that allows you to connect to almost any database"
arch=('i686' 'x86_64')
url="http://code.google.com/p/pyodbc"
license=('MIT')
depends=('python>=2.4', 'unixodbc')
makedepends=('git')
provides=('python2-pyodbc')
conflicts=('pyodbc')
source=()
_gitroot="http://github.com/mkleehammer/pyodbc.git"
_gitname="pyodbc"


build() {
    cd "$srcdir"
    msg "Connecting to the GIT repository..."
    if [ -d "$srcdir/$_gitname" ] ; then
        cd $_gitname && git pull origin
        msg "The local files are updated."
    else
        git clone $_gitroot
    fi
    cd "$srcdir/$_gitname"
    python2 setup.py build
}

package() {
  cd "$srcdir/$_gitname"
  python2 setup.py install "--root=${pkgdir}"
}
