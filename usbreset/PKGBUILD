# Maintainer: Joan Rieu <toto_pirate@hotmail.fr>
pkgname=usbreset
pkgver=1
pkgrel=2
pkgdesc="USB device reset program"
arch=any
url="http://marc.info/?l=linux-usb-users&m=116827193506484&w=2"
license=('GPL2')
makedepends=(gcc)
source=(usbreset.c usbreset.1)
md5sums=('fe8e3796ce809ba38831f6fb3120043b'
         'c2a161fda36883681a1fb1f2e427a53a')

build() {
  cd "$srcdir"
  gcc -ousbreset usbreset.c
  gzip --best <usbreset.1 >usbreset.1.gz
}

package() {
  install -D "$srcdir/usbreset" "$pkgdir/usr/bin/usbreset"
  install -D "$srcdir/usbreset.1.gz" "$pkgdir/usr/share/man/man1/usbreset.1.gz"
}

# vim:set ts=2 sw=2 et:
