# Maintainer: Ray Rashif <schiv@archlinux.org>

pkgname=swh-lv2
pkgver=1.0.15
pkgrel=4
pkgdesc="Large and popular collection of LADSPA plug-ins ported to LV2"
url="http://plugin.org.uk/"
license=('GPL2')
arch=('i686' 'x86_64')
depends=('fftw')
makedepends=('libxslt' 'lv2')
source=(http://plugin.org.uk/lv2/$pkgname-$pkgver.tar.gz)
md5sums=('c78f42c36d7bf2fb5b17f795ef9636d1')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make INSTALL_DIR="$pkgdir/usr/lib/lv2" install-system
}
