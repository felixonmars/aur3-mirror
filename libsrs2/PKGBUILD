# Maintainer: Nikolay Amiantov <nikoamia@gmail.com>

pkgname=libsrs2
pkgver=1.0.18
pkgrel=1
pkgdesc="The next generation SRS library from the original designer of SRS."
arch=(i686 x86_64)
url="http://www.libsrs2.org/"
license=(GPL2 BSD)
source=("http://www.libsrs2.org/srs/$pkgname-$pkgver.tar.gz")
sha1sums=('db9452e5207bb573eca4b3409c201f1e0275d300')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir" install
  install -D -m644 LICENSE.BSD "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
