# Maintainer: Daniel Clemmer <mraoflink@verizon.net>
#!/bin/bash

pkgname=hanvon
pkgver=20140127
pkgrel=1
pkgdesc="Driver for hanvon tablets"
url="http://forschung.wi.uni-passau.de/~ond/myweb/hw/hanvon/"
arch=('i686' 'x86_64')
license=('GPL')
source=(http://forschung.wi.uni-passau.de/~ond/hw/hanvon/hanvon-$pkgver.tgz )
md5sums=('3f966bb9aee3c00edf2e3c630befc576')
install=hanvon.install
build() {
  cd $srcdir/hanvon
  make
}
package() {
  _EXTRAMODULES=`find /usr/lib/modules -name version | sed 's|\/usr\/lib\/modules\/||; s|\/version||'`
  install -D -m644 $srcdir/hanvon/hanvon.ko $pkgdir/usr/lib/modules/$_EXTRAMODULES/hanvon.ko
  gzip $pkgdir/usr/lib/modules/$_EXTRAMODULES/hanvon.ko
}
