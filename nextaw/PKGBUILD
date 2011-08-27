# $Id: PKGBUILD 82 2009-07-17 19:56:55Z aaron $
# Contributor: Sarah Hay <sarah31@sarah31.ca>

pkgname=nextaw
pkgver=0.15.1
pkgrel=5
pkgdesc="neXtaw is a replacement library for the Athena (libXaw) widget set"
arch=('i686' 'x86_64')
url="http://siag.nu/neXtaw/"
license=('MIT')
depends=('libxmu')
options=('!libtool')
source=(http://siag.nu/pub/neXtaw/neXtaw-$pkgver.tar.gz)
md5sums=('1c9cbcef735d8e26f3e48bd529aca6a7')

build() {
  cd $srcdir/neXtaw-$pkgver
  ./configure --prefix=/usr
  make || return 1
}
package() {
  cd $srcdir/neXtaw-$pkgver
  make DESTDIR=$pkgdir install
  install -D -m644 COPYING $pkgdir/usr/share/licenses/$pkgname/COPYING
}
