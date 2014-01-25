# Maintainer: Peter Lewis <prlewis@letterboxes.org>

pkgname=beebem
pkgver=0.0.13
pkgrel=5
pkgdesc="An emulator for the BBC Micro computer."
arch=('i686' 'x86_64')
url="http://beebem-unix.bbcmicro.com/"
license=(custom:beebem)
# Please read the COPYING file in the source tarball. This package must be distributed WITH the source code,
# so will probably never be a candidate for a binary package.
depends=('gtk2' 'sdl')
makedepends=()
source=("http://www.stairwaytohell.com/emulators/${pkgname}-${pkgver}.tar.gz"
  "http://beebem-unix.bbcmicro.com/download/beebem-0.0.13_64bit.patch"
  "http://beebem-unix.bbcmicro.com/download/beebem-0.0.13-keys.patch"
  "http://beebem-unix.bbcmicro.com/download/beebem-0.0.13_menu_crash.patch")


md5sums=('44e6edc5c3e5fca9a84e2cddc4bf4858'
         'fb4b26c4b0189dbf0407816314a42ec6'
         '05d373f8c295039b62f9b48cc4dad9fa'
         '32de835139acabb7b919c18a9ebad830')

build() {
  cd $srcdir/${pkgname}-${pkgver}

  patch -p1 < ../${pkgname}-${pkgver}_64bit.patch
  patch -p1 < ../${pkgname}-${pkgver}-keys.patch
  patch -p1 < ../${pkgname}-${pkgver}_menu_crash.patch

  ./configure --enable-econet --prefix=/usr
  make
}

package() {
  cd $srcdir/${pkgname}-${pkgver}
  make prefix=${pkgdir}/usr install-strip

  install -m 644 -D $srcdir/$pkgname-$pkgver/COPYING $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
