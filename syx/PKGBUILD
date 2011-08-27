# $Id$
# Contributor: Michael 'manveru' Fellinger <m.fellinger@gmail.com>
pkgname=syx
pkgver=0.1.7
pkgrel=1
pkgdesc="Smalltalk YX, an open source Smalltalk-80 implementation."
url="http://code.google.com/syx"
license=("MIT")
arch=('i686' 'x86_64')
depends=(readline)
source=(http://syx.googlecode.com/files/$pkgname-$pkgver.tar.gz)
md5sums=('46ef4a1652bab5b502e7e0d4941bf873')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make clean
  make DESTDIR=$pkgdir install
}
