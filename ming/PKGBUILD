# $Id: PKGBUILD 61 2008-10-18 19:13:11Z djclue917 $
# Maintainer: mar77i <mysatyre at gmail dot com>

pkgname=ming
pkgver=0.4.4
pkgrel=1
pkgdesc="SWF output library"
arch=('i686' 'x86_64')
url="http://www.libming.net/"
license=('GPL' 'LGPL')
depends=('freetype2' 'libpng' 'flex')
makedepends=('bison' 'pkgconfig' 'python2')
options=('!libtool' '!emptydirs')
source=(http://downloads.sourceforge.net/sourceforge/ming/$pkgname-$pkgver.tar.bz2)
md5sums=('9e780f93670eaf68b1eefa6cdfc1d1e2')

build() {
  cd $srcdir/$pkgname-$pkgver/
  LDFLAGS="${LDFLAGS/ -Wl,--as-needed/}"
  PYTHON=/usr/bin/python2 ./configure --prefix=/usr --disable-debug --enable-python
  make
  make DESTDIR=$pkgdir install
}

# vim:set ts=2 sw=2 et:
