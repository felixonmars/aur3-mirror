# $Id$
# Maintainer: Sebastien Binet <binet@farnsworth>
pkgname=python-mplh5canvas-svn
pkgver=32
pkgrel=1 
pkgdesc="An HTML5 canvas based matplotlib backend."
url="http://code.google.com/p/mplh5canvas/"
arch=('i686' 'x86_64')
license=('BSD')
depends=('python2-matplotlib' 'pywebsocket-svn')
makedepends=('gcc' 'subversion')
conflicts=('python-mplh5canvas')
provides=('python-mplh5canvas')
backup=()

_svntrunk=http://mplh5canvas.googlecode.com/svn/trunk/
_svnmod=$pkgname

build() {
  cd $startdir/src
  /bin/rm -rf ${_svnmod}
  msg "fetching sources from SVN..."
  svn co ${_svntrunk} -r ${pkgver} ${_svnmod} || return 1
  
  cd $startdir/src/$pkgname

  python2 setup.py build || return 1
  python2 setup.py install --prefix=/usr --root=$startdir/pkg
}