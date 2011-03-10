# Maintainer: SpepS <dreamspepser at yahoo dot it>

_lv2=abgate
_pkg=${_lv2/g/G}
pkgname=lv2-$_lv2
pkgver=1.1.3
pkgrel=2
pkgdesc="LV2 Noise Gate plugin"
arch=(i686 x86_64)
url="http://abgate.sourceforge.net/"
license=('LGPL')
groups=('lv2-plugins')
depends=('gtkmm')
makedepends=('lv2core')
provides=("$_lv2")
conflicts=("$_lv2")
source=("http://downloads.sourceforge.net/project/$_lv2/$_pkg-source/$_pkg-1.1.3.tar.gz")
md5sums=('27fcf7faf46b83396f438b2b9f323b08')

build() {
  cd "$srcdir/$_pkg-$pkgver"

  make
}

package() {
  cd "$srcdir/$_pkg-$pkgver"

  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
