# Maintainer: nic96

pkgname=cgal-compat
pkgver=4.3
pkgrel=2
_pkgid=32995
pkgdesc="Computational Geometry Algorithms Library old version"
arch=('i686' 'x86_64')
url="http://www.cgal.org"
license=('GPL' 'LGPL')
source=(http://gforge.inria.fr/frs/download.php/$_pkgid/CGAL-$pkgver.tar.xz)
depends=('mpfr' 'boost-libs' 'gmp' 'mesa' 'glu')
conflicts="cgal"
optdepends=('qt4: for CGAL_Qt4'
            'eigen: for some packages, see the CGAL manual')
makedepends=('cmake' 'qt4' 'eigen' 'boost')
md5sums=('SKIP')

# consider building with swig for python stuff

build() {
  cd "$srcdir/CGAL-$pkgver"
  mkdir build
  cd build
  cmake ../ -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "$srcdir/CGAL-$pkgver/build"
  make install DESTDIR="$pkgdir"

  # The tarball still has all these licenses included
  for _license in LICENSE{,.FREE_USE,.GPL,.LGPL}; do
    install -D -m644 "$srcdir/CGAL-$pkgver/$_license" "$pkgdir/usr/share/licenses/$pkgname/$_license"
  done
}
