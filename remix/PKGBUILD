# Maintainer: SpepS <dreamspepser at yahoo dot it>

pkgname=remix
pkgver=0.2.4
pkgrel=1
pkgdesc="An audio sequencing and mixing library"
arch=(i686 x86_64)
url="http://www.metadecks.org/software/remix/"
license=('GPL')
depends=('libsndfile')
makedepends=('doxygen')
options=('!libtool')
source=("${url}download/$pkgname-$pkgver.tar.gz")
md5sums=('ab3bd134a9011fc981794093dcd7ddf7')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  # strip as-needed
  export LDFLAGS="${LDFLAGS/,--as-needed}"

  ./configure --prefix=/usr \
              --enable-static=no
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
