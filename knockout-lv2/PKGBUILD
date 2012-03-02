# Maintainer: SpepS <dreamspepser at yahoo dot it>

_name=kn0ck0ut-LV2
pkgname=knockout-lv2
pkgver=1.11
pkgrel=1
pkgdesc="Port of kn0ck0ut to LV2 plugin"
arch=(i686 x86_64)
url="https://github.com/jeremysalwen/kn0ck0ut-lv2"
license=('GPL3')
depends=('lv2core' 'fftw')
makedepends=('lv2-c++-tools')
source=("https://github.com/jeremysalwen/$_name/tarball/$pkgver")
md5sums=('92ee32f9a1a91ade9e8aa201943cc525')

build() {
  cd ${srcdir}/jeremysalwen-$_name-*
  make
}

package() {
  cd ${srcdir}/jeremysalwen-$_name-*
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
