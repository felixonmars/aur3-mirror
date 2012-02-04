# Maintainer: Ape <ape[at]ape3000.com>
pkgname=bin32-mumble-overlay
pkgver=20091002
pkgrel=1
pkgdesc="Support for Mumble overlay on 32-bit applications for 64-bit systems"
arch=('x86_64')
url="http://mumble.sourceforge.net/"
license=('GPL')
depends=('mumble')
makedepends=()
provides=('bin32-mumble-overlay')

build() {

  mkdir -p $pkgdir/opt/lib32/usr/lib/
  install -m755 -D $srcdir/libmumble.so.1 $pkgdir/opt/lib32/usr/lib/libmumble.so.1
  install -m755 -D $srcdir/mumble-overlay32 $pkgdir/usr/bin/mumble-overlay32

} 
