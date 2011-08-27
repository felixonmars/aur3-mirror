# Contributor: William Rea <sillywilly@gmail.com>
pkgname=togra
pkgver=20060312
pkgrel=1
pkgdesc="A high-level approach to 3D application scripting using Python and OpenGL"
url="http://togra.sourceforge.net"
depends=('gst-python' 'gtkglext')
makedepends=('cvs')
source=()
md5sums=()

_cvsroot=":pserver:anonymous:@cvs.sourceforge.net:/cvsroot/togra"
_cvsmod="togra"

build() {
  cd $startdir/src
  cvs -z3 -d $_cvsroot co -D $pkgver -f $_cvsmod
  cd $_cvsmod
  sed -i 's|/usr/local|/usr|' Makefile
  python setup.py install --root=$startdir/pkg
}
