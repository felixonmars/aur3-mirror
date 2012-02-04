# Contributor: Vincent Kriek <vincent@vincentkriek.nl>
pkgname=bootload
pkgver=1.4
pkgrel=1
pkgdesc="Load program into your TUSB3210"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/tusb3210/"
license=('GPL')
source=("http://downloads.sourceforge.net/project/tusb3210/Bootloader%20and%20i2c%20Utilities/$pkgname-$pkgver/$pkgname-$pkgver.tar.gz")

build() {
  cd "$srcdir/$pkgname-$pkgver"

  sed 's/busses())/busses() < 0)/' tusb.c > tusb.tussen
  sed 's/devices())/devices() < 0)/' tusb.tussen > tusb.c

  make || return 1

  mkdir -p $pkgdir/usr/bin/
  install -m 755 bootload $pkgdir/usr/bin/bootload
  install -m 755 i2c-header $pkgdir/usr/bin/i2c-header
  install -m 755 i2c-rom $pkgdir/usr/bin/i2c-rom
}

# vim:set ts=2 sw=2 et:

md5sums=('0b7dca4685ad460be5c61e5066cc9c25')
