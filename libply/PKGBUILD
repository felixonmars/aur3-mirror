# Maintainer: Steve Anton <anxuiz.nx@gmail.com>
pkgname=libply
pkgver=0.1
pkgrel=2
pkgdesc="A modern C++ library for parsing the PLY file format."
arch=(i686 x86_64)
url="http://people.cs.kuleuven.be/~ares.lagae/libply/index.html"
license=('GPL')
depends=(boost)
makedepends=()
source=(http://people.cs.kuleuven.be/~ares.lagae/libply/ply-$pkgver.tar.gz
        plyheader.patch)
md5sums=('1c2832e6cc56ebfd3026ae3fc01f3070'
         '3f1b6d9d1195ed97fe638315486d6107')

build() {
  cd "$srcdir/ply-$pkgver"
  patch -p0 < "$srcdir/plyheader.patch"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/ply-$pkgver"
  make DESTDIR="$pkgdir/" install
  rm "$pkgdir/usr/lib/$pkgname.la"
}

# vim:set ts=2 sw=2 et:
