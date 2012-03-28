# Maintainer: Paul Hollensen <hollense@cs.dal.ca>
pkgname=pywebsocket-svn
pkgver=618
pkgrel=1 
pkgdesc="a WebSocket standalone server and a WebSocket extension for Apache HTTP Server, mod_pywebsocket."
url="http://code.google.com/p/pywebsocket/"
arch=('i686' 'x86_64')
license=('BSD')
depends=('python2')
makedepends=('subversion')
conflicts=('pywebsocket mod_pywebsocket')
provides=('pywebsocket')

_svntrunk="http://pywebsocket.googlecode.com/svn/trunk/"
_svnmod=pywebsocket-read-only

build() {
  cd $srcdir
  /bin/rm -rf ${_svnmod}
  msg "fetching sources from SVN..."
  svn co ${_svntrunk} ${_svnmod} || return 1
  cd $_svnmod/src
  python2 setup.py build || return 1
  python2 setup.py install --prefix=/usr --root=$pkgdir --optimize=1
}