
pkgname=polyclipping
pkgver=6.1.3a
pkgrel=1
pkgdesc="Polygon clipping library (also known as clipper)"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/polyclipping/"
license=('custom')
depends=('gcc-libs')
makedepends=('cmake')
source=("http://downloads.sourceforge.net/polyclipping/clipper_ver${pkgver}.zip")
md5sums=('4dcd043ce48de59714f07bd3ec7ac62b')

build() {
  cd "$srcdir"
  mkdir -p build && pushd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr ../cpp
  make
}

package() {
  cd "$srcdir/build"
  make install DESTDIR="$pkgdir"
}
