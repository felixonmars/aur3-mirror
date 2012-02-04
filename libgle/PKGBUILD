# Maintainer: SpepS <dreamspepser at yahoo dot it>

pkgname=libgle
pkgver=3.1.0
pkgrel=1
pkgdesc="The GLE Tubing and Extrusion Library"
arch=(i686 x86_64)
url="http://linas.org/gle/"
license=('GPL')
depends=('mesa')
options=('!libtool')
source=("http://downloads.sourceforge.net/project/gle/gle/gle-$pkgver/gle-$pkgver.tar.gz")
md5sums=('da5b45c6906343d4a3672c3de35513ad')

build() {
  cd "$srcdir/gle-$pkgver"

  ./configure --prefix=/usr \
              --mandir=/usr/share/man \
              --enable-static=no
  make
}

package() {
  cd "$srcdir/gle-$pkgver"

  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
