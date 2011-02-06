# Maintainer: MkFly <mmkfly@gmail.com>

pkgname=e200tool
pkgver=0.2.3
pkgrel=2
pkgdesc='A low-level bootloader utility for SanDisk Sansa e200 and c200 series'
arch=('i686' 'x86_64')
url='http://daniel.haxx.se/sansa/e200tool.html'
license=('unknown')
depends=('libusb')
source=(http://daniel.haxx.se/sansa/$pkgname/$pkgname-src.zip)
md5sums=('03de4db62c4fe6879495a7e4778b0daf')

build() {
  cd $srcdir
  make
}

package() {
  mkdir -p $pkgdir/usr/bin/
  cp $srcdir/e200tool $pkgdir/usr/bin/
}