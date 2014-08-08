# Maintainer: speps <dreamspepser at yahoo dot it>

pkgname=librem
pkgver=0.4.6
pkgrel=1
pkgdesc="A portable and generic library for real-time audio and video processing"
arch=(i686 x86_64)
url="http://www.creytiv.com/rem.html"
license=('custom:BSD')
depends=('libre>=0.4.5')
source=("http://www.creytiv.com/pub/rem-$pkgver.tar.gz")
md5sums=('888c3000aa002790cc7129fa72d39a58')

build() {
  cd rem-$pkgver
  make
}

package() {
  cd rem-$pkgver
  make DESTDIR="$pkgdir/" install

  # license
  install -Dm644 docs/COPYING \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # fix permission for static lib - not included
#  chmod 644 "$pkgdir/usr/lib/$pkgname.a"
}

# vim:set ts=2 sw=2 et:
