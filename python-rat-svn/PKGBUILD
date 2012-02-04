# Contributor: Piotr Husiatyński <phusiatynski@gmail.com>

pkgname=python-rat-svn
pkgver=18
pkgrel=2
pkgdesc="Rat is a Python library to help you work with PyGtk."
arch=('i686' 'x86_64')
url="http://python-rat.berlios.de/"
license=('MIT')
depends=(python pygtk)
makedepends=(setuptools)
source=()
md5sums=()

_svnmod="python-rat"
_svntrunk="http://svn.berlios.de/svnroot/repos/${_svnmod}/trunk"

build() 
{
    cd $startdir/src
    msg "Connecting to svn.xfce.org svn server...."
    svn co $_svntrunk $_svnmod

    msg "SVN checkout done or server timeout"
    msg "Starting make..."

    cp -R $startdir/src/$_svnmod $startdir/src/$_svnmod-build
    cd $startdir/src/$_svnmod-build/rat

    python setup.py install --root=$startdir/pkg
}
