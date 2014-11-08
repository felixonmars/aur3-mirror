pkgname=nt2
pkgver=3.1.0
pkgrel=1
pkgdesc="The Numerical Template Toolbox - C++ Scientific Computing Made Easy"
arch=( 'x86_64' 'i686')
license=('custom')
url="http://nt2.metascale.org/"
depends=('boost')
makedepends=('cmake')
source=("http://nt2.metascale.org/downloads/nt2-${pkgver}-source.tgz")
md5sums=('5e6ca6be4cfcc7d0351e0665c0cbc882')

build() {
  cd "${srcdir}/nt2-${pkgver}"
  mkdir -p build && pushd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DBUILD_SHARED_LIBS=ON ..
  make
}

package() {
  cd "${srcdir}/nt2-${pkgver}/build"
  make install DESTDIR="${pkgdir}"
}

