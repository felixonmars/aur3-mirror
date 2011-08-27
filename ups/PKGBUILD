# $Id$
# Contributor: Flemming Madsen (arch at themadsens dot dk)
# Maintainer: 
pkgname=ups
pkgver=3.38
pkgrel=1
pkgdesc="A GUI debugger for C, C++ & Fortran"
url="http://ups.sourceforge.net"
license="GPL"
depends=('x-server')
source=(http://dl.sourceforge.net/sourceforge/ups/ups-${pkgver}-beta2.tar.gz)
md5sums=('925366228608feabe37b496c108d6aa1')

build() {
  cd $startdir/src/ups-${pkgver}-beta2
  [ "$NOEXTRACT" == 1 ] || ./configure --prefix=/usr
  make || return 1
  make prefix=$startdir/pkg/usr install
}
