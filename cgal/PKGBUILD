pkgname=cgal
pkgver=4.3
pkgrel=1
_pkgid=32995
pkgdesc="Computational Geometry Algorithms Library"
arch=('i686' 'x86_64')
url="http://www.cgal.org"
source=(http://gforge.inria.fr/frs/download.php/$_pkgid/CGAL-$pkgver.tar.xz)
depends=('mpfr' 'boost' 'gmp' 'mesa')
optdepends=('qt4: for CGAL_Qt4' 'eigen3: for some packages, see the CGAL manual')
makedepends=('cmake' 'xz')
license=('GPL' 'LGPL')
md5sums=('c0af5e3a56300b0c92ebd3a1f0df9149')

build() {
  cd "$srcdir/CGAL-$pkgver"
  cmake . -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "$srcdir/CGAL-$pkgver"
  make install DESTDIR="$pkgdir"

  # The tarball still has all theese licenses included
  for _license in LICENSE{,.FREE_USE,.GPL,.LGPL}; do
    install -D -m644 "$srcdir/CGAL-$pkgver/$_license" "$pkgdir/usr/share/licenses/$pkgname/$_license"
  done
}
