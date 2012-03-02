# Maintainer: SpepS <dreamspepser at yahoo dot it>

_name=So-synth-LV2
pkgname=so-synth-lv2
pkgver=1.4
pkgrel=1
pkgdesc="Unofficial LV2 ports of 50m30n3's synthesizers"
arch=(i686 x86_64)
url="https://github.com/jeremysalwen/So-synth-LV2"
license=('GPL3')
depends=('lv2core')
makedepends=('lv2-event' 'lv2-uri-map')
source=("https://github.com/jeremysalwen/So-synth-LV2/tarball/upstream/$pkgver")
md5sums=('c071a5b622ff33a0633fb5d38c9a889f')

build() {
  cd ${srcdir}/jeremysalwen-$_name-*
  make
}

package() {
  cd ${srcdir}/jeremysalwen-$_name-*
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
